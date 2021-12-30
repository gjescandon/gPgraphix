class MaskCirclesAlt {
  float xx, yy, rr, rrinc, cc;
   QuilezFunctions qef;
   int cnt;
   float fcOff = random(1.);
   
  MaskCirclesAlt() {
    qef = new QuilezFunctions();
    cc = -1.;
    rrinc = 2.;
    cnt = 1;
    
    reset();
  }
  
  
 void draw() {
   fill(cc);
   noStroke();
   circle(xx, yy, rr); 
   rr += rrinc;
   float qf = qef.expSustainedImpulse(cnt, 20, 20);
   rrinc = 2 + 10*qf*(1+sin(0.2*frameCount+fcOff));
   
   if (rr > 0.8* width) reset();
 }
 
 void reset() {
   xx = (0.2 + 0.8*random(1)) * width;
   yy = (0.2 + 0.8*random(1)) * (height);
   
   println(qf);
   rr = 1.;
   cc *= -1.;
   //rrinc = 10;
   cnt++;
     

   
 }
}
