---
layout: page
title: 03. CAD
parent: Assignments
nav_order: 2
---

This week, we are making a laptop stand.

![alt text]({{site.baseurl}}/assets/images/03-01-laptop-stand.PNG "Laptop stand")

**Tools:** We are going to use *Fusion 360* and export 3 sketches in DXF format to open with CorelDraw and print with a CO2 cutter.

We will use **User Parameters** in both inches and millimeters, because we can.

![alt text]({{site.baseurl}}/assets/images/03-02-user-parameters.PNG "User parameters")

We start by creating a sketch for the left leg, and setting a few **constraints**, like a 22 degree angle and parallel lines.

![alt text]({{site.baseurl}}/assets/images/03-03-leg-sketch.PNG "Leg sketch")

After extrusion, we do a **copy-paste**. Since we didn't do **Paste New**, changes made on one leg will be replicated on the other one.

![alt text]({{site.baseurl}}/assets/images/03-04-copy-paste.PNG "Copy Paste")

We will now join them together with a **Joint**, which allows us to fix their width.

![alt text]({{site.baseurl}}/assets/images/03-05-join.PNG "Join")

And we **project** the top left side on the top right side.

![alt text]({{site.baseurl}}/assets/images/03-06-project.PNG "Projection")

We now **create a sketch** on the same plan as the top sides.

![alt text]({{site.baseurl}}/assets/images/03-07-top.PNG "Top sketch")

We now create a tab to make a hole in the sketch and we create two **construction lines** that will serve as mirrors.

![alt text]({{site.baseurl}}/assets/images/03-08-tab.PNG "Tab")

We can now **mirror** this tab across both construction lines to get 4 tabs.

![alt text]({{site.baseurl}}/assets/images/03-09-all-tabs.PNG "All tabs")

We now **extrude** this plan towards the bottom...

![alt text]({{site.baseurl}}/assets/images/03-10-extrusion.PNG "Extrusion")

...and we now have a conflict: two plans overlap

![alt text]({{site.baseurl}}/assets/images/03-11-conflict.PNG "Conflict")

So we do a **combine** by using one leg as a **tool** to **cut** the top body.
We choose *keep tools* so the legs stay.

![alt text]({{site.baseurl}}/assets/images/03-12-combine.PNG "Combine")

And the parts overlapping have now been cut.

![alt text]({{site.baseurl}}/assets/images/03-13-combine-result.PNG "Combine result")

And we **fillet** some edges

![alt text]({{site.baseurl}}/assets/images/03-14-fillet.PNG "Fillet")

Now we create a bottom support.
We create a **New Component**, and create an **offset pane** from the back of the leg

![alt text]({{site.baseurl}}/assets/images/03-15-new-pane.PNG "New Pane")

And we pull it across.

![alt text]({{site.baseurl}}/assets/images/03-16-pane-pulled.PNG "Pane pulled")

We create a new sketch on that face. We want to see the intersection of this sketch with the legs, so we choose **Intersect** and choose **Bodies** in the selection filter and choose the legs. Now, the intersections have been projected on the sketch.

![alt text]({{site.baseurl}}/assets/images/03-17-intersection.PNG "Intersection")

We make the bottom **colinear** with the bottom of the legs and the sides colinear with the sides of the top plane.

![alt text]({{site.baseurl}}/assets/images/03-18-colinear.PNG "Colinear")

We fix the height and add a line in the middle. Now we will extrude this part **symmetrically** by a factor of *thickness / 2* so the total extrusion is *thickness*.

![alt text]({{site.baseurl}}/assets/images/03-19-extrusion.PNG "Extrusion")

We want to copy-paste this support, so we first create a **midplane** halfway between the front and back sides of the leg.

![alt text]({{site.baseurl}}/assets/images/03-20-midplane.PNG "Midplane")

We can now mirror the **bodies** using the midplane as a mirror and we **fillet** all the edges.

![alt text]({{site.baseurl}}/assets/images/03-21-mirror.PNG "Mirror")

We are almost good but we have a problem: some edges have disappeared because the support and the legs are overlapping. 

![alt text]({{site.baseurl}}/assets/images/03-22-edges-disappeared.PNG "Edges disappeared")

We fix this with a **combine cut** using the supports as **tools** and the leg as **bodies** and we fillet the edges.

![alt text]({{site.baseurl}}/assets/images/03-23-combine-cut.PNG "Combine cut")

We are done!

![alt text]({{site.baseurl}}/assets/images/03-24-done.PNG "Done")

Now to print this, we will **Create Sketch** and click **Finish Sketch** on the top, support and leg. This will create 3 sketches that we can right-click and save to DXF to be printed.

![alt text]({{site.baseurl}}/assets/images/03-25-saving-sketches.PNG "Saving sketches")

**Sketches**

[laptop-stand-sketches.zip]({{site.baseurl}}/assets/sketches/04-laptop-stand-sketches.zip)