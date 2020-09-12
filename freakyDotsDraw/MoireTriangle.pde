class MoireTriangles{
 PImage img0, img1;
 float theta, thetaInc;
 Triangle[] tris;
 NoizeBob dBob;
 
 MoireTriangles(){
   setup();
   theta = 0.;
   thetaInc = 0.001;
 }
 
 void draw(){
   drawtriangles();
   rotateTriangles(theta);
   theta += thetaInc;
 }
 
 void setup() {
   tris = new Triangle[width*height];

   int gridInc = 8;
   for (int y = 0; y < height; y+= gridInc) {
     for (int x = 0; x < width; x+= gridInc) {
       if (y % 2 == x % 2) {
         Triangle d =  new Triangle(x+2,x,x+4,y,y+4,y+4);
         tris[x + y*width] = d;
       }
     }
   }
 }
 
 void drawtriangles() {
  for (int i=0; i<width*height; i++) {
    fill(0,0,255);
    noStroke();
    Triangle d = tris[i];
    if (d != null) {
      triangle(d.x1,d.y1,d.x2,d.y2,d.x3,d.y3);
    }
  }
 }

 void rotateTriangles(float theta) {
  for (int i=0; i<width*height; i++) {
    fill(0,0,255);
    noStroke();
    Triangle d = tris[i];
    if (d != null) {
      triangle(d.x1,d.y1,d.x2,d.y2,d.x3,d.y3);
    }
  }
 }

void rotatePoint(float x, float y, float theta) {
  
  float cx = 0.5*width;
  float cy = 0.5*height;
  for (int i=0; i<width*height; i++) {
    fill(0,0,255);
    noStroke();
    Triangle d = tris[i];
    if (d != null) {
      float r = sqrt(pow(x - cx,2.) + pow(cy - y,2.));
      float toff = PI * (1 + cos(theta + PI));
      if (quadrant(x,x) == 1) {
        float theta0 = atan((cy-y)/(x-cx));
        float x2 = cx + r * cos(theta0 + toff); //
        float y2 = cy - r *sin(theta0 + toff);
        circle(x2, y2, 10);
      }
      if (quadrant(x,x) == 2) {
        float theta0 = atan((cy-y)/(cx-x));
        float x2 = cx - r * cos(theta0 + toff);
        float y2 = cy - r *sin(theta0 + toff);
        circle(x2, y2, 10);
      }
      if (quadrant(x,x) == 3) {
        float theta0 = atan((y-cy)/(cx-x));
        float x2 = cx - r * cos(theta0 + toff);
        float y2 = cy + r *sin(theta0 + toff);
        circle(x2, y2, 10);
      }
      if (quadrant(x,x) == 4) {
        float theta0 = atan((y-cy)/(x-cx));
        float x2 = cx + r * cos(theta0 + toff);
        float y2 = cy + r *sin(theta0 + toff);
        circle(x2, y2, 10);
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

 class Triangle {
  float x1,x2,x3,y1,y2,y3;
  Triangle(float x1_, float x2_, float x3_, float y1_, float y2_, float y3_) {
    x1 = x1_;
    x2 = x2_;
    x3 = x3_;
    y1 = y1_;
    y2 = y2_;
    y3 = y3_;
  }
  
 }
}
