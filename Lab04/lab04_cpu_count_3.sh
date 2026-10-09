#!/bin/bash


#Exercise 1 but with a usage() function that reports
# how to call the script if the user forgets the parameter

# print usage information and exit with an error code
usage() {
	echo "Usage: $0 [MAX_NUM_CORES]"
	exit 1
}

# if no argument was passed in, report usage instead of crashing
if [ -z "$1" ]; then
	usage
fi

# count the cores: each CPU in /proc/cpuinfo has one "processor" line
cores=$(grep -c '^processor' /proc/cpuinfo)
echo "This VM has $cores CPU cores"

# -lt means "less than": error out if we don't have enough cores
if [ "$cores" -lt "$1" ]; then
	echo "ERROR: This VM has $cores CPU cores, but at least $1 are required"
	exit 1
fi

echo "The VM has enough CPU cores"
