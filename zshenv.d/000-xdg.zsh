# =================================================================
# XDG Config
# =================================================================


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


# fdo config directory
export FDO_CONFIG=$HOME/.config

# Qt5 Workaround
export XDG_CURRENT_DESKTOP=KDE


# =================================================================
#
# =================================================================
