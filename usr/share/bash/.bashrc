# ~/.bash_commmon.


# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
fi

extract () {
     if [ -f $1 ] ; then
         case $1 in
             *.tar.bz2)   tar xjf $1        ;;
             *.tar.gz)    tar xzf $1     ;;
             *.bz2)       bunzip2 $1       ;;
             *.rar)       rar x $1     ;;
             *.gz)        gunzip $1     ;;
             *.tar)       tar xf $1        ;;
             *.tbz2)      tar xjf $1      ;;
             *.tgz)       tar xzf $1       ;;
             *.zip)       unzip $1     ;;
             *.Z)         uncompress $1  ;;
             *.7z)        7z x $1    ;;
             *)           echo "'$1' cannot be extracted via extract()" ;;
         esac
     else
         echo "'$1' is not a valid file"
     fi
}

# Directory navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

alias ll='ls -la --color'
#alias ll="ls -l --group-directories-first"
alias ls='ls -hF --color'  # add colors for filetype recognition
alias la='ls -Al'          # show hidden files
alias lx='ls -lXB'         # sort by extension
alias lk='ls -lSr'         # sort by size, biggest last
alias lc='ls -ltcr'        # sort by and show change time, most recent last
alias lu='ls -ltur'        # sort by and show access time, most recent last
alias lt='ls -ltr'         # sort by date, most recent last
alias lm='ls -al |more'    # pipe through 'more'
alias lr='ls -lR'          # recursive ls
alias ld='ls -l | grep ^d'
alias lf='ls -l | grep -v ^d'
alias lda='ls -la | grep ^d'
alias lfa='ls -la | grep -v ^d'
alias dusage='du -h --max-depth=1'
alias myshell='ps -p $$'

#TODO: 
#export PATH=~/

# Depends on terminal emulator
alias ns='background konsole  --hide-tabbar --hide-menubar --workdir `pwd` -e bash'

# -- dogit
alias vc='eval `dogit vc bash`'
alias rw='dogit rw -s . ; cd `pwd`'

# -- Sublime + fzf
export FZF_DEFAULT_COMMAND='ag --hidden --path-to-ignore ~/.agignore -f -l -g ""'
#export FZF_DEFAULT_COMMAND='ag --hidden --path-to-agignore ~/.agignore -f -l -g ""'
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

alias fs="fzf  | xargs rsub"
alias ffs="fzf  | xargs rsub -f"
alias fds="cd"

# -- Bash
export HISTSIZE=10000
export PROMPT_COMMAND='history -a'
# Expand variables
shopt -s direxpand
# or
#shopt -s cdable_vars
#shopt -s direxpand
# Search
stty -ixon

# -- Faster vim for WAN
alias wim="vim -u NONE"
