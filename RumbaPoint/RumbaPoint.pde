PImage img;
Pointellizer pizer;

NoizeBob dbob;

void setup() {
  size(1280,720, P3D);
  img = loadImage("kageRumbaFlip.png"); 
  pizer = new Pointellizer(img);
  background(24,24,0);
  dbob = new NoizeBob(1.0,0.06,0.7);
}

void draw() {
  colorMode(HSB,1.0);
  directionalLight(1.0,0,1., 0.001*sin(3.0*dbob.getBob()), 0.001*cos(3.0*dbob.getBobTail(10)),0);
  //background(0.3);
  //image(img,0,0);
  pizer.draw();
  
  //saveFrame();
  
}
