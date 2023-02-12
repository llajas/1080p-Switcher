## IOGEAR/AVIOR GHSQ8181 HDMI Switch RS-232-to-IP Converter Bash Script
This is a bash script for changing sources on an [IOGEAR/AVIOR GHSQ8181 HDMI switch](https://www.amazon.com/gp/product/B005S0YNNM/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&th=1) equipped with an RS-232-to-IP converter, specifically a [Global Caché IP2SL-P iTach TCP/IP to Serial Converter](https://www.amazon.com/gp/product/B003BFVNS4/ref=ppx_yo_dt_b_search_asin_title?ie=UTF8&psc=1). The script takes two arguments: the IP address of the converter and the switch command to execute. A list of accepted commands is listed in the table below.

The script can parse the switch command to determine the port number, and it includes a check for invalid port numbers. It can execute the switch command and provide feedback on the success or failure of the command. Additionally, the script can check for read command output and provide status feedback.

This script is useful for automating the source switching of an IOGEAR/AVIOR GHSQ8181 HDMI switch equipped with an RS-232-to-IP converter, and it can be used in a variety of applications such as home automation, remote control, and more.

|Description|Command|
|-|-|
|Switch Command|`sw`|
|Input Port|`i`|
|Port Number|`01-08`|
|Port Sequence - Next Port|`+`|
|Port Sequence - Previous Port|`-`|

A few examples would therefore look like this:

```bash
root $ ./switch_input.sh 10.7.215.113 "sw i02"
Sent command: sw i02
sw i02 Command OK
root $ ./switch_input.sh 10.7.215.113 "read"
Reading status...
read Command OK
Input: port2
Output: ON
Mode: Next
Goto: OFF
F/W: V1.0.067
```
