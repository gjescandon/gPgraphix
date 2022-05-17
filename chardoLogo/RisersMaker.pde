class RisersMaker {
 
 int[] rcenArr;
 float rcenter;
 float rinc;
 int rcnt;
 
 RisersMaker() {
    rcenter = 0.;
    rinc = 0.7;
 }
 
 
 void draw(float xa) {
   //println(xa);
   rcnt = floor(1.0*height / xa);
   //println(rcnt);
   float xoff = 0.5*xa;
   for (int i=0; i < 4*rcnt; i++) {
     
     noStroke();
     fill(0.6);
     pushMatrix();
     translate(0.3*xa, rcenter + i*1.05*xa, - 0.3*xa);
     sphere(0.3*xa);
     popMatrix();
     
   }
   rcenter -= rinc;
   if (rcenter < -1.05*xa ) {
     rcenter = 0.; 
   }
 }
}
