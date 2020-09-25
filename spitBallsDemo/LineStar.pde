class LineStar {
  
 float[] dist;
 int bmax;
 float thetaFib = 137.5;
 LineStar(){
   bmax = 180;
   dist = new float[bmax];
   for (int i = 0; i < bmax; i++){
     dist[i] = 0.;
   }
 }
 
 void draw() {
   pushMatrix();
   translate(0.5*width, 0.5*height, 0.);
   for (int i =0; i < bmax; i++) {
     if (i < frameCount/10) {
         pushMatrix();
       translate(dist[i]*sin(thetaFib*i), dist[i]*cos(thetaFib*i),0.-0.1*dist[i]);
       sphere(1+ 0.1*dist[i]);
       dist[i] +=0.5;
       popMatrix();
     }
   }
   popMatrix();
   
 }
  
}
