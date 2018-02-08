if [ -f ~/.git-completion.bash ]; then
	source ~/.git-completion.bash
fi

export PATH=/usr/local/bin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use 8.9.4

source $(brew --prefix autoenv)/activate.sh
export PATH="/usr/local/opt/postgresql@9.4/bin:$PATH"

alias ll='ls -lGa'
