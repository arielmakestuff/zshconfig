# =================================================================

# ===================SET USER SPECIFIC ALIASES=====================


# Set User specific aliases
alias timestamp='date -d "$(date -u)" "+%s"'
alias sdate='date -u "+%Y%m%d"'
alias rm='rm -i'
alias mv='mv -i'
alias df='df -h'
alias p='cd -'
# alias l='ls --color=none'
# alias ls='ls -h --color'
# alias l='ls --color=none'
alias l='exa --color=never'
alias ls='exa'
alias less='less -RMX'
alias konq='kfmclient openProfile filemanagement'

# Net
alias gooping='ping -c 10 google.ca'

# Passwords
alias spwgen='pwgen -c -s -y 64'
alias spwgen_web='pwgen -c -s -n 20'

# Misc
alias nd='pushd'
alias pd='popd'

# Dotfiles management
alias home="/usr/bin/env git --git-dir=$XDG_CACHE_HOME/local/$(hostname)/dotfiles.git --work-tree=$HOME"

# =================================================================

# =================================================================
