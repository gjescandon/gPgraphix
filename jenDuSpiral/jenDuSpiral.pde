Boxzz bxz;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;
int frameStep;
NoizeBob cb,zbob, xbob, ybob, swb;
Spiralizer spirals;
int cnt;
int pmax, ploc;
GPoint[] gpArr;
int[] pbArr;
float hue, sat, hue2;
int rotFlag;

void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  
  colorMode(HSB,1.);
  pmax = 16;
  ploc = 10;
  
  setupSpiral();
  
  frameStep = 100;
  //noLoop();
  }

void draw() {
  
  background(.3);
  float a = 0.1 * width;
  float b = 0.1 * height;
  float c = 0.8 * width;
  float d = 0.8 * height;
  
  fill(0.7);
  rect(a, b, c ,d);
  
  GPoint gp1 = new GPoint(a,b);
  GPoint gp2 = new GPoint(a+c, b+d);
  float dd = gf.getLen(gp1, gp2);
  
  fill(0.7);
  //rect(a,b, dd - c, d);
  
  noFill();
  //rect(a,b, d, d);
  //rect(c+a-d,b, d, d);
  
  GPoint p1;
  GPoint p2;
  if (frameCount > frameStep) {
    frameStep+= 200;
    rotFlag = 0;
    if (random(1) > 0.5) rotFlag = 1;
    setupSpiral(); 
    ploc = 8 + 2* floor(random(4));
    println(ploc);
  }
  
  translate(width/2, height/2);
  pushMatrix();
  if (rotFlag > 0) rotate((0.25)*PI);
  for (int i = 0; i < ploc; i++) {
    fill(hue2, sat, i*0.25 - floor(i*0.25));
    p1 = gpArr[i];
    float rad = 20 + 500 * qf.expStep(3.*i/ploc, .5, 1.3);
    ellipse(p1.getX(), p1. getY(), rad, rad);    
  }
  
  
  
    
  for (int i = ploc-1; i >1; i--) {

    float bril = 1. - 0.1*i%3;
    
    fill(hue, sat, bril);
    noStroke();
    p1 = gpArr[i];
    p2 = gpArr[pbArr[i]];
    float rad=abs(p2.getX() - p1.getX());
    if (abs(p2.getX() - p1.getX()) > abs(p2.getY() - p1.getY())) {
      rad = abs(p2.getY() - p1.getY());
    }
    float minW = 10.;
    if ((abs(p2.getX() - p1.getX())) > minW && (abs(p2.getY() - p1.getY())) > minW) {
      rect(p1.getX(), p1. getY(), p2.getX() - p1.getX(), p2.getY() - p1.getY(), 0.3*rad);
    }
  }
  popMatrix();
  
  //saveFrame();
  println(frameCount);
} 

void setupSpiral() {
  hue = random(1.);
  hue2 = 0.5 * (1 + hue);
  hue2 = hue + 0.4 - floor(hue + 0.4);
  sat = 0.3 * (2 + random(1));
  int soff = floor(random(2));
  spirals = new Spiralizer(soff);
  gpArr = new GPoint[pmax];
  pbArr = new int[pmax];
  for (int i = 0; i < pmax; i++) {
    gpArr[i] = spirals.getPoint();
    pbArr[i] = floor(random(0.5*i));
  }
}
