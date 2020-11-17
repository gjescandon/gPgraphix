PImage nuImg;
FlockBox flock;

void setup() {
  size(720,720, P3D);
  frameRate(5);
  flock = new FlockBox();
  background(24,24,0);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.2);
  directionalLight(0.9, 0.0, 0.9, 0, 0, -1.);
  flock.draw();
  
}
