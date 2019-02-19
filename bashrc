#``~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace


# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=
HISTFILESIZE=

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# Assume color is enabled, because it usually is.
source ~/.git-prompt.sh
if [ `whoami` != 'root' ] ; then
    echo 'NOT ROOT'
PS1='--${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u\[\033[01;31m\]@\[\033[01;36m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[01;35m\]$(__git_ps1)\[\033[00m\] 
 \[\033[0;36m\]==> \[\033[00m\] '
else 
    echo ' ROOT'
PS1='${debian_chroot:+($debian_chroot)}\[\033[1;5;31m\]\u\[\033[01;32m\]@\[\033[01;32m\]\h\[\033[00m\]:\[\033[01;33m\]\w\[\033[01;35m\]$(__git_ps1)\[\033[00m\] 
 \[\033[0;36m\]==> \[\033[00m\] '
fi

## LS Color in Mac OS X
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad



# Set Vim as default editor
set -o vi 
## Aliases ##
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ..='cd ..'
alias vi='vim'
alias psa='ps aux | grep'
alias less='less -R'  # Color
alias crontab='VIM_CRONTAB=true crontab'
alias updatedb='sudo /usr/libexec/locate.updatedb'
#alias gdir='cd $GOPATH '
alias ls='ls'
alias ll='ls -alg'
alias chrome='google-chrome&'

# Don't remember ssh key passwords
unset SSH_AUTH_SOCK

export JAVA_HOME="`/usr/libexec/java_home`"

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

## For displaying proper title in screen ##
XTERM_TITLE="${USER}@${HOSTNAME}: ${PWD}"
PROMPT_COMMAND='echo -ne "\033]0;$XTERM_TITLE\007"'
export GOROOT=/usr/local/opt/go/libexec
#export GOPATH=~/Projects/nm/gocode
#export GOBIN=$GOPATH/bin
export ES_HOME=~/apps/elasticsearch/elasticsearch-2.3.1
export PATH=$ES_HOME/bin:$JAVA_HOME/bin:$PATH
export PATH=$PATH:$GOROOT/bin:.:~/apps/bin:

set-title(){
ORIG=$PS1
TITLE="\e]2;$@\a"
PS1=${ORIG}${TITLE}
}





export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=01;05;37;41:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.jpg=01;35:*.jpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.axv=01;35:*.anx=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=01;36:*.au=01;36:*.flac=01;36:*.mid=01;36:*.midi=01;36:*.mka=01;36:*.mp3=01;36:*.mpc=01;36:*.ogg=01;36:*.ra=01;36:*.wav=01;36:*.axa=01;36:*.oga=01;36:*.spx=01;36:*.xspf=01;36:'








