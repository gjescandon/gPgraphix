class BoxzzMarch {

  Boxzz[] boxArr;
  float[] xoffArr;
  int boxCnt = 13;
  float boxOff = 1.6;
  QuilezFunctions qf;
  NoizeBob zbob, rbob, xbob, ybob;
  
  BoxzzMarch() {
    init();
  }

  
  void draw(){
    float xoff = width/boxCnt;
    float toff = PI/boxCnt;
    zbob.getBob();
    ybob.getBob();
    xbob.getBob();
    float yy = 50*sin(0.01*frameCount);
    float zz = 50*cos(0.01*frameCount);
    for (int i = 0; i< boxCnt; i++) {
      yy = 100 * sin(0.006*frameCount + ybob.getBobTail(10*i) + i*toff);
      zz = 100 * (1 + zbob.getBobTail(10*i)) * cos(0.006*frameCount + zbob.getBobTail(10*i) + i*toff);
      pushMatrix();
      translate(xoffArr[i], 0.5*height + yy, zz);
      xoffArr[i] -= xbob.getBobTail(i);
      if (xoffArr[i] < -boxOff * boxArr[i].getWidth()) {
        xoffArr[i] = (boxCnt -1) * boxOff * boxArr[i].getWidth();
      }
      scale(0.6 - 0.4* qf.expSustainedImpulse(dogInc, 1000, 1000));
      //if (xoffArr[i] < 1.1*width && xoffArr[i] > -1.2 *boxArr[i].getWidth()) {
        boxArr[i].draw();
      //}
      popMatrix();
    }

  }
  
  void drawBounce(int dogInc){
    cnt = 5;
    //float xoff = width/boxCnt;
    float toff = PI/boxCnt;
    zbob.getBob();
    ybob.getBob();
    xbob.getBob();
    float yy = 50*sin(0.01*frameCount);
    float zz = 50*cos(0.01*frameCount);
    for (int i = 0; i< boxCnt; i++) {
      yy = 200 * abs(sin(0.1*frameCount + ybob.getBobTail(10*i) + i*toff));
      zz = 0.;
      //zz = 100 * (1 + zbob.getBobTail(10*i)) * cos(0.1*frameCount + zbob.getBobTail(10*i) + i*toff);
      pushMatrix();
      translate(xoffArr[i], 0.8*height - yy, zz);
      xoffArr[i] -= xbob.getBobTail(i);
      if (xoffArr[i] < -boxOff * boxArr[i].getWidth()) {
        xoffArr[i] = (boxCnt -1) * boxOff * boxArr[i].getWidth();
      }
      scale(0.3);// - 0.3* qf.expSustainedImpulse(dogInc, 2500, 2500));
      if (xoffArr[i] < 1.1*width && xoffArr[i] > -1.2 *boxArr[i].getWidth()) {
        boxArr[i].drawGhosts(0);
      }
      popMatrix();
    }

  }

  
  void drawOrth(int dogInc){
    int cnt = 5;
    //float xoff = width/boxCnt;
    float toff = 2*PI/cnt;
    zbob.getBob();
    ybob.getBob();
    xbob.getBob();
    float yy = 50*sin(0.01*frameCount);
    float zz = 50*cos(0.01*frameCount);
    for (int i = 0; i< cnt; i++) {
      yy = 0.3*height * sin(0.01*frameCount + 0.5*ybob.getBobTail(10*i) + i*toff);
      zz = 0.3*height * (1 + zbob.getBobTail(10*i)) * cos(0.01*frameCount + 0.5*zbob.getBobTail(10*i) + i*toff);
      pushMatrix();
      translate(0.4*width + 10.*xbob.getBobTail(1+ i*10), 0.5*height + yy , zz);
      xoffArr[i] -= xbob.getBobTail(i);
      if (xoffArr[i] < -boxOff * boxArr[i].getWidth()) {
        xoffArr[i] = (boxCnt -1) * boxOff * boxArr[i].getWidth();
      }
      scale(1.1 * qf.expSustainedImpulse(dogInc, 500, 500));
      //if (xoffArr[i] < 1.1*width && xoffArr[i] > -1.2 *boxArr[i].getWidth()) {
        boxArr[i].drawDogs(i);
      //}
      popMatrix();
    }

  }

  
  void drawGrid(int dogInc){
    int cnt = 9;
    float xoff = 0.5*(width-height);
    float toff = 2*PI/cnt;
    zbob.getBob();
    ybob.getBob();
    xbob.getBob();
    float yy = 50*sin(0.01*frameCount);
    float zz = 50*cos(0.01*frameCount);
    for (int i = 0; i< cnt/3; i++) {
      for (int j = 0; j< cnt/3; j++) {
      yy = 0.3*height * sin(0.01*frameCount + 0.5*ybob.getBobTail(10*i) + i*toff);
      zz = 0.3*height * (1 + zbob.getBobTail(10*i)) * cos(0.01*frameCount + 0.5*zbob.getBobTail(10*i) + i*toff);
      pushMatrix();
      translate(0.4*width + 10.*xbob.getBobTail(1+ i*10), 0.5*height + yy , zz);
      xoffArr[i] -= xbob.getBobTail(i);
      
      scale(0.4);
        boxArr[i].drawDogs(i);

      popMatrix();
      }
    }

  }
  
  void drawVert(){
    float xoff = width/boxCnt;
    float toff = PI/boxCnt;
    zbob.getBob();
    ybob.getBob();
    xbob.getBob();
    float yy = 50*sin(0.01*frameCount);
    float zz = 50*cos(0.01*frameCount);
    for (int i = 0; i< boxCnt; i++) {
      yy = 100 * sin(0.1*frameCount + ybob.getBobTail(10*i) + i*toff);
      zz = 100 * (1 + zbob.getBobTail(10*i)) * cos(0.1*frameCount + zbob.getBobTail(10*i) + i*toff);
      pushMatrix();
      translate(0.5*height + yy, xoffArr[i] , zz);
      xoffArr[i] -= xbob.getBobTail(i);
      if (xoffArr[i] < -boxOff * boxArr[i].getWidth()) {
        xoffArr[i] = (boxCnt -1) * boxOff * boxArr[i].getWidth();
      }
      scale(0.4);
      //if (xoffArr[i] < 1.1*width && xoffArr[i] > -1.2 *boxArr[i].getWidth()) {
        boxArr[i].draw();
      //}
      popMatrix();
    }

  }  
  
  void init(){
    boxArr = new Boxzz[boxCnt];
    xoffArr = new float[boxCnt];
    for (int i = 0; i< boxCnt; i++) {
      boxArr[i] = new Boxzz();
      xoffArr[i] = i* boxOff * boxArr[i].getWidth();
    }
   
   zbob = new NoizeBob(1.0, 0.003, 0.6);
   rbob = new NoizeBob(1.0, 0.01, 0.7);
   xbob = new NoizeBob(1.0, 0.003, 0.5);
   ybob = new NoizeBob(1.0, 0.003, 0.6);    
    
    qf = new QuilezFunctions();
  }
}

class Boxzz {
  QuilezFunctions qf;
  float index = 7;
     float ll;
  NoizeBob swbob, llbob, xbob, ybob;
  int csize = 6;
  int boxW = 100;
  
  PImage[] imgArr,dogsArr;
  float rotOff1, rotOff2, rotOff3;
  int[] intArr;
  int foff;
  String[] imgPathArr,dogsPathArr,ghPathArr;
  
 Boxzz() {
   init(); 
   imgPathArr = new String[csize];
   imgPathArr[0] = "chardoCHopp/CHOPP_C.png";
   imgPathArr[1] = "chardoCHopp/CHOPP_H.png";
   imgPathArr[2] = "chardoCHopp/CHOPP_O.png";
   imgPathArr[3] = "chardoCHopp/CHOPP_P.png";
   imgPathArr[4] = "chardoCHopp/ONE_N.png";
   imgPathArr[5] = "chardoCHopp/ONE_E.png";

   ghPathArr = new String[csize];
   ghPathArr[0] = "ghostCircle01.png";
   ghPathArr[1] = "ghostCircle02.png";
   ghPathArr[2] = "ghostCircle03.png";
   ghPathArr[3] = "ghostCircle04.png";
   ghPathArr[4] = "ghostCircle05.png";
   ghPathArr[5] = "ghostCircle06.png";

   dogsPathArr = new String[11];
   dogsPathArr[0] = "eggs/dog01sq.png";
   dogsPathArr[1] = "eggs/dog02sq.png";
   dogsPathArr[2] = "eggs/dog03sq.png";
   dogsPathArr[3] = "eggs/dog04sq.png";
   dogsPathArr[4] = "eggs/dog05sq.png";
   dogsPathArr[5] = "eggs/dog06sq.png";
   dogsPathArr[6] = "eggs/dog07sq.png";
   dogsPathArr[7] = "eggs/dog08sq.png";
   dogsPathArr[8] = "eggs/dog09sq.png";
   dogsPathArr[9] = "eggs/cat02sq.png";
   dogsPathArr[10] = "eggs/dogSandy1.png";
 }
 
 int getWidth() {
  return boxW; 
 }
 
 void init() {
   qf = new QuilezFunctions();
   llbob = new NoizeBob(1.0, 0.001, 0.8);
   swbob = new NoizeBob(1.0, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
   imgArr = new PImage[6];
   
   rotOff1 = random(3);
   rotOff2 = random(3);
   rotOff3 = random(3);
   
   intArr = new int[5];
   for (int i = 0; i < 5; i++) {
     intArr[i] = 1 + floor(random(4));
   }
   
   foff = frameCount;
   
 }
 void draw() {
  //image(imgArr[0],0,0);
  noStroke();
  float frameOff = 1. * (frameCount-foff);
  float rotx = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBob() * sin(0.001*frameCount + rotOff1);
  float roty = PI * qf.  expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(10) * sin(0.001*frameCount + rotOff2);
  float rotz = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(100) * sin(0.001*frameCount + rotOff3);
  pushMatrix();
  
  float nn = 2.3;
  float kk = pow(frameOff, nn)*log(2);
  float hoff = height/2.0; // * ( 1 + qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn ));
  //println(kk + " " + 1./pow(frameOff,4.) + " " + hoff);
  
  // center //
  //translate(width/2.0, hoff, -900);
  
  // origin //
  translate(-50, -50, 0);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  
  /* scale */
  //float ss = 5. + 2. * qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn );
  //scale(ss);
  //println(ss);
  
  TexturedCube(imgPathArr);
  popMatrix();
 }
 
 void drawDogs(int imgOffset) {
  //image(imgArr[0],0,0);
  noStroke();
  float frameOff = 1. * (frameCount-foff);
  float rotx = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBob() * sin(0.001*frameCount + rotOff1);
  float roty = PI * qf.  expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(10) * sin(0.001*frameCount + rotOff2);
  float rotz = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(100) * sin(0.001*frameCount + rotOff3);
  pushMatrix();
  
  float nn = 2.3;
  float kk = pow(frameOff, nn)*log(2);
  float hoff = height/2.0; // * ( 1 + qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn ));
  //println(kk + " " + 1./pow(frameOff,4.) + " " + hoff);
  
  // center //
  //translate(width/2.0, hoff, -900);
  
  // origin //
  translate(-50, -50, 0);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  
  /* scale */
  //float ss = 5. + 2. * qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn );
  //scale(ss);
  //println(ss);
  
  TexturedCube(dogsPathArr,imgOffset);
  popMatrix();
 }
 
 void drawGhosts(int imgOffset) {
  //image(imgArr[0],0,0);
  noStroke();
  float frameOff = 1. * (frameCount-foff);
  float rotx = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBob() * sin(0.001*frameCount + rotOff1);
  float roty = PI * qf.  expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(10) * sin(0.001*frameCount + rotOff2);
  float rotz = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(100) * sin(0.001*frameCount + rotOff3);
  pushMatrix();
  
  float nn = 2.3;
  float kk = pow(frameOff, nn)*log(2);
  float hoff = height/2.0; // * ( 1 + qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn ));
  //println(kk + " " + 1./pow(frameOff,4.) + " " + hoff);
  
  // center //
  //translate(width/2.0, hoff, -900);
  
  // origin //
  translate(-50, -50, 0);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  
  /* scale */
  //float ss = 5. + 2. * qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn );
  //scale(ss);
  //println(ss);
  
  TexturedCube(ghPathArr,imgOffset);
  popMatrix();
 }
 
 
 void drawBox() {
   pushMatrix();
   float xb = xbob.getBob();
   float yb = ybob.getBob();
  for (float i=0; i< index; i++) {
   rotateZ(TWO_PI / index);
   rect(xb,yb,0.3*width,0.3*height);
  }
  popMatrix();
   
 }
 
 
 void drawBoxCircling() {
   
  float freq = 0.01 * frameCount; 
  pushMatrix();
  //rotateY(QPI);
  pushMatrix();
  translate(0.5*width,0.5*width,-200);
  //rotateZ(EPI);
  float xx  = 0.5*width*cos(freq);
  float yy  = 0.5*height*sin(freq);
  println(xx );
  //if (freq%PI < 1.0){
    translate(00, yy, xx);
    draw();
  //}
//rotateY(QPI);
  popMatrix();
  popMatrix();
   
 }
 
 
 void TexturedCube(String[] imgPathArr) {
    TexturedCube(imgPathArr, 0);
 }   
 void TexturedCube(String[] imgPathArr, int offset) {
   beginShape(QUADS);
  texture(loadImage(imgPathArr[0+offset]));
  textureMode(NORMAL);

  // Given one texture and six faces, we can easily set up the uv coordinates
  // such that four of the faces tile "perfectly" along either u or v, but the other
  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
  // rotation along the X axis will put the "top" of either texture at the "top"
  // of the screen, but is not otherwised aligned with the X/Z faces. (This
  // just affects what type of symmetry is required if you need seamless
  // tiling all the way around the cube)
  
  // +Z "front" face
  vertex(-100, -100,  100, 0, 0);
  vertex( 100, -100,  100, 1, 0);
  vertex( 100,  100,  100, 1, 1);
  vertex(-100,  100,  100, 0, 1);
  endShape();
  beginShape(QUADS);
  texture(loadImage(imgPathArr[1+offset]));
  textureMode(NORMAL);
  // -Z "back" face
  vertex( 100, -100, -100, 0, 0);
  vertex(-100, -100, -100, 1, 0);
  vertex(-100,  100, -100, 1, 1);
  vertex( 100,  100, -100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(loadImage(imgPathArr[2+offset]));
  textureMode(NORMAL);
  // +Y "bottom" face
  vertex(-100,  100,  100, 0, 0);
  vertex( 100,  100,  100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(loadImage(imgPathArr[3+offset]));
  textureMode(NORMAL);
  // -Y "top" face
  vertex(-100, -100, -100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100, -100,  100, 1, 1);
  vertex(-100, -100,  100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(loadImage(imgPathArr[4+offset]));
  textureMode(NORMAL);
  // +X "right" face
  vertex( 100, -100,  100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex( 100,  100,  100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(loadImage(imgPathArr[5+offset]));
  textureMode(NORMAL);
  // -X "left" face
  vertex(-100, -100, -100, 0, 0);
  vertex(-100, -100,  100, 1, 0);
  vertex(-100,  100,  100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
}
}
