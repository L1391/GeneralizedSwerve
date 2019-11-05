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
    pushMatrix();
    translate(x,y);
    rotate(angle);
    
    fill(255);
    rect(-2,-7.5,4,15);
    fill(255,0,0);
    stroke(255);
    strokeWeight(2);
    //multiplied by visual amplifier
    line(0,0,0, 30*speed);
    popMatrix();
    
    strokeWeight(1);
  }
  
  void calculate(float xSpeed, float ySpeed, float zSpeed, centroid c, swerveWheel farthestWheel) {
    vel = new PVector(xSpeed, ySpeed);
    if (vel.mag() > 1) vel.normalize();
    
    PVector diagonal = new PVector(x-c.x, y-c.y).normalize();
    turn = diagonal.rotate(PI).mult(distanceFromCentroid(c)/farthestWheel.distanceFromCentroid(c)).mult(zSpeed);
    System.out.println(turn.mag());
    
    speed = vel.add(turn).mag();
    
    angle = vel.add(turn).heading();
  }
  
  float distanceFromCentroid(centroid c) {
    return (float) Math.sqrt((c.x-x)*(c.x-x) + (c.y-y)*(c.y-y));
  }
  
}
