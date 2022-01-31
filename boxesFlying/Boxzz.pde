class Boxzz {
  QuilezFunctions qf;
  float index = 7;
     float ll;
  NoizeBob swbob, llbob, xbob, ybob;
  
  PImage[] imgArr;
  float rotOff1, rotOff2, rotOff3;
  int[] intArr;
  int foff;
  String[] imgPathArr;
  
 Boxzz() {
   init(); 
   imgPathArr = new String[7];
   imgPathArr[0] = "geoffPetersonSquare.png";
   imgPathArr[1] = "galana02.jpg";
   imgPathArr[2] = "gApricot.png";
   imgPathArr[3] = "gBlingMasterKidFeliz.png";
   imgPathArr[4] = "gfingers.png";
   imgPathArr[5] = "gHand.png";
   imgPathArr[6] = "djguitar.png";
 }
 
 void init() {
   qf = new QuilezFunctions();
   llbob = new NoizeBob(1.0, 0.001, 0.8);
   swbob = new NoizeBob(1.0, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
   imgArr = new PImage[6];
   if (frameCount < 10 ) {
     imgArr[0] = loadImage("insomnia3.png");
   } else {
     String path = imgPathArr[floor(random(3))];
     println(path);
       imgArr[0] = loadImage(path);
   }
   imgArr[1] = loadImage("ghostCircle01.png");
   imgArr[2] = loadImage("ghostCircle02.png");
   imgArr[3] = loadImage("ghostCircle03.png");
   imgArr[4] = loadImage("ghostCircle04.png");
   imgArr[5] = loadImage("ghostCircle05.png");
   
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
  
  translate(width/2.0, hoff, -900);
  rotateX(rotx);
  rotateY(roty);
  rotateZ(rotz);
  float ss = 5. + 2. * qf.expStep( 1.*frameCount, 1./pow(frameOff,2.3), nn );
  scale(ss);
  //println(ss);
  
  TexturedCube();
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
 
 
 void TexturedCube() {
  beginShape(QUADS);
  texture(imgArr[0]);
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
  texture(imgArr[intArr[0]]);
  textureMode(NORMAL);
  // -Z "back" face
  vertex( 100, -100, -100, 0, 0);
  vertex(-100, -100, -100, 1, 0);
  vertex(-100,  100, -100, 1, 1);
  vertex( 100,  100, -100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(imgArr[intArr[1]]);
  textureMode(NORMAL);
  // +Y "bottom" face
  vertex(-100,  100,  100, 0, 0);
  vertex( 100,  100,  100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(imgArr[intArr[2]]);
  textureMode(NORMAL);
  // -Y "top" face
  vertex(-100, -100, -100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100, -100,  100, 1, 1);
  vertex(-100, -100,  100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(imgArr[intArr[3]]);
  textureMode(NORMAL);
  // +X "right" face
  vertex( 100, -100,  100, 0, 0);
  vertex( 100, -100, -100, 1, 0);
  vertex( 100,  100, -100, 1, 1);
  vertex( 100,  100,  100, 0, 1);

  endShape();
  beginShape(QUADS);
  texture(imgArr[intArr[4]]);
  textureMode(NORMAL);
  // -X "left" face
  vertex(-100, -100, -100, 0, 0);
  vertex(-100, -100,  100, 1, 0);
  vertex(-100,  100,  100, 1, 1);
  vertex(-100,  100, -100, 0, 1);

  endShape();
}
}
