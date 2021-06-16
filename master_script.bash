#     _   _           _      __       _ _     _____            _ 
#    /_\ | | _____  _( )__  / _\ __ _| | |_  /__   \___   ___ | |
#   //_\\| |/ _ \ \/ // __| \ \ / _` | | __|   / /\/ _ \ / _ \| |
#  /  _  \ |  __/>  < \__ \ _\ \ (_| | | |_   / / | (_) | (_) | |
#  \_/ \_/_|\___/_/\_\|___/ \__/\__,_|_|\__|  \/   \___/ \___/|_|
#   
#!/bin/bash
function motd(){
    echo "   _   _           _      __       _ _     _____            _ ";
    echo "  /_\\ | | _____  _( )__  / _\\ __ _| | |_  /__   \\___   ___ | |";
    echo " //_\\\\| |/ _ \\ \\/ // __| \\ \\ / _\\ | | __|   / /\\/ _ \\ / _ \\| |";
    echo "/  _  \\ |  __/>  < \\__ \\ _\\ \\ (_| | | |_   / / | (_) | (_) | |";
    echo "\\_/ \\_/_|\\___/_/\\_\\|___/ \\__/\\__,_|_|\\__|  \\/   \\___/ \\___/|_|";
    echo "                                                              ";
}
function cls(){
    printf "\033c"
}
function acceptall(){
    echo -e "acceptall"
}
function accept_and_load(){
    echo -e "accept_and_load"
}
function freshload_list(){
    echo -e "freshload a list of clients"
}
function mass_command(){
    echo -e "execute a command across a list of clients"
}
function mass_script(){
    echo -e "execute a script across a list of files"
}
function chocolatey(){
    echo -e "use chocolatey"
}


motd

options=( "accept all awaiting clients" "accept and freshload all waiting clients"
     "freshload all clients from a list of clients" "execute a command across a list of clients"
      "execute a script across a group of clients" "use chocolatey to install something across a group of clients" 
      "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ${options[0]})
            acceptall ;;
        ${options[1]})
            accept_and_load ;;
        ${options[2]})
            freshload_list ;;
        ${options[3]})
            mass_command ;;
        ${options[4]}) 
            mass_script ;;
        ${options[5]}) 
            chocolatey ;;
        "Quit")
            exit 255 ;;
        *) echo "invalid option $REPLY";;
    esac
done