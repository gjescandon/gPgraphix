class FreakyDots{
 PImage img0, img1;
 float theta, thetaInc;
 Dot[] dots;
 NoizeBob dBob;
 
 FreakyDots(){
   setup();
   theta = 0.;
   thetaInc = 0.01;
 }
 
 void draw(){
   drawDots();
   rotateDots();
   //image(img0, 0, 0, width, height);
   //rotateImg(img1, 0.1*sin(theta), 0.9 + (0.2/2)*(1+sin(theta)));
   theta += thetaInc;
 }
 
 void rotateImg(PImage img, float theta, float scale) {
   pushMatrix();
   translate(0.5*width, 0.5*height);
   pushMatrix();
   rotate(theta);   
   image(img0, -0.5*width*scale, -0.5*height*scale, width * scale, height * scale);
   popMatrix();
   popMatrix();
 }
 
 void setup() {
   dots = new Dot[width*height];
   float fac = 2.;
   float inc = 0.1;
   float fall = 0.5;
   
   dBob = new NoizeBob(fac, inc, fall);
   
   img0 = (new EmptyTemplate()).getEmpty();
   img0.loadPixels();
   for (int y = 0; y < height; y++) {
     for (int x = 0; x < width; x++) {
       if (hash(x,y) > 0.7) {
         float db =  dBob.getBob();
         Dot d =  new Dot(x,y, 3+ db);
         dots[x + y*width] = d;
         img0.pixels[x + y*width] = color(0);
       }
     }
   }
   img0.updatePixels();
   
   img1 = (new EmptyTemplate()).getEmpty();
   img1.loadPixels();
   img0.pixels = img0.pixels;
   img1.updatePixels();
 }
 
 float hash(float x, float y) {
   QuilezFunctions qf = new QuilezFunctions();
   return qf.hash(x,y);
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
      float toff = 0.05 * (1 + cos(theta + PI));
      if (quadrant(d.x,d.x) == 1) {
        float theta0 = atan((cy-d.y)/(d.x-cx));
        float x = cx + r * cos(theta0 + toff); //
        float y = cy - r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
      if (quadrant(d.x,d.x) == 2) {
        float theta0 = atan((cy-d.y)/(cx-d.x));
        float x = cx - r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
        float y = cy - r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
      if (quadrant(d.x,d.x) == 3) {
        float theta0 = atan((d.y-cy)/(cx-d.x));
        float x = cx - r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
        float y = cy + r *sin(theta0 + toff);
        circle(x, y, d.r);
      }
      if (quadrant(d.x,d.x) == 4) {
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
