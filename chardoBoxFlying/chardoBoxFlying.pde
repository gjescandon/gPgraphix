Boxzz bxz;
BoxzzMarch bmar;
QuilezFunctions qf;
GeoFunctions gf;
MaskCirclesAlt mask;
color chromaGrn;
float HPI, QPI, EPI;
int BPM, frameBump, frameInc;
int dogInc;

NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1920,1080, P3D);
  HPI = 0.5*PI;
  QPI = 0.25*PI;
  EPI = 0.125*PI;
  cnt = 3  ;
  dogInc = 0;
  
  // frameRate = 60 per sec default
  bxz = new Boxzz();
  bmar = new BoxzzMarch();
  
  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  mask = new MaskCirclesAlt();
  colorMode(HSB,1.);
  chromaGrn = color(0.3, 0.98, 0.96);

  BPM = 120;
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  }

void draw() {
  background(chromaGrn);
  //background(0.);
  directionalLight(1., 0., 1., 0.1*sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1.);

  if (frameCount > frameBump) {
   //bxz.init();
   frameBump = frameCount + frameInc;
  }
  pushMatrix();
  translate(0., 0. , -200.);
  //mask.draw();
  popMatrix();
  
  //bxz.drawBoxCircling();
  translate(0.5*width,0);
  rotateY(0.001*frameCount);
  pushMatrix();
  translate(-0.5*width,0);
  
  //bmar.drawVert();
  bmar.draw();
  if (frameCount > 3000) bmar.drawOrth(dogInc++);
  //bmar.drawBounce(1);
  popMatrix();
  
  //saveFrame();
  println(frameCount);
  
} 


void floatTheBox (Boxzz bxz) {

  }


void floatTheBoxCircle (Boxzz bxz) {
  float freq = 0.01 * frameCount; 
  pushMatrix();
  rotateX(QPI);
  rotateZ(EPI);
  translate(0,0,-200);
  float xx  = 0.5*width*cos(freq);
  float yy  = 0.5*height*sin(freq);
  println("" + cos(freq) + " " + sin(freq) );
  //if (freq%PI < 1.0){
    translate(xx, yy);
    bxz.draw();
  //}
  popMatrix();
}
