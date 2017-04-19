class Vehicle {
  PVector pos = new PVector();
  PVector vel = new PVector();
  PVector acc = new PVector();
  float r;
  float heading;
  float maxspeed;
  float maxforce;
  Target t;
  BehaviorSet set;

  Vehicle(float r_, float x, float y, PVector vel_, Target t_) {
    pos.set(x, y);
    vel.set(vel_);
    acc.set(0, 0);
    heading = vel.heading() + PI / 2;
    r = r_;
    maxspeed = 4;
    maxforce = 0.1;
    t = t_;
    set = new BehaviorSet(this, t);
  }

  void setHeading(float heading_) {
    heading = heading_ + PI / 2;
  }

  void move() {
    vel.add(acc);
    vel.limit(maxspeed);
    setHeading(vel.heading());
    pos.add(vel);
    acc.mult(0);
  }

  void addBehavior(String behavior) {
    if (behavior == "seek") {
      applyForce(set.seek());
    } else if (behavior == "flee") {
      applyForce(set.flee());
    } else if (behavior == "arrival") {
      applyForce(set.arrival());
    }
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void display() {
    pushMatrix();
    stroke(0);
    strokeWeight(2);
    fill(127);
    translate(pos.x, pos.y);
    rotate(heading);
    triangle(0, -r*2, -r, +r*2, r, r*2);
    popMatrix();
  }
}