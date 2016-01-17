# $HOME/.zshenv

# =================================================================

# ===================SET ENV VARS==================================
typeset -U path

#  export TERM="screen-256color"

# Other env var handling
# user-specific data files 
export -TU XDG_DATA_HOME xdg_data_home

# set of preference ordered base directories relative to which data files
# should be searched
export -TU XDG_DATA_DIRS xdg_data_dirs

# user-specific configuration files
export -TU XDG_CONFIG_HOME xdg_config_home

# set of preference ordered base directories relative to which
# configuration files should be searched
export -TU XDG_CONFIG_DIRS xdg_config_dirs

# user-specific non-essential (cached) data
export -TU XDG_CACHE_HOME xdg_config_dirs

# XDG paths
#
# User specific data files
XDG_DATA_HOME=~/.local/share
XDG_DATA_DIRS="/usr/local/share/:/usr/share/"
# xdg_data_home=(~/.local/share)
# xdg_data_dirs=(/usr/local/share /usr/share)

# User-specific config files
XDG_CONFIG_HOME=~/.config
XDG_CONFIG_DIRS="/etc/xdg/"
# xdg_config_home=(~/.config)
# xdg_config_dirs=(/etc/xdg)

# User-specific non-essential data
XDG_CACHE_HOME=~/.cache
export XDG_CONFIG_HOME XDG_CONFIG_DIRS XDG_DATA_HOME XDG_DATA_DIRS XDG_CACHE_HOME
# xdg_cache_home=(~/.cache)

# XML catalogs
export XML_CATALOG_FILES="${XDG_CONFIG_HOME}/share/xml/catalog /etc/xml/catalog"

# Sun java2 sdk 1.4.2
# #PATH=$PATH:/usr/local/share/j2sdk/bin
# path=($path /usr/local/share/j2sdk/bin)
# JAVA_HOME="/usr/local/share/j2sdk"
# JAVA_DRIVERS="/usr/local/share/jdk"
# MYSQL_JDBC=$JAVA_DRIVERS/mysql-connector-java

# # Tomcat JSP/Servlet server
# CATALINA_HOME="/usr/local/jakarta-tomcat-4.0.2-b1"
# CLASSPATH=".:$CATALINA_HOME/common/lib/servlet.jar:$MYSQL_JDBC:$CLASSPATH"

# export JAVA_HOME CATALINA_HOME CLASSPATH

#my stuff
path=(~/usr/bin $path)

# GCC optimizations
export CFLAGS="-Os -m64 -pipe -fomit-frame-pointer"
export CXXFLAGS=$CFLAGS
export LDFLAGS="-Wl,-O1"

# Debian make-kpkg settings
export CONCURRENCY_LEVEL=3

# DevPI path
export DEVPI_SERVERDIR=$XDG_DATA_HOME/devpi

# python virtualenv
#  export VIRTUALENV_USE_DISTRIBUTE=1


# python virtualenvwrapper
export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/pyvenv-3.5
#  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.2
export VIRTUALENVWRAPPER_PYTHON=$HOME/usr/bin/python3.5
#  export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.3
export WORKON_HOME=$HOME/opt/projects/devel/python/virtualenvwrapper

# Default python version
export PYTHONVERSION=3.5

# For custom python modules
function pythonpath()
{
   BIN="$1"
   if [ -z "$BIN" ]; then
      BIN="/usr/bin/python"
   fi
   if [ -z "$PYVER" ]; then
      #PYVER=$($HOME/usr/bin/python $BIN $1 -c "import sys;print '.'.join([str(n) for n in sys.version_info[:2]])")
      PYVER=$($BIN -c "import sys;print '.'.join([str(n) for n in sys.version_info[:2]])")
   fi
   PYROOT=$HOME/usr/lib/python
   PYHOME=$PYROOT/$PYVER
   PYALL=$PYROOT/all
   EGGDIR=$PYHOME/eggs
#    ALL_ST=$(ls -d --color=never $EGGDIR/setuptools-*py${PYVER}.egg | tr '\n' '|')
#    SETUPTOOLS=$(python -c "print [n for n in '$ALL_ST'.split('|') if n][-1]")
   rm -f $HOME/usr/bin/python
   ln -s $BIN $HOME/usr/bin/python
   rm -f $HOME/.pydistutils.cfg
   ln -s $HOME/.config/local/python/$PYVER/pydistutils.cfg $HOME/.pydistutils.cfg
   PYTHONPATH="$PYHOME/packages:$PYHOME/eggs:$PYHOME/devel"
   export PYTHONPATH="$PYTHONPATH:$PYALL/packages:$PYALL/eggs:$PYALL/devel"
}
# pythonpath "/usr/bin/python2.5"
export PYTHONPATH=$HOME/usr/lib/python/all/packages

# pylint
export PYLINTRC=~/.config/local/pylint/pylintrc

# Localisation settings
if [ -n "$DISPLAY" ]; then
    export LANG=en_CA.UTF-8
    export LANGUAGE=$LANG
    export LC_ALL=$LANG
    export LC_CTYPE=$LANG
    
    # UTF-8 enabled less
    export LESSCHARSET=utf-8
fi

# NVIDIA stuff
# export __GL_FSAA_MODE=2
# export __GL_SYNC_TO_VBLANK=1
export __GL_NO_DSO_FINALIZER=1

# Mutt/email stuff
export EMAIL='Ariel De Ocampo <arieldeocampo@gmail.com>'

# Ruby stuff
export RUBYLIB=$RUBYLIB:/usr/local/lib/ruby

# Mozilla Firebird stuff
#export MOZILLA_FIVE_HOME=/usr/local/share/mozilla-firebird
#export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$MOZILLA_FIVE_HOME

# Firebird/Interbase DB
# export FIREBIRD_DIR=/usr/local/share/firebird
# #PATH=$PATH:$FIREBIRD_DIR/bin
# path=($path $FIREBIRD_DIR/bin)

# KDE Stuff
# export KDE_IS_PRELINKED="true"

# QT Stuff
export QT_PLUGIN_PATH=$HOME/.kde4/lib/kde4/plugins/:/usr/lib/kde4/plugins/

calc() { perl -wlne 'print eval'; }
export calc

# Default pager
# export PAGER=/usr/bin/most

# export USERNAME PATH

# fdo config directory
export FDO_CONFIG=$HOME/.config

# pwsafe variables
export PWSAFE_DATABASE=$FDO_CONFIG/private/pwsafe/pwsafe.dat
export RANDFILE=$FDO_CONFIG/private/pwsafe/rnd

export ALLPROJECTS=$HOME/usr/local/share/documents/projects/allprojects.otl

# VIM workaround
#export VIMRUNTIME=/usr/share/vim/vim70

# Password Store
export PASSWORD_STORE_DIR=$HOME/.local/share/local/password-store

# TOPTEN
export TOPTEN="history 1|awk '{print \$2}'|awk 'BEGIN {FS=\"|\"} {print \$1}'|sort|uniq -c | sort -nr |head -n 10"

function abspath
{
    python -c "import os.path as op;print(op.abspath(\"$1\"))"
}


# default date prefix for development tagging
function dprefix
{
   date +'%Y/%m/%d'
}

function dversion
{
    date +'%Y.%m.%d.%H%M'
}

function tgconfig
{
   git add .topmsg
   git commit -m 'TopGit config'
}

function setgit
{
   git config --add user.name "Ariel De Ocampo"
   git config --add user.email "python.$1@gmail.com"
}

# TMUX
function mksc()
{
   TERM=screen-256color-bce /usr/bin/tmux new-session -d -s $1
}

function rmsc()
{
   /usr/bin/tmux kill-session -t $1
}

function rsc()
{
   TMUX=/usr/bin/tmux
   CLIENTID=$1.$(date +%Y%m%d%H%M%S)
   TERM=screen-256color-bce $TMUX new-session -d -t $1 -s $CLIENTID \; set-option -q destroy-unattached \; attach-session -t $CLIENTID
}

function rsc_new_window()
{
   TMUX=/usr/bin/tmux
   CLIENTID=$1.$(date +%Y%m%d%H%M%S)
   TERM=screen-256color-bce $TMUX new-session -d -t $1 -s $CLIENTID \; set-option -q destroy-unattached \; attach-session -t $CLIENTID \; new-window -t $CLIENTID
}

# =================================================================

# =================================================================

