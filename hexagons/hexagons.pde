Hexagon m666;
PImage textImg;

float xOff, xInc, yOff, yInc;

float duty = 0.02;
void setup() {
 size(1280, 720, P2D);
 textImg = loadImage("rumbaEye.png");
 xOff = 0.0;
 yOff = 0.0;
 yInc = 0.01;
 xInc = 0.04;
}

void draw() {

 m666 = new Hexagon(0.4 *  width, 0.3 *height, 200, 150, textImg);
 xOff += xInc;
 yOff += yInc;
 
 if (random(1) < duty) {
   background(0);
   m666.drawAprime(random(1, 13));
   m666.draw();
 }
}




class Hexagon {
  float xa, ya, w, h, theta;
  
  PShape m666;

  float[] xAprime;
  float[] yAprime;

  float duty = 0.9;
  PImage textureImg;
  
 Hexagon(float xa, float ya, float w, float h, float theta, PImage img) {
   this.xa = xa;
   this.ya = ya;
   this.w = w;
   this.h = h;
   this.theta = theta;
   loadTextureImg(img);   
   setupHex();
 }
 
Hexagon(float xa, float ya, float w, float h) {
   this.xa = xa;
   this.ya = ya;
   this.w = w;
   this.h = h;
   this.theta = random(atan(w / h), 0.45 * PI);
   setupHex();
 }

Hexagon(float xa, float ya, float w, float h, PImage img) {
   this.xa = xa;
   this.ya = ya;
   println(xa / ya);
   
   this.w = w;
   this.h = h;
   this.theta = random(atan(w / h), 0.5 * PI);
   loadTextureImg(img);
   setupHex();
 }
  
 void draw() {
  drawM666();
 }
 
 void drawAprime() {
  int pindex = floor(random(0, 6));
  Hexagon aprime = new Hexagon(xAprime[pindex], yAprime[pindex], w, h, theta, textureImg);
  aprime.draw();
 }

 void drawAprime(float index) {
  int pindex = floor(random(0, 6));
  Hexagon aprime = new Hexagon(xAprime[pindex], yAprime[pindex], w, h, theta, textureImg);
  aprime.drawAprime();
  if (1.0 <= index) {
    aprime.drawAprime(index - 1);
  }
  aprime.draw();
 }
 
 void drawM666() {
  
   float n = 0.5 * h / tan(theta);
   
   float axJitt = jitter(xa);
   float ayJitt = jitter(ya);
   float bx = axJitt + (w - 2*n);
   float by = ayJitt;
   float cx = axJitt + (w - n);
   float cy = ayJitt + 0.5*h;
   float dx = axJitt + (w - 2*n);
   float dy = ayJitt + h;
   float ex = axJitt;
   float ey = ayJitt + h;
   float fx = axJitt - n;
   float fy = ayJitt + 0.5*h; 
   
  if (random(1) > duty) {
    // texture shape
  m666 = createShape();
  m666.beginShape();
  m666.texture(textureImg);
  m666.stroke(0,0,0);
  m666.strokeWeight(3);
  m666.vertex(axJitt, ayJitt, 0, 0);
  m666.vertex(bx, by, textureImg.width, 0);
  m666.vertex(cx, cy, textureImg.width,0.5 *textureImg.height);
  m666.vertex(dx, dy, textureImg.width,textureImg.height);
  m666.vertex(ex, ey, 0, textureImg.height);
  m666.vertex(fx, fy, 0, 0.5 *textureImg.height);
  m666.endShape(CLOSE); 
    
  } else {
    // color shape 
  m666 = createShape();
  m666.beginShape();
  m666.fill(getColor());
  m666.stroke(0,0,0);
  m666.strokeWeight(3);
  m666.vertex(axJitt, ayJitt);
  m666.vertex(bx, by);
  m666.vertex(cx, cy);
  m666.vertex(dx, dy);
  m666.vertex(ex, ey);
  m666.vertex(fx, fy);
  m666.endShape(CLOSE); 
  }
  shape(m666, axJitt, ayJitt);
 }
 
 
 void setupHex() {
   float n = 0.5 * h / tan(theta);

   xAprime = new float[6];
   yAprime = new float[6];
   
   xAprime[0] = xa;
   xAprime[1] = xa + (w - n) * 0.5;
   xAprime[2] = xa + (w - n) * 0.5;
   xAprime[3] = xa;
   xAprime[4] = xa - (w - n) * 0.5;
   xAprime[5] = xa - (w - n) * 0.5;
   
   yAprime[0] = ya - h * 0.5;
   yAprime[1] = ya - (0.25 * h);
   yAprime[2] = ya + (0.25 * h);
   yAprime[3] = ya + h * 0.5;
   yAprime[4] = ya - 0.25 * h;
   yAprime[5] = ya + 0.25 * h;

 }
 
 color getColor() {
  if (random(1) > duty) {
    return color(0.0, 0.0,0.0);
  } else {
    return color(0.0, random(128,255), random(128,255));
  }
   
 }
 
 void loadTextureImg(PImage img) {
   textureImg = createImage(img.width, img.height, ARGB);
   img.loadPixels();
   textureImg.loadPixels();
   arrayCopy(img.pixels, textureImg.pixels);
   textureImg.updatePixels();
 }
 
 float jitter(float n) {
  return n ;//+ random(-5,5); 
 }
  
}
