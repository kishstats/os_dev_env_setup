alias ggraph="git log --graph --pretty=oneline --abbrev-commit"
alias gitorigin="git config --get remote.origin.url"
alias ll='ls -lah'

fetchgit() {
  git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
  git fetch --all
}

alias gitorigin="git config --get remote.origin.url"

function take {
  mkdir $1
  cd $1
}

newvenv() {
	pip install --upgrade virtualenv
  virtualenv -p python3 venv --always-copy
  source venv/bin/activate
}
