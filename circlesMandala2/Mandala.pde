class Mandala {
  
  float r = 10.;
  float rc0 = 5.0;
  float tOff = 0.0;
  float tinc = 137.5*TWO_PI/360.;
  NoizeBob pbob;
  AutoPalette apal;
  float cOff = 1.0;
  float ci = 0.01;
  float cinc = 0.03;
  float ccinc = 0.003;
  float rs = 0.0003;
 Mandala(){
   pbob = new NoizeBob(1.0, 0.006, 0.5);
   apal = new AutoPalette(0.6);
 }
 
 
 void draw() {
   colorMode(HSB, 1.0);
   r = 100.0;
   float rc = rc0;
   tOff = 0.0;
   
   float tMax = r / 10.0;
   ci = 0.1;
   
   while (r < 0.5*width) {
     pbob.getBob();
     tMax = r / 5.0;
     //noStroke();
     color cc = apal.getColor(cOff + ci);
     float rq =4.0*(r)/(0.5*width);
     if (rq%2<1.0) {
       pushMatrix();
       
       rotateZ(PI-rs*frameCount);
       drawCircle((0.9)*r, tMax, tOff, rc, cc);
       popMatrix();
     } else {
       pushMatrix();
       rotateZ(PI+rs*frameCount);
       drawCircle((0.9)*r, tMax, tOff, rc, cc);
       popMatrix();  
     }

     r += 1.2*rc0;
     tOff += tinc;
     ci += cinc;
   }
   
     cOff -= ccinc;
   
   
 }
 
 void drawCircle(float rr, float tMax, float tOff, float rc, color cc) {
   float td = PI / tMax;
   pushMatrix();
   
   float rq =4.0*(rr*1.1)/(0.5*width);
   rotateZ(tOff);
   translate(0.0, 0.0, 5*(1-frac(rq)));
   for (int t= 0; t <= tMax; t++) {
     float x = rr*cos(t*td);
     float y = rr*sin(t*td);
     float hue = hue(cc) + 0.1*pbob.getBobTail(t);
     float sat = saturation(cc);
     float brit = brightness(cc);
     float alpha = pow(1.0-frac(rq),0.5);
     stroke(color(hue,sat,brit,alpha));
     fill(color(hue,sat,brit,alpha));
     
     circle(x + pbob.getBobTail(t), y  + pbob.getBobTail(t+1), alpha*rc);
     pushMatrix();
     translate(x + pbob.getBobTail(t), y  + pbob.getBobTail(t+1), 0.);
     //sphere(alpha*rc);
     popMatrix();
     if (t > 0 && t < tMax) {
       circle(x  + pbob.getBobTail(t+2),  pbob.getBobTail(t+3)-y, alpha*rc);
       pushMatrix();
       translate(x + pbob.getBobTail(t+2), pbob.getBobTail(t+3)-y, 0);
       //sphere(alpha*rc);
       popMatrix();     }
   }   
   popMatrix();
   
 }
 
 float frac(float v) {
   return (v-floor(v));
 }
  
}
