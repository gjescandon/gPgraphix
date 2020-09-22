TriangleFibber tc1;
float bkHue;
NoizeBob lzBob;
  void setup() {
  size(720,720, P3D);
  frameRate(24);
  colorMode(HSB, 100);
  tc1 = new TriangleFibber(10);
  bkHue = 40+random(10);
  lzBob = new NoizeBob(0.5, 0.4);
  
}

void draw() {
 background(color(bkHue,100,100));
// directionalLight(0,0,100, 0.0, 0.0, 1.0 * sin(lzBob.getBob()));
//  directionalLight(0,0,100, 0.0, lzBob.getBob(), lzBob.getBob());
 
 tc1.drawTriangles();
}

class TriangleFibber { 
  NoizeBob bobHue1, bobHue2;
  float myHue;
  float xmid, ymid;
  float xmid0 = width * 0.3;
  float ymid0 = height * 0.6;
  

  float th, tw, tSide, tSideFactor;
  float theta0 = atan(0.5);
  int tCnt = 32;
  
  float thetaOff, thetaInc;
  float x1Noff, y1Noff, x2Noff, y2Noff; 
  float x1Inc, y1Inc, x2Inc, y2Inc;  
  float rad, radfactor;
  float direction = -1.0;
  int rate = 10;
  int frameNext = 20;
  int frameIndex = 23;
  float fangle, fangle0;
  
  TriangleFibber(float radius) {

  rad = radius;
  radfactor = 0.5;
  thetaOff = 0.0;
  thetaInc = 0.0005 * random(1, 5);
  
  x1Noff = y1Noff = x2Noff = y2Noff = 0.0;
  x1Inc = 0.001 * random(1, 10);
  y1Inc = 0.001 * random(1, 10);
  x2Inc = 0.001 * random(1, 10);
  y2Inc = 0.001 * random(1, 10);  
  xmid = xmid0;
  ymid = ymid0;
  
   th = 10 + 10 * (radius - 100)/100;
   tw = 20 + 10 * (radius - 100)/100; // half the triangle base
   th = 60;
   tw = 120;
   tSide = sqrt(th * th + tw * tw);
   tSideFactor = 0.005;
   fangle0 = 137.5;

   myHue = 8.0 + random(10);
   bobHue1 = new NoizeBob(100, 0.4);
   bobHue2 = new NoizeBob(100, 0.4);
  }
  
  void drawTriangles() {
   stroke(color(bobHue1.getBob(), 100, 100));

   fangle = fangle0+ map(noise(x1Noff, y1Noff), 0.0, 1.0, -0.5, 0.5);
   
   x1Noff += x1Inc;
   y1Noff += y1Inc;
   thetaOff += thetaInc;// + noise(x1Noff, y1Noff);

    for (int i = 0; i < frameIndex; i++) {
      drawTriangle(i);  
    }
    if (frameCount == frameNext) {
      frameNext = frameCount + 10;
      frameIndex++;
    }
   
   thetaOff += thetaInc;// + noise(x1Noff, y1Noff);
   
  }
  
  void drawTriangle(int index) {
   float radMax = rad * (1 + frameIndex * radfactor);
   float radInstance = map(index, 0, frameIndex, radMax, rad);
   float tSideMax = tSide * (1 + frameIndex * tSideFactor);
   float tSideInstance = map(index, 0, frameIndex, tSideMax, tSide);
   float r = radInstance + 30 * noise(x1Noff, y1Noff);
   float iAngle = 2 * PI * index / tCnt;
   
   iAngle = 2 * PI * index * 360 / fangle;
   iAngle = 2 * PI * index * 360.0 / 137.5;
   float x = xmid + r * cos(direction * thetaOff + iAngle);
   float y = ymid + r * sin(direction * thetaOff + iAngle);
   float x2 = x - (tSideInstance * cos(theta0 + direction * thetaOff + iAngle));
   float y2 = y - (tSideInstance * sin(theta0 + direction * thetaOff + iAngle));
   float x3 = x - (tSideInstance * cos(00 - theta0 + direction * thetaOff + iAngle));
   float y3 = y - (tSideInstance * sin(0.0 - theta0 + direction * thetaOff + iAngle));
   
   float sat = map(index, 0, frameIndex, 100, 10);
   fill(color(myHue, sat,100));
   
   boolean inboundsX = true;
   boolean inboundsY = true;
   
   if(x + x2 + x3 < 0.005 * width) {
     inboundsX = false;
   }
   if ((x > 0.8 * width) || (x2 > 0.8 * width) || (x3 > 0.8 * width)) {
     inboundsX = false;
   }
   if(y + y2 + y3 < 0.3 * height) {
     inboundsY = false;
   }
   if ((y > 0.95 * height) || (y2 > 0.95 * height) || (y2 > 0.95 * height)) {
     inboundsX = false;
   }
   
   if (inboundsX && inboundsY) {
     pushMatrix();
     translate(0, 0, index);
     triangle(x,y, x2, y2, x3, y3);
     popMatrix();
   }
  }

}
