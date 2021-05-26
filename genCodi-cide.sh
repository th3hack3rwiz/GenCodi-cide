#!/bin/bash
#!/bin/bash
BOLD='\e[1m'
GOLD='\e[38;5;226m'
GREY='\033[0;37m'
echo -e "${GOLD}${BOLD}$(figlet -f slant GenCodi-cide)"
echo -e "\033[0;37m\e[1m\n\t\t\t  ${GREY}${BOLD}© Created By: th3hack3rwiz"
CYAN='\033[0;36m'
PEACH='\e[38;5;216m'
GREEN='\e[38;5;149m'
ORANGE='\e[38;5;202m'
MAGENTA='\033[0;95m'
PINK='\e[38;5;204m'
YELLOW='\e[38;5;227m'
OFFWHITE='\e[38;5;157m'
RED='\e[38;5;196m'

function usage()
{
	echo -e "${PINK}\n[+] Usage:\n\t./generatecodes  <length of alpha-num strings> <number of reps per key> <length of dashes>"	
	echo -e "${GREEN} -d : to specify number of dashes between codes"
	echo -e "${GREEN} -s : to specify the size of one entity of code"
	echo -e "${GREEN} -r : to specify the number of reps"
	echo -e "${GREEN}  Eg: ./generatecodes -s 4 -r 3 -d 1 will generate 'XXXX-XXXX-XXXX'"
}

while getopts :d:s:r: fuzz_args; do 
	case $fuzz_args in
		d)
			number=$OPTARG
			;;
		s)
			size=$OPTARG
			;;
		r)	reps=$OPTARG
			;;
		*)
			usage
			exit 1
			;;
	esac
done
shift $((OPTIND-1))


crunch $size $size ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890 > wd
myString=$(printf "%$(echo $number)s");dashes=$(echo ${myString// /-} );
cat wd | shuf | xargs -n $reps  | sed "s/\ /$dashes/g" 
rm wd
