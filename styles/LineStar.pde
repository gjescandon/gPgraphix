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
 NoizeBob radBob, rotBob, zBob;
 float noizeInc, noizeFloat, noizeFalloff;
 
 LineStar(){
   thetaInc = PI/12.;
   theta = 0.0;
   thetaOff = 0;
   thetaOinc = TWO_PI/48.;
   thetaOff2 = 0;
   thetaO2inc = 0.0003;
   rotFactor = 0.006;
   
   bmax = floor(TWO_PI/thetaInc);
   apal = new AutoPalette(random(1));
   cntr = 0;
   qeq = new QuilezFunctions();
   
   float noizeInc = 0.01;
   float noizeFactor = 1.;
   float noizeFalloff = 0.4;
   
   radBob = new NoizeBob(noizeFactor, noizeInc, noizeFalloff);
   rotBob = new NoizeBob(noizeFactor, noizeInc, noizeFalloff);
   zBob = new NoizeBob(-10., noizeInc, noizeFalloff);
 }
 
 void draw() {
   colorMode(HSB, 1.0);
   pushMatrix();
   translate(0.,0., zBob.getBob());
   pushMatrix();
   rotate(thetaOff2 + rotBob.getBob());

   float dist = 220 * dscale(cntr) * (1. + 0.7*sin(0.0006*cntr));
   for (int i =0; i < bmax; i++) {
     float bobTail = radBob.getBobTail(i);
     float thisDist = dist * (1+ bobTail);
       float xoff = thisDist * (1+rotFactor*sin(thetaOff+ thetaOinc*i))*sin(thetaInc*i);
       float yoff = thisDist * (1+rotFactor*sin(thetaOff+ thetaOinc*i))*cos(thetaInc*i);
       pushMatrix();
       translate(xoff + bobTail, yoff - bobTail, 0-10.);
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
