/*


****** KINDA BORING


*/


QuilezFunctions qf;
GeoFunctions gf;
AutoPalette apal;

int frameBump, frameInc;
int BPM = 96;

NoizeBob cb,zbob, xbob, ybob, swb;
float ran1, ran2, ran3;

int cnt;
void setup() {
  size(720,720, P3D);
  init();
  }
  
void init() {
  frameInc = 1000*1*60/BPM;
  frameBump = frameInc;
  
  cnt = 6 + floor(random(8)) ;
  println(cnt);
  // frameRate = 60 per sec default

  qf = new QuilezFunctions();
  gf = new GeoFunctions();
  
  cb = new NoizeBob(1.0, 0.003, 0.6);
  swb = new NoizeBob(1.0, 0.01, 0.7);
  zbob = new NoizeBob(1.0, 0.006, 0.5);
  xbob = new NoizeBob(1., 0.01, 0.5);
  ybob = new NoizeBob(1., 0.001, 0.5);
  
  colorMode(HSB,1.);
  apal = new AutoPalette();
  
  ran1 = random(1);
  ran2 = random(1);
  ran3 = random(1);
}

void draw() {
  
  if (frameCount > frameBump) {
    init();
   frameBump = frameCount+frameInc;
  }
  background(0.1);
  directionalLight(1., 0., 1., 0.1*sin(xbob.getBob()), 0.1*cos(ybob.getBob()), -1.);

  float x1, x2, y1, y2, z1, z2;
  float cx1, cx2, cy1, cy2, cz1, cz2;
  
  x1 = 100;
  y1 = 100;
  x2 = 600;
  y2 = 600;
  
  noFill();
  
  stroke(.9);
  
  float rM = 50. + 10.*zbob.getBob();
  float r = 300. + 100. * xbob.getBob();
  
  float tInc = 0.1* PI;
  translate(0.5*width, 0.5*height, 5. +  (10. + (pow(sin(0.01*frameCount + ran2),3))));
  rotate(ran1 + 2.* ybob.getBob());

  tInc = gf.getGolden() * zbob.getBobTail(10); 
  float zb = map(zbob.getBobTail(10), 0. , 1., 0.3, 0.01);
  //zb = abs(sin(0.01*frameCount));
  
  tInc = gf.getGolden() * zb; 
  int max = cnt;
  float tM = PI/max;
  float theta = 0.;
  swb.getBob();
  cb.getBob();
  
  for (int i = 0 ; i < max; i++) {
    theta = i * gf.getGolden();
    theta = 1. * i * PI / max;
    rM = 200. + 200.*cb.getBobTail(i*10);
    //rM = 300. + 200.*abs(sin(0.1*frameCount));
    
    x1 = rM * cos(theta);
    x2 = rM * cos (theta + PI);
    y1 = rM * sin(theta);
    y2 = rM * sin(theta + PI);
    z1 = 0. + 2. - 4. *i * swb.getBobTail(i);
    z2 = 0. - 2. + 4. *i * swb.getBobTail(i);

    r = rM + 100. * xbob.getBob();
    for (float j = 0 ; j < TWO_PI; j += tInc) {
        cx1 = x1 + r *cos(j);
        cx2 = x2 + r *cos(j );
        cy1 = y1 + r *sin(j);
        cy2 = y2 + r *sin(j );
        cz1 = z1 + r *sin(theta);
        cz2 = z2 + r *sin(theta + PI);
        
        bezier(x1, y1, z1, cx1, cy1, cz1, cx2, cy2, cz2,  x2, y2, z2);
    }
  }

  //saveFrame();
  println(frameCount);

} 
