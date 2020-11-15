PImage nuImg;
FlockBox flock;
AutoPalette apal;

void setup() {
  size(720,720, P3D);
  
  flock = new FlockBox();
  background(24,24,0);
  apal = (new AutoPalette()).newApalDar();
  
}

void draw() {
  colorMode(HSB,1.0);
  background(apal.getColor(0.0006*frameCount));
  flock.drawSpiro();
  //saveFrame();
  println(frameCount);
}
