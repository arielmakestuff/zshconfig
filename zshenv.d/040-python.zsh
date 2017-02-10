# =================================================================
# Python settings
# =================================================================


# DevPI path
export DEVPI_SERVERDIR=$XDG_DATA_HOME/devpi

# python virtualenvwrapper for python3.5
# export VIRTUALENVWRAPPER_VIRTUALENV=/usr/bin/pyvenv-3.5
# export VIRTUALENVWRAPPER_PYTHON=$HOME/usr/bin/python3.5
# export WORKON_HOME=$HOME/opt/projects/devel/python/virtualenvwrapper

# python virtualenvwrapper for python3.6
export WORKON_HOME=$XDG_DATA_HOME/python-venv
export VIRTUALENVWRAPPER_VIRTUALENV=$HOME/.local/bin/pyenv.sh
export VIRTUALENVWRAPPER_PYTHON=$WORKON_HOME/python3.6/bin/python3

# Default python version
export PYTHONVERSION=3.6

# pylint
export PYLINTRC=~/.config/local/pylint/pylintrc

# IPython
IPYTHONDIR=(~/.config/ipython)


# =================================================================
#
# =================================================================
