# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples


# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# enable color support of ls and also add handy aliases
if [ "$TERM" != "dumb" ]; then
    eval "`dircolors -b`"
    alias ls='ls --color=auto'
fi

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

#netinfo - shows network information for your system
netinfo ()
{
echo "--------------- Network Information ---------------"
/sbin/ifconfig | awk /'inet addr/ {print $2}'
/sbin/ifconfig | awk /'Bcast/ {print $3}'
/sbin/ifconfig | awk /'inet addr/ {print $4}'
/sbin/ifconfig | awk /'HWaddr/ {print $4,$5}'
myip=`lynx -dump -hiddenlinks=ignore -nolist http://checkip.dyndns.org:8245/ | sed '/^$/d; s/^[ ]*//g; s/[ ]*$//g' `
echo "${myip}"
echo "---------------------------------------------------"
}

#dirsize - finds directory sizes and lists them for the current directory
dirsize ()
{
du -shx * .[a-zA-Z0-9_]* 2> /dev/null | \
egrep '^ *[0-9.]*[MG]' | sort -n > /tmp/list
egrep '^ *[0-9.]*M' /tmp/list
egrep '^ *[0-9.]*G' /tmp/list
rm -rf /tmp/list
}

#copy and go to dir
cpg (){
  if [ -d "$2" ];then
    cp $1 $2 && cd $2
  else
    cp $1 $2
  fi
}

#move and go to dir
mvg (){
  if [ -d "$2" ];then
    mv $1 $2 && cd $2
  else
    mv $1 $2
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

#case insensitive
alias igrep='grep -i'
alias iless='less -i'
alias ifind="find . -iname"


#Module (Load everything in cshrc
source /cad/gnu/modules/modules-tcl/init/bash
#module load common_setup
# Grid
#module load gnutools/grid-engine

GetJobName(){
  name=`echo $PWD | rev |  cut -d '/' -f 1,2,3,4 | rev |  sed 's#/#_#g'`
  echo "${name}_\${JOB_ID}"
}

alias qp="qsub -cwd -V -j y -b y -S /bin/bash -M veen@nordicsemi.no -m e -N `GetJobName` -o \$JOB_ID.log $*"
alias qs='qrsh -N `GetJobName` -V -cwd $*'
#alias qsim="qrsh -cwd -V" 

#ls-Colors
declare -x CLICOLOR=1
declare -x LSCOLORS=gxfxcxdxbxegedabagacad

#Eclipse settings
#source /pri/veen/usr/config/eclipse.cnf

#Syntest
#export SYNTEST="192.9.202.52"

# Search
stty -ixon

# This is the setup for dogit -->
#module load gnutools/git2.6.2
#module load gnutools/anaconda3-2.4.0

#export PATH=/pri/veen/dogit:$PATH
# <--

# Alias

# Our Linux machines are running on incompatible kernels for LS_COLORS. Patch it!
export LS_COLORS='di=01;34:ln=01;36:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arj=01;31:*.taz=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lz=01;31:*.xz=01;31:*.bz2=01;31:*.tbz=01;31:*.tbz2=01;31:*.bz=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.rar=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:'

alias ns='background konsole  --hide-tabbar --hide-menubar --workdir `pwd` -e bash'


_codeComplete()
{
    #local cur=${COMP_WORDS[COMP_CWORD]}
    #COMPREPLY=( $(compgen -W "$(ls --color=never ${VC_WORKSPACE})" -- $cur) )
    #COMPREPLY=( $(compgen -W "$(cat $VC_WORKSPACE/cache)" -- $cur) )
    local cur=${COMP_WORDS[$COMP_CWORD]}
    local arr=()
    arr+=("")
    local var=`grep -iP "$cur" $VC_WORKSPACE/.cache `
    #for i in "${var[@]}"; do
    #  arr+=("$i")
    #done
    #echo $arr
    COMPREPLY=(${var})
    #COMPREPLY=${arr[@]}
    #COMPREPLY=${arr[@]}
    #COMPREPLY=( $(compgen -W "${opts}" -- ${arr[@]}) )


}

complete -F _codeComplete wss

# -- Directory stack
alias stack="tail ${HOME}/var/dirs/${BASHPID} -n 30 | sort | uniq"
#alias cd="cd $@; echo $PWD >> ${HOME}/var/dirs/${BASHPID}"

function cd () {
  builtin cd "$@"
  echo $PWD >> ${HOME}/var/dirs/${BASHPID}
}
