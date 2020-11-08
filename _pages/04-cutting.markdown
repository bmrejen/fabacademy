---
layout: page
title: 04. Cutting
parent: Assignments
nav_order: 3
---

## Precaution rules
1. Do not touch microchips with hands. Static electricity is enough to kill them
2. Do not place an Arduino on metal. It's easy to short it.
3. If you use through-hole pins, try to have 4 pins together as it will make them more sturdy
4. Always do multiple passes when cutting and check with a microscope to see there aren't any hairs or shorts.
5. Always use the air pump and the exhaust pump when using the laser cutter
6. Always stay next to the cutter while cutting as a fire can break out easily.

## Settings
We use the following settings:

|  | Fiber  | CO2  |
|---|---|---|
| Goal  | Carve  | Cut  |
| Line style  | Raster  | Vector  |
| DPI  | 1200  | (none)  |
| Speed  | 10  | 30  |
| Power  | 100  | 70  |
| Frequency  | 1  | 100  |
| Focus  | +4.0  | +4.0  |
| Passes  | 2  | ~20  |

## Carving
We stick a board of FR1 or FR4 using double-sided adhesive tape to a metallic plate. And put it inside the cutter. We caliber it (Z axis) with the appropriate tees and set the home (X and Y axis).
![alt text]({{site.baseurl}}/assets/images/05-03-cutter.png "cutter")

We first download and print this image for the circuit, using the **Fiber cutter** ![alt text]({{site.baseurl}}/assets/images/05-01-fts_mini_traces.png "circuit")

We don't forget to set the home on the X and Y axis.

The fiber cutting should give a green light
![alt text]({{site.baseurl}}/assets/images/05-04-green-light.png "green light")

When this done, we test it for continuity
![alt text]({{site.baseurl}}/assets/images/05-05-test.png "test")

We test it for continuity with a multimeter in continuity mode
![alt text]({{site.baseurl}}/assets/images/05-06-multimeter.png "multimeter")

## Cutting

When this is done, we leave it inside the machine and cut the edges using this image with the same home, using this time the **CO2 cutter**
![alt text]({{site.baseurl}}/assets/images/05-02-fts_mini_cut.png "board")

Since we will not be milling, this image is not good. We only need a small line at the junction of the black and white areas.
We use **CorelDraw** to create a **hairline** along this border and print it.

The cutting gives a yellow light

![alt text]({{site.baseurl}}/assets/images/05-07-cutting.png "cutting")

We can now take out the board, and clean it using some **acetone**
![alt text]({{site.baseurl}}/assets/images/05-08-before-acetone.png "before acetone")

We do not forget to use a mask and a fume extractor
![alt text]({{site.baseurl}}/assets/images/05-15-mask.png "mask")

After cleaning
![alt text]({{site.baseurl}}/assets/images/05-09-after-acetone.png "after acetone")

Let's re-test it to make sure
![alt text]({{site.baseurl}}/assets/images/05-10-retest.png "retest")

We now have a functioning board.
![alt text]({{site.baseurl}}/assets/images/05-11-finish.png "finish")