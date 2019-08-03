# BLE-NullBlr
IoT Workshop - BLE - Understanding and Exploiting 



## Resources
- CTF-Resource - https://github.com/hackgnar/ble_ctf
- https://github.com/nkolban/esp32-snippets
- https://lastminuteengineers.com/esp32-arduino-ide-tutorial/
- slides - https://speakerdeck.com/v33ru/ble-bluetooth-low-energy-exploitation

## Download the tools
- bluez 
    - apt get install bluez  - (hcitool and gatttool will install)
    - usage
       - to scan le devices surrounding - #hcitool lescan 
       - to get info about the devices  - #hcitool leinfo $MAC
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

------------------------------------------------------------------------------------------------------------

## Rules of Flashing ESP32 board from the Arduino IDE:
- 1.Select Board>esp32devmodule 
- 2.Check the tools>port>Select /dev/ttyUSB0 (windows - com **)\
- 3.Select upload speed>115200 (default)
- 4.Let it be default other settings 

--------------------------------------------------------------------------------------------------------------

## Challenge 1: Identify the device information

- Flash this code to ESP32 BLE Module one (https://github.com/V33RU/BLE-NullBlr/blob/master/BLE%20Server)
- Scan device 
    - sudo hcitool lescan 
    - sudo hcitool leinfo $MAC
            - Results As shown below image you may get BLE version and vendor information and GAP services info 
            ![](/images/Selection_010.png)
            
----------------------------------------------------------------------------------------------------------------           
## Challenge 2: understand difference between Classsic Bluetooth and BLE (Bluetooth Low Energy) Security
   
 
- **Classic Bluetooth** 
    Classic Bluetooth mostly like we can call as a old Bluetooth, which we used for sending data , mostly this communication is UN-encrypted and non-secure one
                             ![](/images/Picture1.png)
Basic practical Approach use the Bluetooth General code flash into the ESP32(https://github.com/V33RU/BLE-NullBlr/blob/master/Bluetooth%20Connection%20-%20General)
        
 ![](/images/bluetooth%20general.png)

Don’t forget to change the tools options according board requirements
One flash powerup the device and try connect with the mobile device 

Don’t try to connect with the NRF connect app and the code related basic Bluetooth not BLE 

Goto bluetooth settings in mobile
       
  ![](/images/BLK-2.png)

- **Bluetooth Low Energy**
        BLE stands for Bluetooth Low Energy (Bluetooth LE, and marketed as Bluetooth Smart). BLE is a form of wireless communication designed especially for short-range communication. BLE is very similar to Wi-Fi in the sense that it allows devices to communicate with each other.
        
  ![](/images/BLE.png)
        
 These will be very basic difference in security between the Classic & BLE later on Classic Bluetooth will also included the pairing and key authentication as well 
BLE as came more advance features in the device encryption , authentication etc, This is not exact difference this is jus for an idea , 
Soon i will completely write diffrentiation between Classic Bluetooth and Smart BLE with Practical Example


## Challenge 3: Check the Services in BLE and check for Read/Write data

## Challenge 4: Try to overwrite or change the value of Service 
