class swerveWheel {
  float x;
  float y;
  
  float angle;
  float speed;
  
  PVector vel;
  PVector turn;
  
  swerveWheel(float x, float y) {
    this.x =x;
    this.y = y;
  }
  
  void show() {
    //create new plane for each wheel
    pushMatrix();
    translate(x,y);
    rotate(angle);
    
    fill(255);
    rect(-7.5,-2,15,4);
    fill(255,0,0);
    stroke(255);
    strokeWeight(2);
    //multiplied by visual amplifier and divided by the largest magnitude to normalize
    line(0,0, 30*speed/biggestMagnitude,0);
    popMatrix();
    
    strokeWeight(1);
  }
  
  void calculate(float xSpeed, float ySpeed, float zSpeed, centroid c, swerveWheel farthestWheel) {
    //create glide vector
    vel = new PVector(xSpeed, ySpeed);
    if (vel.mag() > 1) vel.normalize();
    
    //create turn vector from line perpendicular to line to centroid
    PVector diagonal = new PVector(x-c.x, y-c.y).normalize();
    turn = diagonal.rotate(PI/2).mult(distanceFromCentroid(c)/farthestWheel.distanceFromCentroid(c)).mult(zSpeed);
    
    speed = vel.add(turn).mag();
    
    angle = vel.add(turn).heading();
  }
  
  float distanceFromCentroid(centroid c) {
    return (float) Math.sqrt((c.x-x)*(c.x-x) + (c.y-y)*(c.y-y));
  }
  
}
