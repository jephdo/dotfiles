# https://github.com/exogen/dotfiles/blob/730fb8e2b72b2fc3aa3d90b889874bb5195e1d07/.profile#L65

#History can be very useful, but by default on most distributions your history is blown 
# away by each shell exiting, and it doesn't hold much to begin with
export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend

alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

function mkcd {
	mkdir -p "$1" && cd "$1"
}

function workon {
    local name="${1:-$(basename "$PWD")}"
    source "$HOME/virtualenvs/$name/bin/activate"
}

function mkenv {
    virtualenv "$HOME/virtualenvs/$1"
}

export EDITOR=vim

# To have colors for All grep commands such as grep, egrep and zgrep, I have the following in my .bashrc
export GREP_OPTIONS='--color=auto'