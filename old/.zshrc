# $HOME/.zshrc

# =================================================================

# ===================LOAD THEM MODULE GOODIES======================
# Custom completion scripts
fpath=(~/.config/local/zsh/completion $fpath)
autoload colors zsh/terminfo
autoload -U compinit && compinit

##### Completion stuff
zstyle ':completion:::::' completer _complete _approximate
#_force_rehash() {
#  (( CURRENT == 1 )) && rehash
#  return 1     # Because we didn't really complete anything
#}
#zstyle ':completion:::::' completer _force_rehash _complete _approximate
zstyle -e ':completion:*:approximate:*' max-errors 'reply=( $(( ($#PREFIX + $#SUFFIX) / 3 )) )'
zstyle ':completion:*:descriptions' format "- %d -"
zstyle ':completion:*:corrections' format "- %d - (errors %e})"
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*' group-name ''
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*' menu select
zstyle ':completion:*' verbose yes
##### End Completion stuff

# Do the colors
if [[ "$terminfo[colors]" -ge 8 ]]; then
  colors
fi

# New style completion!
#compinit -C

# UTF-8 support (for +4.3.x only!)
setopt printeightbit
# =================================================================

# ===================SET USER SPECIFIC ALIASES=====================
# Set User specific aliases
alias timestamp='date -d "$(date -u)" "+%s"'
alias sdate='date -u "+%Y%m%d"'
alias rm='rm -i'
alias mv='mv -i'
# alias cp='cp -v'
alias df='df -h'
alias l='ls --color=none'
alias p='cd -'
alias ls='ls -h --color'
alias less='less -RMX'
alias gcombust='sudo gcombust'
alias xcdroast='sudo xcdroast'
alias pon='sudo pon'
alias poff='sudo poff'
alias plog='sudo plog'
#alias ip='sudo /usr/local/sbin/ip'
alias update-debian='sudo update-debian'
alias cdrdao='sudo cdrdao'
alias poweroff='sudo /sbin/poweroff'
alias soundfonts='sudo soundfonts'
# alias kvim='kvim -geometry 752x542'
alias konq='kfmclient openProfile filemanagement'
#alias k3b='sudo /usr/bin/k3b'
alias dsl='sudo /usr/local/bin/dsl'
#alias su='sudo /bin/su'
# alias naut='nautilus --no-desktop'
#alias btdownloadcurses='btdownloadcurses --max_uploads 15'
#alias grip='sudo grip'
alias apts='aptitude search'
alias rapps='rox ~/Apps'

#alias su='su -'
alias gooping='ping -c 10 google.ca'
alias iping='ping -c 10 216.239.33.100'
alias spwgen='pwgen -c -s -y 64'
alias spwgen_web='pwgen -c -s -n 20'

# Yakuake vim
alias yvim='shmoky_screen gvim'

alias cdeve='cd ~hgwork/onigokko'
alias ncmpc_screen='screen -D -R ncmpc ncmpc'
alias gpgpw="pwsafe -E -p gpg|tr '\n' ' '|sed 's/ $//'|xclip"
alias kwpw="pwsafe -E -p kdewallet|tr '\n' ' '|sed 's/ $//'|xclip"
alias kde-ssh-add="kdepwsafe ssh_rsa '/usr/bin/ssh-add $HOME/.ssh/id_rsa < /dev/null'"
alias getpw="kdepwsafe"
alias top10='eval $TOPTEN'

alias nd='pushd'
alias pd='popd'
#  alias tmux="TERM=screen-256color-bce /usr/bin/tmux"

# =================================================================

# ===================SET VARS======================================
# Set vars
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.history
VISUAL=vim
EDITOR=$VISUAL
# TOPTEN=$(history 1|awk '{print $2}'|awk 'BEGIN {FS="|"} {print $1}'|sort|uniq -c | sort -nr |head -n 10)
# TOPTEN=$(history 1)

# Set command-line editing style: vi
set -o vi
# =================================================================

# ===================SET HISTORY OPTIONS===========================
# Set history options
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_NO_FUNCTIONS

# =================================================================

# ===================SET PROMPT====================================
# Set prompt
# for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY BROWN; do
#    eval "FG_${color:u}=\"%{${fg_no_bold[${color:l}]}${bg[black]}%}\""
#    eval "FG_BOLD_${color:u}=\"%{${fg_bold[${color:l}]}${bg[black]}%}\""
#    (( count = $count + 1 ))
# done
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY BROWN; do
   eval "FG_${color:u}=\"%{${fg_no_bold[${color:l}]}%}\""
   eval "FG_BOLD_${color:u}=\"%{${fg_bold[${color:l}]}%}\""
   (( count = $count + 1 ))
done
# NO_COLOUR="%{$terminfo[sgr0]%}"
FG_DEFAULT="%{${fg_no_bold[default]}${bg[default]}%}"
 
PS1=$'\n'\
"%(!.${FG_BOLD_RED}!!!WARNING!!! .${FG_BOLD_GREEN})%(!.$FG_BOLD_RED.$FG_BOLD_GREEN)%(!.${USERNAME:u} USER.%n@%M)%(!.${FG_BOLD_RED}!!!.${FG_BOLD_GREEN}) ${FG_DEFAULT}"\
"${FG_WHITE}zsh ${ZSH_VERSION} ${FG_YELLOW}%D{%a %B %d %Y} %D{%I:%M:%S %p} "\
$'\n'\
"${FG_MAGENTA}%80<...<Current Dir: ${FG_CYAN}%d%<<"\
$'\n'\
"${FG_DEFAULT}%# "

PS2='>'

# =================================================================

# ===================SET COLOURS===================================
# Set colors
eval `/usr/bin/dircolors`
# if [[ -f ~/.dir_colors ]]; then
#   eval $(dircolors -b ~/.dir_colors)
# else
#   eval $(dircolors -b /etc/DIR_COLORS)
# fi

# =================================================================

# ===================SET POWER USER OPTIONS========================
# No need to type 'cd' for a directory as long as directory exists
setopt AUTO_CD
setopt NO_HUP
setopt NO_CHECK_JOBS
# =================================================================

# ===================SET NAMED DIRECTORIES=========================
# -----------------------------------------------------------------
# Home locations
# -----------------------------------------------------------------
# Basic
docs=$HOME/opt/documents
shared=$HOME/opt/shared
tmp=$HOME/tmp

# Personal
downloads=$HOME/opt/downloads
torrentdl=$HOME/opt/downloads/torrents
torrentfiles=$HOME/tmp/torrents
pictures=$HOME/usr/share/pictures
finance=$HOME/usr/share/finances
music=$HOME/opt/music
games=$HOME/opt/games
projects=$HOME/opt/projects
# Programming
pydev=$HOME/opt/projects/devel/python
dev=$HOME/opt/projects/devel
programming=$HOME/usr/src
repos=$HOME/opt/repos
hgrepos=$HOME/opt/repos/hg
hgarchives=$HOME/opt/repos/hg/programming/archives/current
hgwork=$HOME/opt/repos/hg/programming/work
hgconfig=$HOME/opt/repos/hg/config
gitrepos=$HOME/opt/repos/git
gitarchives=$HOME/opt/repos/git/programming/archives/current
gitwork=$HOME/opt/repos/git/programming/work
gitconfig=$HOME/opt/repos/git/config
svnwork=$HOME/opt/repos/svn/programming/work
#hgtailor=$HOME/opt/repos/hg/programming/tailor
#hg2svn=$HOME/opt/repos/hg/programming/svn

# App specific
kde=$HOME/.config/local/kde/kde

# -----------------------------------------------------------------
# Non-Home locations
# -----------------------------------------------------------------
usrdoc=/usr/share/doc
aptrepo=/home/apt/repo

# -----------------------------------------------------------------
# Set aliases
# -----------------------------------------------------------------
: ~downloads ~docs ~shared ~projects ~dev ~pydev \
~tmp ~programming ~repos \
~hgconfig ~hgrepos \
~hgarchives ~hgwork \
~gitconfig ~gitrepos \
~gitarchives ~gitwork \
~torrentfiles ~torrentdl \
~pictures ~finance ~kde ~usrdoc \
~aptrepo ~music ~games
# =================================================================

# ========================= SET STTY ==============================

stty -ixon

# =================================================================

# ==================== VIRTUALENVWRAPPER ==========================

#  source $HOME/usr/bin/virtualenvwrapper_bashrc
source $HOME/usr/bin/virtualenvwrapper.sh

# =================================================================

# ==================== GIT-FLOW COMPLETION ========================

source /usr/share/git-flow/git-flow-completion.zsh

# =================================================================

# ==================== DIRCOLORS ==================================

eval "$(dircolors -b ~/.config/local/dircolors/dircolorsrc)"

# ===================== SOURCE $ENV ===============================

if [ -n "$ENV" ]; then
   source $ENV
fi

# =================================================================

# =================================================================

