PImage nuImg;
CyrusRoller croller;
BobbleBoxPistil bbPistil;

void setup() {
  size(720,720, P3D);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  croller = new CyrusRoller();
  croller.setup();
  background(24,24,0);
  bbPistil = new BobbleBoxPistil();
}

void draw() {
  croller.draw();
  bbPistil.draw();
  //saveFrame();
  println(frameCount);
}
