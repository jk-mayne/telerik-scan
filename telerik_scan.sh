#!/bin/bash
#based on Caleb Gross' Telerik blog post 
#https://bishopfox.com/blog/cve-2019-18935-remote-code-execution-in-telerik-ui
#Variables
#reg ="20[0-9]{2}(\.[0-9]*)"
URL=""
outfile=""


#Help shit...
Help() 
{
	#Show help...
	echo "Usage: telerik_scan.sh [-u|-h|-v]"
	echo 
	echo "options:"
	echo "h 	Print help"
	echo "u	URL to scan"
	echo 
}

###################
# Main #
###################



#Get options...
while getopts ":h:u:o:" option; do
	case $option in
		h) #dislay help
			Help
			exit;;
		\?) #invalid options
			echo "Error: Invalid option"
			exit;;
		u) #url to scan
			URL=$OPTARG;;
		o) #output file required
			outfile=$OPTARG;;
	esac
done

curl -m 1 -skL $URL | grep -oE '20[0-9]{2}(\.[0-9].[0-9]*)' > $outfile


