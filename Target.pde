class Target {
  PVector pos = new PVector();
  float r;
  
  Target(float r_, float x, float y) {
    moveTo(x, y);
    r = r_;
  }
  
  void moveTo(float x, float y) {
    pos.set(x, y);
  }
  
  void move(float xVel, float yVel) {
    pos.add(xVel, yVel);
  }
  
  void display() {
    stroke(0);
    strokeWeight(2);
    fill(127);
    ellipse(pos.x, pos.y, r*2, r*2);
  }
}