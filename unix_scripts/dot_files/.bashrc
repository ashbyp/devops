alias df='df -h'
alias du='du -h'
alias ll='ls -al'
alias .=pwd
alias ..='cd ..'
alias c=clear
alias rc='source ~/.bashrc'
alias ls='ls -F'
alias h=history
alias md='sudo mount -t drvfs S: /mnt/s'
alias ds='ssh admin@diskstation'
alias dev='cd ~/dev'
alias jdev='cd ~/dev/java'
alias pdev='cd ~/dev/python'
alias rdev='cd ~/dev/R'
alias bb='docker run -it --rm busybox'
alias more=less

security_updates() {
    sudo apt-get update
    sudo apt-get -y upgrade
}

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

prettyjson_s() {
    echo "$1" | python3 -m json.tool
}

prettyjson_f() {
    python -m json.tool3 "$1"
}

prettyjson_w() {
    curl "$1" | python3 -m json.tool
}

runl() {

  if [[ -z "$1" ]]; then
    echo "Usage: runl <file>"
    return 1
  fi

  if [[ ! -f "$1" ]]; then
    echo "File not found: $1"
    return 1
  fi

  last_line=$(tail -n 1 "$1")
  if [[ -z "$last_line" ]]; then
    echo "File is empty or last line is blank."
    return 1
  fi

  echo "Running: $last_line"
  eval "$last_line"
}

runf() {

  if [[ -z "$1" ]]; then
    echo "Usage: runf <file>"
    return 1
  fi

  if [[ ! -f "$1" ]]; then
    echo "File not found: $1"
    return 1
  fi

  last_line=$(head -n 1 "$1")
  if [[ -z "$last_line" ]]; then
    echo "File is empty or last line is blank."
    return 1
  fi

  echo "Running: $last_line"
  eval "$last_line"
}


