PImage nuImg;

NoizeBob zBob, cbob;
NoizeBob yBob;
QuilezFunctions qeq;
AutoPalette apal, apal2;
color bc;
float h0, w0;
float tFib;
boolean saveFrame;

void setup() {
  size(1280,720, P3D);
  colorMode(HSB, 1.);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(100., 0.006, 0.7);
  yBob = new NoizeBob(10., 0.006, 0.3);
  cbob = new NoizeBob(1., 0.06, 0.5);
  apal = new AutoPalette(0.4, 0.9);
  apal2 = new AutoPalette();
  bc = apal.getColor(random(1));
  qeq = new QuilezFunctions();
  w0 = 0.5*width;
  h0 = 0.5*height;
  tFib = 137.5*TWO_PI/360;
  saveFrame = false;
}

void draw() {
  colorMode(HSB,1.0);
  background(0.67,.35,0.97);
  
  
  //drawBackground();
  
  int dmax = 8;
  float bw = 1.*width/dmax;
  bw= 200;
  zBob.getBob();
  yBob.getBob();
  
  
  directionalLight(1.,0.,1.,0.5*sin(0.01*frameCount),0.,-1);
  
  // forground boxes
  //rotateX(0.1*sin(0.001*frameCount) - 0.2*PI);
  float xOff = 0.318*width;

  translate(xOff, 0, 0);
  pushMatrix();
  rotateY(0.1*(0.01*frameCount));
  fill(apal.getColor50(0.005*zBob.getBobTail(1)));
  
  
  float bm = 9;
  float yOff = 1.0*height / bm;
  cbob.getBob();
  for(int i = 0; i < bm+2; i++) {
    pushMatrix();
    translate( yBob.getBobTail(i*10), yOff * i + yBob.getBobTail(i), zBob.getBobTail(i*10));
    noStroke();
    fill(apal.getColor50(cbob.getBobTail(i*100)));
    pushMatrix();
    rotateY(yBob.getBobTail(i*10));
    box(zBob.getBobTail(100+i) * (1+ sin(PI*yOff*i/height)));
    popMatrix();
    popMatrix();
  }
  
  popMatrix();
  
  if (saveFrame) saveFrame();
  println(frameCount);
}

void drawBackground() {
  // background
  float j=0.0;
  float jm = 5.0*height;
  while (j < jm+2) {
    fill(0.8+(pow(0.4*sin(0.01*frameCount+ j / (100+cbob.getBob())),3)));
    pushMatrix();
    translate(0,j-500,-900);
    box(4*width,j,2);
    popMatrix();
    j= j+10;
  }
}
