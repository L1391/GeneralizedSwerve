# Generalized Swerve 

This repository hold the Processing code for a generalized swerve visualizer.

### Assumptions
* The arrangement of the wheels forms a convex shape
* The centroid of said shape is the center of mass
* The swerve is robot-oriented 

## Controls
Click: Add another wheel. The robot needs at least three wheels and the wheels need to be created in order of the perimeter
A and D: Increase and decrease horizontal speed
W and S: Increase and decrease vertical speed
Q and E: Increase and decrease turning speed
R: Resets all speed values
N: Clears the canvas so a new wheel configuration can be made

### Process

The algorithm adds to the existing swerve math by making the wheels farther from the centroid have a proportionally faster turning-vector than the wheel closest to the centroid. Everything is then normalized to an output between 0 and 1 while preserving the proportions.

