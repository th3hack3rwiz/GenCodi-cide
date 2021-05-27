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
	echo -e "${PINK}\n[+] Usage:\n\t./genCodi-cide.sh  -s <size of each code> -r <number of reps per key> -d <length of dashes in b/w codes> <mode>"	
	echo -e "${GREEN} -d : to specify number of dashes between codes"
	echo -e "${GREEN} -s : to specify the size of one entity of code"
	echo -e "${GREEN} -r : to specify the number of reps"
	echo -e "${GREEN}  Eg: ./generatecodes -s 4 -r 3 -d 1 E will generate 'XXXX-XXXX-XXXX' where X:'Some lowercase letter'\n"
}
function menu()
{
	echo "[+] Use any one of the 'modes' to generate codes"
	echo -e "\tA - alpha-num"
	echo -e "\tB - hexadecimal"
	echo -e "\tC - APLHA-NUM"
	echo -e "\tD - NUM"
	echo -e "\tE - alpha"
	echo -e "\tF - ALPHA"
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
			menu
			exit 1
			;;
	esac
done
shift $((OPTIND-1))

test=$1
case $test in

  'A')
    str="abcdefghijklmnopqrstuvwxyz1234567890"
    ;;

  'B')
    str="ABCDEF123456"
    ;;

  'C')
    str="ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890"
    ;;

  'D')
    str='1234567890'
    ;;

  'E')
    str='abcdefghijklmnopqrstuvwxyz'
    ;;

  'F')
    str="ABCDEFGHIJKLMNOPQRSTUVWXYZ"
    ;;

  *)
    echo Wrong option!
    ;;
esac

crunch $size $size $str -o wd >/dev/null 2>&1
myString=$(printf "%$(echo $number)s");dashes=$(echo ${myString// /-} );
cat wd | shuf | xargs -n $reps  | sed "s/\ /$dashes/g" 
rm wd
