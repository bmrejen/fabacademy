---
layout: page
title: 20. Project development
parent: Assignments
nav_order: 19
---

### Problem

My friend [Jamshid Kohandel](https://www.linkedin.com/in/jamshidkohandel/) works for the French government as a special advisor for digital transformation. He also happens to be 100% blind. 

A big issue he faces is that when he goes to a social gathering with lots of people that he knows, he has no way to know who is standing around him. As a result, he cannot approach his friends or acquaintances; he has to wait for them to approach him.

This is pretty upsetting because that means he has little control over his social interactions and has to remain totally passive while people around him are having fun.

## Solution

We are going to tackle this problem with some **Face-recognition glasses**

Hopefully, these glasses will gather a lot of functions. We are probably going to have to abandon a few of them to finish this project in time, but theoretically, we want our glasses to be able to:

- scan the environment in front of him
- compare them to a database of known faces in a SD card

**If the person is already in the database**
- the glasses will say the name of this person out loud through a built-in speaker

**If this person is unknown**
- the speaker will give some indications, like "female, around 40, Asian, police uniform"
- Jamshid can populate his database of known faces by standing in front of them and pressing a button and saying their name

## Future improvements

If we are able to complete this task, we also want to add some features that will improve the lives of blind people around the world:
- the glasses can recognize elements of the environment and say things like "car, dog, door, stairs, stop sign"
- we can add a distance measurement and have the speaker speak LOUDER for close people or objects
- we can add 4 speakers on the glasses so the sound comes from the position of the item
- we can add hole-trackers. Blind people can already detect obstacles with their traditional or AI-canes but it's very hard for them to detect holes. As a result, it's easy for them to fall into a lake or a manhole cover.

## What we will need

- Raspberry Pi that is not too big and has enough computing power
Arduino is too slow, Jetson Nano is not portable. We will use a Banana Pi M2 Zero OR a Pi Zero W OR a Pi Model A+

- ESP-EYE with built-in microphone

- speakers

- battery holder

- probably a relay

- probably a buck converter

- battery

- battery holder

- FTDI programmer

## Installing the cam


![alt text](https://maker.pro/storage/SFYdixn/SFYdixnlDb2eAhV3GHS0QdVhGTjgXb8FV8KqPxxH.png)

![alt text](https://maker.pro/storage/09GGoBk/09GGoBklQg0Y8kUmEdbzrMWPdvu2NvBrAX98iooL.jpeg)

Add the battery

![alt text](https://maker.pro/storage/9pMh0MR/9pMh0MRwZCilOFtRrWMy4pngrd2o0XlkxzQD598a.jpeg)

We install a board manager in the Arduino IDE

![alt text](https://maker.pro/storage/AGixxkb/AGixxkb7AxFXahBFPS2Ibs6GfuIWcQeA4H4If6tg.png)

![alt text](https://maker.pro/storage/Hp01pwg/Hp01pwg6tF49MRUkw1uGczyVcsDHeJyl0myF4tM8.png)

and uncomment the line `#define CAMERA_MODEL_AI_THINKER`
and add 
```
const char* ssid = "my_wifi_network";
const char* password = "my_wifi_password";
```

The cam now offers a server

![alt text](https://maker.pro/storage/zKZVgo4/zKZVgo4oUS0HIlQeaO9e0kwbER5p2NYb8fDHBHSP.png)

When using face recognition, we use CIF detection

![alt text](https://maker.pro/storage/OvRvu4z/OvRvu4zQGYRugvqv3lANvWF1UIrsmexKhYAk4yfH.png)

Now we are having a few problems:

- Impossible to update the firmware
Solution: do not forget to connect GPIO0 to GND every time we want to update the firmware

- Strange bugs, video very laggy
Solution: we cannot continue to use the power from the USB to FTDI adapter. We are going to use another power source. We tried to use a 9V battery and connect it to a regulator with 3 capacitors. But such a high voltage drop caused it to heat like crazy. So in the meantime, we will be using a DC supply workbench.
Do not forget to connect all GND together so we have the same ground for all components !

- Unreliable results
Solution: 5V seems to work better than 3.3V. We will do it this way, without forgetting that the ESP32 has a different pin for 5V. This is also the case for the FTDI adapter, but we do not need it since we are using a bench DC supply for the moment.

- Impossible to compile the firmware. "esp32_camera.h" not found
I tried to replace "esp32_camera.h" by *<esp32_camera.h>* but it didn't work either. This is a weird situation, but the firmware that we are using for the Board Manager cannot be 1.0.3 or later, because it dropped support for some features. So we are sticking to 1.0.1 so far.

### 3D model 

The rough sketch will look something like this
<iframe width="420" height="315" src="https://www.youtube.com/embed/1NtTdS63znI" frameborder="0" allowfullscreen></iframe>
 
 We print it with our Alfawise U30 Pro

 Settings:
 
 - PLA
 - Nozzle: 0.4 mm
 - Heatbed: 160°
 - Nozzle temp: 205°

 Result: we have something to start with

 ![alt text]({{site.baseurl}}/assets/images/project/glasses-01.jpg "glases01")

![alt text]({{site.baseurl}}/assets/images/project/glasses-02.jpg "glases02")

![alt text]({{site.baseurl}}/assets/images/project/glasses-03.jpg "glases03")
