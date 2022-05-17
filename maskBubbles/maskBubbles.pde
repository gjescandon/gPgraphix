
QuilezFunctions qf;
GeoFunctions gf;
int mccnt = 13;
MaskCirclesAlt[] maskArr;
MaskCirclesAlt mask;
int frameBump, frameInc;
int BPM = 96;

NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1920,1080, P3D);
  //size(1280,720, P3D);
  init();
  }
  
void init() {
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  
  cnt = 3  ;
  // frameRate = 60 per sec default

  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  maskArr = new MaskCirclesAlt[mccnt];
  for (int i =0; i < mccnt; i++) {
   maskArr[i] = new MaskCirclesAlt();
  }
  
  colorMode(HSB,1.);
  
}

void draw() {
  
  if (frameCount > frameBump) {
   // init();
   frameBump = frameCount+frameInc;
  }
  background(0.);
  //directionalLight(1., 0., 1., 0.1*sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1.);
  translate(0.5*width, 0.5*height);
  
  for (int i =0; i < mccnt; i++) {
   if (frameCount > 200 + i*50) maskArr[i].draw();

  }
  
  saveFrame();
  println(frameCount);

} 
