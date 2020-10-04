BluWav bluWave;
RedStrip redStrip;
DanStarr starr;

/// R 171 0 5 ::: 358/360 1.00 .67
/// W 255 255 255 ::: 0 0 1

/// B: 20 38 75 ::: 220/360 .733 .294

void setup() {
  
  size(720, 720, P3D);
  float rate = 0.001;
  bluWave = new BluWav(rate);
  redStrip = new RedStrip(rate);
  starr = new DanStarr();
  colorMode(HSB, 1.);
}

void draw() {
 background(0.9);
 pushMatrix();
 translate(0,0,-10);
 bluWave.draw();
 redStrip.draw();
 popMatrix();
 pushMatrix();
 translate(0,0,100);
 starr.draw();
 popMatrix();
 
 
}

class BluWav {
  PShape bwave;
  float rate;
  color bc;
  
  BluWav(float rate_){
   rate = rate_;
   colorMode(HSB, 1.);  
   bc = color(220./360., 0.733, 0.294);
  }
  
 void draw() {
   fill(bc);
   //rect(0,0,width,0.5*height);
   bwave = createShape();
   bwave.beginShape();
   bwave.vertex(0,0);
   bwave.vertex(0,0.5*height);
  //float ctrl = zBob.getBob();
  for (int i=0; i<1;i++){
     float xc1 = 0.2*width;
     float yc1 = 0.5*height + 60*sin(rate*frameCount);
     float xc2 = 0.8*width;
     float yc2 = 0.5*height - 60*sin(rate*frameCount);
     float x2 = width;
     float y2 = 0.5*height;
      bwave.bezierVertex(xc1,yc1,xc2,yc2,x2,y2);
  }
  bwave.vertex(width,0);
  bwave.endShape();

 shape(bwave); 
 }
}

class RedStrip {
   float iMax = 13;
   float wMax = 1.*width/iMax;
   float rate;
   color rc;
   RedStrip(float rate_){
     rate = rate_;
     float h = 1.*358./360.;
     colorMode(HSB, 1.);  
     rc = color(h, 1.00, 0.67);
  }
  
 void draw() {
   
   for(int i = 0; i < iMax; i++) {
     float hh = 0.618*height;
     float yy = pow(sin(i*PI*0.5 + PI*sin(rate*frameCount)),2.);
     point(wMax*i,0.5*height+ 50*yy);
     stroke(0.9);
     fill(rc);
     rect(i*wMax, hh*(1+yy), wMax, 0.5*height);
   }
 }
  
}

float squareWave(float t) {
  float theta = 28.*t*PI/width;
  float swt0 = sin(theta);
  return swt0 + 0.3*sin(3*theta) + 0.2*sin(5*theta) + sin(7*theta)/7 + sin(9*theta)/9+ sin(11*theta)/11;
  
}
