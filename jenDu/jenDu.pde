Boxzz bxz;
JenDuMaker jd;
QuilezFunctions qf;
NoizeBob cb,zbob, xbob, ybob, swb;
AutoPalette apal;
int cnt;
void setup() {
  size(720,720, P3D);
  cnt = 3  ;
  jd = new JenDuMaker();
  apal  = new AutoPalette();
  // frameRate = 60 per sec default
  bxz = new Boxzz();
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.01, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  background(0.);
  }

void draw() {
  colorMode(HSB,1.0);
  float offf = 100.;
  pushMatrix();
  translate(0,0,-50);
  fill(0.);
  rect(-offf,-offf,width+offf+offf,height+offf+offf);
  fill(apal.getColorDark(sin(0.0001*frameCount)));
  rect(0,0,width,height);
  popMatrix();
  directionalLight(1.,0.1,1.,0.3*sin(swb.getBob()),0.3*cos(swb.getBob()),-1);
  //directionalLight(1.,0.1,1.,0.3*sin(0.01*frameCount),0.3*cos(0.01*frameCount),-1);
  
  jd.draw();
  
  //println(frameCount);
  //saveFrame();
} 



// circles - works good
void drawCircles() {
  
  stroke(0.0);
  float sw = 50;
  strokeWeight(sw*swb.getBob());
  fill(1.);
  //pushMatrix();
  //translate(0,0,zbob.getBob());
  circle(0,0, 700 + 1000 * cb.getBobTail(1));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(10));
  circle(0,0, 400 + 1500 * cb.getBobTail(100));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));
  circle(0,0, 700 + 1000 * cb.getBobTail(200));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(100));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));

  circle(0,0, 400 + 1500 * cb.getBobTail(300));
  //popMatrix();
}
