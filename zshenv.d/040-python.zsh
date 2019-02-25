# =================================================================
# Python settings
# =================================================================


# DevPI path
export DEVPI_SERVERDIR=$XDG_DATA_HOME/devpi

# virtualenvwrapper
VENV_DIR=$XDG_DATA_HOME/pipx/venvs/virtualenvwrapper
export VIRTUALENVWRAPPER_PYTHON=$VENV_DIR/bin/python
export WORKON_HOME=$XDG_DATA_HOME/python-venv
export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME

# pipx
export PIPX_HOME=$XDG_DATA_HOME/pipx

# Default python version
export PYTHONVERSION=3.6

# pylint
export PYLINTRC=~/.config/local/pylint/pylintrc

# IPython
export IPYTHONDIR=$XDG_DATA_HOME/ipython


# =================================================================
#
# =================================================================
