#!/bin/bash

# Coheck that the VM has at least the number of
# CPU cores passed in as the first parameter

# each CPU core in /proc/cpuinfo has one line starting with "processor",
# so counting those lines counts the cores
cores=$(grep -c '^processor' /proc/cpuinfo)
echo "This VM has $cores CPU cores"

# -lt means "less than": if we have fewer cores than required,
# print an error and exit with a failure code
if [ "$cores" -lt "$1" ]; then
	echo "ERROR: This VM has $cores CPU cores, but at least $1 are required"
	exit 1
fi

echo "The VM has enough CPU cores"
