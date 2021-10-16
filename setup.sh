#!/data/data/com.termux/files/usr/bin/bash

## Author  : Sounava777
## Github  : @anika777
## Youtube : https://www.youtube.com/channel/UCOiqRfC_RJqauRtqaOhTRTA

## Run exe files in Termux Android

## ANSI Colors (FG & BG)
RED="$(printf '\033[31m')"  GREEN="$(printf '\033[32m')"  ORANGE="$(printf '\033[33m')"  BLUE="$(printf '\033[34m')"
MAGENTA="$(printf '\033[35m')"  CYAN="$(printf '\033[36m')"  WHITE="$(printf '\033[37m')" BLACK="$(printf '\033[30m')"
REDBG="$(printf '\033[41m')"  GREENBG="$(printf '\033[42m')"  ORANGEBG="$(printf '\033[43m')"  BLUEBG="$(printf '\033[44m')"
MAGENTABG="$(printf '\033[45m')"  CYANBG="$(printf '\033[46m')"  WHITEBG="$(printf '\033[47m')" BLACKBG="$(printf '\033[40m')"

## Reset terminal colors
reset_color() {
	printf '\033[37m'
}

## Script Termination
exit_on_signal_SIGINT() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Interrupted." 2>&1; reset_color; }
    exit 0
}

exit_on_signal_SIGTERM() {
    { printf "${RED}\n\n%s\n\n" "[!] Program Terminated." 2>&1; reset_color; }
    exit 0
}

trap exit_on_signal_SIGINT SIGINT
trap exit_on_signal_SIGTERM SIGTERM

## Banner
banner() {
	clear
    cat <<- EOF
		${RED}┌──────────────────────────────────────────────────────────────────────────────────────────────────────┐
		${RED}│${GREEN}███████╗██╗░░██╗███████╗  ██╗███╗░░██╗  ████████╗███████╗██████╗░███╗░░░███╗██╗░░░██╗██╗░░██╗${RED}|
		${RED}|${GREEN}██╔════╝╚██╗██╔╝██╔════╝  ██║████╗░██║  ╚══██╔══╝██╔════╝██╔══██╗████╗░████║██║░░░██║╚██╗██╔╝${RED}|
        ${RED}|${GREEN}█████╗░░░╚███╔╝░█████╗░░  ██║██╔██╗██║  ░░░██║░░░█████╗░░██████╔╝██╔████╔██║██║░░░██║░╚███╔╝░${RED}|
        ${RED}|${GREEN}██╔══╝░░░██╔██╗░██╔══╝░░  ██║██║╚████║  ░░░██║░░░██╔══╝░░██╔══██╗██║╚██╔╝██║██║░░░██║░██╔██╗░${RED}|
        ${RED}|${GREEN}███████╗██╔╝╚██╗███████╗  ██║██║░╚███║  ░░░██║░░░███████╗██║░░██║██║░╚═╝░██║╚██████╔╝██╔╝╚██╗${RED}|
        ${RED}|${GREEN}╚══════╝╚═╝░░╚═╝╚══════╝  ╚═╝╚═╝░░╚══╝  ░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░╚═════╝░╚═╝░░╚═╝${RED}|
		${RED}└──────────────────────────────────────────────────────────────────────────────────────────────────────┘
		${BLUE}By : Sounava777 // @anika777
	EOF

}

## Show usages
usage() {
	banner
	echo -e ${ORANGE}"\nInstall GUI (Openbox Desktop) on Termux"
	echo -e ${ORANGE}"Usages : $(basename $0) --install \n"
}


## Update, X11-repo, Program Installation


setup_base() {
	echo -e ${RED}"\n[*] Installing Please Wait..."
	echo -e ${CYAN}"\n[*] Updating Termux... \n"
	{ reset_color; pkg autoclean;apt update -y; apt upgrade; pkg upgrade -y; pkg upgrade -y;}
	echo -e ${CYAN}"\n[*] Installing wget... \n"
	{ reset_color; pkg install wget -y; }
	done
	reset_color
}

# installing Ubuntu.
	echo -e ${CYAN}"\n[*] Downloading Ubuntu... \n"
	{ reset_color; wget https://bit.ly/3p4ZTq2; }
	
    echo -e ${CYAN}"\n[*] Installing Ubuntu... \n"
    { reset_color; bash 3p4ZTq2 switch}

    echo -e ${CYAN}"\n[*] Updating Termux... \n"
	{ reset_color; pkg autoclean;apt update -y; apt upgrade; pkg upgrade -y; pkg upgrade -y;}


	_pkgs=(wget openssl-tool proot)
	echo -e ${CYAN}"\n[*] Installing required programs... \n"
	for package in "${_pkgs[@]}"; do
		{ reset_color; pkg install -y "$package"; }
		_ipkg=$(pkg list-installed $package 2>/dev/null | tail -n 1)
		_checkpkg=${_ipkg%/*}
		if [[ "$_checkpkg" == "$package" ]]; then
			echo -e ${GREEN}"\n[*] Package $package installed successfully.\n"
			continue
		else
			echo -e ${MAGENTA}"\n[!] Error installing $package, Terminating...\n"
			{ reset_color; exit 1; }
		fi
	done