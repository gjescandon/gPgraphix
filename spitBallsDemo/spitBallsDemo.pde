float theta, thetaInc;
float zoff, zoffInc;
SpitBalls balls;

/***

good 

*/


void setup() {
 size(720,702,P3D); 
  theta = 0.;
  /// fib angle = 137.5
  thetaInc = 137.7 * PI / 180.;

  zoff = 0.0;
  zoffInc = 0.05;
  colorMode(HSB, 1.);
  
  balls = new SpitBalls();
}

void draw() {
  background(200);
  float lx = 0.05* sin(0.06*frameCount);
  float ly = 0.05* cos(0.06*frameCount);
  
  directionalLight(1., 0., 1., lx, ly, -1);
  
  stroke(0);
  line(0.5*width,0,0.5*width, height);
  noStroke();
  pushMatrix();
  translate(0.5*width, 0.5*height,0);
  pushMatrix();
  rotateY(0-theta); // no thiickness cant see it.
    pushMatrix();
    //rotateX(theta);
      pushMatrix();
      translate(-10,0,zoff-10);
      sphere(10);
      popMatrix();
      
      pushMatrix();
      drawS(5,0);
      popMatrix();
    popMatrix();
  popMatrix();
  popMatrix();
  theta += thetaInc;
  if (theta>0.5*PI) theta = 0.5*PI;
  zoff += zoffInc;
  if (zoff>10.) zoff = 10.0;
  
  if (theta == 0.5*PI) {
     balls.draw();
     
  }
}



 void drawS(float x0, float y0){
   // 1. S

   noStroke();
   fill(0,0,200);
   float s1h = 0.2*height;
   float s1w = 100;
   float rr1a = 0.;
   float rr1b = 0-0.5*s1h;
   float rr1c = rr1a;
   float rr1d = 0+0.5*s1h;
   
   // this is a bezier shape
   PShape e1 = createShape();
    e1.beginShape();
    e1.vertex(rr1a, rr1b);
    e1.bezierVertex(rr1a-60, rr1b, rr1c-90, rr1d, rr1a, rr1d);
    e1.bezierVertex(rr1c, rr1d, rr1a, rr1b, rr1a, rr1b);
    e1.endShape();
    shape(e1);
    
   fill(0,0,250);
   float rr2a = x0;
   float rr2b = rr1b + 0.16*height;
   float rr2c = x0;
   float rr2d = rr2b+0.3*height;
   
/*
    PShape e2 = createShape();
    e2.beginShape();
    e2.vertex(rr2a, rr2b);
    e2.bezierVertex(rr2a, rr2b, rr2c, rr2d, rr2c, rr2d);
    e2.bezierVertex(rr2c+80, rr2d, rr2a+100, rr2b, rr2a, rr2b);
    e2.endShape();
    shape(e2);
 */
 }
