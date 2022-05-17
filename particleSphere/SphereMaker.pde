class SphereMaker {
NoizeBob cb,zbob, xbob, ybob, swb;
NoizeBob_2D r2dbob;
AutoPalette apal;

float rotoffx, rotoffy, rotoffz;
float xtoff, ytoff, ztoff;
float radMin;
  SphereMaker() {
    init();
  }
  
  void init() {
    
    cb = new NoizeBob(1.0, 0.002, 0.5);
    swb = new NoizeBob(1.0, 0.0001, 0.9);
    zbob = new NoizeBob(1.0, 0.001, 0.5); 
    r2dbob = new NoizeBob_2D(1., 0.01, 0.01, 0.5);
    
  xbob = new NoizeBob(1., 0.001, 0.5);
  ybob = new NoizeBob(1., 0.001, 0.5);
  
    rotoffx = random(1);
    rotoffy = random(1);
    rotoffz = random(1);
    radMin = 200.;
    xtoff = 2.*radMin*(random(1) - 0.5);
    ytoff = 2.*radMin*(random(1) - 0.5);
    ztoff = 2.*radMin*(random(1) - 0.5);
    
    apal = new AutoPalette();
  }
  
  void draw() {
    float r = radMin + 100*zbob.getBob(); 
    float rfact = 10.;
    float thetaMax = TWO_PI  - 2.*rfact/r;
    float phiMax = PI;
    float tInc = 0.4;
    float pInc = 2.*rfact/r;
    pushMatrix();
    translate(xtoff, ytoff, ztoff);
    
      pushMatrix();
      rotateY(sin(ybob.getBob() + rotoffy));
      rotateX(sin(xbob.getBob() + rotoffx));
      rotateZ(sin(zbob.getBob() + rotoffz));
      float roff = swb.getBob();
      
    for (float j = 0.; j < phiMax; j+= pInc) {
      roff = swb.getBobTail(floor(j/pInc));
      tInc = (2 * rfact)/( r * sin(j));
    for (float i = 0.0; i < thetaMax; i+= tInc) {
      float x = r * sin(i + roff)*sin(j);
      float y = r * cos(i + roff)*sin(j);
      float z = r * cos(j);
      pushMatrix();
      translate(x,y,z);
      noStroke();
      float rr = r2dbob.getBobTail(floor(j/pInc), floor(i/tInc));
      fill(apal.getColor(rr));
      sphere(rfact * rr);
      popMatrix();
    }}
    popMatrix();
    popMatrix();
  }
  
}
