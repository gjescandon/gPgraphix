class FreakyPolarDots{
 PImage img0, img1;
 float theta, thetaInc;
 float theta0, theta0Inc;
 float cx, cy;
 Dot[] dots;
 NoizeBob dBob;
 color dotColor;
 FreakyPolarDots(){
   setup();
   theta = 0.;
   theta0 = 0.;
   thetaInc = 0.01;
   theta0Inc = 0.003;
   dotColor = color(255,255,255);
   
   cx = 0.5*width;
   cy = 0.5*height;
 }
 
 void draw(){
   pushMatrix();
   //translate(cx,cy);
   //drawDots();
   rotateDots(theta0);
   float toff = 0.05 * (1 + cos(theta + PI));
   rotateDots(theta0+toff);
   theta += thetaInc;      
   if (theta > TWO_PI) {
     theta = 0.;
   }

   theta0 += theta0Inc;
   if (theta0 > TWO_PI) {
     theta0 = 0.;
   }
   
  for (int i=0; i<width*height; i++) {
    Dot d = dots[i];
    if (d != null) {
      d.moveToCenter();
    }
  }
  popMatrix();
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
   float fac = 9.;
   float inc = 0.07;
   float fall = 0.5;
   
   dBob = new NoizeBob(fac, inc, fall);
   float rMax = sqrt(2.*sq(0.5*width));
   float offset = 0.; //.5 * width;
   for (float t = 0.0; t < TWO_PI; t += 0.01) {
     for (float r = 0.; r < rMax; r += 1.) {
       if (hash(t,r) > 0.9) {
         float x = offset + r * cos(t);
         float y = offset + r * sin(t);
         Dot d =  new Dot(x,y, 1);
         dots[floor(r + t*rMax)] = d;
       }
     }
   }
 }
 
 float hash(float x, float y) {
   QuilezFunctions qf = new QuilezFunctions();
   return qf.hash(x,y);
 }
 
 void drawDots() {
  float db = dBob.getBob();
  
  for (int i=0; i<width*height; i++) {
    db = dBob.getBobTail(i);
    fill(dotColor);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      float dr = d.r + db;
      circle(d.x, d.y, dr);
    }
  }
 }

void rotateDots(float theta) {
  float db =  dBob.getBob();

  float cx = 0.5*width;
  float cy = 0.5*height;
  float thetaDot = 0.;
  pushMatrix();
  translate(0.5*width, 0.5*height);
  pushMatrix();
  rotate(theta);
  for (int i=0; i<dots.length; i++) {
    db = dBob.getBobTail(i);
    fill(dotColor);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      circle(d.x, d.y, d.r + db);
    }
  }
  popMatrix();
  popMatrix();
 }
 
 int quadrant(float x, float y) {
  int quadrant = 1;
  float cx = 0.5*width;
  float cy = 0.5*height;
  
  if (cx > x && cy > y) {
    quadrant = 2;
  }
  if (cx > x && cy < y) {
    quadrant = 3;
  }
  if (cx < x && cy < y) {
    quadrant = 4;
  }
  return quadrant;
 }

 class Dot {
  float x,y,r;
  Dot(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r = r_;
  }
  
  void moveToCenter() {
   //move towards center
   float cx = 0.;//5*width;
   float cy = 0.;//5*height;
   float R = sqrt(sq(x - cx)+sq(y - cy));
   float t = atan((y - cy)/(x- cx));
   float descend = 0.5;
   if (x>0.) {
     x = (R - 0.4)*abs(cos(t));
   } else {
     x = 0.-(R - 0.4)*abs(cos(t));      
   }
   
   if (y>0.) {
     y = (R - descend)*abs(sin(t));
   } else {
     y = 0.-(R - descend)*abs(sin(t));      
   }
   
   if (abs(cx-x) + abs(cy-y) < 0.5) {
     relocate();
   }
  }
  
  void relocate() {
   float r = 0.4*width + random(0.3*width);
   float t = random(TWO_PI);
   x = r * cos(t);
   y = r * sin(t);
  }
  
 }
}
