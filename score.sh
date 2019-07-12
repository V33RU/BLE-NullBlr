#!/bin/bash
gatttool -b 24:0A:C4:30:F0:6A --char-read -a 0x002a|awk -F':' '{print $2}'|tr -d ' '|xxd -r -p;printf '\n' 
