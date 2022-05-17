class MaskCirclesAlt {
  
  float theta, rr, dd;
  float tinc; 
  NoizeBob rbob, tbob, dbob;
  
  MaskCirclesAlt() {
    rbob = new NoizeBob(1.0, 0.01, 0.5);
    tbob = new NoizeBob(1., 0.01, 0.7);
    dbob = new NoizeBob(1., 0.01, 0.7);
    rr = random(128.0);
    theta = 2 * PI * random(1);
    tinc = 0.1;
  }
  
  
 void draw() {
   //tbob.getBob();
   rbob.getBob();
   float wlen = 16.*rr/height;

   rr += 0.3*rbob.getBob();
   theta += 0.03*(tbob.getBob() - 0.6);
   dd += 0.6*dbob.getBob();

   //println("" + rr + " " + dd +  " " + wlen);
   //if (rr > height) return;
   if (wlen >= PI) {
     rr = 0.;
     dd = 0.;
     //println("reset");
   }
   
   float xx = rr * (1 + 0.4*rbob.getBobTail(1)) * sin(theta);
   float yy = rr * (1 + 0.4*rbob.getBobTail(1)) * cos(theta);
   
   noStroke();
   pushMatrix();
   translate(xx, yy);
   rotateZ(theta);
   
   ellipse(0,0, dd * sin(wlen) * (1+rbob.getBobTail(1)),dd * sin(wlen));
   popMatrix();
   
 }
}
