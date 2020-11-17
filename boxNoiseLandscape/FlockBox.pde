class FlockBox{

  
  PShape[] flock;
  int fs = 12;
  NoizeBob_2D nb2d;
  AutoPalette apal;
  QuilezFunctions qf;
  NoizeBob cbob, xbob, ybob;
  
  FlockBox(){
   init(); 
  }
  
  void draw(){
    float fsw = 1.0*width/fs;
    float fsh = 1.0*height/fs;
    nb2d.getBob();
    xbob.getBob();
    ybob.getBob();
    
    for (int i = fs; i >= 0; i--) {
      for (int j = 0; j <= fs; j++) {
        pushMatrix();
        
        translate(xbob.getBobTail(i) - 2.0, ybob.getBobTail(j) - 2.0, -300);
        pushMatrix();
        translate((i)*fsw, j*fsh, sin(0.01*frameCount)*500.0*nb2d.getBobtail(i,j));
        noStroke();
        fill(apal.getColor(nb2d.getBobtail(i,j) + cbob.getBob()));
        //sphere(0.6  *fsw);
        box(0.9*fsw);
        popMatrix();
        popMatrix();
      }
    }
    
    
  }
  
  void init(){
    nb2d = new NoizeBob_2D(1.0, 0.03, 0.9);
    cbob = new NoizeBob(1.0, 0.0003, 0.7);
    xbob = new NoizeBob(4.0, 0.0003, 0.7);
    ybob = new NoizeBob(4.0, 0.0003, 0.7);
    apal = new AutoPalette(0.4);//0.3,0.9);
    qf = new QuilezFunctions();
  }
}
