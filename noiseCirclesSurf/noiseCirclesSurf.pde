Boxzz bxz;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;

NoizeBob cb,zbob, xbob, ybob, swb, lbob;
NoizeBob_2D nb2d;
FlockBox flock;

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
  lbob = new NoizeBob(1.0,0.007,0.5);  flock = new FlockBox();
  colorMode(HSB,1.);
  
  }

void draw() {
  
  colorMode(HSB,1.0);
  background(0.);
  directionalLight(0.9, 0.0, 0.9, sin(0.0001*frameCount*lbob.getBob()), sin(0.0001*frameCount*lbob.getBobTail(10000)), -1.);
  flock.draw();
  println(frameCount);
  saveFrame();
} 
