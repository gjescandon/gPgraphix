Horizon[] horizons;
int raySize = 21;
float thetaFib0 = (2*PI*137.5/360);
float xPropOff, yPropOff;
float xnPropOff, ynPropOff;
float xinc, yinc;
NoiseCircle nc;
NoizeBob xBob, yBob;

void setup() {
  size(1280, 720);
    
  xBob = new NoizeBob(1.0,0.0061*random(1),0.5);
  yBob = new NoizeBob(1.0,0.0061*random(1),0.5);
  
  horizons = new Horizon[raySize];
  for (int i = 0; i < raySize; i++) {
    float thetaOff = 2 * PI  * i / raySize;
     horizons[i] = new Horizon(4, 0.5, 0.01, 300, thetaOff);    
  }
  
  nc = new NoiseCircle();
  
}

void draw() {
 colorMode(HSB,1.0);
 background(0.0);
 xnPropOff = xBob.getBob();
 ynPropOff = yBob.getBob();

 for (int i = 0; i< horizons.length; i++) {
   horizons[i].draw();
 }
 nc.isGrowing = true;
 nc.drawNoiseCircle();
 saveFrame();

}
