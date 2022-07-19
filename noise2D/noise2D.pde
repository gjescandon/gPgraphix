FlockBox fbox;
QuilezFunctions qf;
GeoFunctions gf;

int frameBump, frameInc;
int BPM = 96;
color CHROMAGRN;
NoizeBob cb,zbob, xbob, ybob, swb, lbob;
int cnt;
void setup() {
  size(1280,720, P3D);
  init();
  }
  
void init() {
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  
  cnt = 3  ;
  // frameRate = 60 per sec default
  fbox = new FlockBox(1.,0.8);
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  lbob = new NoizeBob(1., 0.01, 0.5);
  
  colorMode(HSB,1.);
  CHROMAGRN = color(0.3, 0.98, 0.96);
  
}

void draw() {
  
  if (frameCount > frameBump) {
   // init();
   frameBump = frameCount+frameInc;
  }
  background(0.);
  directionalLight(1., 0.0, 1., 0.19*sin(lbob.getBob()), 0.19*cos(lbob.getBobTail(10)), -1.);
    
  //nzWave.setGradient(0,0.1);
  fbox.draw();
  
  //saveFrame();
  //println(frameCount);

} 
