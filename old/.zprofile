# $HOME/.zprofile
ABSFILE="$HOME/.ssh/id_rsa"
SSH_ADD="/usr/bin/ssh-add $ABSFILE"

if [ $EUID -ne 0 ] ; then
    envfile="$HOME/.local/var/run/gpg-agent.env"
    if [[ -e "$envfile" ]] && kill -0 $(grep GPG_AGENT_INFO "$envfile" | cut -d: -f 2) 2>/dev/null; then
	eval "$(cat "$envfile")"
    else
	eval "$(gpg-agent --daemon --enable-ssh-support --write-env-file "$envfile")"
    fi
    export GPG_AGENT_INFO  # the env file does not contain the export statement
    export SSH_AUTH_SOCK   # enable gpg-agent for ssh
fi


# ssh-agent
function add_id()
{
  #  pw=$(pwsafe -E -p ssh_rsa | tr '\n' ' ' | sed 's/ //g')
  pw=$(pass show system/ssh | tr '\n' ' ' | sed 's/ //g')
  # sshpw=$(echo $pw | sed -e 's/["]/\\"/g')
  sshpw=$(echo $pw | sed -e 's/["]/\\"/g' \
			 -e 's/[(]/\\(/g' -e 's/[)]/\\)/g' \
			 -e 's/[[]/\\[/g' -e 's/[]]/\\]/g' \
			 -e 's/[{]/\\{/g' -e 's/[}]/\\}/g')
  if [ -n "$sshpw" ]; then
     expect -c "spawn $SSH_ADD;expect \"Enter passphrase for $ABSFILE:\";send \"$sshpw\\r\";expect \"Identity added: $ABSFILE ($ABSFILE)\";expect eof"
  fi
}
# KDM is sourcing this file
if [ -n "$session" ]; then
   display_manager="kdm"
fi

# Call these only if not being sourced by a display manager
if [ -z "$display_manager" ]; then
   #For fortune/cowsay/ddate combo
   echo ""
   /usr/games/fortune -a
   echo ""
   /usr/bin/ddate
   #echo ""

   # Generate fortune signature
   #cat /etc/skel/.signature-custom > $HOME/.signature
   #echo ""

fi


# Start custom email retrainer
$HOME/usr/bin/retrain-email.sh &
