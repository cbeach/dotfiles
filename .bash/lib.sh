color_echo() {
    color=$1
    shift
    text="$@"
    case $color in
        black)
            echo -e "\033[0;30m${text}\033[0m"
            ;;
        red)
            echo -e "\033[0;31m${text}\033[0m"
            ;;
        green)
            echo -e "\033[0;32m${text}\033[0m"
            ;;
        brown)
            echo -e "\033[0;33m${text}\033[0m"
            ;;
        blue)
            echo -e "\033[0;34m${text}\033[0m"
            ;;
        purple)
            echo -e "\033[0;35m${text}\033[0m"
            ;;
        cyan)
            echo -e "\033[0;36m${text}\033[0m"
            ;;
        light_gray)
            echo -e "\033[0;37m${text}\033[0m"
            ;;
        dark_gray)
            echo -e "\033[1;30m${text}\033[0m"
            ;;
        light_red)
            echo -e "\033[1;31m${text}\033[0m"
            ;;
        light_green)
            echo -e "\033[1;32m${text}\033[0m"
            ;;
        yellow)
            echo -e "\033[1;33m${text}\033[0m"
            ;;
        light_blue)
            echo -e "\033[1;34m${text}\033[0m"
            ;;
        light_purple)
            echo -e "\033[1;35m${text}\033[0m"
            ;;
        light_cyan)
            echo -e "\033[1;36m${text}\033[0m"
            ;;
        white)
            echo -e "\033[1;37m${text}\033[0m"
            ;;
        *)
            echo -e "${text}"
            ;;
    esac
}
export -f color_echo

function include() {
  for i in `ls $HOME/.bash/include/`
  do
    cat $HOME/.bash/include/$i
  done

  if [ -d "$HOME/.bash/work_include/" ]; then
    for i in `ls $HOME/.bash/work_include/`
    do
      cat $HOME/.bash/work_include/$i
    done
  fi

  for i in `ls $HOME/.bash/path/`
  do
    cat $HOME/.bash/path/$i
  done

  for i in `ls $HOME/.bash/personal/path/`
  do
    cat $HOME/.bash/personal/path/$i
  done
}
export -f include
