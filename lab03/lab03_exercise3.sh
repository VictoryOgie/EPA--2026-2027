
# this is a comment



# how do we pass parameters from the command line
# into this bash script. 
# we use the notation $1, $2 etc to represent
# the first, second etc parameter into this script
LOGFILE="lab03.log"
if [ -z $1 ]; then
	echo "You didn't pass any paraemters to $0"
fi

# heres a brand new command: 
# it calls ps -ef, then pipes it into word counter
# then stores the result in ct
ct=$(ps -ef | wc -l)

timestamp=$(date)

if [ "$ct" -gt "$1" ]; then
	echo "$timestamp: "Maximum number of processes exceeded" >> $LOGFILE
else
	echo "$timestamp: "The maximum number of processes NOT exceeded" >> $LOGFILE
fi


