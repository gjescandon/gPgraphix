class LineStar {
  
 float[] dist;
 int bmax;
 float theta, thetaInc;
 float thetaOff, thetaOinc;
 float thetaOff2, thetaO2inc;
 float rotFactor;
 AutoPalette apal;
 
 LineStar(){
   thetaInc = PI/24.;
   theta = 0.0;
   thetaOff = 0;
   thetaOinc = TWO_PI/48.;
   thetaOff2 = 0;
   thetaO2inc = 0.003;
   rotFactor = 0.03;
   
   bmax = floor(TWO_PI/thetaInc);
   apal = new AutoPalette(0.7);
 }
 
 void draw() {
   colorMode(HSB, 1.0);
   pushMatrix();
   translate(0.5*width, 0.5*height, 0.);
   pushMatrix();
   rotate(thetaOff2);
   float dist = 200;
   for (int i =0; i < bmax; i++) {
       float xoff = dist*(1+rotFactor*sin(thetaOff+ thetaOinc*i))*sin(thetaInc*i);
       float yoff = dist*(1+rotFactor*sin(thetaOff+ thetaOinc*i))*cos(thetaInc*i);
       pushMatrix();
       translate(xoff, yoff,0);
       fill(apal.getColor(1.0*i/bmax));

       stroke(apal.getColor(1.*i/bmax));
       sphere(6);
       strokeWeight(1);
       line(0, 0, 0.-xoff, 0.-yoff);
       popMatrix();
     }
   thetaOff += thetaOinc;
   if (thetaOff >=TWO_PI) thetaOff = 0.0;
   thetaOff2 += thetaO2inc;
   if (thetaOff >=TWO_PI) thetaOff = 0.0;
   
   popMatrix();
   popMatrix();
   
 }
  
}
