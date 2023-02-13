#!/bin/bash

# Check for correct number of arguments
if [ $# -lt 2 ] || [ $# -gt 3 ]; then
  echo "Usage: $0 IP_ADDRESS [-get|-set PORT_NUMBER|-next|-previous]"
  exit 1
fi

# Assign arguments to variables
IP_ADDRESS=$1
OPTION=$2
PORT_NUMBER=$3

# Parse command line options
case $OPTION in
  -g|-get) SWITCH_COMMAND="read" ;;
  -s|-set)
    if [[ -z $PORT_NUMBER ]]; then
      echo "Error: Port number is required for -set option."
      exit 1
    fi
    if [[ ! $PORT_NUMBER =~ ^[1-8]$ ]]; then
      echo "Error: Invalid port number."
      exit 1
    fi
    SWITCH_COMMAND="sw i0$PORT_NUMBER"
    ;;
  -n|-next) SWITCH_COMMAND="sw +" ;;
  -p|-previous) SWITCH_COMMAND="sw -" ;;
  *)
    echo "Error: Invalid option. Use -get, -set, -next, or -previous."
    exit 1
    ;;
esac

# Send switch command to converter
if echo -e "$SWITCH_COMMAND\r" | nc -w 2 -z $IP_ADDRESS 4999 > /dev/null 2>&1; then
  if echo -e "$SWITCH_COMMAND\r" | nc -w 2 $IP_ADDRESS 4999 ; then
    :
  else
    echo "Error: Failed to execute switch command."
    exit 1
  fi
else
  echo "Error: Failed to connect to device."
  exit 1
fi

