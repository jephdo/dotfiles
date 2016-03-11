alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias now='date +"%T"'

alias on35='source ~/virtualenvs/env35/bin/activate'


bytestohr()
{
    # Convert input parameter (number of bytes) 
    # to Human Readable form
    #
    SLIST="bytes,KB,MB,GB,TB,PB,EB,ZB,YB"

    POWER=1
    VAL=$( echo "scale=2; $1 / 1" | bc)
    VINT=$( echo $VAL / 1024 | bc )
    while [ $VINT -gt 0 ]
    do
        let POWER=POWER+1
        VAL=$( echo "scale=2; $VAL / 1024" | bc)
        VINT=$( echo $VAL / 1024 | bc )
    done

    echo $VAL$( echo $SLIST | cut -f$POWER -d, )
}


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