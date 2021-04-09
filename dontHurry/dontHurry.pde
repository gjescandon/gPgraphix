BigBang bbang, bbang2;
Buables buabs;
FlowerLinda fl;

QuilezFunctions qf;
NoizeBob cb,zbob, xbob, ybob, swb;
int cnt;
void setup() {
  size(1280,720, P3D);
  cnt = 3  ;
  // frameRate = 60 per sec default
  bbang = new BigBang();
  bbang2 = new BigBang();
  buabs = new Buables();
  fl = new FlowerLinda();
  
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(1., 0.001, 0.3);
  ybob = new NoizeBob(1., 0.001, 0.3);
  }

void draw() {
  colorMode(HSB,1.0);
  background(0.2);

  float t0 = 1.0 * TWO_PI / cnt;
  float off = 0.5*height;
  
  translate(0.5*width, 0.5*height, 0);
  //cb.getBob();
  
  rotateZ(sin(0.001*frameCount + zbob.getBob()));
  /*
  for (int i = 0; i < cnt; i++) {
    pushMatrix();
    translate(off*sin(i*t0)+off*0.5*xbob.getBobTail(10+i*100),off*cos(i*t0)+ off*0.5*ybob.getBobTail(10+i*100));
    scale(0.6);
    bxz.draw();
    popMatrix();
  }
  */
  
  float rad = 0.2*width*(1+swb.getBob());
  translate(0,0,-35);
  pushMatrix();
  buabs.draw(rad);
  bbang.draw(rad);
  popMatrix();

  translate(0,0,35);
  fl.draw();
  bbang2.draw(0.2*rad);
  println(frameCount);
  //saveFrame();
} 
