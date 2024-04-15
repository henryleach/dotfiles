# System specific
function fish_greeting
	 set -f os (uname)
	 printf "Fish on $os"
end
