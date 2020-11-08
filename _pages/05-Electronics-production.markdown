---
layout: page
title: 05. Electronics production
parent: Assignments
nav_order: 4
---

Today we are making a programmator. This will allow us to program the AVR microchips we embed on our components.
AVR microchips have some flash memory that can be reprogrammed *ISP* - in-system programming, while they are already being used.

We will be following [this tutorial](http://fab.cba.mit.edu/classes/863.16/doc/projects/ftsmin/index.html)

## Material
The PCB we are going to use is a **SMB**, i.e surface mount box, which means it is 1-sided. 

We can use material **FR1 or FR4** that we will cut with a CO2 laser cutter. 

The resistances we will solder on it have a Case-Code of **1206**, which means they are 0.12" * 0.06".

This is the smallest we can use in our lab. Anything smaller and it will be harder to make **bridges** over the circuit.

We had the choice bteween **FR1 and FR4**
FR4 is made of fiber-glass and a thin layer of copper. Fiber glass is not very elastic, so it doesn't support drilling very well.
Luckily, we will not be **milling**, but removing the copper with a cutting with a **fiber cutter** and cutting the PCB with a **laser cutter**


## Soldering
We are going to get the components and solder them one by one on the board. We use *leaded* solder, not unleaded, and we start from the center.

We add lots of solder on the USB pins because the board is a bit thin.

We put some reflow for the small parts. We use a Yihua 852D soldering iron.

![alt text]({{site.baseurl}}/assets/images/05-16-soldered.png "soldered")


## Programming the microchip
0. Connect the programmer to USB for power + to the Atmel ICE
![alt text]({{site.baseurl}}/assets/images/05-13-connect.png "connect")


1. Install the drivers and utils
`sudo apt install avrdude gcc-avr avr-libc make`

2. Download the [firmware](http://fab.cba.mit.edu/classes/863.16/doc/projects/ftsmin/fts_firmware_bdm_v1.zip)

3. Unzip it and launch `make && make flash && make fuses`
This should flash the compiled HEX code on the memory

4. Disable the reset function
`make rstdisbl`

## Characterization of the PCB
To see how the machine prints, we can print a tryout.
![alt text]({{site.baseurl}}/assets/images/05-12-pcb-characterization.png "PCB characterization")

## Vinyl cutter
For soft materials like clothes, it can be useful to print the circuit using a vinyl cutter from a roll of sticky copper.
We used the Roland GS-24
![alt text]({{site.baseurl}}/assets/images/05-17-vinyl-machine.png "vinyl machine")

The blade was dull, we had to remove it.
![alt text]({{site.baseurl}}/assets/images/05-18-removing-blade.png "removing blade")

And replace it
![alt text]({{site.baseurl}}/assets/images/05-19-new-blade.png "new blade")

We used a strength of 130 grams and a cutting speed of 10 cm / sec. The blade offset is the position of the blade on the vertical axis. We kept it at 0.25
![alt text]({{site.baseurl}}/assets/images/05-20-settings.png "settings")

The end result was pretty bad.
![alt text]({{site.baseurl}}/assets/images/05-14-vinyl.png "vinyl")

