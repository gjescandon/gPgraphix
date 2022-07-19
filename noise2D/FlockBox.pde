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
    int fs = 37;
    int fsx = fs * width / height;
    int fsy = fs;

    float fsw = 1.5*width/fsx;
    float fsh = 1.0*height/fsy;
    float ss = 0.6 * fsw;
    
    nb2d.getBob();
    pb2d.getBob();
    cbob.getBob();
    xbob.getBob();
    ybob.getBob();
    
    float incbob1 = 0.000005+0.0000005*(5 - floor(random(10)));
    float incbob2 = 0.00005+0.000005*(5 - floor(random(10)));
    
    cb2d.getBob(incbob1, incbob2);

        pushMatrix();
        
        //translate(xbob.getBobTail(1) - 0.5*(1.5*width), ybob.getBobTail(1) - 0.5*height,0);
    float cmin = 1.;
    float cmax = 0.;
    
    for (int i = fsx; i >= 0; i--) {
      pushMatrix();
      rotateY(sin(fsx * 0.8 * fsw));
      for (int j = 0; j <= fsy; j++) {
        pushMatrix();
        float dish = sqrt(sq(0.5*width-fsx)+sq(0.5*height-fsy));
        dish = 1.;
        translate((i)*fsw, j*fsh, (dish)*(1-cos(0.006*frameCount))*(5*nb2d.getBobTail(30*i,30*j)));

        noStroke();
        float btFactor = 8.;
        float cfx = 4 * btFactor;
        float cfy = 2 * btFactor;
        float cf = cb2d.getBobTail(cfx*i,cfy*j);// + cbob.getBob();
        float pf = pb2d.getBobTail(cfx*i,cfy*j);// + cbob.getBob();
        
        if (pf < cmin) cmin = pf;
        if (pf > cmax) cmax = pf;
        
        if (range > 0.) {
          float delta = abs(pf - 0.5);
          //println("delta " + delta);
          if (delta < range) {
            fill(apal.getColorHue(cf - floor(cf)));
            //sphere(0.6  *fsw * constrain((range - delta)/delta,0.0, 1.0));
            float ssx = ss * constrain((range - delta)/delta,0.0, 1.0);
            box(ssx);

          } 
        } else {
            fill(apal.getColorDark(cf - floor(cf)));
            
            sphere(0.5  *fsw);
          }
        
        popMatrix();
      }
      popMatrix();
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
    float hue = 0.01*floor(random(100));
    apal = new AutoPalette(hue, 1., brit);
    range = myRange;
  }
}
