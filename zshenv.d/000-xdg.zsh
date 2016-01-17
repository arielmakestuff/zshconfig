# =================================================================
# XDG Config
# =================================================================


# XDG paths
#
# User specific data files
xdg_data_home=(~/.local/share)

# User-specific config files
xdg_config_home=(~/.config)

# User-specific non-essential data
xdg_cache_home=(~/.cache)

# Other env var handling
# user-specific data files
export -TU XDG_DATA_HOME xdg_data_home

# user-specific configuration files
export -TU XDG_CONFIG_HOME xdg_config_home

# user-specific non-essential (cached) data
export -TU XDG_CACHE_HOME xdg_cache_home

# fdo config directory
export FDO_CONFIG=$HOME/.config

# Qt5 Workaround
export XDG_CURRENT_DESKTOP=KDE


# =================================================================
#
# =================================================================
