PImage nuImg;
FlockBox flock;
Zag zag;
void setup() {
  size(1080,720, P3D);
  
  zag = new Zag();
  background(24,24,0);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.3);
  zag.draw();
}
