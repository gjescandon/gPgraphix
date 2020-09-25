class SpitBalls {
  
 AutoPalette apal;
 float[] dist;
 int bmax;
 float thetaFib = 137.5;
 color[] bc;
 
 SpitBalls(){
   bmax = 180;
   dist = new float[bmax];
   bc = new color[bmax];
   apal = new AutoPalette(0.5);

   for (int i = 0; i < bmax; i++){
     dist[i] = 0.;
     bc[i] = apal.getColor(random(1));
   }
 }
 
 void draw() {
   colorMode(HSB, 1.0);
   pushMatrix();
   //translate(0.5*width, 0.5*height, 0.);
   for (int i =0; i < bmax; i++) {
     if (i < frameCount/10) {
         pushMatrix();
       translate(dist[i]*sin(thetaFib*i), dist[i]*cos(thetaFib*i),0.-0.1*dist[i]);
       fill(bc[i]);
       sphere(1+ 0.03*dist[i]);
       dist[i] +=0.1;
       if (dist[i] > 300.) dist[i] = 300.;
       popMatrix();
     }
   }
   popMatrix();
   
 }
  
}
