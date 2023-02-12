#!/bin/bash

# Check for correct number of arguments
if [ $# -ne 2 ]; then
  echo "Usage: $0 IP_ADDRESS SWITCH_COMMAND"
  exit 1
fi

# Assign arguments to variables
IP_ADDRESS=$1
SWITCH_COMMAND=$2

# Parse switch command for port number
if [[ $SWITCH_COMMAND == *\i* ]]; then
  PORT_NUMBER=${SWITCH_COMMAND: -2}
  if [[ ! $PORT_NUMBER =~ ^[0-9]+$ || $PORT_NUMBER -lt 1 || $PORT_NUMBER -gt 8 ]]; then
    echo "Error: Invalid port number."
    exit 1
  fi
else
  PORT_NUMBER=01
fi

# Check for read command output
if [[ $SWITCH_COMMAND == "read" ]]; then
  echo "Reading status..."
  if echo -e "$SWITCH_COMMAND\r" | nc -w 2 $IP_ADDRESS 4999 ; then
    echo "Command sent"
    sleep 1
    echo "" | nc -w 2 $IP_ADDRESS 4999
    echo "Reading done"
  else
    echo "Error: Failed to connect to device."
    exit 1
  fi
else
  # Send switch command to converter
  echo "Sent command: $SWITCH_COMMAND"
  if echo -e "$SWITCH_COMMAND\r" | nc -w 2 $IP_ADDRESS 4999 ; then
    echo "Command sent"
  else
    echo "Error: Failed to connect to device."
    exit 1
  fi
fi
