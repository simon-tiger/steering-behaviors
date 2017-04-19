Target t;
PVector vel;
Vehicle v;

String[] behaviors = { "seek", "flee", "arrival" };
int count = 0;
int index = 0;

void setup() {
  size(600, 400);
  vel = new PVector(0, -2);
  t = new Target(16, mouseX, mouseY);
  v = new Vehicle(6, width/2, height/2, vel, t);
}

void draw() {
  background(51);
  fill(255);
  text("Mode: " + behaviors[index], 15, height-20);
  t.moveTo(mouseX, mouseY);
  t.display();
  v.addBehavior(behaviors[index]);
  v.move();
  v.display();
}

void mousePressed() {
  count++;
  if (count % behaviors.length == 0) {
    index = 0;
  } else {
    index++;
  }
}