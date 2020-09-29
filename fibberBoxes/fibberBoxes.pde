PImage nuImg;

NoizeBob zBob;
NoizeBob_2D yBob;
QuilezFunctions qeq;
AutoPalette apal;
color bc;

void setup() {
  size(720,720, P3D);
  colorMode(HSB, 1.);
  
  EmptyTemplate mt = new EmptyTemplate();
  nuImg = mt.getEmpty();
  zBob = new NoizeBob(200., 0.003, 0.7);
  yBob = new NoizeBob_2D(200., 0.003, 0.7);
  apal = new AutoPalette(random(1));
  bc = apal.getColor(random(1));
  qeq = new QuilezFunctions();
}

void draw() {
  background(bc);
  int dmax = 8;
  float bw = 1.*width/dmax;
  zBob.getBob();
  yBob.getBob();
  //translate(0,0,-300);
  directionalLight(1.,0.,1.,0.5*sin(0.01*frameCount),0.,-1);
  //rotateX(0.1*sin(0.01*frameCount));
  rotateX(-0.4);
  for (int x = 0; x < dmax; x++){
    for (int z =0; z < dmax; z++) {
      pushMatrix();
      //translate((x+0.5)*bw,300+zBob.getBobTail(x*dmax+z), 200-(z+0.5)*bw);
      translate((x+0.5)*bw, 300+zBob.getBobTail(x*dmax+z), 200-(z+0.5)*bw);
      box(0.618*bw);
      popMatrix();
    }
  }
 
}
