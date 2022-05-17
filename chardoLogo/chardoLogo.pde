QuilezFunctions qf;
GeoFunctions gf;
PImage orgEgg;
LinearImage limg, limg2;
int frameBump, frameInc;
int BPM = 96;
color CHROMAGRN;
RisersMaker risers;
ColorBox cbox;
NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1920,1080, P3D);
  //size(1280,720, P3D);
  init();
  }
  
void init() {
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  
  cnt = 3  ;
  // frameRate = 60 per sec default

  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.0006, 0.7);
  ybob = new NoizeBob(1., 0.0003, 0.7);

  
  colorMode(HSB,1.);
  CHROMAGRN = color(0.3, 0.98, 0.96);
  
  limg = new LinearImage("eggs/egg06.jpg");
  limg2 = new LinearImage("eggs/egg03pale.png");
  risers = new RisersMaker();
  cbox = new ColorBox();
}

void draw() {
  if (frameCount > frameBump) {
   // init();
   frameBump = frameCount+frameInc;
  }
  background(0.);
  //background(CHROMAGRN);
  directionalLight(1., 0., 1., 0.1*sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1.);

  noStroke();
  fill(1.);
  
  float xa = (0.4+0.3*xbob.getBob())*(width-height);
  float ya = (0.3*ybob.getBob())*height;
  pushMatrix();
  translate(0,0, -xa);
  limg2.drawVert(0,floor(ya), floor(xa), height);
  popMatrix();
  //rect(0,0,xa,height);
  //triangle(xa,0,xa+ya,0,xa,ya);
  limg2.drawLinearImage(floor(xa),0, floor(xa+ya), floor(ya));
  cbox.draw(floor(xa), floor(ya));
  risers.draw(xa);
  limg.drawLinearImage(0,0, floor(xa), floor(ya));
  fill(CHROMAGRN);
  quad(xa+ya,0,width,0,width,ya,xa,ya);
  saveFrame();
  println(frameCount);

} 
