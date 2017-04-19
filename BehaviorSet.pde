class BehaviorSet {
  Vehicle v;
  Target t;

  BehaviorSet(Vehicle v_, Target t_) {
    v = v_;
    t = t_;
  }

  PVector seek() {
    PVector desired = PVector.sub(t.pos, v.pos);

    desired.setMag(v.maxspeed);

    PVector steer = PVector.sub(desired, v.vel);
    steer.limit(v.maxforce);

    return steer;
  }
  
  PVector flee() {
    PVector desired = PVector.sub(t.pos, v.pos);

    desired.setMag(v.maxspeed);
    desired.mult(-1);

    PVector steer = PVector.sub(desired, v.vel);
    steer.limit(v.maxforce);

    return steer;
  }
  
  PVector arrival() {
    float thresh = 100;
    
    PVector desired = PVector.sub(t.pos, v.pos);
    float d = desired.mag();
    
    if (d < thresh) {
      float m = map(d, 0, thresh, 0, v.maxspeed);
      desired.setMag(m);
    } else {
      desired.setMag(v.maxspeed);
    }

    PVector steer = PVector.sub(desired, v.vel);
    steer.limit(v.maxforce);

    return steer;
  }
}