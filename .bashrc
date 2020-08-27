# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#set guifont=Ubuntu\ Mono\ for\ Powerline\ 12

#alias mc='java -Xmx1024M -Xms512M -cp $HOME/bin/minecraft.jar net.minecraft.LauncherFrame'
alias nautilus='nautilus --no-desktop'
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

for i in `ls $HOME/.bash/include/`
do
  source $HOME/.bash/include/$i
done

for i in `ls $HOME/.bash/work_include/`
do
  source $HOME/.bash/work_include/$i
done

export EDITOR=vim
export PATH=$HOME/bin/:$PATH
export PATH=$HOME/bin/dev-tools/:$PATH
export PATH=$HOME/bin/dev-tools/bin/:$PATH
export PATH=$HOME/bin/dev-tools/analyzer/:$PATH
export PATH=$HOME/bin/dev-tools/clion/bin/:$PATH
export PATH=$HOME/bin/dev-tools/EAPidea/bin:$PATH
export PATH=$HOME/bin/dev-tools/idea/bin:$PATH
export PATH=$HOME/bin/dev-tools/intelliJ/bin/:$PATH
export PATH=$HOME/bin/dev-tools/pycharm/bin:$PATH
export PATH=$HOME/bin/dev-tools/pycharm/bin/:$PATH
export PATH=$HOME/bin/dev-tools/scala_sloc:$PATH
export PATH=$HOME/bin/dev-tools/bin:$PATH
export PATH=$HOME/bin/dev-tools/JetBrains/clion/bin:$PATH
export PATH=$HOME/bin/dev-tools/JetBrains/DataGrip/bin:$PATH
export PATH=$HOME/bin/dev-tools/JetBrains/intelliJ/bin:$PATH
export PATH=$HOME/bin/dev-tools/JetBrains/pycharm/bin:$PATH
export PATH=$HOME/bin/dev-tools/JetBrains/GoLand/bin:$PATH

export PATH=$HOME/.vimpkg/bin:$PATH
export PATH=/usr/local/cuda-9.2/bin:$PATH
export PATH=/opt/couchbase/bin:$PATH

export PATH=$HOME/bin/games/MultiMC:$PATH
export PATH=$HOME/bin/games/FTL:$PATH

export PATH=$HOME/.cabal:$PATH

export JAVA_HOME=$(readlink -f $(which java))
export JETTY_HOME="$HOME/bin/dev-tools/jetty/"
export IDEA_JDK='/usr/lib/jvm/java-8-oracle/jre/bin/java'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/dev/java_libraries/static_libraries/
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda-9.2/lib64
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/extras/CUPTI/lib64

export WORKON_HOME=$HOME/Envs
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME

export DATA_DIR=$HOME/dev/data/

source /usr/local/bin/virtualenvwrapper.sh
#source $HOME/bin/dev-tools/nvm/nvm.sh

alias pdipip='/home/beachc/Envs/pdi/bin/pip'
alias notpdipip='/home/beachc/Envs/notpdi/bin/pip'

# This was all here when I made this ------------------------------------------ 

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace

HISTCONTROL=ignoredups:ignorespace
HISTIGNORE="ls:ps:history"

# append to the history file, don't overwrite it
shopt -s histappend
shopt -s cmdhist

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000000000
HISTFILESIZE=1000000000
HISTTIMEFORMAT="%h %d %H:%M:%S "

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi
# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mcsmash/bin/dev-tools/google-cloud-sdk/path.bash.inc' ]; then source '/home/mcsmash/bin/dev-tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mcsmash/bin/dev-tools/google-cloud-sdk/completion.bash.inc' ]; then source '/home/mcsmash/bin/dev-tools/google-cloud-sdk/completion.bash.inc'; fi

export PATH=$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin:/home/ANT.AMAZON.COM/casebeac/.vimpkg/bin

export PATH=$HOME/.toolbox/bin:$PATH
eval "$(direnv hook bash)"

#show_virtual_env() {
#  if [[ -n "$VIRTUAL_ENV" && -n "$DIRENV_DIR" ]]; then
#    echo "($(basename $VIRTUAL_ENV))"
#  fi
#}
#export -f show_virtual_env
#PS1='$(show_virtual_env)'$PS1


function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

PROMPT_COMMAND="history -a; $PROMPT_COMMAND"
