class FlockBox{

  
  PShape[] flock;
  //int fs = ;
  NoizeBob_2D nb2d, cb2d, pb2d;
  AutoPalette apal;
  QuilezFunctions qf;
  NoizeBob cbob, xbob, ybob;
  float range;
  
  FlockBox(){
   init(); 
  }

  
  FlockBox(float bright, float range){
   init(); 
   init02(bright, range);
  }
  
  void draw(){
    int fs = 80;
    int fsx = fs * width / height;
    int fsy = fs;

    float fsw = 1.5*width/fsx;
    float fsh = 1.0*height/fsy;
    float ss = 0.6 * fsw;
    
    nb2d.getBob();
    cb2d.getBob();
    pb2d.getBob();
    cbob.getBob();
    xbob.getBob();
    ybob.getBob();
        pushMatrix();
        
        translate(xbob.getBobTail(1) - 0.5*(1.5*width), ybob.getBobTail(1) - 0.5*height,0);
    float cmin = 1.;
    float cmax = 0.;
    
    for (int i = fsx; i >= 0; i--) {
      for (int j = 0; j <= fsy; j++) {
        pushMatrix();
        translate((i)*fsw, j*fsh, (1-cos(0.006*frameCount))*(5*nb2d.getBobtail(30*i,30*j)));

        noStroke();
        float cf = cb2d.getBobtail(30*i,30*j);// + cbob.getBob();
        float pf = pb2d.getBobtail(30*i,30*j);// + cbob.getBob();
        
        if (pf < cmin) cmin = pf;
        if (pf > cmax) cmax = pf;
        
        if (range > 0.) {
          float delta = abs(pf - 0.5);
          //println("delta " + delta);
          if (delta < range) {
            fill(apal.getColor(cf - floor(cf)));
            //sphere(0.6  *fsw * constrain((range - delta)/delta,0.0, 1.0));
            float ssx = ss * constrain((range - delta)/delta,0.0, 1.0);
            box(ssx, ssx ,ssx );

          } 
        } else {
            fill(apal.getColorDark(cf - floor(cf)));
            
            sphere(0.5  *fsw);
          }
        
        popMatrix();
      }
    }
        popMatrix();
    
     //println("cmin " + cmin);
     //println("cmax " + cmax);
  }
  
  void init(){
    nb2d = new NoizeBob_2D(1.0, 0.009, 0.6);  //  z noise
    cb2d = new NoizeBob_2D(1.0, 0.0001, 0.0001, 0.8);  //  color noise large
    pb2d = new NoizeBob_2D(1.0, 0.0006, 0.0006, 0.8);  //  color noise large
    cbob = new NoizeBob(1.0, 0.00001, 0.3); // color noise small
    xbob = new NoizeBob(10.0, 0.006, 0.4);
    ybob = new NoizeBob(10.0, 0.006, 0.4);
    apal = new AutoPalette();
    qf = new QuilezFunctions();
    range =0.;
  }

  void init02(float brit, float myRange){
    apal = new AutoPalette(0.6, 1., brit);
    range = myRange;
  }
}
