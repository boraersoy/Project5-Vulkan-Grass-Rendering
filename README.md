Vulkan Grass Rendering
==================================

**University of Pennsylvania, CIS 565: GPU Programming and Architecture, Project 5**

* Bora Ersoy
* Tested on: 13th Gen Intel(R) Core(TM) i7-13700HX, 2100 Mhz, 16 Core(s), 24 Logical Processor(s), RTX 4060 8GB AD107

### (Vulkan Grass Rendering)

This project is a Vulkan-based grass rendering application that is based on
[Responsive Real-Time Grass Rendering for General 3D Scenes](https://www.cg.tuwien.ac.at/research/publications/2017/JAHRMANN-2017-RRTG/JAHRMANN-2017-RRTG-draft.pdf).
The application renders a large number of grass blades efficiently using Vulkan's compute shaders and indirect drawing capabilities. The grass blades are generated procedurally with Bezier curves
and animated to create a realistic waving effect.

### Features

### Physics Simulation 

The grass blades are animated using a simple physics simulation that takes into account various forces such as 
wind forces, gravity and wind. The simulation is performed in a compute shader, allowing for real-time updates of the grass animation.

| No Force | Gravity | Gravity and Recovery | Gravity, Recovery and Wind |
| ----- | ----- | ----- | ----- |
|![](images/noforce.png)|![](images/gravity.png)|![](images/gravityandrecovery.png)| ![](images/grassanimation.png)

### Culling 
The application implements frustrum culling, distance culling and orientation culling.
- Frustrum Culling: Culls grass blades that near camera position
- Distance Culling: Culls grass blades that are far from the camera position
- Orientation Culling: Culls grass blades that are oriented away from the camera position because grass has no width
on its horizontal axis.

| No Cull | Frustum Culling | Distance Culling | Orientation Culling|
| ----- | ----- | ----- | ----- |
| ![](images/nocull.gif)|![](images/frustrumculling.gif)|![](images/distanceculling.gif)|![](images/orientationculling.gif)|

### Performance Analysis


