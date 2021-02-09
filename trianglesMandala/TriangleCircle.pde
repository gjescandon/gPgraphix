class TriangleCircle { 
  float xmid, ymid;
  float xmid0 = width * 0.5;
  float ymid0 = height * 0.5;

  float th, tw, tSide;
  float theta0 = atan(0.5);
  int tCnt = 32;
  
  float thetaOff, thetaInc;
  float x1Noff, y1Noff, x2Noff, y2Noff; 
  float x1Inc, y1Inc, x2Inc, y2Inc;  
  float rad, radInc;
  float direction = -1.0;
  PImage img;
  
  TriangleCircle(float radius, boolean clockwise) {
  if (clockwise) {
   direction = 1.0; 
  }
  rad = radius;
  radInc = 5.0;
  thetaOff = 0.0;
  thetaInc = 0.01 * random(1, 5);
  
  x1Noff = y1Noff = x2Noff = y2Noff = 0.0;
  x1Inc = 0.01 * random(1, 10);
  y1Inc = 0.01 * random(1, 10);
  x2Inc = 0.01 * random(1, 10);
  y2Inc = 0.01 * random(1, 10);  

  setTriangleSize();

    img = loadImage("djivanMask.jpg");
    img.loadPixels();
  }
  
  void drawTriangles() {

    fill(getMyColor());
    xmid = xmid0 - (50 - 100 * noise(x1Noff, y1Noff));
    ymid = ymid0 - (50 - 100 *  noise(x2Noff, y2Noff));
    
    x1Noff += x1Inc;
    y1Noff += y1Inc;
    x2Noff += x2Inc;
    y2Noff += y2Inc;
  
    for (int i = 0; i < tCnt; i++){
     float r = rad + 30 * noise(x1Noff, y1Noff);
     float x = xmid + r * cos(direction * thetaOff + 2 * PI * i / tCnt);
     float y = ymid + r * sin(direction * thetaOff + 2 * PI * i / tCnt);
     float x2 = x - (tSide * cos(theta0 + direction * thetaOff + 2 * PI * i / tCnt));
     float y2 = y - (tSide * sin(theta0 + direction * thetaOff + 2 * PI * i / tCnt));
     float x3 = x - (tSide * cos(00 - theta0 + direction * thetaOff + 2 * PI * i / tCnt));
     float y3 = y - (tSide * sin(0.0 - theta0 + direction * thetaOff + 2 * PI * i / tCnt));
     //ellipse(x,y,5,5);
     //ellipse(x2,y2,8,8);
     //ellipse(x3,y3,13,13);
     triangle(x,y, x2, y2, x3, y3);
    }
    
    thetaOff += thetaInc + noise(x1Noff, y1Noff);
    rad += radInc;
    
    if (rad > 0.5 * width) {
      rad = 50.0;
    }    
    setTriangleSize();
  }
  
  void setTriangleSize() {
   th = 10 + 10 * (rad - 100)/100 * random(1);
   tw = 20 + 10 * (rad - 100)/100 * random(1); // half the triangle base
   tSide = sqrt(th * th + tw * tw);
  }

color getMyColor() {
 return img.pixels[floor(random(5, img.pixels.length - 5))]; 
  
}}
