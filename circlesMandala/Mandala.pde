class Mandala {
  
  float r = 100.;
  float rc0 = 8.0;
  float tOff = 0.0;
  float tinc = 137.5*TWO_PI/360.;
  NoizeBob pbob;
  AutoPalette apal;
  float cOff = 1.0;
  float ci = 0.01;
  float cinc = 0.03;
  float ccinc = 0.003;
  
 Mandala(){
   pbob = new NoizeBob(1.0, 0.001, 0.5);
   apal = new AutoPalette(0.1);
 }
 
 
 void draw() {
     colorMode(HSB, 1.0);

   r = 100.0;
   float rc = rc0;
   tOff = 0.0;
   
   float tMax = r / 10.0;
   ci = 0.1;
   rotateZ(PI-0.0003*frameCount);
   while (r < 0.5*width) {
     pbob.getBob();
     tMax = r / 5.0;
     //noStroke();
     color cc = apal.getColor(cOff + ci);
     drawCircle(0.9*r, tMax, tOff, rc, cc);

     r += 1.2*rc0;
     tOff += tinc;
     ci += cinc;
   }
   
   if (cOff > 0.0) {
     cOff -= ccinc;
   } else {
     cOff = 1.0;
   }
   
   
 }
 
 void drawCircle(float rr, float tMax, float tOff, float rc, color cc) {
   float td = PI / tMax;
   pushMatrix();
   rotateZ(tOff);
   translate(0.0, 0.0, -1.0);
   for (int t= 0; t <= tMax; t++) {
     float x = rr*cos(t*td);
     float y = rr*sin(t*td);
     float hue = hue(cc) + 1.5*pbob.getBobTail(t);
     float sat = saturation(cc);
     float brit = brightness(cc);
     float rq =3.0*r/(0.5*width);
     float alpha = frac(rq);
     fill(color(hue,sat,brit,alpha));
     
     circle(x + pbob.getBobTail(t), y  + pbob.getBobTail(t+1), rc);
     if (t > 0 && t < tMax) {
       circle(x  + pbob.getBobTail(t+2),  pbob.getBobTail(t+3)-y, rc);
     }
   }   
   popMatrix();
   
 }
 
 float frac(float v) {
   return (v-floor(v));
 }
  
}
