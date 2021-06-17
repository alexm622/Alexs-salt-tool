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
function menu(){
    echo "1) accept all awaiting clients"
    echo "2) accept and freshload all waiting clients"
    echo "3) freshload all clients from a list of clients"
    echo "4) execute a command across a list of clients"
    echo "5) execute a script across a group of clients"
    echo "6) use chocolatey to install something across a group of clients"
    echo "7) prepare test environment"
    echo "8) Quit"
}
function cls(){
    printf "\033c"
}
function acceptall(){
    echo -e "you need to be superuser to use this script"
    echo -e "please enter the sudo password now"
    sudo bash ./accept-all.bash
}
function accept_and_load(){
    echo -e "you need to be superuser to use this script"
    echo -e "please enter the sudo password now"
    sudo bash ./accept-all.bash
    
    sudo bash ./freshload_all.bash
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
function prepare_test(){
    echo -e "preparing test"
    sudo bash prepare_test.bash
}

cls
motd

options=( "accept all awaiting clients" "accept and freshload all waiting clients"
     "freshload all clients from a list of clients" "execute a command across a list of clients"
      "execute a script across a group of clients" "use chocolatey to install something across a group of clients" 
      "prepare test env" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        ${options[0]})
            acceptall ;;
        ${options[1]})
            echo "accepting and loading"
            accept_and_load ;;
        ${options[2]})
            freshload_list ;;
        ${options[3]})
            mass_command ;;
        ${options[4]}) 
            mass_script ;;
        ${options[5]}) 
            chocolatey ;;
        ${options[6]}) 
            prepare_test ;;
        "Quit")
            exit 255 ;;
        *) 
        cls

        motd
                                                                      
        
        echo "invalid option $REPLY"
        ;;
    esac
done

