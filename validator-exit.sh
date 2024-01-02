# #!/bin/bash
# set -e

# for key in /keystore/validator_keys/*; do
#   if [ -f "$key" ]; then
#     echo "Found validator key in $key"
#     echo "exiting validator..."
#     # ./lighthouse account validator exit --network $VAL_NETWORK --password-file /keystore/keystore_password.txt --keystore $key --beacon-node $BEACON_API_URL
#     echo "please exit" | ./lighthouse account validator exit --network $VAL_NETWORK --password-file /keystore/keystore_password.txt --keystore $key --beacon-node $BEACON_API_URL
#     echo "Validator exited"
#   fi
# done


# # lighthouse --network goerli account validator exit --keystore /path/to/keystore --beacon-node http://localhost:5052

# #!/bin/bash
# set -e

# for key in /keystore/validator_keys/*; do
#   if [ -f "$key" ]; then
#     echo "Found validator key in $key"
#     echo "exiting validator..."
    
#     # Use expect to automate the interaction
#     if expect -c "
#       spawn ./lighthouse account validator exit --network $VAL_NETWORK --password-file /keystore/keystore_password.txt --keystore $key --beacon-node $BEACON_API_URL
#       expect \"Enter the exit phrase\"
#       send \"Exit my validator\r\"
#       interact
#     "; then
#       sleep 10
#       echo "Validator exited successfully"
#     else
#       echo "Error: Validator exit failed"
#     fi
#   fi
# done


#!/bin/bash
set -e

for key in /keystore/validator_keys/*; do
  if [ -f "$key" ]; then
    echo "Found validator key in $key"
    echo "Exiting validator..."
    
    # Replace the following line with the actual command
    confirmation_text="Exit my validator"
    exit_command="./lighthouse account validator exit --network $VAL_NETWORK --password-file /keystore/keystore_password.txt --keystore $key --beacon-node $BEACON_API_URL"

    output=$(echo "${confirmation_text}" | script -q -c "${exit_command}" /dev/null)

    # Check the exit status of the command
    if [ $? -eq 0 ]; then
      echo "Validator exited successfully"
      echo "Output: ${output}"
    else
      echo "Validator exit command failed"
      echo "Error: ${output}"
    fi
  fi
done
