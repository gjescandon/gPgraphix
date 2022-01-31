Boxzz bxz;
QuilezFunctions qf;
NoizeBob cb,zbob, xbob, ybob, swb;
TriangleBuilder[] tb;
float rOff;
int cnt;


/****

good : interestin 3d action
*/

void setup() {
  size(720,720, P3D);
  colorMode(HSB,1.);
  cnt = 8;
  rOff = (15.-1.)/7.;
  // frameRate = 60 per sec default
  tb = new TriangleBuilder[cnt];
  for (int i = 0; i < cnt; i++) {
   tb[i] = new TriangleBuilder(); 
  }
  qf = new QuilezFunctions();
  cb = new NoizeBob(1.0, 0.002, 0.5);
  swb = new NoizeBob(1.0, 0.001, 0.9);
  zbob = new NoizeBob(1.0, 0.01, 0.3);
  xbob = new NoizeBob(PI, 0.00001, 0.3);
  ybob = new NoizeBob(PI, 0.00001, 0.3);
  background(0.);
  }

void draw() {
  colorMode(HSB,1.0);
  stroke(0.6);
  fill(1.0);
  background(0.);
  
  
  directionalLight(1.,0.,1.,sin(xbob.getBob()-HALF_PI),cos(ybob.getBob()-HALF_PI),-1);
   translate(0.5*width, 0.4*height);
   rotateX(0.7*PI/2);
  
  for (int i = 0; i < cnt; i++) {
    pushMatrix();
    if (i == 0) {
      tb[i].draw();
    }
    
    if (i > 0 && ((tb[i-1].getRad() < tb[i].getRad()) || tb[i-1].getRad() > rOff)) {
      tb[i].draw();
    } 
    popMatrix();
  }
  
  println(frameCount);

  //saveFrame();
} 
