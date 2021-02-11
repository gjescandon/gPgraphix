class Pointellizer{
  PImage img;
  int x0, y0, xf, yf;
  int w0, wf, h0, hf;
  
  NoizeBob xbob, ybob, pbob;
  QuilezFunctions qf; 
  float qff = 0.95;
  float qfk = 0.001;
  Pointellizer(PImage imgIn){
    img = imgIn;
    setup();
  }
  
  void setup() {
   x0 = 375;
   w0 = 140;
   
   y0 = 355;
   h0 = 50;
   
   xf = 120;
   wf = 700;
   
   yf = 240;
   hf = 430;
    
   xbob = new NoizeBob(1.0, 0.01, 0.5);
   ybob = new NoizeBob(1.0, 0.01, 0.5);
   pbob = new NoizeBob(1.0, 0.03, 0.6);
   
   qf = new QuilezFunctions();
  }
  
  
  void draw() {
    drawSpheres();
  }
  
  void drawSpheres() {

  noStroke();
  float duty = getDuty();
  float xOff = 8*xbob.getBob();
  float yOff = 8*ybob.getBob();
  
  pbob.getBob();
  float x1 = getXmin();
  float x2 = getXmax();
  //println(qf.expStep(frameCount, 0.001, qff) + " " + x2);
  float y1 = getYmin();
  float y2 = getYmax();
  
  for (int i = 0; i < duty; i++) {
    int xr = floor(x1 + floor(random(x2-x1)));
    int y = floor(y1 + floor(random(y2-y1)));

    color pix = img.get(xr, y);
    fill(pix);
    float pl = getRad();
    
      pushMatrix();
      translate(map(xr, x1, x2, 0, width)+xOff, map(y,y1,y2,0,height)+yOff, 10 - pl - map(brightness(pix),0,100,0,20));
      sphere(pl*(1+pbob.getBobTail(i)));
      popMatrix();

}
  
  
}

  float getDuty() {
    float d = 1500 - 1490 *qf.cubicPulse(2500, 1000, frameCount);
    return d;
  }
  
  float getRad() {
    float r = 8.;
    r = map(constrain(frameCount,1,2000),1,2000,3,1) + 13.*qf.cubicPulse(2500, 1000, frameCount);
    return r;
}
  float getXmin(){
   float xx = x0;
   xx = map(qf.expStep(frameCount, qfk, qff), 1.0, 0.0, x0, xf) ;
   return xx;
  }
  float getXmax(){
   float xx = width;
   xx = map(qf.expStep(frameCount, qfk, qff), 1.0, 0.0, w0+x0, wf+xf) ;
   return xx;
  }
  float getYmin(){
   float yy = height;
   yy = map(qf.expStep(frameCount, qfk, qff), 1.0, 0.0, y0, yf) ;
   return yy;
  }
  float getYmax(){
   float yy = yf;
   yy =  map(qf.expStep(frameCount, qfk, qff), 1.0, 0.0, h0+y0, hf+yf) ;
   return yy;
  }

}
