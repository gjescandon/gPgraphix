class WordFlyers {
 
  PImage main, all, fogd;
  NoizeBob xbob, ybob, zrotbob;
  float xoff, yoff, zoff;
  float woff, hoff;
  QuilezFunctions qf;
  
  WordFlyers() {
    main = loadImage("title_allfogdup.png");
    all = loadImage("title_up.png");
    fogd = loadImage("title_fogd.png");
    woff = hoff = 1.0;
    
    xoff = yoff = zoff = 0.0;
    yoff = -150;
    xoff = -0.2*width;
    zoff = 10;
    xbob = new NoizeBob(1.0, 0.01, 0.5);
    ybob = new NoizeBob(1.0, 0.01, 0.5);
    zrotbob = new NoizeBob(1.0, 0.001, 0.5);
    qf = new QuilezFunctions();
  }
  
  
  void draw() {
    float alf = qf.expStep(frameCount/700,0.05,3.1);
    //println(alf);
    fill(0.6, 0.35, 0.97, alf);
    rect(0,0,width,height);
    pushMatrix();
    float zrotoff = 0.5*qf.expSustainedImpulse(frameCount, 1000., 1000. )* zrotbob.getBob() ;
    rotateZ(-zrotoff);
    pushMatrix();
    translate(xoff* qf.expSustainedImpulse(frameCount/1000.,1.0,1.0) + xbob.getBob(), yoff + ybob.getBob(), zoff);
    image(main,0.5*(1.0-woff)*width,0.5*(1.0-hoff)*height, woff*width, hoff* height);
    popMatrix();
    popMatrix();
    
    if (woff > 0.1) {
     woff -= 0.001 * qf.expSustainedImpulse(frameCount, 1000., 1000. ); 
     hoff -= 0.001 * qf.expSustainedImpulse(frameCount, 1000., 1000. ); 
    }
  }
  
}
