# BLE-NullBlr
IoT Workshop - BLE - Understanding and Exploiting 



## Resources
- CTF-Resource - https://github.com/hackgnar/ble_ctf
- https://github.com/nkolban/esp32-snippets
- https://lastminuteengineers.com/esp32-arduino-ide-tutorial/

## Download the tools
- bluez 
    - apt get install bluez  - (hcitool and gatttool will install)
    - usage
       - to scan le devices surroundin - #hcitool lescan 
       - to get info about the devics  - #hcitool leinfo $MAC
- hcidump 
    - sudo apt-get install bluez-hcidump	
    - usage 
       - hcidump --raw
- btproxy	https://github.com/conorpp/btproxy	To run a simple MiTM or proxy on two devices
- bettercap	https://www.bettercap.org/installation/	
    
- btlejack	https://github.com/virtualabs/btlejack	
- nrfconnect https://www.nordicsemi.com/Software-and-Tools/Development-Tools/nRF-Connect-for-desktop/Download 
- Arduino IDE    https://www.arduino.cc/en/guide/linux
- Ubuntu 18.04 


## Challenge 1: Identify the device information

- Flash this code to ESP32 BLE Module one (https://github.com/V33RU/BLE-NullBlr/blob/master/BLE%20Server)
