QuilezFunctions qf;
GeoFunctions gf;
color chromaGrn;
int frameBump, frameInc;
int index;
int choppSize = 17;
float rotOff = 0.1;
int BPM = 96;
String[] choppStr;
PImage[] choppArr;

NoizeBob cb,zbob, xbob, ybob, swb, rbob;
int cnt;
void setup() {
  size(1920,1080, P3D);
  init();
  }
  
void init() {
  index = 0;
  choppStr = new String[choppSize];
   choppStr[0] = "chardoCHopp/CHARDO_A.png";
   //choppStr[0] = "djEyes01djBowlcut.png";
   choppStr[1] = "chardoCHopp/CHARDO_C.png";
   choppStr[2] = "chardoCHopp/CHARDO_D.png";
   choppStr[3] = "chardoCHopp/CHARDO_H.png";
   choppStr[4] = "chardoCHopp/CHARDO_O.png";
   choppStr[5] = "chardoCHopp/CHARDO_R.png";
   choppStr[6] = "chardoCHopp/CHOPP_C.png";
   choppStr[7] = "chardoCHopp/CHOPP_H.png";
   choppStr[8] = "chardoCHopp/CHOPP_O.png";
   choppStr[9] = "chardoCHopp/CHOPP_P.png";
   choppStr[10] = "chardoCHopp/CHOPP_PP.png";
   choppStr[11] = "chardoCHopp/ONE_O.png";
   choppStr[12] = "chardoCHopp/ONE_N.png";
   choppStr[13] = "chardoCHopp/ONE_E.png";
   choppStr[14] = "chardoCHopp/TWO_T.png";
   choppStr[15] = "chardoCHopp/TWO_W.png";
   choppStr[16] = "chardoCHopp/TWO_O.png";
   
  choppArr = new PImage[choppSize];
  for (int i =0 ; i < choppSize; i++) {
   choppArr[i] = loadImage(choppStr[i]); 
  }
  
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  
  cnt = 3  ;
  // frameRate = 60 per sec default
  
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(15., 0.01, 0.5);
  rbob = new NoizeBob(rotOff, 0.01, 0.7);
  ybob = new NoizeBob(15., 0.01, 0.5);
  
  colorMode(HSB,1.);
  chromaGrn = color(0.3, 0.98, 0.96);
}

void draw() {
  
  if (frameCount > frameBump) {
   // init();
   frameBump = frameCount+frameInc;
  }
  background(chromaGrn);
  //directionalLight(1., 0., 1., 0.1*sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1.);

  //drawChardo();
  
  //drawChoppOne();
  drawChoppTwo();
  saveFrame();
  println(frameCount);

  
} 

void drawChoppOne() {
  // chardo
  xbob.getBob();
  ybob.getBob();
  rbob.getBob();
  
  int choppW = choppArr[0].width;
  int choppOffx0 = floor((height - 6.0*choppW ) / 7.);
  int choppH = choppArr[0].height;
  int choppOffy = floor(0.25 * height - 0.5*choppH);
  int choppOffx = choppOffx0;

  
  
  //chopp
  int choppOffx1 = floor(((width - 5.0*choppW - 4.*choppOffx0) / 2.) );
  choppOffy += choppOffx0 ;
  
  choppOffx = choppOffx1;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(70) - 0.5*rotOff);  
  if (frameCount < 300) {
    image(choppArr[6],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < (1.0 - 0.9*qf.expSustainedImpulse(frameCount, 2000, 500))) {
    image(choppArr[6],-0.5*choppW, -0.5*choppH);      
    }
  }
    
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(80) - 0.5*rotOff);  
  //image(choppArr[7],-0.5*choppW, -0.5*choppH);
  if (frameCount < 100) {
    image(choppArr[7],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < (1.0 - 0.9*qf.expSustainedImpulse(frameCount, 3000, 500))) {
    image(choppArr[7],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(90) - 0.5*rotOff);  
  //image(choppArr[8],-0.5*choppW, -0.5*choppH);
  if (frameCount < 100) {
    image(choppArr[8],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < 0.98) {
    image(choppArr[8],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(100) - 0.5*rotOff);  
  //image(choppArr[9],-0.5*choppW, -0.5*choppH);
  if (frameCount < 800) {
    image(choppArr[9],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < (1.0 - 0.9*qf.expSustainedImpulse(frameCount, 3000, 500))) {
    image(choppArr[9],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(110) - 0.5*rotOff);  
  //image(choppArr[10],-0.5*choppW, -0.5*choppH);
  if (frameCount < 600) {
    image(choppArr[10],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < (1.0 - 0.9*qf.expSustainedImpulse(frameCount, 2500, 500))) {
    image(choppArr[10],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();

// one
  int choppOffx2 = floor(((width - 3.0*choppW - 2.*choppOffx0) / 2.) );
  choppOffy += choppOffx0 +choppArr[0].height;
  
  choppOffx = choppOffx2;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(70) - 0.5*rotOff);  
  //image(choppArr[11],-0.5*choppW, -0.5*choppH);
  if (frameCount < 200) {
    image(choppArr[11],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < (1.0 - 0.9*qf.expSustainedImpulse(frameCount, 3000, 500))) {
    image(choppArr[11],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(80) - 0.5*rotOff);  
  //image(choppArr[12],-0.5*choppW, -0.5*choppH);
  if (frameCount < 600) {
    image(choppArr[12],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < 0.98) {
    image(choppArr[12],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(90) - 0.5*rotOff);  
  //image(choppArr[13],-0.5*choppW, -0.5*choppH);
  if (frameCount < 300) {
    image(choppArr[13],-0.5*choppW, -0.5*choppH);
  } else {
    if (random(1) < (1.0 - 0.9*qf.expSustainedImpulse(frameCount, 3000, 500))) {
    image(choppArr[13],-0.5*choppW, -0.5*choppH);      
    }
  }
  popMatrix();


}

void drawChoppTwo() {
  // chardo
  xbob.getBob();
  ybob.getBob();
  rbob.getBob();
  
  int choppW = choppArr[0].width;
  int choppOffx0 = floor((height - 6.0*choppW ) / 7.);
  int choppH = choppArr[0].height;
  int choppOffy = floor(0.25 * height - 0.5*choppH);
  int choppOffx = choppOffx0;

  
  
  //chopp
  int choppOffx1 = floor(((width - 5.0*choppW - 4.*choppOffx0) / 2.) );
  choppOffy += choppOffx0 ;
  
  choppOffx = choppOffx1;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(70) - 0.5*rotOff);  
  image(choppArr[6],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(80) - 0.5*rotOff);  
  image(choppArr[7],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(90) - 0.5*rotOff);  
  image(choppArr[8],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(100) - 0.5*rotOff);  
  image(choppArr[9],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(110) - 0.5*rotOff);  
  image(choppArr[10],-0.5*choppW, -0.5*choppH);
  popMatrix();

// two
  int choppOffx2 = floor(((width - 3.0*choppW - 2.*choppOffx0) / 2.) );
  choppOffy += choppOffx0 +choppArr[0].height;
  
  choppOffx = choppOffx2;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(70) - 0.5*rotOff);  
  image(choppArr[14],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(80) - 0.5*rotOff);  
  image(choppArr[15],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(90) - 0.5*rotOff);  
  image(choppArr[16],-0.5*choppW, -0.5*choppH);
  popMatrix();


}

void drawChardo() {
  // chardo
  xbob.getBob();
  ybob.getBob();
  rbob.getBob();
  
  int choppW = choppArr[0].width;
  int choppOffx0 =  floor((height - 6.0*choppW ) / 7.);
  int choppH = choppArr[0].height;
  int choppOffy = floor(0.25 * height - 0.5*choppH);
  int choppOffx = floor(0.5 * (width-height)) + choppOffx0;
  pushMatrix();
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(20) - 0.5*rotOff);
  image(choppArr[1], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(20) - 0.5*rotOff);
  image(choppArr[3], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();
  choppOffx += choppOffx0 + choppW;
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(30) - 0.5*rotOff);
  image(choppArr[0], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();
  
  choppOffx += choppOffx0 + choppW;
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(40) - 0.5*rotOff);
  image(choppArr[5], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();
  
  choppOffx += choppOffx0 + choppW;
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(50) - 0.5*rotOff);
  image(choppArr[2], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();  
  choppOffx += choppOffx0 + choppW;
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(60) - 0.5*rotOff);
  image(choppArr[4], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  
  //chopp
  int choppOffx1 = floor(((width - 5.0*choppW - 4.*choppOffx0) / 2.) );
  choppOffy += choppOffx0 +choppArr[0].height;
  
  choppOffx = choppOffx1;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(70) - 0.5*rotOff);  
  image(choppArr[6],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(80) - 0.5*rotOff);  
  image(choppArr[7],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(90) - 0.5*rotOff);  
  image(choppArr[8],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(100) - 0.5*rotOff);  
  image(choppArr[9],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(110) - 0.5*rotOff);  
  image(choppArr[10],-0.5*choppW, -0.5*choppH);
  popMatrix();

}


void drawChardo2() {
  // chardo
  xbob.getBob();
  ybob.getBob();
  rbob.getBob();
  
  int choppW = choppArr[0].width;
  int choppOffx0 = floor((width - 6.0*choppW ) / 7.);
  int choppH = choppArr[0].height;
  int choppOffy = floor(0.25 * height - 0.5*choppH);
  int choppOffx = choppOffx0;
  pushMatrix();
  
  choppOffy = floor(choppOffx + 0.5*choppH);
  translate(choppOffx + xbob.getBobTail(10) + 0.5*choppW, choppOffy+ ybob.getBobTail(10)+ 0.5*choppH);
  rotate(rbob.getBobTail(10) - 0.5*rotOff);
  image(choppArr[1], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx = 2* choppOffx0 + choppW;
  choppOffy = floor(choppOffx);
  pushMatrix();
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(20) - 0.5*rotOff);
  image(choppArr[3], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx - 0.5*choppH);
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(30) - 0.5*rotOff);
  image(choppArr[0], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();
  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx - choppH);
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(40) - 0.5*rotOff);
  image(choppArr[5], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();
  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx - 1.5*choppH);
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(50) - 0.5*rotOff);
  image(choppArr[2], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  pushMatrix();  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx - 2.*choppH);
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(60) - 0.5*rotOff);
  image(choppArr[4], -0.5*choppW, -0.5*choppH);
  popMatrix();
  
  
  //chopp
  int choppOffx1 = floor(((width - 5.0*choppW - 4.*choppOffx0) / 2.) );
  
  choppOffx = choppOffx1;
  choppOffy = floor(choppOffx + choppOffx0 + 2.* choppH); 
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(70) - 0.5*rotOff);  
  image(choppArr[6],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx + choppOffx0 + 1.5*choppH); 
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(80) - 0.5*rotOff);  
  image(choppArr[7],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx + choppOffx0 + choppH); 
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(90) - 0.5*rotOff);  
  image(choppArr[8],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx + choppOffx0 + 0.5*choppH); 
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(100) - 0.5*rotOff);  
  image(choppArr[9],-0.5*choppW, -0.5*choppH);
  popMatrix();
  
  choppOffx += choppOffx0 + choppW;
  choppOffy = floor(choppOffx + choppOffx0 - 0.1*choppH); 
  pushMatrix();  
  translate(choppOffx + xbob.getBobTail(20) + 0.5*choppW, choppOffy+ ybob.getBobTail(20)+ 0.5*choppH);
  rotate(rbob.getBobTail(110) - 0.5*rotOff);  
  image(choppArr[10],-0.5*choppW, -0.5*choppH);
  popMatrix();

}


// circles - works good
void drawCircles() {
  
  stroke(0.0);
  float sw = 50;
  strokeWeight(sw*swb.getBob());
  fill(1.);
  //pushMatrix();
  //translate(0,0,zbob.getBob());
  circle(0,0, 700 + 1000 * cb.getBobTail(1));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(10));
  circle(0,0, 400 + 1500 * cb.getBobTail(100));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(50));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));
  circle(0,0, 700 + 1000 * cb.getBobTail(200));
  //popMatrix();
  
  strokeWeight(sw*cb.getBobTail(100));
  //pushMatrix();
  //translate(0,0,zbob.getBobTail(50));

  circle(0,0, 400 + 1500 * cb.getBobTail(300));
  //popMatrix();
}
