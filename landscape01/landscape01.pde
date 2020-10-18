PImage nuImg;
CyrusRoller croller;
ColorBoxBuilder cbb;
NoizeBob hbob;

Mountain mtn, mtn2, mtn3;

float hy;

void setup() {
  size(720,720, P3D);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  croller = new CyrusRoller();
  croller.setup();
  
  cbb = new ColorBoxBuilder();
  
  hbob = new NoizeBob(30., 0.01, 0.4);
  hy = 0.5*height + hbob.getBob();
  
  mtn = new Mountain();
  mtn2 = new Mountain();
  mtn3 = new Mountain();
}

void draw() {
  colorMode(HSB,1.0);
  background(0.9);
  image(cbb.getImage(),0,hy,width,height-hy);

  pushMatrix();
  translate(0, hy, 0);
  mtn.draw();
  translate(0, 0, -1);
  mtn2.draw();
  translate(0, 0, -1);
  mtn3.draw();
  popMatrix();
  
  croller.draw(floor(hy));
  
  hy = 0.5*height + hbob.getBob();
  
}
