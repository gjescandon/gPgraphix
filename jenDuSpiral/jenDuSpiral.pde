Boxzz bxz;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;
int frameStep, frameInc;
NoizeBob cb,zbob, xbob, ybob, swb;
Spiralizer spirals;
int cnt;
int pmax, ploc;
GPoint[] gpArr;
int[] pbArr;
float hue, sat, hue2;
int rotFlag;
int shapeFlag;
float thetaX;
float backgroundColor, frameColor;
int BPM = 140;

void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  frameInc = 4*60*60/BPM;
  frameStep = frameInc;
  println(frameStep);
  
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
  
  //noLoop();
  }

void draw() {
  
  float a = 0.1 * width;
  float b = 0.1 * height;
  float c = 0.8 * width;
  float d = 0.8 * height;
  directionalLight(1., 0., 1., 0., 0., -1.);
  
  pushMatrix();
  translate(0,0,-5);
  background(backgroundColor);
  fill(frameColor);
  rect(-10, -10, a ,height+10);
  rect(-10, -10, width +10, b);
  rect(-10, b + d, width +10, height+10);
  rect(a+c, -10, width +10, height+10);
  
  fill(backgroundColor);
  //rect(a, b, c ,d);
  popMatrix();
  
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
    frameStep+= frameInc;
    setupSpiral(); 
  }
  
  
  pushMatrix();
  translate(width/2, height/2, -5);
  
  if (rotFlag > 0) {
    rotate((0.25)*PI);
  } 
  for (int i = 0; i < ploc; i++) {
    fill(hue2, sat, i*0.25 - floor(i*0.25));
    p1 = gpArr[i];
    float rad = 20 + 500 * qf.expStep(3.*i/ploc, .5, 1.3);
    pushMatrix();
    if ((( abs(p1.getX()) <   0.5*width - rad)) && ((p1.getY() < rad - 0.5*height) || (p1.getY() > 0)))  {
      translate(0, 0, -10);    
    }
    if (0.5*width > rad)       translate(0, 0, -10);    
    if (0.5*height > rad)       translate(0, 0, -10);    


    ellipse(p1.getX(), p1. getY(), rad, rad);
    popMatrix();
  }
    popMatrix();
  
  
  pushMatrix();
  translate(width/2, height/2, 0);
  if (rotFlag > 0) {
    rotate((0.25)*PI);
  } 
  
    
  for (int i = ploc-1; i >1; i--) {

    float bril = 1. - 0.06*i%3;
    
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
        if (shapeFlag == 0.) {
          pushMatrix();
          if (isPointInbounds(p1) == false) {
            translate(0,0,-10);
          }
          rect(p1.getX(), p1. getY(), p2.getX() - p1.getX(), p2.getY() - p1.getY(), 0.3*rad);
          popMatrix();
        } else {
          pushMatrix();
          float ww = p2.getX() - p1.getX();
          float hh = p2.getY() - p1.getY(); 
          translate(p1.getX() + 0.5*ww, 0.5*hh + p1.getY(), 0.);
          rotateX(thetaX);
          box(ww, hh, 20.3 * i);
        }
    }
  }
  popMatrix();
  
  saveFrame();
  println(frameCount);
} 

void setupSpiral() {
  backgroundColor = 0.7 + 0.1*random(1);
  frameColor = 0.2 + 0.1*random(1);
    ploc = 8 + 2* floor(random(4));
    rotFlag = 0;
    shapeFlag = 0;
    if (random(1) > 0.5) rotFlag = 1;
    //if (random(1) > 0.5) shapeFlag = 1;
    println(ploc);
  thetaX = 0.1*PI - 0.05*random(1);
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

boolean isPointInbounds(GPoint p) {
  boolean ret = false;
  if ((p.getX() > 0.-0.5*width) && (p.getX() < .5*width) && (p.getY() > 0.-0.5*height) && (p.getY() < 0.5* height)) ret = true;
 return ret; 
}
