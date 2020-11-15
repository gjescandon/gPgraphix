PImage nuImg;

NoizeBob zBob, cbob;
NoizeBob_2D yBob;
QuilezFunctions qeq;
AutoPalette apal, apal2;
color bc;
float h0, w0;
float tFib;

ColorBoxBuilder bluz;
BullsEye beye;

//***
boolean saveFrame = false;
//***

void setup() {
  size(1280,720, P3D);
  colorMode(HSB, 1.);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(200., 0.006, 0.7);
  yBob = new NoizeBob_2D(10., 0.003, 0.3);
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
  background(0.9);
  image(bluz.getImageBob(),0,0,width,height);
  beye.draw();
  
  
  if (saveFrame) saveFrame();
  println(frameCount);
}
