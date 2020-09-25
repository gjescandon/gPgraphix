class LineStar {
  
 float[] dist;
 int bmax;
 float theta, thetaInc;
 float thetaOff, thetaOinc;
 float thetaOff2, thetaO2inc;
 float rotFactor;
 AutoPalette apal;
 int cntr;
 QuilezFunctions qeq;
 NoizeBob radBob;
 float noizeInc, noizeFloat, noizeFalloff;
 
 LineStar(){
   thetaInc = PI/24.;
   theta = 0.0;
   thetaOff = 0;
   thetaOinc = TWO_PI/48.;
   thetaOff2 = 0;
   thetaO2inc = 0.003;
   rotFactor = 0.03;
   
   bmax = floor(TWO_PI/thetaInc);
   apal = new AutoPalette(random(1));
   cntr = 0;
   qeq = new QuilezFunctions();
   
   float noizeInc = 0.01;
   float noizeFactor = 1.;
   float noizeFalloff = 0.4;
   
   radBob = new NoizeBob(noizeFactor, noizeInc, noizeFalloff);
 }
 
 void draw() {
   colorMode(HSB, 1.0);
   pushMatrix();
   //translate(0.5*width, 0.5*height, 0.);
   pushMatrix();
   rotate(thetaOff2);
   float radBobInc = radBob.getBob();
   float dist = 220 * dscale(cntr) * (1. + 0.7*sin(0.006*cntr));
   for (int i =0; i < bmax; i++) {
     float bobTail = radBob.getBobTail(i);
     float thisDist = dist * (1+ bobTail);
       float xoff = thisDist * (1+rotFactor*sin(thetaOff+ thetaOinc*i))*sin(thetaInc*i);
       float yoff = thisDist * (1+rotFactor*sin(thetaOff+ thetaOinc*i))*cos(thetaInc*i);
       pushMatrix();
       translate(xoff, yoff, 30* bobTail);
       fill(apal.getColor(1.*i/bmax));
       stroke(apal.getColor(1.*i/bmax));
       sphere(10 * dscale(cntr) * thisDist /180.);
       strokeWeight(1);
       //line(0, 0, 0.-xoff, 0.-yoff);
       popMatrix();
     }
   thetaOff += thetaOinc;
   if (thetaOff >=TWO_PI) thetaOff = 0.0;
   thetaOff2 += thetaO2inc;
   if (thetaOff >=TWO_PI) thetaOff = 0.0;
   
   popMatrix();
   popMatrix();
   cntr += 1;
   
 }
 
 float dscale(float cntr) {
   float ret = 0.;
   ret = qeq.expSustainedImpulse( cntr, 600, 600 );
   
   return ret;
 }
  
}
