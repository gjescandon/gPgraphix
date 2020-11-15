PImage nuImg;
CyrusRoller croller;
ColorBoxBuilder cbb, bluz;
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
  bluz = new ColorBoxBuilder(0.7);
  
  hbob = new NoizeBob(30., 0.01, 0.4);
  hy = 0.5*height + hbob.getBob();
  
  mtn = new Mountain();
  mtn2 = new Mountain();
  mtn3 = new Mountain();
}

void draw() {
  colorMode(HSB,1.0);
  background(0.9);
  image(cbb.getImageRot(),0,hy,width,height-hy);
  pushMatrix();
  translate(0, 0, -9);
  image(bluz.getImageBob(),-10,-10,width+20,hy+20);
  popMatrix();
  
  pushMatrix();
  translate(0, hy, -1);
  mtn.draw(80);
  translate(0, 0, -2);
  mtn2.draw(110);
  translate(0, 0, -3);
  mtn3.draw(150);
  popMatrix();
  
  croller.draw(floor(hy));

  hy = 0.6*height + hbob.getBob() - 0.1 * height *cos(0.0001*frameCount);

//  saveFrame();
  println(frameCount);
}
