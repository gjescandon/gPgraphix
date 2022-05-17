
FaceMaker fm;
LineBuilder[] lines;

QuilezFunctions qf;
NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
int frameInc, frameStep;
int BPM = 184;

void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  frameInc = 4*60*60/BPM;
  frameStep = frameInc;
  init();
  }
  
void init() {
    
  // frameRate = 60 per sec default
  frameStep = frameCount + frameInc;
  
  fm = new FaceMaker();
  lines = new LineBuilder[cnt];
  for (int i = 0; i < cnt; i++) lines[i] = new LineBuilder();
  colorMode(HSB,1.);
  
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  background(0.);
}

void draw() {
  colorMode(HSB,1.0);
  background(0.);
  directionalLight(1., 0., 1., 0.1* sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1);
  
  
  
  fm.draw();
  for (int i = 0; i < cnt; i++) lines[i].draw();
  if (frameCount > frameStep) init();
  
  
  println(frameCount);
  //saveFrame();
} 
