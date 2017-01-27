#!/bin/bash
#
# This script attempts to detect backdoors and hidden code in PHP scripts downloaded from suspicious sources.
# Checks for some common and uncommon strings found in unsafe scripts that may lead to ads, backdoors, etc.
# It uses recursive grep searching to output the suspected filename and line.
#
# This script is not foolproof and all output should be examined by someone with at least an intermediate
# knowledge of their system. If something doesn't look right, backup the suspected file to an offline
# storage device and delete original the file from your web server. A lot of times, these shady files can
# be reverse engineered to provide a unique insight into the vulnerability.
#

echo "===================================="
echo "==== PHP MALICIOUS CODE SCANNER ===="
echo "===================================="
echo ""

scanDirectory=""
scannerLoading=true

_promptForDirectory_(){
    echo "Drag & Drop / Paste the Path to Scan:"
    read -p "" scanDirectory
    echo ""
}
_scan_(){
	suspectFiles=$(grep -Rn $1 $scanDirectory --include *.php)
	_printResults_ $1 $suspectFiles
}
function _spinner() {
    # $1 start/stop
    #
    # on start: $2 display message
    # on stop : $2 process exit status
    #           $3 spinner function pid (supplied from stop_spinner)

    local on_success="DONE"
    local on_fail="FAIL"
    local white="\e[1;37m"
    local green="\e[1;32m"
    local red="\e[1;31m"
    local nc="\e[0m"

    case $1 in
        start)
            # start spinner
            i=1
            sp='\|/-'
            delay=${SPINNER_DELAY:-0.05}

            while :
            do
                printf "\b${sp:i++%${#sp}:1}"
                sleep $delay
            done
            ;;
        stop)
            if [[ -z ${3} ]]; then
                echo "spinner is not running.."
                exit 1
            fi
            kill $3 > /dev/null 2>&1
            ;;
        *)
            echo "invalid argument, try {start/stop}"
            exit 1
            ;;
    esac
}

function start_spinner {
    # $1 : msg to display
    _spinner "start" "${1}" &
    # set global spinner pid
    _sp_pid=$!
    disown
}

function stop_spinner {
    # $1 : command exit status
    _spinner "stop" $1 $_sp_pid
    unset _sp_pid
}

_printResults_(){
    #if Nothing Found
    if ! [ -z "$2" ]
    then

        echo "=========================================================================================="
        echo "⚠ $1){} FOUND!"
        echo "=========================================================================================="
        echo "Found in files:"
        echo "$2"
        echo ""
    fi
}


_doScan_(){

    #Ask For Directory
	_promptForDirectory_

    echo ""
    #Clear Log File
    > ~/Desktop/php_scan.log

    start_spinner
    exec >> ~/Desktop/php_scan.log
    echo ""
    echo "=========================================================================================="
    echo "==== NEW PHP SCAN RESULTS ================================================================"
    echo "=========================================================================================="
    echo ""

    _scan_ "apache_child_terminate("
    _scan_ "base64_decode("
    _scan_ "bzopen("
    _scan_ "chgrp("
    _scan_ "chmod("
    _scan_ "chown("
    _scan_ "copy("
    _scan_ "disk_free_space("
    _scan_ "disk_total_space("
    _scan_ "diskfreespace("
    _scan_ "exif_imagetype("
    _scan_ "exif_read_data("
    _scan_ "exif_thumbnail("
    _scan_ "extract("
    _scan_ "file_exists("
    _scan_ "file_get_contents("
    _scan_ "file_put_contents("
    _scan_ "file("
    _scan_ "fileatime("
    _scan_ "filectime("
    _scan_ "filegroup("
    _scan_ "fileinode("
    _scan_ "filemtime("
    _scan_ "fileowner("
    _scan_ "fileperms("
    _scan_ "filesize("
    _scan_ "filetype("
    _scan_ "fopen("
    _scan_ "fsockopen("
    _scan_ "ftp_get("
    _scan_ "ftp_nb_get("
    _scan_ "ftp_nb_put("
    _scan_ "ftp_put("
    _scan_ "get_cfg_var("
    _scan_ "get_current_user("
    _scan_ "getcwd("
    _scan_ "getenv("
    _scan_ "getimagesize("
    _scan_ "getlastmo("
    _scan_ "getmygid("
    _scan_ "getmyinode("
    _scan_ "getmypid("
    _scan_ "getmyuid("
    _scan_ "glob("
    _scan_ "gzfile("
    _scan_ "gzopen("
    _scan_ "hash_file("
    _scan_ "hash_hmac_file("
    _scan_ "hash_update_file("
    _scan_ "highlight_file("
    _scan_ "ini_set("
    _scan_ "iptcembed("
    _scan_ "is_dir("
    _scan_ "is_executable("
    _scan_ "is_file("
    _scan_ "is_link("
    _scan_ "is_readable("
    _scan_ "is_uploaded_file("
    _scan_ "is_writable("
    _scan_ "is_writeable("
    _scan_ "lchgrp("
    _scan_ "lchown("
    _scan_ "link("
    _scan_ "linkinfo("
    _scan_ "lstat("
    _scan_ "md5_file("
    _scan_ "mkdir("
    _scan_ "move_uploaded_file("
    _scan_ "parse_ini_file("
    _scan_ "pathinfo("
    _scan_ "pfsockopen("
    _scan_ "phpinfo("
    _scan_ "posix_getlogin("
    _scan_ "posix_kill("
    _scan_ "posix_mkfifo("
    _scan_ "posix_mkfifo("
    _scan_ "posix_setpgid("
    _scan_ "posix_setsid("
    _scan_ "posix_setuid("
    _scan_ "posix_ttyname("
    _scan_ "proc_close("
    _scan_ "proc_get_status("
    _scan_ "proc_nice("
    _scan_ "proc_terminate("
    _scan_ "putenv("
    _scan_ "read_exif_data("
    _scan_ "readfile("
    _scan_ "readgzfile("
    _scan_ "readlink("
    _scan_ "realpath("
    _scan_ "rename("
    _scan_ "rmdir("
    _scan_ "sha1_file("
    _scan_ "show_source("
    _scan_ "SplFileObject->__construct("
    _scan_ "stat("
    _scan_ "symlink("
    _scan_ "tempnam("
    _scan_ "tmpfile("
    _scan_ "touch("
    _scan_ "unlink("

    echo "=========================================================================================="
    echo "==== SCAN COMPLETED ======================================================================"
    echo "=========================================================================================="
    echo ""

    stop_spinner "DONE"

    echo ""
    echo "Success! Scan Complete."
    echo ""

    open -a "Console" ~/Desktop/php_scan.log
}
_doScan_
