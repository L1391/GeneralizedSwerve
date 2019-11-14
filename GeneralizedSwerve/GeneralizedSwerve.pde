ArrayList<swerveWheel> w = new ArrayList();
centroid c = new centroid();


float xSpeed;
float ySpeed;
float zSpeed;

float biggestMagnitude;

int farthestWheelIndex = 0;

void setup() {
  size(600,600);
  xSpeed = 0;
  ySpeed = 0;
  zSpeed = 0;
}

void draw() {
  background(0);
  
 
  if (!w.isEmpty()) {
    System.out.println("mag: " + biggestMagnitude);
    biggestMagnitude = 1;
    
    //show centroid
    c.show();
    
    
    
    //show and calculate the wheels
    for (int i = 0; i < w.size(); i++) {
      w.get(i).calculate(xSpeed, ySpeed, zSpeed, c, w.get(farthestWheelIndex));
    }
    
    //find the largest magnitude greater than 1 to normalize everything above 1 and preserve proportions
    for (int i =0; i < w.size(); i++) {
      if (biggestMagnitude < Math.abs(w.get(i).speed)) {
        biggestMagnitude = Math.abs(w.get(i).speed);
      }
    }
    
     //show wheels
    for (int i = 0; i < w.size(); i++) {
      w.get(i).show();
    }
    
  }
  
      //check keyboard inputs
    if (keyPressed) {
      //x speed
      if (key == 'a' && xSpeed > -1) {
        xSpeed -= 0.01;
      } else if (key == 'd' && xSpeed < 1) {
        xSpeed += 0.01;
      }
      //y speed
       if (key == 'w' && ySpeed > -1) {
        ySpeed -= 0.01;       
      } else if (key == 's' && ySpeed < 1) {
        ySpeed += 0.01;        
      }
      //z speed
       if (key == 'q' && zSpeed > -1) {
        zSpeed -= 0.01;        
      } else if (key == 'e' && zSpeed < 1) {
        zSpeed += 0.01;        
      }
      
      //reset speeds
      if (key == 'r') {
        xSpeed = 0;
        ySpeed = 0;
        zSpeed = 0;
      }
      
      //set lower and upper bounds
      if (xSpeed > 1) xSpeed = 1;
      if (ySpeed > 1) ySpeed = 1;
      if (zSpeed > 1) zSpeed = 1;
      if (xSpeed < -1) xSpeed = -1;
      if (ySpeed < -1) ySpeed = -1;
      if (zSpeed < -1) zSpeed = -1;
      
      //reset canvas
      if (key == 'n') {
        w = new ArrayList();
        farthestWheelIndex = 0;
      }
    }
    
    //System.out.println("X: " + xSpeed);
   // System.out.println("Y: " + ySpeed);
    //System.out.println("Z: " + zSpeed);

}

//add new swerve wheels, calculate centroid, and farthest wheel
void mousePressed() {
  w.add(new swerveWheel(mouseX, mouseY));
  c.calculate(w);
  
  //find the farthest wheel from the centroid
  for (int i = 0; i < w.size(); i++) {
    if (w.get(i).distanceFromCentroid(c) > w.get(farthestWheelIndex).distanceFromCentroid(c)) {
      farthestWheelIndex = i;
    }
  }
}
