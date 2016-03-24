ssh(){
  echo -e "\033]Ph355b85\033\\"
  command ssh $*
  echo -e "\033]Ph252525\033\\"
}

export -f ssh
