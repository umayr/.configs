#-----------------------------
#	Constants 
#-----------------------------

# Reset
Color_Off='\e[0m'       # Text Reset

# Regular Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Background
On_Black='\e[40m'       # Black
On_Red='\e[41m'         # Red
On_Green='\e[42m'       # Green
On_Yellow='\e[43m'      # Yellow
On_Blue='\e[44m'        # Blue
On_Purple='\e[45m'      # Purple
On_Cyan='\e[46m'        # Cyan
On_White='\e[47m'       # White


LS_COLORS="no=00:fi=00:di=00;36:ln=00;36:pi=40;33:so=00;35:bd=40;33;01:cd=40;33;01:or=01;05;37;41:mi=01;05;37;41:ex=00;35:*.cmd=00;32:*.exe=00;32:*.sh=00;32:*.gz=00;31:*.bz2=00;31:*.bz=00;31:*.tz=00;31:*.rpm=00;31:*.cpio=00;31:*.t=93:*.pm=00;36:*.pod=00;96:*.conf=00;33:*.off=00;9:*.jpg=00;94:*.png=00;94:*.xcf=00;94:*.JPG=00;94:*.gif=00;94:*.pdf=00;91"
export LS_COLORS

#-----------------------------
#	Aliases 
#-----------------------------

# Colorize the ls output
alias ls='ls --color=tty'
 
# Use a long listing format
alias ll='ls -la'
 
# Show hidden files 
alias l.='ls -d .* --color=auto'

# Default 'ls'
alias ls='ls -lhart --color=auto'

# get rid of command not found
alias cd..='cd ..'
 
# A quick way to get out of current directory
alias ..='cd ..'

alias cd...='cd ../../../'
alias ...='cd ../../../'

alias cd....='cd ../../../../'
alias ....='cd ../../../../'

alias cd.....='cd ../../../../'
alias .....='cd ../../../../'

alias .4='cd ../../../../'

alias .5='cd ../../../../..'
 
# Colorize the grep command output for ease of use (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Start calculator with math support
alias bc='bc -l'

# Path command
alias path='echo -e ${PATH//:/\\n}'

# Time and Date
alias now='echo -e ${Color_Off}${Cyan}`date +"%T"`${Color_Off}'
alias nowtime='echo -e ${Color_Off}${Cyan}`now`${Color_Off}'
alias nowdate='echo -e ${Color_Off}${Cyan}`date +"%d-%m-%Y"`${Color_Off}'

# Show open ports
alias ports='netstat -tanp'

# File tree
alias tree="find . -print | sed -e 's;[^/]*/;|____;g;s;____|; |;g'"

#-----------------------------
#	Functions 
#-----------------------------

# Go Up in the directory tree.
up () {
	if [ -z $1 ]; then
		COUNTER=1
	else
		COUNTER=$1
	fi
    while [[ $COUNTER -gt 0 ]]
     do
      UP="${UP}../"
      COUNTER=$(( $COUNTER -1 ))
     done
    echo -e ${Color_Off}${Cyan}Executed: cd $UP${Color_Off}
    cd $UP
    UP=''
}

# Generates a random password.
function random() {
	if [ -z $1 ]; then
		MAXSIZE=10
	else
		MAXSIZE=$1
	fi
	array1=( 
	q w e r t y u i o p a s d f g h j k l z x c v b n m Q W E R T Y U I O P A S D 
	F G H J K L Z X C V B N M 1 2 3 4 5 6 7 8 9 0 
	\! \@ \$ \% \^ \& \* \! \@ \$ \% \^ \& \* \@ \$ \% \^ \& \* 
	) 
	MODNUM=${#array1[*]} 
	pwd_len=0 
	while [ $pwd_len -lt $MAXSIZE ] 
	do 
	    index=$(($RANDOM%$MODNUM)) 
	    echo -n "${array1[$index]}" 
	    ((pwd_len++)) 
	done 
	echo 
}
