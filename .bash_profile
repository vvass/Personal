source ~/.bashrc
export PATH="/usr/local/Cellar/sbt/0.13.9/bin/sbt:/usr/local/sbin:$PATH"
export PATH=$(brew --prefix ruby)/bin:$PATH
#eval "$(rbenv init -)"
#export RBENV_ROOT=/usr/local/var/rbenv
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi
export NVM_DIR="$HOME/.nvm"
  . "$(brew --prefix nvm)/nvm.sh"

