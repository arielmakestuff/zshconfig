# $HOME/.zlogout

# User specific logoff programs
SSH_AGENT_INFODIR=$HOME/.local/var/run/ssh-agent
SSH_AGENT_RUNFILE=$SSH_AGENT_INFODIR/ssh-agent-info
LOGIN_COUNT=$(/usr/bin/who -u | grep 'smokybobo' | wc -l)
if [ $LOGIN_COUNT -eq 1 -a -n "$SSH_AGENT_PID" ]; then
   ssh-agent -k
   if [ -f $SSH_AGENT_RUNFILE ]; then
      rm -f $SSH_AGENT_RUNFILE
   fi
fi

echo "" > $HOME/.xsession-errors
clear
unset DISPLAYMANAGER_CALLED
