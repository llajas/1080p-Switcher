# IOGEAR/AVIOR GHSQ8181 HDMI Switch RS-232-to-IP Converter Bash Script

This is a bash script for changing sources on an [IOGEAR/AVIOR GHSQ8181 HDMI switch](https://www.amazon.com/gp/product/B005S0YNNM/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1) equipped with an RS-232-to-IP converter, specifically a [Global Caché IP2SL-P iTach TCP/IP to Serial Converter](https://www.amazon.com/gp/product/B003BFVNS4/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1). The script takes two arguments: the IP address of the converter and the switch command to execute. A list of accepted commands is listed in the table below.

| Command | Description |
| --- | --- |
| `-g` or `-get` | Get current switch status. |
| `-s X` or `-set X` | Set switch to input `X`. |
| `-n` or `-next` | Set switch to the next input in the sequence. |
| `-p` or `-previous` | Set switch to the previous input in the sequence. |

The script parses the switch command to determine the port number and switch to that device accordingly. It also includes a check for invalid port numbers which are 1 through 8. It can execute the switch command and provide feedback on the success or failure of the command as well. Additionally, the script can check for read command output and provide status feedback.

This script is useful for automating the source switching of an IOGEAR/AVIOR GHSQ8181 HDMI switch equipped with an RS-232-to-IP converter, and it can be used in a variety of applications such as home automation, remote control, and more.

Below are a few examples on usage:

## Examples

```bash
# Set input to port 2
./switch_input.sh 192.168.1.20 -set 2

# Set input to port 4
./switch_input.sh 192.168.1.20 -set 4

# Read status of switch
./switch_input.sh 192.168.1.20 -get

# Switch to next port
./switch_input.sh 192.168.1.20 -next

# Switch to previous port
./switch_input.sh 192.168.1.20 -previous
```
