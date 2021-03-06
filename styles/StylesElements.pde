class StylesElements{
  AutoPalette autoPal;
  float theta, theta1, theta2, theta3, thetaInc;
  float xoff, xoffInc;
  color cs1,cs2,ct1,cy1,cl1,ce1,ce2,cs3,cs4;
  int maxT, pauseCount;
  
   float xt0, yt0, xtf, ytf, xtinc, ytinc;
   float tw0, th0, tws, ths, twsf, tsinc;
   float xy0, yy0, xyf, yyf, xyinc, yyinc, zy, zyinc;
   float xl0, yl0, xlf, ylf, xlinc, ylinc, lsinc;
   float lw0, lh0, lws, lwsf;
  PShape shapeStop, shapeSbottom, shapeT, shapeY, shapeL, shapeE; 
  float theta0Max, theta1Max,  theta2Max, theta3Max;
  SpitBalls sball0, sball1, sball2, sball3;
  LineStar lstar1, lstar2;
  PImage imgE;
  float yTheta, yThetaInc;
  NoizeBob ybob;
  QuilezFunctions qeq;
  
  
 StylesElements() {
   autoPal = new AutoPalette(random(1));
   qeq = new QuilezFunctions();
  theta = 0.;
  thetaInc = 0.01;
  yTheta = 0.;
  yThetaInc = 0.01;
  
  xoff = 1.;
  xoffInc= 0.001; 
  maxT = 0;
  setupColors();
  setupShapes();
  pauseCount = 333;
  
   xl0 = .51*width;
   xlf = 0.618*width;
   yl0 = 0.32*height;
   ylf = 0.-0.1*height;
   xlinc = 0.6;
   ylinc = 1.;
   lsinc = 0.006;
   lw0 = 0.2*width;
   lh0 = 0.4*height;
   lws = 1.0;
   lwsf = 3.0;
   
   xy0 = .38*width;
   xyf = 0.;
   yy0 = 0.47*height;
   yyf = 0.;
   xyinc = 1.1;
   yyinc = 1.1;
   zyinc = 1.;
   zy = 0.;
   
   xt0 = 0.22*width;
   xtf = 0.-0.08*width;
   yt0 = 0.29*height;
   ytf = 0.-0.1*height;
   xtinc = 0.7;
   ytinc = 1.;
   tsinc = 0.006;
   tw0 = 0.4*width;
   th0 = 0.5*height;
   tws = 1.0;
   twsf = 3.0;
   
   theta0Max = 0.;
   theta1Max = 0.; 
   theta2Max = 0.;
   theta3Max = 0.;
   theta0Max = 0.40*PI;
   theta1Max = 0.60*PI;
   theta2Max = 0.4*PI;
   theta3Max = 0.41*PI;
   
   sball0 = new SpitBalls();
   sball1 = new SpitBalls();
   sball2 = new SpitBalls();
   sball3 = new SpitBalls();
   
   lstar1 = new LineStar();
   lstar2 = new LineStar();
   
   ybob = new NoizeBob(10, 0.1, 0.3);
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
   float x0 = 0.2*width;
   float y0 = 0.34*height;
   pushMatrix();
    x0 = 0.22*width;
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
     
     if (theta1 == theta1Max) {
      sball0.draw();
     }           
   popMatrix();

   // bottom S1
   pushMatrix();
    x0 = 0.22*width;
    y0 = 0.65*height;
   translate(x0, y0, 0);
     pushMatrix();
     rotateY(theta1); //no thickness cant see it
       fill(cs2);
       pushMatrix();
         rad = 20.;
         translate(0.6*rad, 0, 0);
         sphere(rad);
         popMatrix();
       drawSbottom(0, 0);
     popMatrix(); 

     if (theta1 == theta1Max) {
      pushMatrix();
      //translate(1.,0,0);
      lstar1.draw();
      popMatrix();
     }               
   popMatrix();
   
   
   

   
   // top S2
   pushMatrix();
   x0 = 0.76*width;
   y0 = 0.4*height;
   translate(x0, y0, 0);
     pushMatrix();
     rotateY(0-theta1); //no thickness cant see it
       fill(cs3);
       pushMatrix();
         rad = 10.;
         translate(0.-rad, 0., 0);
         sphere(10);
         popMatrix();
       drawStop(0, 0);
     popMatrix(); 
     
     if (theta1 == theta1Max) {
      pushMatrix();
      //translate(1.,0,0);
      lstar2.draw();
      popMatrix();
     }           
   popMatrix();

   // bottom S2
   pushMatrix();
     x0 = 0.76*width;
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
     
     if (theta3 == theta3Max) {
      // spitball[3] 
      sball3.draw();
     }     
   popMatrix();
   
   

 if (frameCount > pauseCount) {
  theta += thetaInc;
  if (theta> theta0Max) theta = theta0Max;
  theta1 += thetaInc;
  if (theta1 > theta1Max) theta1 = theta1Max;
  theta2 += thetaInc;
  if (theta2 > theta2Max) theta2 = theta2Max;
  theta3 += thetaInc;
  if (theta3 > theta3Max) theta3 = theta3Max;
   if (xoff < 2.) xoff += xoffInc;  
   if (maxT < 300) maxT ++;
 }
 

   
 }
 
 void drawStretch() {

   colorMode(HSB, 1.0);
   pushMatrix();
   translate(0,0,0-100);
   shape(shapeT, xt0, yt0, tw0*tws, th0*tws);
   shape(shapeL, xl0, yl0, lw0*tws, lh0*tws);   
   popMatrix();

   pushMatrix();
     translate(xy0, yy0, 0 - zy);
   pushMatrix();
   rotate(yTheta);
   shape(shapeY, 0, 0);
    popMatrix();
    popMatrix();
   if (frameCount < pauseCount) {
     return;
   }

   // T: final position
   if (xt0>=xtf) xt0-=xtinc;
   if (yt0>=ytf) yt0-=ytinc;
   if (tws <= twsf)    tws += tsinc;

   
   // L: final position
   if (xl0<=xlf) xl0+=xlinc;
   if (yl0>=ylf) yl0-=ylinc;
   if (lws <= lwsf)    lws += lsinc;
   
   // Y: rot
   yTheta += yThetaInc;
   if (yTheta >TWO_PI) yTheta = 0.;
   zy += zyinc;
 }
 
 
 void drawUncover() {
   
   pushMatrix();
   translate(0-120, 0, -200);
   fill(ce2);
   int ww = floor(1.4*width);
   noStroke();
   for (int x = 0; x<ww/2; x+=2) {
     rect(x,380 + 20*ybob.getBobTail(x)*qeq.expSustainedImpulse(frameCount, pauseCount*3, pauseCount*3) ,x+1,height);     
   }
   popMatrix();
   pushMatrix();
   translate(0, 0, -200);
   if (frameCount > pauseCount) {
     scatterE();
     ybob.getBob();
   
   }
   image(imgE, 0-100, 0-100, 1.27* width, 1.27* height);
   popMatrix();
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
   PShape ps = createShape(RECT,r1a, r1b, r1c, r1d);
   ps.setFill(ct1);
   shapeT.addChild(ps);
   
   float r2a = 0;
   float r2b = 0.1*height;
   float r2c = 0.5*width;
   float r2d = 0.02*height;
   PShape ps2 = createShape(RECT,r2a, r2b, r2c, r2d);
   ps2.setFill(ct1);
   shapeT.addChild(ps2);
   
 }
 
  void createY(){

   // 3. y
   noStroke();
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
   float rl1a = 0;
   float rl1b = 0;
   float rl1c = 0.02*width;
   float rl1d = 0.4*height;
   PShape ps = createShape(RECT,rl1a, rl1b, rl1c, rl1d);
   ps.setFill(cl1);
   shapeL.addChild(ps);
   float rl2a = 0;
   float rl2b = 0+rl1d;
   float rl2c = 0.2*width;
   float rl2d = 0.03*height;
   PShape ps2 = createShape(RECT,rl2a, rl2b, rl2c, rl2d);
   ps2.setFill(cl1);
   shapeL.addChild(ps2);
   
 }
 
  void createEmask(){
    colorMode(HSB, 1.0);
    float x0 = 380.;
    float y0 = 460.;
    float a = 1400.;
    float b = 3440.;
    EmptyTemplate et = new EmptyTemplate();
    AutoPalette epal = new AutoPalette(random(1));
    imgE = et.getEmpty();
    imgE.loadPixels();
    color ec = epal.getColor(random(1));
    ec = ce2;
    println(hue(ec));
    for (int x = 0; x< width; x++) {
      for (int y = 0; y<height; y++) {
        float rr= sq(x-x0)/a + sq(y-y0)/b;
        //imgE.pixels[x*height+y] = color(random(1), 0., 1.0, 0.);
        if (rr > 1) {
          imgE.pixels[x*height+y] = color(110,0.1,0.9);
        }
          
      }
    }
    imgE.updatePixels();
  }
  
  void scatterE() {
    imgE.loadPixels();
    for (int x = 0; x< width; x++) {
      for (int y = 0; y<height; y++) {
        color ec = imgE.pixels[x*height+y];
        if ((alpha(ec) > 0.) && (random(1) > (0.995 - 0.0001*frameCount))) {
          imgE.pixels[x*height+y] = color(hue(ec), 0., 1.0, 0.);
        }
          
      }
    }
    imgE.updatePixels();    
  }
  
  void setupColors() {
    cs1 = autoPal.getColor(random(1));
    cs2 = autoPal.getColor(random(10) - 10.);
    ct1 = autoPal.getColor50(random(1));
    println(ct1);
    cy1 = autoPal.getColor50(random(10) - 10.);
    println(cy1);
    cl1 = autoPal.getColor50(random(1));
    println(cl1);
    ce1 = autoPal.getColor(random(1));
    ce2 = autoPal.getColor(random(1));
    cs3 = autoPal.getColor(random(1));
    cs4 = autoPal.getColor(random(1));
    
    
    
    
  }
  
  void setupShapes() {
    createT();
    createY();
    createL();
    createEmask();
    autoPal.test();
  }
}
  
  
