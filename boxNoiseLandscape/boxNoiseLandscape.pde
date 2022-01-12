PImage nuImg;
FlockBox flock;
NoizeBob lbob;

void setup() {
  size(720,720, P3D);
  
  flock = new FlockBox();
  
  lbob = new NoizeBob(1.0,0.007,0.5);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.2);
  directionalLight(0.9, 0.0, 0.9, sin(0.0001*frameCount*lbob.getBob()), sin(0.0001*frameCount*lbob.getBobTail(10000)), -1.);
  flock.draw();
  //saveFrame();
  println(frameCount);
}
