class BoxzzMarch {

  Boxzz[] boxArr;
  float[] xoffArr;
  int boxCnt = 13;
  float boxOff = 1.6;
  QuilezFunctions qf;
  NoizeBob zbob, rbob, xbob, ybob;
  
  BoxzzMarch(int frameInc) {
    init(frameInc);
  }

  

  
  void drawGrid(int dogInc){
    int cnt = 3;
    float xoff = 0.6*(width- 0.9*height);
    float yoff = 0.15*height;

    float toff = 2*PI/cnt;
    zbob.getBob();
    ybob.getBob();
    xbob.getBob();
    float yy = 50*sin(0.01*frameCount);
    float zz = 50*cos(0.01*frameCount);
    for (int i = 0; i< cnt; i++) {
      for (int j = 0; j< cnt; j++) {
        float boxOff = boxArr[i].getWidth();
        //yy = 0.3*height * sin(0.01*frameCount + 0.5*ybob.getBobTail(10*i) + i*toff);
        zz = 0.01*height * (1 + zbob.getBobTail(10*i)) * cos(0.001*frameCount + 0.5*zbob.getBobTail(10*i) + i*toff);
        pushMatrix();
        translate(xoff + i * 0.3 * height + boxOff + 10*xbob.getBobTail(i), yoff + j * 0.3 * height + boxOff + 10*ybob.getBobTail(i), zz);
        scale(1.3);
        boxArr[i].drawDogs(j+i*cnt);

        popMatrix();
      }
    }

  }
  
  
  void init(int frameInc){
    boxArr = new Boxzz[boxCnt];
    xoffArr = new float[boxCnt];
    for (int i = 0; i< boxCnt; i++) {
      boxArr[i] = new Boxzz(frameInc);
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
  int bumpOff, frameInc;
  float rotX, rotXoff, rotY, rotYoff, rotZ, rotZoff;
  float rotXinc, rotYinc, rotZinc;
  
 Boxzz(int _frameInc) {
   frameInc = _frameInc;
   bumpOff = frameInc;
   
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

   ghPathArr = new String[csize];
   ghPathArr[0] = "tStar01.png";
   ghPathArr[1] = "tStar01.png";
   ghPathArr[2] = "tStar01.png";
   ghPathArr[3] = "tStar01.png";
   ghPathArr[4] = "tStar01.png";
   ghPathArr[5] = "tStar01.png";

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
   rotX = rotY = rotZ = 0.;
   rotXoff = rotYoff = rotZoff = 0.;
   rotXinc = rotYinc = rotZinc = 0.1;
   
   intArr = new int[5];
   for (int i = 0; i < 5; i++) {
     intArr[i] = 1 + floor(random(4));
   }
   
   foff = frameCount;
 }

 
 void drawDogs(int imgOffset) {
   
  if (frameCount > bumpOff) {
    float rran = random(1);
   if (rran < 0.8) {
     rotXoff -= 0.5*PI;
     rotXinc = -0.05;
   }
   if (rran < 0.4) {
     rotXoff += 0.5*PI;
     rotXinc = 0.05;
   }

   rran = random(1);
   if (rran < 0.7) {
     rotYoff -= 0.5*PI;
     rotYinc = -0.05;
   }
   if (rran < 0.4) {
     rotYoff += 0.5*PI;
     rotYinc = 0.05;
   }

   rran = random(1);
   if (rran < 0.7) {
     rotZoff -= 0.5*PI;
     rotZinc = -0.05;
   }
   if (rran < 0.4) {
     rotZoff += 0.5*PI;
     rotZinc = 0.05;
   }
   //println("bumped");
   //println(rotXoff);
   //println(rotYoff);
   //println(rotZoff);
   
   bumpOff = frameCount + frameInc;
   
  } 
  
  //image(imgArr[0],0,0);
  noStroke();
  float frameOff = 1. * (frameCount-foff);
  //float rotx = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBob() * sin(0.001*frameCount + rotOff1);
  //float roty = PI * qf.  expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(10) * sin(0.001*frameCount + rotOff2);
  //float rotz = PI * qf.expSustainedImpulse(frameOff, 500., 1450.) * llbob.getBobTail(100) * sin(0.001*frameCount + rotOff3);
  
  float nn = 2.3;
  float kk = pow(frameOff, nn)*log(2);
  float hoff = height/2.0; // * ( 1 + qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn ));
  //println(kk + " " + 1./pow(frameOff,4.) + " " + hoff);
  
  // center //
  //translate(width/2.0, hoff, -900);
  
  pushMatrix();
  // origin //
  translate(-50, -50, 0);
  //println(abs(rotXoff - rotX));
  if (abs(rotXoff - rotX) >= abs(rotXinc)) {
    rotX += rotXinc;
  } else {
    rotX = rotXoff;
  }
  if (abs(rotYoff - rotY) >= abs(rotYinc)) {
    rotY += rotYinc;
  } else {
    rotY = rotYoff;
  }
  if (abs(rotZoff - rotZ) >= abs(rotZinc)) {
    rotZ += rotZinc;
  } else {
    rotZ = rotZoff;
  }
  
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  
  /* scale */
  //float ss = 5. + 2. * qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn );
  //scale(ss);
  //println(ss);
  TexturedCube(dogsPathArr,imgOffset);
  popMatrix();
  translate(50, 50, 0);
 }
 
 
 
 
 
 
 void TexturedCube(String[] imgPathArr) {
    TexturedCube(imgPathArr, 0);
 }   
 void TexturedCube(String[] imgPathArr, int offset) {
   beginShape(QUADS);
  int myOffset = offset;
  texture(loadImage(imgPathArr[myOffset]));
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
  myOffset++;
  if (myOffset >= imgPathArr.length) myOffset = 0;
  texture(loadImage(imgPathArr[myOffset]));
  textureMode(NORMAL);
  // -Z "back" face
  vertex( 100, -100, -100, 0, 0);
  vertex(-100, -100, -100, 1, 0);
  vertex(-100,  100, -100, 1, 1);
  vertex( 100,  100, -100, 0, 1);

  endShape();
  beginShape(QUADS);
  myOffset++;
  if (myOffset >= imgPathArr.length) myOffset = 0;
  texture(loadImage(imgPathArr[myOffset]));
  textureMode(NORMAL);
  // +Y "bottom" face
  vertex(-100,  100,  100, 0, 0);
  vertex( 100,  100,  100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
  beginShape(QUADS);
  myOffset++;
  if (myOffset >= imgPathArr.length) myOffset = 0;
  texture(loadImage(imgPathArr[myOffset]));
  textureMode(NORMAL);
  // -Y "top" face
  vertex(-100, -100, -100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100, -100,  100, 1, 1);
  vertex(-100, -100,  100, 0, 1);

  endShape();
  beginShape(QUADS);
  myOffset++;
  if (myOffset >= imgPathArr.length) myOffset = 0;
  texture(loadImage(imgPathArr[myOffset]));
  textureMode(NORMAL);
  // +X "right" face
  vertex( 100, -100,  100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex( 100,  100,  100, 0, 1);

  endShape();
  beginShape(QUADS);
  myOffset++;
  if (myOffset >= imgPathArr.length) myOffset = 0;
  texture(loadImage(imgPathArr[myOffset]));
  textureMode(NORMAL);
  // -X "left" face
  vertex(-100, -100, -100, 0, 0);
  vertex(-100, -100,  100, 1, 0);
  vertex(-100,  100,  100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
}
}
