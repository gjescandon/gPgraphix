
QuilezFunctions qf;
GeoFunctions gf;
SphereMaker sm;
SphereMaker[] sarr;
NoizeBob xbob, ybob, zbob;

int frameBump, frameInc;
int BPM = 140;

int cnt;
void setup() {
  size(720,720, P3D);
  init();
  }
  
void init() {
  frameInc = 4*60*60/BPM;
  frameBump = frameInc;
  
  cnt = 3  ;
  // frameRate = 60 per sec default
  qf = new QuilezFunctions();
  gf = new GeoFunctions();

  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  zbob = new NoizeBob(1., 0.001, 0.3);

  //sm = new SphereMaker();
  sarr = new SphereMaker[cnt];
  for (int i = 0; i < cnt; i++) {

    sarr[i] = new SphereMaker();
  }
  colorMode(HSB,1.);
}

void draw() {
  
  if (frameCount > frameBump) {
   init();
   frameBump = frameCount+frameInc;
  }
  background(0.);
  directionalLight(1., 0., 1., 0.1*sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1.);

  translate(0.5*width, 0.5*height);
  pushMatrix();
  rotateX(sin(xbob.getBob()));
  rotateY(0.01*frameCount);
  rotateZ(sin(zbob.getBob()));
  
  for (int i = 0; i < cnt; i++) {
    sarr[i].draw();
  }
  popMatrix();
  
  //saveFrame();
  println(frameCount);
}
