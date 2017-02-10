# =================================================================
# Personal settings
# =================================================================


# Personal preferences
export EMAIL='Ariel De Ocampo <arieldeocampo@gmail.com>'
export VISUAL=nvim
export EDITOR=$VISUAL
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=$XDG_CACHE_HOME/zsh/history

# NVIM stuff
export NVIM_TUI_ENABLE_TRUE_COLOR=1

# Path
path=($HOME/.local/bin $path)

# Python virtualenv project paths
if [ -n $VENV_PROJECT_DIR ]; then
    path=($VENV_PROJECT_DIR $path)
fi

# Password Store
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/local/password-store

# =================================================================
#
# =================================================================
