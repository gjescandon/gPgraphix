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
    xbob = new NoizeBob(1.0, 0.01, 0.5);
    ybob = new NoizeBob(1.0, 0.01, 0.5);
    zrotbob = new NoizeBob(1.0, 0.001, 0.5);
    qf = new QuilezFunctions();
  }
  
  
  void draw() {
    
    pushMatrix();
    float zrotoff = qf.expSustainedImpulse(frameCount, 1000., 1000. )* zrotbob.getBob() ;
    rotateZ(zrotoff);
    pushMatrix();
    translate(xoff + xbob.getBob(), yoff + ybob.getBob(), zoff);
    image(main,0.5*(1.0-woff)*width,0.5*(1.0-hoff)*height, woff*width, hoff* height);
    popMatrix();
    popMatrix();
    
    if (woff > 0.1) {
     woff -= 0.001 * qf.expSustainedImpulse(frameCount, 1000., 1000. ); 
     hoff -= 0.001 * qf.expSustainedImpulse(frameCount, 1000., 1000. ); 
    }
  }
  
}
