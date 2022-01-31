QuilezFunctions qf;
GeoFunctions gf;
LineBuilder[] lines;

NoizeBob cb,zbob, xbob, ybob, swb;

int frameInc, frameStep;
int BPM = 120;

int cnt;
void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  frameInc = 4*60*60/BPM;
  frameStep = frameInc;
    
  init();
  }

void draw() {
  
  background(0.1);

  for (int i = 0; i < cnt; i++) lines[i].draw();
  if (frameCount > frameStep) init();
    
} 

void init() {
  frameStep = frameCount + frameInc;
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);

  lines = new LineBuilder[cnt];
  for (int i = 0; i < cnt; i++) lines[i] = new LineBuilder();
  colorMode(HSB,1.);
}
