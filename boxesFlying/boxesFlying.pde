Boxzz bxz;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;

int BPM, frameBump, frameInc;

NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
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
  mask = new MaskCirclesAlt();
  colorMode(HSB,1.);
  
  BPM = 120;
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  }

void draw() {
  
  if (frameCount > frameBump) {
   bxz.init();
   frameBump = frameCount + frameInc;
  }
  
  background(0.);
  
  bxz.draw();
  
  saveFrame();
  println(frameCount);
  
} 
