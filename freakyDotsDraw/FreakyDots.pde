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
   //rotateDots();
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
   float fac = 5.;
   float inc = 0.01;
   float fall = 0.1;
   
   dBob = new NoizeBob(fac, inc, fall);
   //dBob = new NoizeBob();
   //img0 = (new EmptyTemplate()).getEmpty();
   //img0.loadPixels();
   for (int y = 0; y < height; y++) {
     for (int x = 0; x < width; x++) {
       if (hash(x,y) > 0.7) {
         Dot d =  new Dot(x,y, 1);
         dots[x + y*width] = d;
         //img0.pixels[x + y*width] = color(0);
       }
     }
   }
   /*
   img0.updatePixels();
   
   img1 = (new EmptyTemplate()).getEmpty();
   img1.loadPixels();
   img0.pixels = img0.pixels;
   img1.updatePixels();
   */
 }
 
 float hash(float x, float y) {
   QuilezFunctions qf = new QuilezFunctions();
   return qf.hash(x,y);
 }
 
 void drawDots() {
  float db = dBob.getBob();
  
  for (int i=0; i<width*height; i++) {
    db = dBob.getBobTail(i);
    fill(0,0,255);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      float dr = d.r + db;
      circle(d.x, d.y, dr);
    }
  }
  println(" " + frameCount  + " " + db + " " + dBob.getBob() + " " + dBob.bob);
 }

void rotateDots() {
  float db =  dBob.getBob();
  //db = dBob.getBobTail(0-width*height);

  float cx = 0.5*width;
  float cy = 0.5*height;
  for (int i=0; i<width*height; i++) {
    fill(0,0,255);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      float r = sqrt(pow(d.x - cx,2.) + pow(cy - d.y,2.));
      float toff = 0.05 * (1 + cos(theta + PI));
      float x = 0.;
      float y = 0.;
      float theta0 = 0.;
      if (quadrant(d.x,d.x) == 1) {
         theta0 = atan((cy-d.y)/(d.x-cx));
         x = cx + r * cos(theta0 + toff); //
         y = cy - r *sin(theta0 + toff);
      }
      if (quadrant(d.x,d.x) == 2) {
         theta0 = atan((cy-d.y)/(cx-d.x));
         x = cx - r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
         y = cy - r *sin(theta0 + toff);
      }
      if (quadrant(d.x,d.x) == 3) {
         theta0 = atan((d.y-cy)/(cx-d.x));
         x = cx - r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
         y = cy + r *sin(theta0 + toff);
      }
      if (quadrant(d.x,d.x) == 4) {
         theta0 = atan((d.y-cy)/(d.x-cx));
         x = cx + r * cos(theta0 + toff); //+ 0.5 * (1 + cos(theta + PI)
         y = cy + r *sin(theta0 + toff);
      }
      println(d.r + db);
      circle(x, y, d.r + db);
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
