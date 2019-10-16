# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
#set guifont=Ubuntu\ Mono\ for\ Powerline\ 12

export CURRENT_TICKET="BE-5756"
export STAGING_MONGO_PASS=$(aws ssm --region='us-west-2' get-parameter --name "/atlas/staging/mongo_password" --with-decryption --output json | jq -r ".Parameter.Value" || echo "no connection")

#alias mc='java -Xmx1024M -Xms512M -cp $HOME/bin/minecraft.jar net.minecraft.LauncherFrame'
alias nautilus='nautilus --no-desktop'
alias cdgo="cd $HOME/dev/go/src/github.com/gametimesf/"
alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'
alias mb='make build'
alias mt='make test'
alias mtb='make test build'
alias mbr='make build run'
alias gt='go test -v'
alias code-gen="java -jar ~/bin/dev-tools/bin/swagger-codegen-cli-2.4.5.jar generate -i ./swagger.json -l typescript-fetch   -o $HOME/dev/ts-mobileapi-client   --additional-properties modelPropertyNaming=snake_case"
alias gcot='git checkout $CURRENT_TICKET'
alias compass="mongodb-compass-community"
alias mq="mongo localhost/gametime_development --username='admin' --password='gametime' --authenticationDatabase='admin' --eval "
alias smq="mongo "'"'"mongodb+srv://staging-803bf.mongodb.net/gametime_staging"'"'" --username atlas --password='$STAGING_MONGO_PASS' --networkMessageCompressors zlib,snappy --quiet --ssl --eval "
alias filter_mq="egrep -v \"^[0-9]{4}-[0-9]{2}-[0-9]{2}\" "
alias ext_json_to_json="egrep -v \"^[0-9]{4}-[0-9]{2}-[0-9]{2}\" | egrep \"^[~{[\\\"]\" | sed 's/ObjectId(\(\"[0-9a-f]\{24\}\"\))/\1/g' | sed 's/ISODate(\(\"[-0-9T:Z.]*\"\))/\1/g' | sed 's/NumberLong(\([0-9]*\))/\1/g' "

export TMPDIR=$HOME/tmp

source $HOME/.bash/include/github

export GOPATH=$HOME/dev/go/

export HOME_DBIN=$HOME/bin/dev-tools/
export PATH=/opt/couchbase/bin:$PATH
export PATH=${HOME_DBIN}:$PATH
export PATH=${HOME_DBIN}bin:$PATH
export PATH=${HOME_DBIN}analyzer/:$PATH
export PATH=${HOME_DBIN}clion/bin/:$PATH
export PATH=${HOME_DBIN}EAPidea/bin:$PATH
export PATH=${HOME_DBIN}idea/bin:$PATH
export PATH=${HOME_DBIN}intelliJ/bin/:$PATH
export PATH=${HOME_DBIN}pycharm/bin:$PATH
export PATH=${HOME_DBIN}pycharm/bin/:$PATH
export PATH=${HOME_DBIN}scala_sloc:$PATH
export PATH=${HOME_DBIN}robo3t-1.2.1/bin:$PATH
export PATH=${HOME_DBIN}GoLand-2019.1/bin:$PATH
export PATH=${HOME_DBIN}WebStorm-191.6183.63/bin:$PATH
export PATH=${HOME_DBIN}RubyMine-2019.2.3/bin:$PATH

export PATH=$HOME/.vimpkg/bin:$PATH
export PATH=$HOME/dev/go/bin:$PATH

export PATH=$HOME/bin/games/MultiMC:$PATH
export PATH=$HOME/bin/games/FTL:$PATH

export PATH=$HOME/.cabal:$PATH

# GameTime

export PATH=/usr/local/go/bin:$PATH


#export JAVA_HOME='/usr/lib/jvm/java-1.6.0-openjdk'
export JAVA_HOME='/usr/lib/jvm/java-8-oracle'
export JETTY_HOME="$HOME/bin/dev-tools/jetty/"
export IDEA_JDK='/usr/lib/jvm/java-8-oracle/jre/bin/java'
#export JAVA_HOME='/usr/lib/jvm/java-6-openjdk-amd64/'
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/dev/java_libraries/static_libraries/

export WORKON_HOME=$HOME/Envs
export PIP_REQUIRE_VIRTUALENV=true
export PIP_RESPECT_VIRTUALENV=true
export PIP_VIRTUALENV_BASE=$WORKON_HOME
source /usr/local/bin/virtualenvwrapper.sh

alias pdipip='/home/beachc/Envs/pdi/bin/pip'
alias notpdipip='/home/beachc/Envs/notpdi/bin/pip'

function local_mquery() {
  mongo localhost/gametime_development --username="admin" --password="gametime" --authenticationDatabase='admin' --eval 
}
# TODO: Patch fonts and get powerline-bash/vim working properly
# Powerline bash plugin -------------------------------------------------------
#export $TERM=xterm-256color
#function _update_ps1()
#{
#   export PS1="$(~/.bash/PowerLineShell/powerline-shell.py $?)"
#}

# append to the history file, don't overwrite it
shopt -s histappend
PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
#export PROMPT_COMMAND="_update_ps1"

# This was all here when I made this ------------------------------------------ 

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace

HISTCONTROL=ignoredups:ignorespace


# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=10000000
HISTFILESIZE=10000000

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

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/mcsmash/bin/dev-tools/google-cloud-sdk/path.bash.inc' ]; then source '/home/mcsmash/bin/dev-tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/mcsmash/bin/dev-tools/google-cloud-sdk/completion.bash.inc' ]; then source '/home/mcsmash/bin/dev-tools/google-cloud-sdk/completion.bash.inc'; fi
export PATH=$PATH:~/.vimpkg/bin
eval "$(rbenv init -)"

show_virtual_env() {
  if [ -n "$VIRTUAL_ENV" ]; then
    echo "($(basename $VIRTUAL_ENV))"
  fi
}

PS1='$(show_virtual_env)'$PS1

# direnv
eval "$(direnv hook bash)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

function _update_ps1() {
    PS1=$(powerline-shell $?)
}

if [[ $TERM != linux && ! $PROMPT_COMMAND =~ _update_ps1 ]]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

# Jeff's tunnle function
function tunnel {
  usage='tunnel <host> <localport> <remoteport> (targethost)'
  if [[ -z $1 ]]; then
    echo $usage && return
  fi

  if [[ -z $2 ]]; then
    echo $usage && return
  fi

  if [[ -z $3 ]]; then
    echo $usage && return
  fi

  if [[ -z $4 ]]; then
    TARGET_HOST=$1
  else
    TARGET_HOST=$4
  fi

  HOST=$1
  LOCALPORT=$2
  REMOTEPORT=$3

  ssh -l root -L ${LOCALPORT}:${TARGET_HOST}:${REMOTEPORT} ${HOST}
}
export PATH="/home/casey/.ebcli-virtual-env/executables:$PATH"

# added by travis gem
[ -f /home/casey/.travis/travis.sh ] && source /home/casey/.travis/travis.sh
