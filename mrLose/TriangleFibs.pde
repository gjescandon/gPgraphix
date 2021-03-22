class TriangleFibber { 
  NoizeBob bobHue1, bobHue2;
  float myHue;
  float xmid, ymid;
  float xmid0 = width * 0.5;
  float ymid0 = height * 0.5;
  AutoPalette apal;

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
  int frameIndex = 1;
  float fangle, fangle0;
  NoizeBob xbob, ybob, cbob, zbob;
  
  TriangleFibber(float radius) {
    
    apal = new AutoPalette(0.53);
  rad = radius;
  radfactor = 0.5;
  thetaOff = 0.0;
  thetaInc = 0.0005 * random(1, 5);
  
  x1Noff = y1Noff = x2Noff = y2Noff = 0.0;
  x1Inc = 0.0001 * random(1, 10);
  y1Inc = 0.0001 * random(1, 10);
  x2Inc = 0.0001 * random(1, 10);
  y2Inc = 0.0001 * random(1, 10);  
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
   bobHue1 = new NoizeBob(1., 0.01, 0.4);
   bobHue2 = new NoizeBob(100, 0.01, 0.4);
   xbob = new NoizeBob(1.0, 0.00001, 0.6);
   ybob = new NoizeBob(1.0, 0.00001, 0.6);
   cbob = new NoizeBob(1.0, 0.006, 0.6);
   zbob = new NoizeBob(1.0, 0.0003, 0.6);
   cbob.getBob();
  }
  
  void drawTriangles() {
   colorMode(HSB, 1.);
   //stroke(color(bobHue1.getBob(), 1., 1.));
   zbob.getBob();
   fangle = fangle0+ map(noise(x1Noff, y1Noff), 0.0, 1.0, -0.5, 0.5);
   
   x1Noff += x1Inc;
   y1Noff += y1Inc;
   thetaOff += thetaInc;// + noise(x1Noff, y1Noff);

   int imin = constrain(frameIndex - 200, 0, 200);
    for (int i = imin; i < frameIndex; i++) {
      drawTriangle(i);  
    }
    if (frameCount == frameNext) {
      frameNext = frameCount + 50;
      frameIndex++;
    }
    
   
   
   thetaOff += thetaInc;// + noise(x1Noff, y1Noff);
   
  }
  
  void drawTriangle(int index) {
   float radMax = rad * (1 + frameIndex * (radfactor + 0.2* zbob.getBobTail(index)));
   float radInstance = map(index, 0, frameIndex, radMax, rad);
   float tSideMax = tSide * (1 + constrain(frameIndex, 0, 100) * tSideFactor);
   float tSideInstance = map(index, 0, frameIndex, tSideMax, tSide);
   float r = radInstance + 30 * noise(x1Noff, y1Noff);
   float iAngle = 2 * PI * index / tCnt;
   
   iAngle = 2 * PI * index * 360 / fangle;
   iAngle = 2 * PI * index * 360.0 / 137.5;
   xmid = 0.5*width + 100 * xbob.getBob();
   ymid = 0.5*height + 100 * ybob.getBob();
   float x = xmid + r * cos(direction * thetaOff + iAngle);
   float y = ymid + r * sin(direction * thetaOff + iAngle);
   float x2 = x - (tSideInstance * cos(theta0 + direction * thetaOff + iAngle));
   float y2 = y - (tSideInstance * sin(theta0 + direction * thetaOff + iAngle));
   float x3 = x - (tSideInstance * cos(00 - theta0 + direction * thetaOff + iAngle));
   float y3 = y - (tSideInstance * sin(0.0 - theta0 + direction * thetaOff + iAngle));

   float sat = map(index, 0, frameIndex, 100, 10);
   fill(apal.getColor(cbob.getBobTail(index)));
   
   boolean inboundsX = true;
   boolean inboundsY = true;
   
   if(x + x2 + x3 < 0.005 * width) {
     inboundsX = false;
   }
   if ((x > 0.95 * width) || (x2 > 0.95 * width) || (x3 > 0.95 * width)) {
     inboundsX = false;
   }
   if(y + y2 + y3 < 0.05 * height) {
     inboundsY = false;
   }
   if ((y > 0.95 * height) || (y2 > 0.95 * height) || (y2 > 0.95 * height)) {
     inboundsX = false;
   }
   
   if (inboundsX && inboundsY) {
     pushMatrix();
     translate(0, 0, index + zbob.getBobTail(index));
     triangle(x,y, x2, y2, x3, y3);

     popMatrix();
   }
  }

}
