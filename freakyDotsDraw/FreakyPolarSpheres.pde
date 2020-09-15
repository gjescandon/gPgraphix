class FreakyPolarSpheres{
 PImage img0, img1;
 float theta, thetaInc;
 float theta0, theta0Inc;
 float cx, cy;
 Dot[] dots;
 NoizeBob dBob;
 color dotColor;
 FreakyPolarSpheres(){
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
         Dot d =  new Dot(x,y, 3.);
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

  float zmin = 100;
  float zmax = 0;

  for (int i=0; i<dots.length; i++) {
    db = dBob.getBobTail(i);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      //circle(d.x, d.y, d.r + db);
      pushMatrix();
      float zed = 0- sq(1/(d.dc+100)*1000);
      translate(d.x, d.y, zed);
      fill(d.c);
      sphere(d.r+db);
      popMatrix();
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
  float x,y,r0,r;
  float dc;
  color c;

  Dot(float x_, float y_, float r_) {
    x = x_;
    y = y_;
    r0 = r_;
    r = getR();
    dc = sqrt(sq(x) + sq(y));
    c = setColor();
  }
  
 color setColor() {
  colorMode(HSB,100);   
  color c = color(10*(noise(dc)) , 0.7*dc, 100, dc);  
   return c;
 }  
 
  void moveToCenter() {
   //move towards center
   float R = sqrt(sq(x)+sq(y));
   float t = atan((y)/(x));
   float descend = 0.4;
   if (x>0.) {
     x = (R - descend)*abs(cos(t));
   } else {
     x = 0.-(R - descend)*abs(cos(t));      
   }
   
   if (y>0.) {
     y = (R - descend)*abs(sin(t));
   } else {
     y = 0.-(R - descend)*abs(sin(t));      
   }
   setColor();   
   if (abs(x) + abs(y) < 0.5) {
     relocate();
   }
   r = getR();
  }
  
  float getR() {
    return r0 * (1. + dc / (1.3*width));
  }
  void relocate() {
   dc = 0.4*width + random(0.3*width);
   float t = random(TWO_PI);
   x = dc * cos(t);
   y = dc * sin(t);
   
   setColor();
  }
  
 }
}
