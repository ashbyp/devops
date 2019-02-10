# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias df='df -h'
alias du='du -h'
alias ll='ls -al'
alias .=pwd
alias ..='cd ..'
alias c=clear
alias rc='source ~/.bashrc'
alias ls='ls -F'
alias h=history
alias mg='cd ~/gowork/src/github.com/ashbyp/goutil'

create_mvn_simple() {
   if [ $# -ne 1 ]; then
      echo "Usage: create_mvn_simple <project name>"
      return
   fi
   proj=$1

   mvn archetype:generate -DgroupId=com.ashbyp.$proj -DartifactId=$proj \
                          -DarchetypeArtifactId=maven-archetype-quickstart -DinteractiveMode=false
}

init_github_proj() {
   # create proj on github first
   if [ $# -ne 1 ]; then
      echo "Usage: init_github_proj <project name>"
      return
   fi
   proj=$1

   git init
   git add .
   git commit -m "first commit for $proj"
   git remote add origin git@github.com:ashbyp/$proj.git
   git push -u origin master

}

export PATH=$PATH:$HOME/bin:$HOME/bin/protoc-3.0.0/bin:$GOPATH/bin
export GODATA=$GOPATH/dat

# app enginme
export GAE_SDK_ROOT="C:\Users\ashbyp\dev\go_appengine"
export GAE_SDK_ROOT=/cygdrive/c/Users/ashbyp/dev/go_appengine
export PATH=$PATH:$GAE_SDK_ROOT
