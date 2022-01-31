float theta;
float phi = 2.0;
float phinc = 0.001;
float theta0 = 0.01;
float offx, offy;
float offx2, offy2;
color myColor, sunfill, sunstroke;
color[] sunColors;
float scaleGrande, scaleInc, scaleGrandeMax;
boolean isGrande = false;
float direction = 1.;

AutoPalette apal;
NoizeBob cbob, xbob, ybob, rbob, zbob;

int fc0, fc1, fc2;
float rOff = 1.0;

void setup() {
  size(1280, 720, P3D);
  colorMode(HSB, 1.);
  background(0.);
  cbob = new NoizeBob(2., 0.001, 0.7);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  rbob = new NoizeBob(1., 0.01, 0.2);
  zbob = new NoizeBob(PI, 0.0001, 0.7);
  apal = new AutoPalette(0.6);
  
  offx = 0.2 * width;
  offy = 0.2 * height;
  
  offx2 = width/2 + random(-1, 1);
  offy2 = 0.6 * height + random(-1, 1);

  //setupAudio();
  
  
  scaleGrande = 0.2 * width;
  scaleGrandeMax = 0.4* width;
  scaleInc = 1.0;
  //timg = new TextImage();  // what does this thing do?!?
  

  
  colorMode(HSB, 100);

    
  fc0 = 840; //23 * 30;
  fc1 = 2000; //90 * 30
  fc2 = 3300;
}

void draw() {
   println(frameCount);
   drawSuperFormula();
   
   //saveFrame();


  

  }

void drawSuperFormula() {
  sunfill = apal.getColor(cbob.getBob(), 0.7, 0.4*(1+sin(0.001*frameCount)));
  stroke( apal.getColor(cbob.getBobTail(1000)));
  fill(sunfill);
  float x0 = offx + 0.6*width * xbob.getBob();
  float y0 = offy + 0.6*height * ybob.getBob();
   
   float a = 2.0;//* (1.5 + sin(phi));
   // width abs
   float b = 2.0;//  * (1.5 + cos(phi));
   // height abs
   float m1 = 16.0 * phi;
   float m2 = 16.0 * phi;
   float n1 = -4.0;
   // n1 > 1 :: circular
   // positive or negative
   // n1 < -1 pokey
   float n2 = 1.0* (0.5 + cos(phi));
   // -2 < n2 < 1 :: molecule
   // n2 > 1 :: rectangle
   float n3 = 1.0 * (0.5 + sin(phi));
   // -2 < n3 < 1 :: molecule
   // n3 > 1 :: rectangle
   float ss = 100;
   float ms = 20.0 * ( 1.0 * mouseX / width - 0.5);
   //n3 = n3 * ms;
   //n2 = 10.0 * (cos( phi));
   //n3 = 5.0 * sin(phi);
   //n1 =  2.0 * (2 + sin(3*phi));
   //println("" + ms );
   
   float r0 = rOff + rbob.getBob();
   
   //println(frameCount + " " + rOff);
  translate(x0, y0);
  rotateZ(zbob.getBob());
   pushMatrix();
   translate(0,0,50*zbob.getBobTail(1));
  
  pushMatrix();
  beginShape();
  for (float theta = 0; theta < PI; theta += theta0) {
   float r = r0 * r(theta, a, b, m1, m2, n1, n2, n3);
   if (r > width) r = width;
   float x = r * cos(theta);
   float y = r * sin(theta);
   vertex(ss * x, ss * y); 
  }  
  for (float theta = 0; theta < PI; theta += theta0) {
   float r = r0 * r(PI - theta, a, b, m1, m2, n1, n2, n3);
   if (r > width) r = width;
   float x = r * cos(PI + theta);
   float y = r * sin(PI + theta);
   vertex(ss * x, ss * y); 
  }  
  endShape(CLOSE);
  popMatrix();
  popMatrix();
  phi += phinc * direction;
  //println(phi);
  
  if (phi > 3.6) direction *= -1.;
  if (phi <= 2.0) direction *= -1.;

}


void drawSuperFormulaGrande() {
  if (random(0,1) > 0.95) {
    sunstroke = apal.getColor(cbob.getBob());
  }
  stroke(sunstroke);

  fill(0);
  
   offx2 = offx2 + random(-1, 1);
   offy2 = offy2 +  random(-1, 1);


   float a = 2.0;//* (1.5 + sin(phi));
   // width abs
   float b = 2.0;//  * (1.5 + cos(phi));
   // height abs
   float m1 = 4.0 * phi;
   float m2 = 4.0 * phi;
   float n1 = -4.0;

   float n2 = 1.0* (0.5 - abs(cos(0.0 - phi)));
   float n3 = 1.0 * (0.5 - abs( sin(phi)));
   
   
  beginShape();
  for (float theta = 0; theta < 2*PI; theta += theta0) {
   float r = r(theta, a, b, m1, m2, n1, n2, n3);
   float x = r * cos(theta);
   float y = r * sin(theta);
   vertex(offx2 - scaleGrande * x, offy2 + scaleGrande * y); 
  }  
  endShape(CLOSE);

  phi += theta0;
}



float r(float theta, float a, float b, float m1, float m2, float n1, float n2, float n3) {
  return pow(pow(abs(cos(m1 * theta / 4) / a), n2) 
    + pow(abs(sin(m2 * theta / 4) / b), n3), -1 / n1);
}
