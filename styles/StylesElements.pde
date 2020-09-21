class StylesElements{
  AutoPalette autoPal;
  float theta, thetaInc;
  float xoff, xoffInc;
  color cs1,cs2,ct1,cy1,cl1,ce1,ce2,cs3,cs4;
  int maxT, pauseCount;
  
   float xt0, yt0, xtf, ytf, xtinc, ytinc;
   float tw0, th0, tws, ths;
   float xy0, yy0, xyf, yyf, xyinc, yyinc;
   float xl0, yl0, xlf, ylf, xlinc, ylinc;
   float lw0, lh0, lws, lhs;
  PShape shapeStop, shapeSbottom, shapeT, shapeY, shapeL, shapeE; 
  
 StylesElements() {
   autoPal = new AutoPalette(0.7,0.6);
   
  theta = 0.;
  thetaInc = 0.01;
  
  
  xoff = 1.;
  xoffInc= 0.001; 
  maxT = 0;
  setupColors();
  setupShapes();
  pauseCount = 100;
  
   xl0 = .42*width;
   xlf = xl0;
   yl0 = 0.26*height;
   ylf = 0.;
   xlinc = 0.1;
   ylinc = 0.1;
   lw0 = 0.2*width;
   lh0 = 0.4*height;
   lws = 1.0;
   lhs = 1.0;
   
   xy0 = .33*width;
   xyf = 0.;
   yy0 = 0.47*height;
   yyf = 0.;
   xyinc = 1.1;
   yyinc = 1.1;
   
   xt0 = 0.2*width;
   xtf = 0.;
   yt0 = 0.29*height;
   ytf = 0.19*height;
   xtinc = 0.1;
   ytinc = 0.1;
   tw0 = 0.4*width;
   th0 = 0.5*height;
   tws = 1.0;
   ths = 1.0;
   
 }
 
 void draw() {
   float x0 = 0.18*width;
   float y0 = 0.34*height;
   pushMatrix();
    x0 = 0.17*width;
    y0 = 0.17*height;
   translate(x0, y0, 0);
     drawStop(0, y0);
   popMatrix();

   pushMatrix();
    x0 = 0.17*width;
    y0 = 0.17*height;
     translate(x0, y0, 0);
     drawSbottom(0, y0);
   popMatrix();
   
    x0 = 0.2*width;
    y0 = 0.29*height;
   shape(shapeT, x0, y0);

   x0 = .33*width;
   y0 = 0.47*height;
   shape(shapeY,x0, y0);

   x0 = .42*width;
   y0 = 0.26*height;
   shape(shapeL, x0, y0);
   
   x0 = 0.5*width;
   y0 = 0.6*height;
   drawE(x0, y0);
   
   scale(0.8);
   pushMatrix();
     x0 = 0.93*width;
     y0 = 0.24*height;
   translate(x0, y0, 0);
     drawStop(0, y0);
   popMatrix();
   pushMatrix();
   translate(x0, y0, 0);
     drawSbottom(0, y0);
   popMatrix();
   scale(1/0.8);
 }
 
 void drawRotate() {
   
   // top S1
   float x0 = 0.18*width;
   float y0 = 0.34*height;
   pushMatrix();
    x0 = 0.17*width;
    y0 = 0.45*height;
   translate(x0, y0, 0);
     pushMatrix();
     rotateY(0-theta); //no thickness cant see it
       fill(cs1);
       pushMatrix();
         float rad = 10.;
         translate(0.-rad, 0., 0);
         sphere(10);
         popMatrix();
       drawStop(0, 0);
     popMatrix();  
   popMatrix();

   // bottom S1
   pushMatrix();
    x0 = 0.17*width;
    y0 = 0.65*height;
   translate(x0, y0, 0);
     pushMatrix();
     rotateY(theta); //no thickness cant see it
       fill(cs2);
       pushMatrix();
         rad = 20.;
         translate(0.6*rad, 0, 0);
         sphere(rad);
         popMatrix();
       drawSbottom(0, 0);
     popMatrix();  
   popMatrix();
   
   
   
   x0 = 0.5*width;
   y0 = 0.6*height;
   drawE(x0, y0);
   
   
   // top S2
   pushMatrix();
   x0 = 0.73*width;
   y0 = 0.4*height;
   translate(x0, y0, 0);
     pushMatrix();
     rotateY(0-theta); //no thickness cant see it
       fill(cs3);
       pushMatrix();
         rad = 10.;
         translate(0.-rad, 0., 0);
         sphere(10);
         popMatrix();
       drawStop(0, 0);
     popMatrix();  
   popMatrix();

   // bottom S2
   pushMatrix();
    x0 = 0.73*width;
    y0 = 0.6*height;
   translate(x0, y0, 0);
     pushMatrix();
     rotateY(theta); //no thickness cant see it
       fill(cs4);
       pushMatrix();
         rad = 20.;
         translate(0.6*rad, 0, 0);
         sphere(rad);
         popMatrix();
       drawSbottom(0, 0);
     popMatrix();  
   popMatrix();
   
   
  float thetaMax = 0.41*PI;

 if (frameCount > pauseCount) {
  theta += thetaInc;
  if (theta> thetaMax) theta = thetaMax;
   if (xoff < 2.) xoff += xoffInc;  
   if (maxT < 300) maxT ++;
 }
   
 }
 
 void drawStretch() {

   pushMatrix();
   translate(0,0,0-100);
   shape(shapeT, xt0, yt0, tw0*tws, th0*tws);
   shape(shapeL, xl0, yl0, lw0*lhs, lh0*lhs);   
   popMatrix();

   shape(shapeY, xy0, yy0);

   xt0-=xtinc;
   if (xt0<=xtf) {
     xt0=xtf;
   } else {
     yt0-=ytinc;
   }
   //if (yt0<=ytf) yt0=ytf;
   //xl0+=xlinc; xL does not move
   //if (xl0>=xlf) xl0=xlf;
   yl0-=ylinc;
   if (yl0<=ylf) yl0=ylf;
   if (lhs*lh0<= height) lhs += 0.0006;
   if (tws*tw0<= width)    tws += 0.001;

   
 }
 
 void drawStop(float x0, float y0){
   // 1. S

   noStroke();

   float rr1a = x0;
   float rr1b = 0.-0.1*height;
   float rr1c = x0;
   float rr1d = 0.+0.1*height;
   
   PShape e1 = createShape();
    e1.beginShape();
    e1.vertex(rr1a, rr1b);
    e1.bezierVertex(rr1a-60, rr1b, rr1c-90, rr1d, rr1c, rr1d);
    e1.bezierVertex(rr1c, rr1d, rr1a, rr1b, rr1a, rr1b);
    e1.endShape();
    shape(e1);
 }
 
 void drawSbottom(float x0, float y0){
   // 1. S

   noStroke();   
   float rr2a = 0;
   float rr2b = 0 - 0.15*height;
   float rr2c = 0;
   float rr2d = 0 + 0.15*height;

    PShape e2 = createShape();
    e2.beginShape();
    e2.vertex(rr2a, rr2b);
    e2.bezierVertex(rr2a, rr2b, rr2c, rr2d, rr2c, rr2d);
    e2.bezierVertex(rr2c+80, rr2d, rr2a+100, rr2b, rr2a, rr2b);
    e2.endShape();
    shape(e2);
 }
 
 void createT(){
   // 2. t
   shapeT = createShape(GROUP);
   noStroke();
   float r1a = 0.1*width;
   float r1b = 0;
   float r1c = 0.02*width;
   float r1d = 0.4*height;
   fill(ct1);

   shapeT.addChild(createShape(RECT,r1a, r1b, r1c, r1d));
   
   float r2a = 0;
   float r2b = 0.1*height;
   float r2c = 0.5*width;
   float r2d = 0.02*height;
   shapeT.addChild(createShape(RECT,r2a, r2b, r2c, r2d));
   
 }
 
  void createY(){

   // 3. y
   noStroke();
   fill(cy1);
   float thick = 14.0;
   shapeY = createShape();
    shapeY.beginShape();
    shapeY.fill(cy1);
    shapeY.noStroke();
    shapeY.vertex(0, .3*height);
    shapeY.vertex(thick,0.3*height);
    shapeY.vertex(thick + 0.1*height, 0);
    shapeY.vertex(0.1*height, 0);
    shapeY.vertex(0.618*0.1*width+ 0.5*thick, 0.618*0.1*width);
    shapeY.vertex(0, 0.382* 0.382*0.3*height);
    shapeY.vertex(0, thick + 0.382* 0.382*0.3*height);
    shapeY.vertex(0.618*0.1*width + 0.2*thick, thick + 0.618*0.1*width);
    shapeY.endShape(CLOSE);
     
  }
  
 void createL(){
  
   // 4. L
   shapeL = createShape(GROUP);
   noStroke();

   fill(cl1);

   float rl1a = 0;
   float rl1b = 0;
   float rl1c = 0.02*width;
   float rl1d = 0.4*height;
   shapeL.addChild(createShape(RECT,rl1a, rl1b, rl1c, rl1d));
   float rl2a = 0;
   float rl2b = 0+rl1d;
   float rl2c = 0.2*width;
   float rl2d = 0.03*height;
   rect(rl2a, rl2b, rl2c, rl2d);
   shapeL.addChild(createShape(RECT,rl2a, rl2b, rl2c, rl2d));
   
 }
 
  void drawE(float x0, float y0){

   
   // 5. e
   
   noStroke();
   fill(ce1);

   float rr1a = x0;
   float rr1b = y0;
   float rr1c = rr1a+150;
   float rr1d = y0;
   
   PShape e1 = createShape();
    e1.beginShape();
    e1.vertex(rr1a, rr1b);
    e1.bezierVertex(rr1a, rr1b-60, rr1c, rr1d-60, rr1c, rr1d);
    e1.bezierVertex(rr1c, rr1d, rr1a, rr1b, rr1a, rr1b);
    e1.endShape();
    shape(e1);
    
   fill(ce2);
   float rr2a = rr1a;
   float rr2b = rr1b;
   float rr2c = rr1c;
   float rr2d = rr1d;

    PShape e2 = createShape();
    e2.beginShape();
    e2.vertex(rr2a, rr2b);
    e2.bezierVertex(rr2a, rr2b, rr2c, rr2d, rr2c, rr2d);
    e2.bezierVertex(rr2c, rr2d+60, rr2a, rr2b+60, rr2a, rr2b);
    e2.endShape();
    shape(e2);
  }
  
  void setupColors() {
    cs1 = autoPal.getColor(random(1));
    cs2 = autoPal.getColor(random(1));
    ct1 = autoPal.getColor50(random(1));
    cy1 = autoPal.getColor50(random(1));
    cl1 = autoPal.getColor50(random(1));
    ce1 = autoPal.getColor50(random(1));
    ce2 = autoPal.getColor50(random(1));
    cs3 = autoPal.getColor50(random(1));
    cs4 = autoPal.getColor50(random(1));
    
  }
  
  void setupShapes() {
    createT();
    createY();
    createL();
  }
}
  
  