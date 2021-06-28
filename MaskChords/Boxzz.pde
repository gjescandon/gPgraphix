class Chords {
  
  float index = 16;
     float ll;
  NoizeBob swbob, llbob, lsbob, xbob, ybob,zbob;
 Chords() {
   llbob = new NoizeBob(1.0, 0.003, 0.5);
   lsbob = new NoizeBob(1.0, 0.01, 0.5);
   swbob = new NoizeBob(PI, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
   zbob = new NoizeBob(300.0, 0.001, 0.5);
 }
 
 void draw() {
   colorMode(HSB,1.);
   //directionalLight(1.0,0.0,1.0,sin(0.001*frameCount),cos(0.001*frameCount),-1.);
   fill(1.);
   translate(0, 0, zbob.getBob());
   pushMatrix();
   rotateZ(PI * sin(0.001*frameCount * llbob.getBob()));
   drawChord();
   popMatrix();
 }
 
 
 void drawChord() {
   float r = 0.4*height;//*llbob.getBobTail(1);
   float t1 = swbob.getBob();
   float t0 = 1. * PI / index;
   float cd = 25. * r / index;
   float ls = lsbob.getBob();
   for (int i=0; i < index; i++) {
     float x1 = r*sin(i * t0  + 0.001*frameCount + swbob.getBobTail(10*i));
     float y1 = r*cos(i * t0  + 0.001*frameCount+ swbob.getBobTail(10*i));
     float x2 = r*sin(i * t0  + 0.001*frameCount+ swbob.getBobTail(10*i) + TWO_PI * swbob.getBobTail(20*(1+i)));
     float y2 = r*cos(i * t0  + 0.001*frameCount+ swbob.getBobTail(10*i) + TWO_PI *swbob.getBobTail(20*(1+i)));
     strokeWeight(1.);
     noStroke();
     pushMatrix();
     translate(x1, y1);
     circle(0,0, cd* llbob.getBobTail(1));
     popMatrix();
     pushMatrix();
     translate(x2,y2);
     circle(0,0, cd* llbob.getBobTail(1));
     popMatrix();
     stroke(1.);
     strokeWeight(0.5 * cd * ls * llbob.getBobTail(1));
     line(x1,y1,x2,y2);
   }
   
 }
}
