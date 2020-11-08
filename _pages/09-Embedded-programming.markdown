---
layout: page
title: 09. Embedded programming
parent: Assignments
nav_order: 8
---

Homework: **Make an Arduino project**

I have installed the Arduino software on my Windows machine and already made a few projects with it.
But now, I would like to try two different programming languages with it: **Cylon.js**, built on JavaScript and **Artoo**, built on Ruby.

We have made several projects during the week.
One of them is using a potentiometer to fade the light of a led.

We shoot 5V to the potentiometer and connect the LED to a digital pin that supports PWM. On the Arduino MEGA 2560 that we are using, all of them do.
We will remember to use both ```analogRead()``` and ```analogWrite()```

I fried an LED using it without a resistor, so now we are using a resistor

![alt text]({{site.baseurl}}/assets/images/09-arduino/02-breadboard.PNG "breadboard")

It can also be simulated on TinkerCAD
![alt text]({{site.baseurl}}/assets/images/09-arduino/03-tinkercad.PNG "tinkercad")

# Using Cylon.JS

1. Install NodeJS by downloading it from the official website
2. ```npm install cylon cylon-firmata```
3. Install Gort from the [official website](http://gort.io/documentation/getting_started/downloads/)
4. ```gort arduino install```
5. ```gort scan serial```
We can see that the Arduino is connected to COM4
6. ```gort arduino upload firmata COM4```

We are now ready to connect and communicate with the Arduino via serial


# Work in progress - using Docker

**Reminder:** we have a few constraints:
1. We are running Windows
2. I do not want to install any software
3. Therefore, everything we do will be happening in a docker

## Making Docker GUI-friendly

So far, Docker has only been working in CLI. This has been useful for many of the applications but it seems to me that we are going to need the GUI.
In the future, I want to go 100% CLI but let's make our Docker GUI-compatible for now.

**Install VcxSrv**
```choco install vcxsrv``` and then follow the [following instructions](https://dev.to/darksmile92/run-gui-app-in-linux-docker-container-on-windows-host-4kde)

Now our **hosts** should have 2 extra lines indicating the $DISPLAY should be connected to our local IP

![alt text]({{site.baseurl}}/assets/images/09-arduino/01-hostfile.PNG "hostfile")

Let's test if it works by running GIMP:
```docker run --rm -it -e DISPLAY=host.docker.internal:0 jamesnetherton/gimp```

Now that we have GIMP running, we can create a **Dockerfile**