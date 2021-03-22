class BoxChain {
  NoizeBob yBob, zBob;
  AutoPalette apal;
  QuilezFunctions qf;
  color myFill;
  BoxChain() {
   setup(); 
  }
  
  void setup() {
    
      //int dmax = 8;
    //float bw = 1.*width/dmax;
    //bw= 200;
   zBob = new NoizeBob(300., 0.006, 0.7);
   yBob = new NoizeBob(10., 0.006, 0.3);
   cbob = new NoizeBob(1., 0.0006, 0.5);
    apal = new AutoPalette(0.4, 0.9);
   qf = new QuilezFunctions();
   myFill = apal.getColor50(cbob.getBob());
  }
  
  void draw() {
    zBob.getBob();
    yBob.getBob();
    
    // forground boxes
    //rotateX(0.1*sin(0.001*frameCount) - 0.2*PI);
    float xOff = 0.318*width;
  
    translate(xOff, 0, 0);
    pushMatrix();
    rotateY(0.1*(0.01*frameCount));
    //fill(apal.getColor50(0.005*zBob.getBobTail(1)));
    
    
    float bm = 4;
    float yOff = 1.0*height / bm;
    float bd = qf.expSustainedImpulse(1.0*frameCount, 2000., 1.);
    
    if (random(1) > 0.99) cbob.getBob();
    

    
    for(int i = 0; i < bm+2; i++) {
      pushMatrix();
      translate( yBob.getBobTail(i*10), yOff * i + yBob.getBobTail(i), zBob.getBobTail(i*10));
      noStroke();
      
      fill(apal.getColor50(cbob.getBobTail(i*100)));
      pushMatrix();
      rotateY(yBob.getBobTail(i*100));
      
      box(bd * (zBob.getBobTail(100+i) * (1+ sin(PI*yOff*i/height))));
      popMatrix();
      popMatrix();
    }
    
    popMatrix();
    
  }
}
  
  
