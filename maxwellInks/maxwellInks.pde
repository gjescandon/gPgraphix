
QuilezFunctions qf;
GeoFunctions gf;

int frameBump, frameInc;
int BPM = 96;

int cnt;

InkLiner inker;

float xoff;
void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default

  qf = new QuilezFunctions();
  gf = new GeoFunctions();
 
 inker = new InkLiner();
 

  
  colorMode(HSB,1.);
  
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  
  xoff = random(1);
  }

void draw() {
  background(0.);
  if (frameCount > frameBump) {
   // init();
   frameBump = frameCount+frameInc;
  }
  
  inker.draw();
  
  //saveFrame();
  println(frameCount);

} 
