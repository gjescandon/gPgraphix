class FlockBox{

  
  PShape[] flock;
  int fs = 24;
  NoizeBob_2D nb2d, cb2d;
  AutoPalette apal;
  QuilezFunctions qf;
  NoizeBob cbob, xbob, ybob;
  
  FlockBox(){
   init(); 
  }
  
  void draw(){
    
    float fsw = 1.0*width/fs;
    float fsh = 1.0*height/fs;
    float bw = 0.8*fsw;
    float bh = 0.8*fsh;
    
    nb2d.getBob();
    cb2d.getBob();
    xbob.getBob();
    ybob.getBob();
    
    for (int i = fs; i >= 0; i--) {
      for (int j = 0; j <= fs; j++) {
        pushMatrix();
        
        translate(xbob.getBobTail(i) - 5.0, ybob.getBobTail(j) - 5.0, -1000);
        pushMatrix();
        translate((i)*fsw, j*fsh, (1-cos(0.001*frameCount))*(50*nb2d.getBobtail(30*i,30*j)));
        noStroke();
        float cf = cb2d.getBobtail(30*i,30*j) + cbob.getBob();
        fill(apal.getColor(cf - floor(cf)));
        //sphere(0.48  *fsw);
        box(bw, bh, bw);
        popMatrix();
        popMatrix();
      }
    }
    
    
  }
  
  void init(){
    nb2d = new NoizeBob_2D(1.0, 0.0009, 0.7);  //  z noise
    cb2d = new NoizeBob_2D(2.0, 0.0001, 0.0004, 0.8);  //  color noise large
    cbob = new NoizeBob(1.0, 0.00001, 0.3); // color noise small
    xbob = new NoizeBob(10.0, 0.006, 0.4);
    ybob = new NoizeBob(10.0, 0.006, 0.4);
    apal = new AutoPalette();
    qf = new QuilezFunctions();
  }
}
