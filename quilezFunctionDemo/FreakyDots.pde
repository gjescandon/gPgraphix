class FreakyDots{
 PImage img0, img1;
 float theta, thetaInc;
 float theta0, theta0Inc;
 Dot[] dots;
 NoizeBob dBob;
 color dotColor;
 FreakyDots(){
   setup();
   theta = 0.;
   theta0 = 0.;
   thetaInc = 0.01;
   theta0Inc = 0.6;
   dotColor = color(255,255,255);
 }
 
 void draw(){
   drawDots();
   //rotateDots(theta0);
   float toff = 0.05 * (1 + cos(theta + PI));
   //rotateDots(theta0+toff);
   theta += thetaInc;      
   if (theta > TWO_PI) {
     theta = 0.;
   }

   theta0 += theta0Inc;
   //if (theta0 > 2 * TWO_PI) {
     //theta0 = 0.;
  // }
   
  for (int i=0; i<width*height; i++) {
    Dot d = dots[i];
    if (d != null) {
      d.moveToCenter();
    }
  }
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

   for (int y = 0; y < height; y++) {
     for (int x = 0; x < width; x++) {
       if (random(1) > 0.999) {
         Dot d =  new Dot(x,y, 1);
         dots[floor(x + y*width)] = d;
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
  
  for (int i=0; i<width*height; i++) {
    db = dBob.getBobTail(i);
    fill(dotColor);
    noStroke();
    Dot d = dots[i];
    if (d != null) {
      float r = sqrt(pow(d.x - cx,2.) + pow(cy - d.y,2.));
      float x = 0.;
      float y = 0.;
      /*
      if (quadrant(d.x,d.x) == 1) {
         thetaDot = atan((cy-d.y)/(d.x-cx));
         x = cx + r * cos(theta+thetaDot); //
         y = cy - r *sin(theta+thetaDot);
      }
      if (quadrant(d.x,d.x) == 2) {
         thetaDot = atan((cy-d.y)/(cx-d.x));
         x = cx - r * cos(theta+thetaDot); //+ 0.5 * (1 + cos(theta + PI)
         y = cy - r *sin(theta+thetaDot);
      }
      if (quadrant(d.x,d.x) == 3) {
         thetaDot = atan((d.y-cy)/(cx-d.x));
         x = cx - r * cos(theta+thetaDot); //+ 0.5 * (1 + cos(theta + PI)
         y = cy + r *sin(theta+thetaDot);
      }
      if (quadrant(d.x,d.x) == 4) {
         thetaDot = atan((d.y-cy)/(d.x-cx));
         x = cx + r * cos(theta+thetaDot); //+ 0.5 * (1 + cos(theta + PI)
         y = cy + r *sin(theta+thetaDot);
      }
      */

         thetaDot = atan((d.y-cy)/(d.x-cx));
         x = cx + r * cos(theta+thetaDot); //+ 0.5 * (1 + cos(theta + PI)
         y = cy + r *sin(theta+thetaDot);

      circle(x, y, d.r + db);
    }
  }
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
   float cx = 0.5*width;
   float cy = 0.5*height;
/*   if (x > cx) {
     x -= 0.1;
   } else {
     x += 0.1;
   }
   if (y > cy) {
     y -= 0.1;
   } else {
     y += 0.1;
   }
  */
   x -= 0.1;
   y -= 0.1;
   if (abs(cx-x) + abs(cy-y) < 0.5) {
     relocate();
   }
  }
  
  void relocate() {
   x = random(0.5*width);
   y = sqrt(sq(0.5*width) - sq(x));
   if (random(1) < 0.5) {
     x = 0. - x;
   }
   if (random(1) < 0.5) {
     y = 0. - y;
   }
  }
  
 }
}
