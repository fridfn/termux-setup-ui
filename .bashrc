alias gitlog="git log --pretty=format:'%h - %an, %ar : %s' -5"
alias project='cd ~/project && ls'
alias reload='source /data/data/com.termux/files/home/.bashrc'
alias rbash="source ~/.bashrc && c"
alias c="clear"
alias root='cd .. && cd ..'
alias android="cd storage/emulated/0"

alias obash="nano ~/.bashrc"
alias omotd="nano /data/data/com.termux/files/usr/etc/motd"
alias otheme="nano ~/.oh-my-zsh/themes/jonathan.zsh-theme"
alias oproject="nano ~/.bashrc"
alias ogithub="nano ~/kamus/github.sh"
alias otermux="nano ~/kamus/termux.sh"
alias oreact="nano ~/kamus/react.sh"
alias owarna='nano ~/kamus/color.sh'
alias ojavascript='nano ~/kamus/javascript.sh'

alias pf="cd project && cd farid"
alias nrd="npm run dev"
alias down="cd storage/emulated/0/download"

alias termux='~/kamus/termux.sh'
alias warna='~/kamus/color.sh'
alias react='~/kamus/react.sh'
alias github='~/kamus/github.sh'
alias javascript='~/kamus/javascript.sh'
alias e="exit"
alias cdd="cd ..."
alias ex="nano ~/favorite.sh"
alias fav="~/favorite.sh"
alias cl="~/chapter/challenge.py"

black=$(tput setaf 8)
red=$(tput setaf 9)
green=$(tput setaf 10)
yellow=$(tput setaf 11)
blue=$(tput setaf 4)
purple=$(tput setaf 13)
cyan=$(tput setaf 14)
white=$(tput setaf 15)
clear=$(tput sgr0)


#public client 8f5fa7fd269943908154a007da4d4438
#secret client 4439897a0f8e497e829251c6c7c2c839

color() {
  local message=$1
  local color=$2
   
  case $color in
    black)
        echo "${black}${message}${clear}"
        ;;
    red)
        echo "${red}${message}${clear}"
        ;;
    green)
        echo "${green}${message}${clear}"
        ;;
    yellow)
        echo "${yellow}${message}${clear}"
        ;;
    blue)
        echo "${blue}${message}${clear}"
        ;;
    purple)
        echo "${purple}${message}${clear}"
        ;;
    cyan)
        echo "${cyan}${message}${clear}"
        ;;
    white)
        echo "${white}${message}${clear}"
        ;;
    *)
        echo "${message}"
        ;;
  esac
}



function clear() {
    command clear

echo -e "\033[35m   ____  _____      _____                     _ _"      
echo -e "\033[35m  / __ \| ____|_  _|  ___|_ ___   _____  _ __(_) |_ ___"
echo -e '\033[35m / / _ `|  _| \ \/ / |_ / _ `\ \ / / _ \| "__| | __/ _ \"'
echo -e "\033[36m| | (_| | |___ >  <|  _| (_| |\ V / (_) | |  | | ||  __/"
echo -e "\033[36m \ \__,_|_____/_/\_\_|  \__,_| \_/ \___/|_|  |_|\__\___|"
echo -e "\033[36m  \____/ By : Farid Fathoni N ~\n"

cat << EOF
  ${green}Selamat datang di terminal ${purple}@FaDevelopment !${clear}
  ${green}Untuk melakukan sesuatu lebih lanjut gunakan perintah
  shortcut di bawah ini :${clear}

  ${green}∆${clear}  ${purple}Warna${clear}        : ${blue}untuk membuka panduan kode warna${purple}${clear}
  ${green}∆${clear}  ${green}Termux${clear}       : ${blue}untuk membuka panduan penggunaan shell${purple}${clear}
  ${green}∆${clear}  ${purple}Code${clear}         : ${blue}untuk membuka text editor (Acode)${purple}${clear}
  ${green}∆${clear}  ${green}gitlog${clear}       : ${blue}untuk melihat history commit branch ${purple}${clear}
  
EOF
echo -e "\033[35m___________________________________________________________\033[0m\n"

cat << EOF
  ${green}Di bawah ini adalah shortcut untuk panduan / rangkuman
  materi yang di pelajari / digunakan :${clear}

  ${green}∆${clear}  ${purple}Termux${clear}       : ${blue}Untuk membuka panduan penggunaan shell${purple}
  ${green}∆${clear}  ${green}React${clear}        : ${blue}Untuk membuka panduan kode warna${purple}
  ${green}∆${clear}  ${purple}Warna${clear}        : ${blue}Rangkuman semua kode warna di shell${purple}
  ${green}∆${clear}  ${green}Github${clear}       : ${blue}Panduan fungsi fungsi Git${purple}
  ${green}∆${clear}  ${purple}Javascript${clear}   : ${blue}Rangkuman function yang sangat penting${purple}
  ${green}∆  ${green}command${clear}      : ${blue}Shortcut command${purple}

  ${yellow}Note : untuk membuka / mengedit shortcut command diatas${clear}
  ${yellow}gunakan awalan${clear} ${red}o[nama shortcut]${clear}
EOF
echo -e "\033[35m___________________________________________________________\033[0m\n"
}



function ls() {
   echo "\n"
   echo -e "\033[35m--------------------LIST OF DIRECTORYS---------------------\033[0m\n"
   result=$(command ls "$@")
   echo "\033[36m$result\033[0m"
   echo "\n"
   echo "\033[35mDirectory\033[0m : \033[34m$(pwd)\033[0m"
   echo -e "\033[35m___________________________________________________________\033[0m\n"
}


function code() {
   param1=$1
   if [ -z "$param1" ]; then
      am start -n com.foxdebug.acode/.MainActivity
   else 
      echo "\033[93mMembuka code di\033[0m \033[90m$(pwd)\033[0m \033[093mdan file \033[92m$1\033[0m\n"
      am start --user 0 -a android.intent.action.VIEW -d "file://$(pwd)/$1" -n com.foxdebug.acode/.MainActivity
   fi
}