class JenDuMaker {
  
 GPoint[] gparr;
 NoizeBob rbob, cxbob, cybob, ao1xbob, ao1ybob;
 NoizeBob t1sbob, t2sbob, t3sbob;
 NoizeBob_2D cbob;
 AutoPalette apal;
 float[] carr;
 PShape tri1, tri2;
 QuilezFunctions qf;
 GeoFunctions gf;
 PImage stripImg;
 
 JenDuMaker() {
   gparr = new GPoint[13];
   qf = new QuilezFunctions();
   gf = new GeoFunctions();
   
   setup();
   
 }
 
 void draw() {
   
   if (frameCount %100 ==0) setup();
   drawCircle();
   //drawAddOn1();
   pushMatrix();
   scale(map(t3sbob.getBob(),0.,1.,0.5,0.9));
   if (t3sbob.getBob() > 0.5) translate(0,0,-5);
   drawAddOn3();
   popMatrix();
 }
 
 void drawCircle() {
  stroke(0.5);
  strokeWeight(3.);
  fill(apal.getColor(carr[1]));
  
  pushMatrix();
  scale(map(t1sbob.getBob(),0.,1.,0.8,1.1));
  triangle(gparr[1].getX(), gparr[1].getY(),gparr[2].getX(), gparr[2].getY(),gparr[3].getX(), gparr[3].getY());
  drawAddOn1();
  popMatrix();
  
  
  fill(apal.getColor80(carr[3]));
  
  pushMatrix();
  scale(map(t2sbob.getBob(),0.,1.,0.8,1.1));
  triangle(gparr[4].getX(), gparr[4].getY(),gparr[5].getX(), gparr[5].getY(),gparr[6].getX(), gparr[6].getY());
  drawAddOn2();
  popMatrix();
  
  float rr = rbob.getBob();
  float rrmap = map(rr,0.,1.,8.,0.);
  float cx = gparr[0].getX() + 100*cxbob.getBob()*rrmap;
  float cy = gparr[0].getY()+ 100*cybob.getBob()*rrmap;
  noStroke();
  fill(apal.getColor(carr[0] + cbob.getBobTail(cx,cy)));
  //println("rr " + rr);
  pushMatrix();
  translate(cx, cy, -0.5*rr);
  sphere(0.1*height*rr);
  popMatrix();
 }
 
 void drawAddOn1() {
   
   float theight = 200 * rbob.getBobTail(1);
   GPoint gp1 = gparr[1];
   GPoint gp3 = gparr[3];
   float xx0 = gp1.getX();
   float yy0 = gp1.getY();
   float ss = gp3.getY() - gp1.getY();
   
   
   if ((xx0 < 0.5*width && ss > xx0) ||(xx0 > 0.5*width && ss > width - xx0)) {
     return;
   }
   
   if (xx0 < 0.5*width) xx0 -=ss;
   float xx1 = xx0 - ss;
   float xxc = xx0 - .5*ss;
   PShape ps1 = createShape();
   
   ps1.setFill(apal.getColor80(carr[3]));
   ps1.beginShape();
   ps1.noStroke();
   
   
   //upper
   ps1.vertex(xx1, yy0,0);
   ps1.vertex(xx0, yy0,0); 
   ps1.vertex(xxc, yy0 - 0.5*ss, theight); 
   ps1.vertex(xx1, yy0,0);
   ps1.endShape();
   
   pushMatrix();
   shape(ps1, ss, ss);
   popMatrix();
   
   
   //left
   ps1 = createShape();
   ps1.setFill(apal.getColor50(carr[3]));
   ps1.beginShape();
   ps1.noStroke();
   
   ps1.vertex(xx0, yy0,0); 
   ps1.vertex(xx0, yy0 -ss,0); 
   ps1.vertex(xxc, yy0 - 0.5*ss, theight); 
   ps1.vertex(xx0, yy0,0); 
   ps1.endShape();
   
   pushMatrix();
   shape(ps1, ss, ss);
   popMatrix();
   
   //bottom
   ps1 = createShape();
   ps1.setFill(apal.getColor50(carr[3]));
   ps1.beginShape();
   ps1.noStroke();

   ps1.vertex(xx0, yy0 - ss,0);
   ps1.vertex(xx1, yy0 - ss,0);
   ps1.vertex(xxc, yy0 - 0.5*ss, theight); 
   ps1.vertex(xx0, yy0 - ss,0);
   ps1.endShape();
   
   pushMatrix();
   shape(ps1, ss, ss);
   popMatrix();
   
   //right
   ps1 = createShape();
   ps1.setFill(apal.getColor50(carr[3]));
   ps1.beginShape();
   ps1.noStroke();
   
   ps1.vertex(xx1, yy0,0);
   ps1.vertex(xx1, yy0 - ss,0);
   ps1.vertex(xxc, yy0 - 0.5*ss, theight); 
   ps1.vertex(xx1, yy0,0);

   ps1.endShape();
   
   pushMatrix();
   shape(ps1, ss, ss);
   popMatrix();
   

   
 }
 
 
void drawAddOn2() {

   // semicircle
   
   GPoint gpA = gparr[5];
   GPoint gpB = gparr[4];
   
   if (gpA.getX() > 0.5*width) return;
   if (gpA.getX() < abs(gpA.getY() - gpB.getY())) return;
   float ss = gpB.getY() - gpA.getY();
   float xxA = gpA.getX() -ss;
   float yyA = gpA.getY() -ss;
   float xxB = gpB.getX() -ss;
   float yyB = gpB.getY() -ss;
   
   /*
   if ((xx0 < 0.5*width && ss > xx0) ||(xx0 > 0.5*width && ss > width - xx0)) {
     return;
   }
   */
   
   
   PShape ps1 = createShape();
   
   
   ps1.setStroke(apal.getColor50(carr[1]));
   ps1.setFill(apal.getColor50(carr[4]));
   ps1.beginShape();
   ps1.vertex(xxA, yyA);
   ps1.vertex(xxB, yyB);
   float ctrlen = 0.8*ss;
   GPoint gp1 = gf.getPerp(gpA.getX(), gpA.getY(), gpB.getX(), gpB.getY());
   gp1 = gf.getPerpLen(gpB.getX(), gpB.getY(), gpA.getX(), gpA.getY(), ctrlen);
   
   fill(0.4);
   //circle(xxA + gp1.getX(), yyA + gp1.getY(), 100);
   fill(0.6);
   //circle(gpA.getX() , gpA.getY() , 100);
   fill(0.8);
   //circle(xxB + gp1.getX(), yyB + gp1.getY(), 100);
   fill(0.99);
   circle(gpB.getX() , gpB.getY() , 100);
   
   //println(xxA + " " + xxB + " :: " + gp1.getX());
   
   ps1.bezierVertex(xxB + gp1.getX(), yyB + gp1.getY(), xxA + gp1.getX(), yyA + gp1.getY(), xxA, yyA);
   ps1.endShape();
   
   pushMatrix();
   shape(ps1, ss, ss);
   popMatrix();   
 }
 
void drawAddOn3() {

  image(stripImg,gparr[7].getX() + 50*ao1xbob.getBob(),gparr[7].getY() + 50*ao1ybob.getBob(), stripImg.width * (0.6 + 0.4 *ao1xbob.getBobTail(10)), stripImg.height * (0.6 + 0.4 *ao1ybob.getBobTail(10)));
  
  
}
 void setup() {
   float sin30 = sin(PI/6);
   float cos30 = cos(PI/6);
   float aspect = atan(1280/720);
   
   apal = new AutoPalette();
   int cmax = 5;
   float c0 = random(1);
   carr = new float[cmax];
   for (int i = 0; i < cmax; i++) {
    carr[i] = c0 + 1.0*i / cmax; 
    
   }
   
   // circle center
  gparr[0] = new GPoint(0.3*width+random(0.4*width),0.3*height + random(0.4*height));
  rbob = new NoizeBob(1.0,0.001,0.4);
  cxbob = new NoizeBob(1.0,0.001,0.4);
  cybob = new NoizeBob(1.0,0.001,0.4);
  ao1xbob = new NoizeBob(1.0,0.001,0.4);
  ao1ybob = new NoizeBob(1.0,0.001,0.4);
  t1sbob = new NoizeBob(1.0,0.001,0.4);
  t2sbob = new NoizeBob(1.0,0.001,0.4);
  t3sbob = new NoizeBob(1.0,0.001,0.4);
  cbob = new NoizeBob_2D(1.0,0.001, 0.001,0.4);
  
  
  // triangle1 : 30-60-90
  float xx = random(width);
  float yy = random(0.5*height);
  gparr[1] = new GPoint(xx, yy);
  
  float x2 = 0;
  if ( xx < 0.5 * width ) {
    x2 = 0.9*width;
  } else {
    x2 = 0.1*width;
  }
  float y2 = yy;
  
  float x3 = xx;
  float y3 = yy+1.*(abs(x2-xx) * 720./1280.);
  
  gparr[2] = new GPoint(x2, y2);
  gparr[3] = new GPoint(x3, y3);
  //println("x1 : " + xx);
  
  
  // triangle2 : 30-60-90
  xx = random(width);
  yy = 0.5 * height * (1 + random(1));
  
  x2 = xx;

  x3 = xx;
  if ( xx < 0.5 * width ) {
    x3 = 0.9*width;
  } else {
    x3 = 0.1*width;
  }
  
  y2 = yy - 1.*(abs(x3 - xx) * 720./1280.);

  y3 = yy;
  gparr[4] = new GPoint(xx, yy);
  gparr[5] = new GPoint(x2, y2);
  gparr[6] = new GPoint(x3, y3);
  
  
  EmptyTemplate et = new EmptyTemplate();
  stripImg = et.getEmpty(height*height/width, height);
  NoizeBob stimbob = new NoizeBob(1.0, 0.1,0.7);
  stripImg.loadPixels();
  for (int j = 0 ; j < stripImg.height; j++) {
    stimbob.getBob();
   for (int i = 0; i < stripImg.width; i++) {
    if (stimbob.getBobTail(1) > 0.7) stripImg.pixels[j*stripImg.width + i] = apal.getColor50(carr[2]); 
     
   }
  stripImg.updatePixels();
  
  }
  gparr[7] = new GPoint(0.5*random(1)*width, 0.5*random(1)*height);
 }   
   
 
 
}
