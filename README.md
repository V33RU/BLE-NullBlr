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
   `Classic Bluetooth mostly like we can call as a old Bluetooth, which we used for sending data , mostly this communication is UN-encrypted and non-secure one`
                             ![](/images/Picture1.png)

`Basic practical Approach use the Bluetooth General code flash into the ESP32(https://github.com/V33RU/BLE-NullBlr/blob/master/Bluetooth%20Connection%20-%20General)`
        
 ![](/images/bluetooth%20general.png)
`Don’t forget to change the tools options according board requirements`
`Once flash powerup the device and try connect with the mobile device` 
`Don’t try to connect with the NRF connect app and the code related basic Bluetooth not BLE` 
`Goto bluetooth settings in mobile`
       
  ![](/images/BLK-2.png)

- **Bluetooth Low Energy**
        `BLE stands for Bluetooth Low Energy (Bluetooth LE, and marketed as Bluetooth Smart). BLE is a form of wireless communication designed especially for short-range communication. BLE is very similar to Wi-Fi in the sense that it allows devices to communicate with each other`
        
  ![](/images/BLE.png)
        
 `These will be very basic difference in security between the Classic & BLE later on Classic Bluetooth will also included the pairing and key authentication as well 
BLE as came more advance features in the device encryption , authentication etc, This is not exact difference this is just for an idea , 
Soon i will completely write difference between Classic Bluetooth and Smart BLE with Practical Example`


## Challenge 3: Check the Services in BLE and check for Read/Write data

        `From the 1st challenge will get to know how to get the BAddr or MAC addr of Bluetooth device Use the NRF connect app and or gatttool or any other tool which we can able to see the read and write handles will help us to do next level testing`

        `Lets start install NRF connect from play store and it is helps us see the read/write handles very easily , not only that it will give more other information as well ,like shown in image`

- 1.Android
- 2.Windows / Linux Desktop Apps available`

![](/images/NRF1.png)

![](/images/NRF2.png)

`Scan for surrounding Bluetooth devices to` 

`Before going to start about the 3rd challenge we need to know little depth about the BLE please the read slides in the github or study about the GAP and GATT`

`Flash the battery.ino (https://github.com/V33RU/BLE-NullBlr/blob/master/Ble-sec1.ino) and open the NRF connect app check for the BLE Battery`
![](/images/ble battery.png)


`All services developed by bluetooth SIG (Special Interest Group) only so lets check the battery gatt service`
![](/images/gatt-service.png)

`Just click on the code to see more details about the code,` 
![](/images/UUID.png)

`Once flashed it after open the NRF connect and check for what are all information is available` 
![](/images/uuid-apk.png)

`GATT Service of the battery, 0x18F and lets check for the read and write data` 

`Connect to the device` 


## Challenge 4: Try to overwrite or change the value of Service

Here we are going to use the gatttool from the terminal or we can use NRF connect as well but for me gatttool from terminal more familiar , We got to know finally read and write data of battery service , the fianl part is change the values to send wrong to data mobile notification 

Lets get connect first 
![](/images/f1.png)


As we see in the NRF connect app WRITE handle 0x2a19 in the UUID value it is howing as well to usnderstand more aboutthe UUID (https://www.uuidgenerator.net/)
Will help it more 

Lets start handle will give yout the descriptor value and 
Properties will tells whether it is READ or WRITE
![](/images/f2.img)

It is failed with when you running read request on the property of write handle this way we can confirm the read and write handles when we are not getting any information from NRF connect app


Right now we can change the values to and it will indicate different battery values if you write right one 
![](/images/f3.img)

This is just an example not exact writeup ,, all this article just educational purpose only ,, 

Notes: 1. to understand backed open wireshark select bluetooth and the see the traffic is going encrypted or not 

3.Learn more about the UUID values 
4.Dig Deep the services information as much as you can 
