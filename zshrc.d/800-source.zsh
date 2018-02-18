# =================================================================

# ==================== VIRTUALENVWRAPPER ==========================

# #  source $HOME/usr/bin/virtualenvwrapper_bashrc
# source $HOME/.local/bin/virtualenvwrapper.sh
SHELL_CONFIG="$(pew shell_config)"
if [ -f $SHELL_CONFIG ]; then
    source $SHELL_CONFIG
fi

# =================================================================

# ==================== GIT-FLOW COMPLETION ========================

# source /usr/share/zsh/vendor-completions/_git-flow

# =================================================================

# =================================================================
