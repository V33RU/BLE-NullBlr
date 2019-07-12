#!/bin/bash
gatttool -b 24:0A:C4:30:F0:6A --char-write-req -a 0x002c -n $(echo -n "some flag value"|xxd -ps)
