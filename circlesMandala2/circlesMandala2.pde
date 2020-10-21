PImage nuImg;
Mandala mand;
CyrusRoller croller;

void setup() {
  size(720,720, P3D);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  croller = new CyrusRoller();
  croller.setup();
  background(24,24,0);
  mand = new Mandala();
}


void draw() {
  colorMode(HSB, 1.0);
  background(0.0);
  translate(0.5*width, 0.5*height, 0.0);
  mand.draw();
  /*
  croller.draw();
  pushMatrix();
  translate(0.5*width, 0.5*height, -10);
  box(50, 50, 50);
  popMatrix();
  */
}
