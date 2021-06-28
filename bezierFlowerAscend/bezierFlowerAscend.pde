NoizeBob zBob, xbob, cbob;
NoizeBob yBob;
QuilezFunctions qeq;
AutoPalette apal, apal2;
color bc;
float h0, w0;
float tFib;
boolean saveFrame = false;
BullsEye[] beyes;
int eyeMax = 5 ;
int[] eyeYoff;
Bkgrndr bkgrndr;

void setup() {
  size(1280,720, P3D);
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
  
  beyes = new BullsEye[eyeMax];
  eyeYoff = new int[eyeMax];
  bkgrndr = new Bkgrndr();
  
  for (int i = 0 ; i < eyeMax; i++) {
    beyes[i] = new BullsEye();
    eyeYoff[i] = height + floor(random(2*height));
  }
  background(0.2);
}

void draw() {
  background(0.2);
  //directionalLight(1.,0.,1.,0.3*sin(xbob.getBob()),0.3*cos(xbob.getBobTail(1)),-1);
  bkgrndr.draw();

  
  for (int i = 0 ; i < eyeMax; i++) {
    pushMatrix();
    translate(0,0,10*i);
    if (frameCount > i* 50) {
      beyes[i].draw();
    }
    popMatrix();
  }
  

  
  
  if (saveFrame) saveFrame();
  println(frameCount);
}
