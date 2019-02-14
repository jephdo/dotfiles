# https://www.digitalocean.com/community/tutorials/an-introduction-to-useful-bash-aliases-and-functions
# http://www.tuxarena.com/2014/10/collection-of-useful-bash-functions-and-aliases/

alias ..="cd .."
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll="ls -lha" # long listing, human-readable, list all files
alias df="df -ha"
alias du="du -ch" # show grand total, human-readable
alias free="free -mt" # show memory in bytes, show total
alias ps="ps auxf"
# Makes the process table searchable. This alias searches our process for an argument we'll pass:
alias psg="ps aux | grep -v grep | grep -i -e VSZ -e"

alias mkdir="mkdir -pv" # automatically create parent directories and print out each directory created
alias wget="wget -c"
alias histg="history | grep"

alias myip="curl http://ipecho.net/plain; echo"
alias now='date +"%T"'
alias ppjson='python -m json.tool'

# Give a file execute permissions or just read and write:
alias chx='chmod 755'
alias chr='chmod 644'

export WORKON_HOME=$HOME/.virtualenvs

code2pdf() {
  enscript -2rG --line-numbers -p $2 --highlight=c \
  --color=1 -c $1
}

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

# to colorize man pages 
# http://boredzo.org/blog/archives/2016-08-15/colorized-man-pages-understood-and-customized
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
            man "$@"
}


function mkcd {
    mkdir -p "$1" && cd "$1"
}

# function workon {
#     local name="${1:-$(basename "$PWD")}"
#     source "$HOME/virtualenvs/$name/bin/activate"
# }


# combines a lot of utilities to allow you to decompress just about any compressed file format. 
function extract {
 if [ -z "$1" ]; then
    # display usage if no parameters given
    echo "Usage: extract <path/file_name>.<zip|rar|bz2|gz|tar|tbz2|tgz|Z|7z|xz|ex|tar.bz2|tar.gz|tar.xz>"
 else
    if [ -f $1 ] ; then
        # NAME=${1%.*}
        # mkdir $NAME && cd $NAME
        case $1 in
          *.tar.bz2)   tar xvjf ../$1    ;;
          *.tar.gz)    tar xvzf ../$1    ;;
          *.tar.xz)    tar xvJf ../$1    ;;
          *.lzma)      unlzma ../$1      ;;
          *.bz2)       bunzip2 ../$1     ;;
          *.rar)       unrar x -ad ../$1 ;;
          *.gz)        gunzip ../$1      ;;
          *.tar)       tar xvf ../$1     ;;
          *.tbz2)      tar xvjf ../$1    ;;
          *.tgz)       tar xvzf ../$1    ;;
          *.zip)       unzip ../$1       ;;
          *.Z)         uncompress ../$1  ;;
          *.7z)        7z x ../$1        ;;
          *.xz)        unxz ../$1        ;;
          *.exe)       cabextract ../$1  ;;
          *)           echo "extract: '$1' - unknown archive method" ;;
        esac
    else
        echo "$1 - file does not exist"
    fi
fi
}

# kill processes by name (does the same thing as pkill but with output)
kp () {
  ps aux | grep $1 > /dev/null
  mypid=$(pidof $1)
  if [ "$mypid" != "" ]; then
    kill -9 $(pidof $1)
    if [[ "$?" == "0" ]]; then
      echo "PID $mypid ($1) killed."
    fi
  else
    echo "None killed."
  fi
  return;
}
