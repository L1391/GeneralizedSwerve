class centroid {
  float x;
  float y;
  
  centroid() {

  }
  
  void show() {
    fill(255,0,0);
    ellipse(x,y,6,6);
  }
  
  void calculate(ArrayList<swerveWheel> wheels) {
    x = 0;
    y = 0;
    
    //find area
    float a = 0;
    for (int i = 0; i < wheels.size() - 1; i++) {
      a += 0.5 * (wheels.get(i).x * wheels.get(i+1).y - wheels.get(i+1).x * wheels.get(i).y);
    }
    a += 0.5 * (wheels.get(wheels.size() - 1).x * wheels.get(0).y - wheels.get(0).x * wheels.get(wheels.size() - 1).y);
    
    //x coordinate
    for (int i = 0; i < wheels.size() - 1; i++) {
      x += (wheels.get(i).x +wheels.get(i+1).x)*(wheels.get(i).x * wheels.get(i+1).y - wheels.get(i+1).x * wheels.get(i).y)/(6 * a);
    }
    x += (wheels.get(wheels.size() - 1).x +wheels.get(0).x)*(wheels.get(wheels.size() - 1).x * wheels.get(0).y - wheels.get(0).x * wheels.get(wheels.size() - 1).y)/(6 * a);
    
    
    //y coordinate
    for (int i = 0; i < wheels.size() - 1; i++) {
      y += (wheels.get(i).y +wheels.get(i+1).y)*(wheels.get(i).x * wheels.get(i+1).y - wheels.get(i+1).x * wheels.get(i).y)/(6 * a);
    }
    y += (wheels.get(wheels.size() - 1).y +wheels.get(0).y)*(wheels.get(wheels.size() - 1).x * wheels.get(0).y - wheels.get(0).x * wheels.get(wheels.size() - 1).y)/(6 * a);
    
  }
}
