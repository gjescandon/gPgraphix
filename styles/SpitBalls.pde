class SpitBalls {
  
 AutoPalette apal;
 float[] dist;
 int bmax;
 float thetaFib = 137.5;
 color[] bc;
 float theta, thetaInc;
 NoizeBob tBob;
 
 SpitBalls(){
   bmax = 180;
   dist = new float[bmax];
   bc = new color[bmax];
   apal = new AutoPalette(0.5);

   for (int i = 0; i < bmax; i++){
     dist[i] = 0.;
     bc[i] = apal.getColor(random(1));
   }
   
   theta = 0;
   thetaInc = 0.;
   
   float noizeFactor = 0.001;
   float noizeInc = 0.01;
   float noizeFalloff = 0.5;
   tBob = new NoizeBob(noizeFactor, noizeInc, noizeFalloff);
   
 }
 
 void draw() {
   colorMode(HSB, 1.0);
   pushMatrix();
   //translate(0.5*width, 0.5*height, 0.);
   pushMatrix();
   rotate(theta);
   for (int i =0; i < bmax; i++) {
     if (i < frameCount/10) {
         pushMatrix();
       translate(dist[i]*sin(thetaFib*i), dist[i]*cos(thetaFib*i),0.-0.1*dist[i]);
       fill(bc[i]);
       sphere(1+ 0.03*dist[i]);
       dist[i] +=0.3;
       float maxDist = 2.*(bmax - i);
       if (dist[i] > maxDist) dist[i] = maxDist;
       popMatrix();
     }
   }
   popMatrix();
   popMatrix();
   theta += tBob.getBob();
   if (theta >= TWO_PI) theta = 0.;
 }
  
}
