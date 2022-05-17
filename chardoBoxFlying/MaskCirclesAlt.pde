class MaskCirclesAlt {
  
 
  float[] xoffArr;
  int boxCnt = 13;
  float boxOff = 1.6;
  
  NoizeBob zbob, rbob, xbob, ybob;
  
   MaskCirclesAlt() {
    rbob = new NoizeBob(1.0,0.1,0.6);
    xbob = new NoizeBob(1.0,0.1,0.6);
    ybob = new NoizeBob(1.0,0.1,0.6);
    xoffArr = new float[boxCnt];
   float rrat = width/boxCnt;
   for (int i = 0; i < boxCnt; i++) {
     xoffArr[i] = 1. * (i+1) * rrat;
     
   }  
  }
 
  
 void draw() {
   float xx = 0.5*width;
   float yy = 0.5*height;
   stroke(0.7, 1. , 1.);
   rbob.getBob();
   xbob.getBob();
   ybob.getBob();
   noFill();
   
   for (int i = 0; i < boxCnt; i++) {
     
     strokeWeight(map(xoffArr[i], 0, width, 1., 20.));
     circle(xx + 40. * (sin(0.1 * (frameCount + i) + xbob.getBobTail(10*1))), yy+ 40. * (cos(0.1 * (frameCount + i) + ybob.getBobTail(10*1))), xoffArr[i]); 
     xoffArr[i] -= 10. * rbob.getBobTail(i*10);
     if (xoffArr[i] < 10) xoffArr[i] = width;
   }
 }
}
