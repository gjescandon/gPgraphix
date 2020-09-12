class MoireDots{
 PImage img0, img1;
 float theta, thetaInc;
 Dot[] dots;
 NoizeBob dBob;
 
 MoireDots(){
   setup();
   theta = 0.;
   thetaInc = 0.001;
 }
 
 void draw(){
   drawDots();
   rotateDots();
   theta += thetaInc;
 }
 
 void setup() {
   dots = new Dot[width*height];

   int gridInc = 8;
   for (int y = 0; y < height; y+= gridInc) {
     for (int x = 0; x < width; x+= gridInc) {
       if (y % 2 == x % 2) {
         Dot d =  new Dot(x,y, 3);
         dots[x + y*width] = d;
       }
     }
   }
 }
 
 void drawDots() {
  for (int i=0; i<width*height; i++) {
    fill(0,0,255);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      circle(d.x, d.y, d.r);
    }
  }
 }

void rotateDots() {
  
  float cx = 0.5*width;
  float cy = 0.5*height;
  for (int i=0; i<width*height; i++) {
    fill(0,0,255);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      float r = sqrt(pow(d.x - cx,2.) + pow(cy - d.y,2.));
      float toff = PI * (1 + cos(theta + PI));
      if (quadrant(d.x,d.y) == 1) {
        float theta0 = atan((cy-d.y)/(d.x-cx));
        float x = cx + r * cos(theta0 + toff); //
        float y = cy - r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
      if (quadrant(d.x,d.y) == 2) {
        float theta0 = atan((cy-d.y)/(cx-d.x));
        float x = cx - r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
        float y = cy - r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
      if (quadrant(d.x,d.y) == 3) {
        float theta0 = atan((d.y-cy)/(cx-d.x));
        float x = cx - r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
        float y = cy + r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
      if (quadrant(d.x,d.y) == 4) {
        float theta0 = atan((d.y-cy)/(d.x-cx));
        float x = cx + r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
        float y = cy + r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
    }
  }
 }
 
 int quadrant(float x, float y) {
  int ret = 1;
  float cx = 0.5*width;
  float cy = 0.5*height;
  
  if (cx > x && cy > y) {
    ret = 2;
  }
  if (cx > x && cy < y) {
    ret = 3;
  }
  if (cx < x && cy < y) {
    ret = 4;
  }
  return ret;
 }

 class Dot {
  float x,y,r;
  Dot(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
  }
  
 }
}
