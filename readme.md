

# 802.15.4 Sniffer
Supported Dongles
##### SONOFF Zigbee 3.0 USB DONGLE Plus-E
##### SMLIGHT SLZB-07


- [802.15.4 Sniffer](#802154-sniffer)
        - [SONOFF Zigbee 3.0 USB DONGLE Plus-E](#sonoff-zigbee-30-usb-dongle-plus-e)
        - [SMLIGHT SLZB-07](#smlight-slzb-07)
  - [What's needed](#whats-needed)
  - [Supported Zigbee dongle](#supported-zigbee-dongle)
    - [SONOFF Zigbee 3.0 USB DONGLE Plus-E](#sonoff-zigbee-30-usb-dongle-plus-e-1)
    - [SMLIGHT SLZB-07](#smlight-slzb-07-1)
  - [Firmware Flashing](#firmware-flashing)
    - [SONOFF Zigbee 3.0 USB DONGLE Plus-E flashing](#sonoff-zigbee-30-usb-dongle-plus-e-flashing)
    - [SML SMLIGHT SLZB-07](#sml-smlight-slzb-07)
  - [Wireshark Extcap installation](#wireshark-extcap-installation)
  - [How to record packets](#how-to-record-packets)
  - [Wireshark color scheme for ZigBee](#wireshark-color-scheme-for-zigbee)
  - [How it works](#how-it-works)
  - [How to compile](#how-to-compile)
  - [What's next](#whats-next)


This repository contains firmware to allow capturing 802.15.4 packets with a USB Zigbee dongle

The USB dongle once reflashed will capture 802.15.4 traffic (Zigbee, 6lowpan/Thread) and send a frame in JSON format on USB Serial COM port to the host computer.

Wireshark can be used to display captured packets.


## What's needed

A supported Zigbee dongle and a computer running Windows 10 or Windows 11 or Linux with Wireshark.

## Supported Zigbee dongle

Currently two USB dongles are supported:

 ### [SONOFF Zigbee 3.0 USB DONGLE Plus-E](https://sonoff.tech/product/gateway-and-sensors/sonoff-zigbee-3-0-usb-dongle-plus-e/)

![SONOFF USB DONGLE Plus-E](/docs/Sonoff%20USB%20dongle%20Plus-E.PNG)

### [SMLIGHT SLZB-07](https://smlight.tech/product/slzb-07)

![Smlight slzb-07.PNG](/docs/Smlight%20slzb-07_3.PNG)


## Firmware Flashing

To capture 802.15.4 packets, the USB dongle must be flashed with the sniffer firmware.
***WARNING! Reflashing the device will change its firmware. The USB dongle will no longer provide factory coordinator firmware.***

### SONOFF Zigbee 3.0 USB DONGLE Plus-E flashing
The SONOFF Zigbee 3.0 USB DONGLE Plus-E comes with a pre-installed bootloader and application running a Zigbee coordinator.
To replace the pre-installed application follow the procedure "Firmware Flashing" provided by SONOFF found at https://sonoff.tech/wp-content/uploads/2023/02/SONOFF-Zigbee-3.0-USB-dongle-plus-firmware-flashing.pdf.
The file Sniffer_802.15.4_SONOFF_USB_Dongle_Plus_E.gbl must be used when performing the XModem transfer (located in folder Output\Sniffer_802.15.4_SONOFF_USB_Dongle_Plus_E)<br>


The following online tool also works well:<br>
https://darkxst.github.io/silabs-firmware-builder/<br>


### SML SMLIGHT SLZB-07

The SMLIGHT SLZB-07 can be flashed with
https://darkxst.github.io/silabs-firmware-builder/
Please note that once the SMLIGHT SLZB-07 is flashed with the sniffer software, it cannot be reflashed using the above tools unless manually entering the bootloader.
To manually enter bootloader send JSON payload {"B"} to the device using a serial terminal at 1Mbs (if successfull the red led will turn-off)
Alternatively a jumper can be intalled between FLSH and GND pads before plugging the dongle in a USB port. The jumper must be removed once the device is reflashed.

<!-- Removed because did not work... obtained a "No matching gpiochip device found" Alternatively, the Universal Silicon Labs Flasher can also be used to reflash a SLZB-07, universal Silicon Labs Flasher can be found at https://github.com/NabuCasa/universal-silabs-flasher:
Typical command to reflash:
```
./universal-silabs-flasher --device /dev/tty8 --bootloader-reset slzb07 flash --firmware /your_path_to/Sniffer_802.15.4_SMLIGHT_SLZB_07.gbl
``` -->

## Wireshark Extcap installation

Wireshark needs a converter to understand and display correctly the packets captured by the USB dongle.
A wireshark converter is called an Extcap (short for EXTernal CAPture).

To provide Wireshark with the needed Extcap, locate the wireshark extcap folder, start wireshark, click on Help->About wireshark, select TAB named "folders", locate the
Global Extcap path
or
Personal Extcap path

Copy the file Extcap_802.15.4.exe to extcap folder for a computer running Windows
Copy the file zigbee_dongle_json_sniffer to extcap folder for a computer running Linux/Python

On Linux additional setup may be required:

```
# Ensure the script has execution permissions set:
chmod +x zigbee_dongle_json_sniffer
# Add yourself to the wireshark group (optional if you want to run Wireshark as non-root user):
sudo usermod $USER -a -G wireshark
# Make sure you have read permissions for the dongle. Usually this can be done by adding yourself to the dialout group:
sudo usermod $USER -a -G dialout
# Logout and back in for user group changes to take effect.
```

Close wireshark once the copy is done, the Extcap will be loaded the next time wireshark is started.

If you are interested in wireshark Extcap, you can refer to wireshark doc [8.2. Adding Capture Interfaces And Log Sources Using Extcap](https://www.wireshark.org/docs/wsdg_html_chunked/ChCaptureExtcap.html).

## How to record packets

Once a USB dongle is flashed with sniffer firmware and wireshark Extcap is copied in one of wireshark extcap folders, packet capture can begin.
Plug the USB dongle in one of the available USB port. Drivers should be automatically detected.
Start wireshark.
### Windows
On a Windows computer, a list of available COM port should be displayed in the bottom window<br>
![wireshark start screen](/docs/wireshark_start_screen.PNG)

Click on the gear next to the COM port corresponding to USB DONGLE COM port being used.

A configuration window will appear to select the channel to use to capture packets.
Press start once the desired channel is selected
![wireshark channel selection](/docs/wireshark_channel_selection.PNG)

Capture should start!

### Linux
On a Linux computer, the "Zigbee JSON Sniffer: zb_dongle_json_sniffer" will be displayed as one of the available interface to capture from<br>
![wireshark start screen Linux](/docs/wireshark_start_screen_linux.png)<br>
Click on the gear next to the "Zigbee JSON Sniffer: zb_dongle_json_sniffer"<br>

A configuration window will appear to select the serial capture device, channel and Baud rate.<br>
The baud rate must remain at 1000000.<br>
Press save once the desired channel is selected<br>
![wireshark channel selection Linux](/docs/wireshark_selection_linux.png)<br>
Capture can be started by double clicking on "Zigbee JSON Sniffer: zb_dongle_json_sniffer" text<br>

Capture should start!

## Wireshark color scheme for ZigBee

By default Wireshark presents ZigBee packets in black text on white background.
The default color scheme can make it difficult to quickly identify packet when analyzing ZigBee packets.
This repo provides a color scheme for Wireshark (file Wireshark\zigbee_color_scheme) well suited for ZigBee packet analysis.
ZCL and APS packets are in green
ZDP/ZDO packets are colored red
Network layer packets are presented in blue

The color scheme can be imported in Wireshark by selecting View->Coloring Rules...
![wireshark coloring rules](/docs/coloring_rules.PNG)

Click on Import...
and select the file "zigbee_color_scheme"
![wireshark coloring rules file import](/docs/coloring_rules_file_select.PNG)

Resulting coloring rules
![wireshark coloring rules result](/docs/coloring_rules_result.PNG)

Capture example
![wireshark capture example](/docs/example_capture.PNG)


## How it works

The USB dongle records 802.15.4 packets, converts to a JSON format and transfers via COM port at 1Mbit/s.
The extcap processes incoming JSON payloads and converts to wireshark pcapng TAP (LINKTYPE_IEEE802_15_4_TAP, 283, DLT_IEEE802_15_4_TAP).

The JSON format is:

  L = length
  Q = LQI
  R = RSSI
  C = channel
  S = string of hexadecimal representation of 802.15.4 packet

Example:

```json
{"L":50,"Q":255,"R":-94,"S":"4188a31e48ffff00000912fcff000001cc0885dafeffd76b0828f6ea32000885dafeffd76b0800295e19cad6ebd84ca2aee2"}
```

The USB dongle accepts channel selection via a JSON payload.

The USB dongle accepts channel selection via a JSON payload.
C = channel

Example:
```json
{"C":11}
```

when sent to the USB dongle will select channel 11, can be used at anytime.


## How to compile

The project builds using a docker image.
To build the project you will need docker installed and running on your computer.

Using vscode, simply open this project in vscode and "reopen in container".
Compile by issuing in a terminal:
```make rebuild -f ./Sources/Target/Sonoff_USB_Dongle_Plus_E/makefile```

Alternatively:
To start an interactive shell using the docker image from docker hub use the following command:
```docker run -it --rm -v ".:/home/app" docker.io/erksponge/gcc_arm_commander_jflash:latest bash```
Then compile SONOFF by issuing
```make rebuild -f ./Sources/Target/Sonoff_USB_Dongle_Plus_E/makefile```
or compile SMLIGHT-07 by issuing
```make rebuild -f ./Sources/Target/smlight_slzb_07/makefile```

Alternative 3:
The file Dockerfile can be used to create an image that contains gcc-arm-none-eabi, SiLabs commander and Segger J-link software.
To locally build the image, you must first download SimplicityCommander-Linux.zip from https://www.silabs.com/documents/login/software/SimplicityCommander-Linux.zip and store it in the same folder as of the Dockerfile.

The docker image can be constructed by issuing:

```docker image build -t erksponge/gcc_arm_commander_jflash .```

and to compile the Sonoff sniffer:
```docker run --rm -v ".:/home/app" --name build_container erksponge/gcc_arm_commander_jflash:latest make rebuild -f ./Sources/Target/Sonoff_USB_Dongle_Plus_E/makefile -j8"```


## What's next

This is a hobby project, so I do it for learning and fun.
Here are some wish list items that I have in mind:
- Keep porting to other hardware from other vendors (ATSAMR21 and TI2652P)
- Improve BSP when porting evolves
- Provide a .gbl having the factory image for user desiring to return to the factory firmware
- keep having fun...

