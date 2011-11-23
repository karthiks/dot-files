# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
# ... or force ignoredups and ignorespace
HISTCONTROL=ignoredups:ignorespace

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

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

#export RAILS_ENV=development
TOMCAT_OPTS="-XX:MaxPermSize=512m -XX:NewSize=384m -server"
TOMCAT_HOME="/home/karthik/apache-tomcat-6.0.29"
ORACLE_HOME="/usr/lib/oracle/xe/app/oracle/product/10.2.0/server"
ANT_HOME="/home/karthik/apache-ant-1.7.1"
IDEA_HOME=/home/karthik/idea-9952
RUBY_MINE_HOME=/home/karthik/rubymine
PATH=$PATH:$ORACLE_HOME/bin:$ANT_HOME/bin:$IDEA_HOME/bin:$RUBY_MINE_HOME/bin
export ANT_HOME
export ORACLE_HOME
export ORACLE_SID=XE
export PATH
export JAVA_OPTS="-Duser.timezone=Asia/Calcutta"
export JAVA_HOME=/usr/lib/jvm/java-6-sun
export CATALINA_HOME=/home/karthik/apache-tomcat-6.0.29

export PATH=$PATH:$JAVA_HOME/bin

#Git tab completion
#TO DO
# Show Git Branch in status line / prompt
PS1='[\W$(__git_ps1 "(%s)")]\$ '
export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
export EDITOR='/usr/bin/gvim'
export BUNDLER_EDITOR='/usr/bin/gvim'

##############################################
# Aliases for 'Frequently Used Commands(FUC)'
##############################################

alias x="exit"
alias ..='cd ..'
alias ...='cd ../..'

# Find Diskspace Usage
alias dus='df -h'

# Find top 5 big files in current directory 
alias findbig="find . -type f -exec ls -s {} \; | sort -n -r | head -5"

# Run and Stop Oracle service
alias rora="echo 'about to run oracle service...'; sudo service oracle-xe start"
alias sora="echo 'about to stop oracle service...'; sudo service oracle-xe stop"

# Run and Stop nginx server
alias rng="echo 'about to run nginx...'; sudo /opt/nginx/sbin/nginx"
alias sng="echo 'about to stop nginx...'; sudo /opt/nginx/sbin/nginx -s stop"

# View and Remove nginx logs
alias nglv="cd /opt/nginx/logs; tail -f access.log error.log services_error.log"
alias nglr="rm /opt/nginx/logs/*.log"

# Start Elastic Search (ES) node
alias res="echo 'about to run ES...'; /home/karthik/elasticsearch/bin/elasticsearch -f"

# Go to Blue Label (BL) project directories
alias cdbl="cd /home/karthik/MyRubyProjects/blue_label"
alias cdblj="cd /home/karthik/MyRubyProjects/blue_label/job_orchestrator"
alias cdblm="cd /home/karthik/MyRubyProjects/blue_label/main_website"
alias cdblp="cd /home/karthik/MyRubyProjects/blue_label/pulses"

# Run All BL Jobs
alias rjobs="cdblm; echo 'about to run jobs...';script/start_jobs"

# Run 1.nginx, 2.All BL jobs, 3.ES
alias rbl="sora; rng; rjobs; res"

#Open my rails practice directory
alias cdr=" cd /home/karthik/MyRubyProjects/practice/rails_3_1_sample_projects"
