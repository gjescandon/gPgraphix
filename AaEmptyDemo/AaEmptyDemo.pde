PImage nuImg;

void setup() {
  size(1280,720, P3D);
  nuImg = loadImage("whispers01.jpg");
  
  
  background(24,24,0);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.3);
  image(nuImg,0,0);
}
