class PikatrixRuler {
  
  float driftX, driftY, driftXinc, driftYinc;
  float signal; // the vertical cursor
  int colorNoiseSize = 13;
  float cursorH; // horizontal cursor
  PImage imgRuler;
  float rw, rh, rh0, rw0;
  float dx, dy;
  PImage img;
  int direction=1;
  int rsize = 56;
  NoizeBob xbob, ybob;

 PikatrixRuler() {
   basicSetup();
 }
 
void draw() {
  xbob.getBob();
  ybob.getBob();
  float qff = qf.expStep(frameCount, 0.03, 0.4);
  rw = rw0 * (1 - qff);
  rh = rh0;
  
  for (int i = 0; i < rsize; i++) {
    pushMatrix();
    //translate(0.3*rw,0,0);
    drawRect(i);
    popMatrix();
    pushMatrix();
    translate(width - 3.2*rw,0,0);
    drawRect(i);
    popMatrix();
  }
}
 


  
  void basicSetup() {
   driftX = 0.0; 
   driftY = 0.0;
   driftXinc = random(1) * 0.01; 
   driftYinc = random(1) * 0.01;
   rw0 = 0.1*width;
   rh0 = 0.01*height;
   signal = height/2;
   xbob = new NoizeBob(rw0, 0.02, 0.5);
   ybob = new NoizeBob(rh0, 0.002, 0.5);
   
    dx = xbob.getBob() * (0.2 * (width - rw));
    dy = ybob.getBob() * (0.4 * (height - rh));
   img = loadImage("Teahupoo_1280.png");

  }
  
  void drawRect(int index) {
    
    if (signal > img.width-rsize|| signal < rsize) { 
      direction = direction * -1;
      }
    signal += (0.0003*direction); 
    pushMatrix();
    translate(0.5*rw + xbob.getBobTail(index), 2*rh + index*(rh*2) + ybob.getBobTail(index));
    fill(img.pixels[floor(signal) + index]);
    pushMatrix();
    rotateX(0.001*frameCount);
    
    pushMatrix();
    translate( -0.5*rw, -0.5*rh, 0.5*rh);   
    rect(0,0,rw, rh);
    popMatrix();
    pushMatrix();
    fill(img.pixels[floor(signal) + index]);
    rotateX(HALF_PI);
    translate( -0.5*rw, -0.5*rh, 0.5*rh);   
    rect(0,0,rw, rh);
    popMatrix();
    pushMatrix();
    fill(img.pixels[floor(signal) + index]);
    translate( -0.5*rw, -0.5*rh, -0.5*rh);   
    rect(0,0,rw, rh);
    popMatrix();
    pushMatrix();
    fill(img.pixels[floor(signal) + index]);
    rotateX(HALF_PI);
    translate( -0.5*rw, -0.5*rh, -0.5*rh);   
    rect(0,0,rw, rh);
    popMatrix();
    popMatrix();
    popMatrix();
          
  }
  
}
