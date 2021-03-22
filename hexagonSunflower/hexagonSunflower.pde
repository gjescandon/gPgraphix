import java.util.HashMap;
import java.util.Set;
import java.util.Iterator;

Hexagon m6;
Sunflowers sflowers;

NoizeBob xBob, yBob, aprimeBob;
float bpm;
AutoFrame sunframe;
int frate;

float xx, yy;
void setup() {
 size(1280, 720, P2D);
 frate = 30;
 frameRate(frate);
 bpm = 120;

 
 xBob = new NoizeBob(0.15, 0.4, 0.01);
 yBob = new NoizeBob(0.15, 0.4, 0.01);
 sflowers = new Sunflowers();
 
 sunframe = new AutoFrame(loadImage("sunflowerAbs75.jpg"));
 xx = xBob.getBobInc();
 yy =  yBob.getBobInc();
 
 m6 = new Hexagon((0.2 + xx) * width, (0.2 + yy) * height, 240, 160);
}

void draw() {
  
 
 xx = xBob.getBobInc();
 yy =  yBob.getBobInc();
 //println(xx + " " + yy);
 
 int bpmIndex = floor(bpm / 60 * frate);
 if (frameCount <= 1 || frameCount % bpmIndex == 0) {
   m6 = new Hexagon((0.15 + xx) * width, (0.15 + yy) * height, 240, 160);
 }

 if (frameCount <= 1 || frameCount % (bpmIndex / 4) == 0) {
   background(0);
   sunframe.draw();
   m6.draw();
 }

//saveFrame();
}




class Hexagon {
  float xa, ya, w, h, theta;
  
  PShape m666;

  float[] xAprime;
  float[] yAprime;

  float duty = 0.03;
  PImage textureImg;
  NoizeBob aprimeBob;
  HashMap<Point, Integer> pointMap;
  int levelMax = 3;
  PImage[] sunimgArr;
  PImage[] imgArr;
  
 Hexagon(float xa, float ya, float w, float h, float theta) {
   this.xa = xa;
   this.ya = ya;
   this.w = w;
   this.h = h;
   this.theta = theta;
   setupHex();
   loadTextureSunflower(); 
 }
 
Hexagon(float xa, float ya, float w, float h) {
   this.xa = xa;
   this.ya = ya;
   this.w = w;
   this.h = h;
   this.theta = random(atan(w / h), 0.45 * PI);
   setupHex();
   loadTextureSunflower();
 }

  
 void draw() {
  drawAprimes();
  drawM666(floor(xa), floor(ya), textureImg);
 }
 
 void drawAprimes() {

  Set ppoints = pointMap.keySet();
  
  Iterator iter = ppoints.iterator();
  int icntr = 0;
  while (iter.hasNext()) {
    Point pp = (Point)iter.next();
    
    drawM666(pp.x, pp.y, imgArr[icntr]);
    icntr++;
    if (icntr > 36) icntr = 0;
  }
 }
 
 void drawM666(int xain, int yain, PImage textureImg) {
  
   float n = 0.5 * h / tan(theta);
   
   float axJitt = jitter(xain);
   float ayJitt = jitter(yain);
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
   
   //println("setupHex");
   
   sunimgArr = sflowers.sunimgArr;

  
   pointMap = new HashMap<Point, Integer>();
   pointMap.putAll(getAprimeMap(floor(xa), floor(ya), 1));
   
   imgArr = new PImage[getHexTileCount(levelMax)];
   for (int i = 0; i < imgArr.length; i++) {
    imgArr[i] = getSunImg();
   }
   
 }
 
 HashMap<Point, Integer> getAprimeMap(int xain, int yain, int llevel) {
   HashMap<Point, Integer> apointMap = new HashMap<Point, Integer>();
   
   if (llevel >= levelMax) return pointMap;
   
   float n = 0.5 * h / tan(theta);
   
   int x0 = floor(xain);
   int y0 = floor(yain - h * 0.5);
   apointMap.putAll(getAprimeMap(x0, y0, llevel + 1));
   apointMap.put(new Point(x0, y0), llevel);
   
   int x1 = floor(xain + (w - n) * 0.5);
   int y1 = floor(yain - (0.25 * h));
   //point[1] = point(xa, ya - h * 0.5);
   apointMap.putAll(getAprimeMap(x1, y1, llevel + 1));
   apointMap.put(new Point(x1, y1), llevel);
   
   int x2 = floor(xain + (w - n) * 0.5);
   int y2 = floor(yain + (0.25 * h));
   apointMap.putAll(getAprimeMap(x2, y2, llevel + 1));
   apointMap.put(new Point(x2, y2), llevel);
   
   int x3 = floor(xain);
   int y3 = floor(yain + h * 0.5);
   apointMap.putAll(getAprimeMap(x3, y3, llevel + 1));
   apointMap.put(new Point(x3, y3), llevel);
   
   int x4 = floor(xain - (w - n) * 0.5);
   int y4 = floor(yain - 0.25 * h);
   apointMap.putAll(getAprimeMap(x4, y4, llevel + 1));
   apointMap.put(new Point(x4, y4), llevel);
   
   int x5 = floor(xain - (w - n) * 0.5);
   int y5 = floor(yain + 0.25 * h);
   apointMap.putAll(getAprimeMap(x5, y5, llevel + 1));
   apointMap.put(new Point(x5, y5), llevel);
   
   return apointMap;
 }
 
 
 
 color getColor() {
   /*
  if (random(1) > duty) {
    return color(0.0, 0.0,0.0);
  } else {
    return color(0.0, random(128,255), random(128,255));
  }
   */
   PImage simg = getSunImg();
   color[] pallete = loadPallet(13, simg);
   return pallete[floor(random(pallete.length))];
 }
 
 void loadTextureImg(PImage img) {
   textureImg = createImage(img.width, img.height, ARGB);
   img.loadPixels();
   textureImg.loadPixels();
   arrayCopy(img.pixels, textureImg.pixels);
   textureImg.updatePixels();
 }

 PImage getSunImg() {

  
   return sunimgArr[floor(random(sunimgArr.length))];
   
 }
  void loadTextureSunflower() {
    
  
   PImage img = getSunImg();
   textureImg = createImage(img.width, img.height, ARGB);
   img.loadPixels();
   textureImg.loadPixels();
   arrayCopy(img.pixels, textureImg.pixels);
   textureImg.updatePixels();
 }
 
 
 float jitter(float n) {
  return n + random(-1,1); 
 }
 
 int getHexTileCount(int lin) {
    int result = 1;
    for(int i = 1; i <= lin; i++) {
      result += 6 * i;
   }
 return result;
 }
 
 class Point {
   int x;
   int y;
   Point(int xin, int yin) {
     x = xin;
     y = yin;
   }
 }
}
