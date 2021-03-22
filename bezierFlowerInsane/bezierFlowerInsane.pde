PImage nuImg;

NoizeBob zBob, xbob, cbob;
NoizeBob yBob;
QuilezFunctions qeq;
AutoPalette apal, apal2;
color bc;
float h0, w0;
float tFib;
boolean saveFrame = false;
ColorBoxBuilder bluz;
BullsEye beye;

void setup() {
  size(1280,720, P3D);
  colorMode(HSB, 1.);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(200., 0.0006, 0.3);
  yBob = new NoizeBob(400., 0.0003, 0.3);
  xbob = new NoizeBob(800., 0.000003, 0.3);
  cbob = new NoizeBob(100., 0.00003, 0.3);
  apal = new AutoPalette(random(1));
  apal2 = new AutoPalette(random(1));
  bc = apal.getColor(random(1));
  qeq = new QuilezFunctions();
  w0 = 0.5*width;
  h0 = 0.5*height;
  tFib = 137.5*TWO_PI/360;
  
  bluz = new ColorBoxBuilder();
  beye = new BullsEye();
}

void draw() {
  colorMode(HSB,1.0);
  background(0.2);
  //directionalLight(1.,0.,1.,0.5*sin(0.01*frameCount),0.,-1);
  
  pushMatrix();
  translate(0,0, 0- 2*zBob.getBob());
  image(bluz.getImageBob(),0,0,width,height);

  popMatrix();
  pushMatrix();
  //translate(xbob.getBob(), yBob.getBob(), 0 - zBob.getBob());
  translate(xbob.getBob(), yBob.getBob(), 0- zBob.getBob());

  beye.draw();
  popMatrix();
  
  if (saveFrame) saveFrame();
  println(frameCount);
}
