# Useful things borrowed from https://github.com/sorin-ionescu/prezto/blob/master/modules/python/init.zsh

export WORKON_HOME=$HOME/.virtualenvs
export VIRTUALENVWRAPPER_PYTHON=/opt/homebrew/bin/python3
export VIRTUAL_ENV_DISABLE_PROMPT=1

source /opt/homebrew/bin/virtualenvwrapper.sh
# TODO: fasterify this? https://github.com/mattmc3/zdotdir/blob/main/.zshrc.d/python.zsh

function python-workon-cwd {
  # Check if this is a Git repo.
  local GIT_REPO_ROOT="$(git rev-parse --show-toplevel 2> /dev/null)"
  # Get absolute path, resolving symlinks.
  local PROJECT_ROOT="$PWD:A"
  while [[ "$PROJECT_ROOT" != "/" && ! -e "$PROJECT_ROOT/.venv" \
        && ! -d "$PROJECT_ROOT/.git"  && "$PROJECT_ROOT" != "$GIT_REPO_ROOT" ]]; do
    PROJECT_ROOT="$PROJECT_ROOT:h"
  done
  if [[ $PROJECT_ROOT == "/" ]]; then
    PROJECT_ROOT="."
  fi
  # Check for virtualenv name override.
  local ENV_NAME=""
  if [[ -f "$PROJECT_ROOT/.venv" ]]; then
    ENV_NAME="$(<$PROJECT_ROOT/.venv)"
  elif [[ -f "$PROJECT_ROOT/.venv/bin/activate" ]]; then
    ENV_NAME="$PROJECT_ROOT/.venv"
  elif [[ $PROJECT_ROOT != "." ]]; then
    ENV_NAME="$PROJECT_ROOT:t"
  fi
  if [[ -n $CD_VIRTUAL_ENV && "$ENV_NAME" != "$CD_VIRTUAL_ENV" ]]; then
    # We've just left the repo, deactivate the environment.
    # Note: this only happens if the virtualenv was activated automatically.
    deactivate && unset CD_VIRTUAL_ENV
  fi
  if [[ $ENV_NAME != "" ]]; then
    # Activate the environment only if it is not already active.
    if [[ "$VIRTUAL_ENV" != "$WORKON_HOME/$ENV_NAME" ]]; then
      if [[ -n "$WORKON_HOME" && -e "$WORKON_HOME/$ENV_NAME/bin/activate" ]]; then
        workon "$ENV_NAME" && export CD_VIRTUAL_ENV="$ENV_NAME"
      elif [[ -e "$ENV_NAME/bin/activate" ]]; then
        source $ENV_NAME/bin/activate && export CD_VIRTUAL_ENV="$ENV_NAME"
      fi
    fi
  fi
}

autoload -Uz add-zsh-hook
add-zsh-hook chpwd python-workon-cwd

python-workon-cwd # Automatically activate venv when new sessions are created inside a directory that matches a venv name

if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate;
fi
if [[ -n "$TMUX" ]]; then
    tmux set-environment VIRTUAL_ENV $VIRTUAL_ENV
fi