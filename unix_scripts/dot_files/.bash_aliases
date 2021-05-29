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
alias md='sudo mount -t drvfs S: /mnt/s'

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
