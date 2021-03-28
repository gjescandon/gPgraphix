class TriangleBuilder {
 
 int td = 23;
 int tdd = 3;
 NoizeBob rArrBob, rSingBob;
 NoizeBob xb, pc;
 float radArr, radInc, radMax;
 AutoPalette apal;
 QuilezFunctions qf;
 
 TriangleBuilder() {

   radArr = 1.0;
   radInc = 0.01;
   radMax = 15.;
   qf = new QuilezFunctions();
   
    rSingBob = new NoizeBob(PI, 0.009, 0.5);
    rArrBob = new NoizeBob(PI, 0.001, 0.5);

    xb = new NoizeBob(1.0, 0.001, 0.5);
    pc = new NoizeBob(1.0, 0.001, 0.5);
    
    apal = new AutoPalette();

 }
 
 void draw() {
   
      
   pushMatrix();
       rSingBob.getBob();
       pc.getBob();
       rotateZ(0.0001*frameCount + rArrBob.getBob());
       pushMatrix();
         scale(radArr);
         drawTriRing(radArr);
       popMatrix();
       
   
   popMatrix();
   
   radArr += radInc;

   if (radArr > radMax) radArr = 1.;
   
 }
 
 void drawTriRing(float r) {
   //println(r);
   for (int i = 0; i < td; i ++) {
     pushMatrix();
     float rr = r * 20;
     translate(rr*sin(i * TWO_PI/td),rr*cos(i * TWO_PI/td));
     pushMatrix();
     rotateZ(i*TWO_PI/td);
     scale(r*qf.expStep(r/radMax,3.,10.));
     //circle(0,0,30);
       pushMatrix();
       rotateZ(rSingBob.getBobTail(i));
       PShape ps = getTri();
       ps.setFill(apal.getColor(pc.getBobTail(i)));
       ps.setStroke(apal.getColor(0.5+pc.getBobTail(i)));
       shape(ps);
       popMatrix();
     popMatrix();
     popMatrix();
   }
 }
 
 float getRad() {
   
  return radArr; 
 }
 
 
 PShape getTri() {
   PShape t = createShape();
   t.beginShape();
   
   t.vertex(2*sin(TWO_PI/3), 2*cos(TWO_PI/3),0);
   t.vertex(2*sin(2*TWO_PI/3), 2*cos(2*TWO_PI/3),0);
   t.vertex(2*sin(3*TWO_PI/3), 2*cos(3*TWO_PI/3),0);
   
   t.vertex(2*sin(TWO_PI/3), 2*cos(TWO_PI/3),0);
   t.vertex(2*sin(2*TWO_PI/3), 2*cos(2*TWO_PI/3),0);
   t.vertex(0,0,2);
   
   t.vertex(2*sin(TWO_PI/3), 2*cos(TWO_PI/3),0);
   t.vertex(0,0,2);
   t.vertex(2*sin(3*TWO_PI/3), 2*cos(3*TWO_PI/3),0);
   
   t.vertex(0,0,2);
   t.vertex(2*sin(2*TWO_PI/3), 2*cos(2*TWO_PI/3),0);
   t.vertex(2*sin(3*TWO_PI/3), 2*cos(3*TWO_PI/3),0);
   t.endShape();
   
   return t;
 }

  
  
  
}
