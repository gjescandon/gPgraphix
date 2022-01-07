NoizeBob zBob, xbob, cbob;
NoizeBob yBob;
QuilezFunctions qeq;
AutoPalette apal, apal2;
ImageMover images;
color bc;
float h0, w0;
float tFib;
boolean saveFrame = false;
int eyeMax = 5 ;
int[] eyeYoff;
BkgrndrHorizontal bkgH;

void setup() {
  size(1280,720);
  colorMode(HSB, 1.);
    
  zBob = new NoizeBob(1., 0.0006, 0.3);
  yBob = new NoizeBob(1., 0.0003, 0.3);
  xbob = new NoizeBob(1., 0.000003, 0.3);
  cbob = new NoizeBob(1., 0.00003, 0.3);
  apal = new AutoPalette(random(1));
  apal2 = new AutoPalette(random(1));
  bc = apal.getColor(random(1));
  qeq = new QuilezFunctions();
  w0 = 0.5*width;
  h0 = 0.5*height;
  tFib = 137.5*TWO_PI/360;
  
  images = new ImageMover();
  
  bkgH = new BkgrndrHorizontal();
  
  background(0.2);
}

void draw() {
  background(0.0);
  //directionalLight(1.,0.,1.,0.3*sin(xbob.getBob()),0.3*cos(xbob.getBobTail(1)),-1);
  bkgH.draw();

  images.draw();
  

  
  
  if (saveFrame) saveFrame();
  println(frameCount);
}
