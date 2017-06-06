lookfor=$1
export PROMPT_COMMAND='source ~/.bashrc'

alias cc='clear'
alias hh='history'
alias jj='jobs -l'
alias aa='alias'
alias ag='alias | grep $lookfor'
alias ga='git la'
alias gag='ga | grep $lookgor'
#alias a='alias | grep -n $lookfor | cut -f1 | sed -n "$1"p ~/.bashrc | grep $lookfor'

#colorize the ls output ##
alias ls='ls -G'
#LSCOLORS='di=1:fi=0:ln=31:pi=5:so=5:bd=5:cd=5:or=31:mi=0:ex=35:*.rpm=90'
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export LSCOLORS
export EDITOR=vim

alias edbash='vim ~/.bashrc && echo "Updated" && source ~/.bashrc'
alias edgit='vim ~/.gitconfig'
alias geturl='git config --get remote.origin.url'

## git aliases
alias update="update_branch"
update_branch(){
    git plu "parse_git_branch"
}


## Use a long listing format ##
alias ll='ls -la'

#die work
alias ..='cd ..'
alias ...='cd ../../'
alias ....='cd ../../../'
alias .....='cd ../../../../'
alias .5='cd ../../../../../'
alias .6='cd ../../../../../..'

alias mkdir="mkdir -pv"

alias del="rm -rf"


## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'                                                                #####    using an expression or regexp exp
alias fgrep='fgrep --color=auto'                                                                #####    from file, fixed string, interpret as a list of fixed strings, separated by newline
alias fndhere='findindir $lookfor'   #####  this will look in the current dir and print out all the uniq files


findindir(){
    grep -riHn $1 * | cut -d":" -f1-2 | uniq
}

alias tailf="tail -f"

# show open networks
alias ports='netstat -tulanp'

alias df="df -Tha --total"
alias du="du -ach"
alias free="free -mt"
alias psg="ps | grep -v grep | grep -i -e VSZ -e"
alias brewtomcat="cd /usr/local/Cellar/tomcat7/7.0.72"

#fabric specific stuff
alias gotowww="cd /usr/local/var/www/"
alias gotofab="cd ~/Documents/Development/fabric/"

# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/' | tr -d '()'
}
varchanges=$(git ls-files -m 2> /dev/null| tr -dc '\n' | wc -l)
varstaged=$(git diff --name-only --cached 2> /dev/null | tr -dc '\n' | wc -l)
varuntracked=$(git ls-files --others --exclude-standard 2> /dev/null | tr -dc '\n' | wc -l)
varunstaged=$(git add -A -n 2> /dev/null| tr -dc '\n' | wc -l)
count_of_changes() {
     if [ $varchanges -gt 0 ]; then
        echo -ne "\033[38;5;160m"
                echo -ne $varchanges
                echo -ne "$(tput sgr0)" 😱  "uncommited"
         elif [[ $varstaged -eq 0 && $varuntracked -eq 0 && $varunstaged ]]; then
        echo 😎
     fi
}
count_of_unstaged() {
        if [ $varunstaged -gt 0 ]; then
            echo -ne "\033[38;5;63m"
            echo -ne $varunstaged
            echo -ne "$(tput sgr0)" 😓  "not staged"
        fi
}
count_of_staged() {
        if [ $varstaged -gt 0 ]; then
            echo -ne "\033[38;5;63m"
            echo -ne $varstaged
            echo -ne "$(tput sgr0)" 🤔  "staged"
        fi
}
count_of_untracked() {
        if [ $varuntracked -gt 0 ]; then
            echo -ne "\033[38;5;63m"
            echo -ne $varuntracked
            echo -ne "$(tput sgr0)" 😧  "untracked"
        fi

}
export PS1="\[\033[38;5;39m\]\@\[$(tput sgr0)\] \[\033[38;5;165m\]\u\[$(tput sgr0)\] \[$(tput bold)\]\[\033[38;5;154m\]\H\[$(tput sgr0)\]  \[$(tput bold)\]\[\033[38;5;202m\]\W\[$(tput sgr0)\] \[\033[38;5;226m\]\$(parse_git_branch)\[$(tput sgr0)\] \$(count_of_changes) \$(count_of_untracked)  \$(count_of_staged)  \$(count_of_unstaged) \n"
alias gitglob='git config --global -l'



# extract all zipped up files with one command
extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1    ;;
           *.tar.gz)    tar xvzf $1    ;;
           *.bz2)       bunzip2 $1     ;;
           *.rar)       unrar x $1       ;;
           *.gz)        gunzip $1      ;;
           *.tar)       tar xvf $1     ;;
           *.tbz2)      tar xvjf $1    ;;
           *.tgz)       tar xvzf $1    ;;
           *.zip)       unzip $1       ;;
           *.Z)         uncompress $1  ;;
           *.7z)        7z x $1        ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
 }

# History structure

export HISTFILESIZE=20000
export HISTSIZE=10000
shopt -s histappend
# Combine multiline commands into one in history
shopt -s cmdhist
# Ignore duplicates, ls without options and builtin commands
HISTCONTROL=ignoredups
export HISTIGNORE="&:ls:[bf]g:exit"

alias fhere="find . -name "

#alias denv='docker-machine env default'
alias denv='eval $(docker-machine env default)'
alias docme='bash --login "/Applications/Docker/Docker Quickstart Terminal.app/Contents/Resources/Scripts/start.sh"'
alias dims='docker images'
alias dcont='docker ps -a'
alias dstop='docker stop'
alias dstats='docker stats'
alias dstart='docker start'
alias dinfo='docker inspect '
alias d='docker'
alias dm='docker-machine'
alias ddelall='docker stop $(docker ps -a -q); echo "Stop all containers"; docker rm $(docker ps -a -q); echo "Remove all containers";  docker rmi $(docker images -q); "Delete all Images"'
alias drmcont='docker stop $(docker ps -a -q); echo "Stop all containers"; docker rm $(docker ps -a -q); echo "Remove all containers";'


#APACHE/PHP/FABRIC

alias start='sudo apachectl -k start'
alias start='sudo apachectl -k start'
alias restrt='sudo apachectl -k restart'







