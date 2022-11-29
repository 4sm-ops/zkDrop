# Usage:
# ./aleo_create_account.sh [ACCOUNT_NAME]

# Output JSON file:
# {
#     "AccountName": "[ACCOUNT_NAME]",
#     "AleoPrivateKey": "[Aleo Private Key]",
#     "AleoViewKey": "[Aleo View Key]",
#     "AleoAddress": "[Aloe Address]"		
# }


# Check input, we should get at least 1 variable

if [ $# -eq 0 ]
  then

    echo "No arguments supplied. Usage: ./aleo_create_account.sh [ACCOUNT_NAME]"
  
  else

	# assign Aleo Key from script input

	AccountName=$1

	# generate Aleo keys using native Aleo CLI command

	AleoKeys=$(aleo account new | grep 'Key\|Address')

	# get 3 keys from Aleo CLI command output

	stringarray=($AleoKeys)

	AleoPrivateKey=${stringarray[2]}
	AleoViewKey=${stringarray[5]}
	AleoAddress=${stringarray[7]}

	# prepare JSON file with Aleo Keys

	output_json="
	{
	    \"AccountName\": \""$AccountName"\",
	    \"AleoPrivateKey\": \""$AleoPrivateKey"\",
	    \"AleoViewKey\": \""$AleoViewKey"\",
	    \"AleoAddress\": \""$AleoAddress"\"		
	}
	"

	# save Aleo keys in JSON file in aleo_keys folder

	python3 zkdrop_qr.py $AleoAddress

	cd aleo_keys; echo $output_json > "aleo""_"$AccountName"_key.json"  

fi



