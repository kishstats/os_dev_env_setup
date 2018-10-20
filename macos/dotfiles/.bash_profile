if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 8.11.1

source $(brew --prefix autoenv)/activate.sh
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

alias ll='ls -lGah'

# git aliases
alias gitorigin="git config --get remote.origin.url"
alias ggraph="git log --graph --pretty=oneline --abbrev-commit"

fetchgit() {
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all
}

function take {
     mkdir $1
     cd $1
}

newvenv() {
	pip install --upgrade virtualenv
  virtualenv -p python3 venv --always-copy
  source venv/bin/activate
}

myextip() {
  lynx --dump http://ipecho.net/plain;
}
