Boxzz bxz;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;
Foto fotoG, fotoBck;
PImage img;
NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
int nextFrameG;
int nextFrameBck;

void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  bxz = new Boxzz();
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  fotoG = new Foto();
  fotoBck = new Foto(20, "gfaces/gface_XX.jpg", 100);
  nextFrameG = 50;
  nextFrameBck = 23;
  
  colorMode(HSB,1.);
  }

void draw() {
  
  background(0.);
  if (frameCount < nextFrameBck) {
    image(fotoBck.getSame(), 0 , 0, width,height);    
  } else {
    image(fotoBck.getRand(),0,0,width,height);
    nextFrameBck = frameCount + 23;
  }
  
  float a = 0.1 * width;
  float b = 0.1 * height;
  float c = 0.8 * width;
  float d = 0.8 * height;
  
  fill(0.9);
  //rect(a, b, c ,d);
  
  GPoint gp1 = new GPoint(a,b);
  GPoint gp2 = new GPoint(a+c, b+d);
  float dd = gf.getLen(gp1, gp2);
  
  fill(0.7);
  //rect(a,b, dd - c, d);
  
  noFill();
  rect(a,b, d, d);
  rect(c+a-d,b, d, d);
  
  if (frameCount < nextFrameG) {
    image(fotoG.getSame(), 0 , 0, width,height);    
  } else {
    image(fotoG.getNext(), 0 , 0, width,height);
    nextFrameG = frameCount + 50;
  }
  println(frameCount);
  //saveFrame();
} 
