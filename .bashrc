#eval "$(pyenv init -)"
#eval "$(pyenv virtualenv-init -)"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
if command -v pyenv 1>/dev/null 2>&1; then
 eval "$(pyenv init -)"
fi
alias config='/usr/bin/git --git-dir=/Users/giulio/dotfiles/ --work-tree=/Users/giulio'
