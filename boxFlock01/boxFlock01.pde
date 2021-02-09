PImage nuImg;
FlockBox flock;

void setup() {
  size(720,720, P3D);
  
  flock = new FlockBox();
  background(24,24,0);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.,100.,100.);
  flock.drawSpiro();
}
