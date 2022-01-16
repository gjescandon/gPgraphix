Collidescope cscope;
Collidescope[] csArr;
int rdim, cntX, cntY, cnt;
int BPM = 102;
NoizeBob nbob,sbob;

void setup() {
  size(720,720, P3D);
  init();
}

void init() {
  rdim = 2 + floor(random(3));
  //rdim = 4;
  cntX = rdim;
  cntY = rdim;
  cnt = cntX*cntY;
  csArr = new Collidescope[cnt];
  for (int i = 0; i < cnt; i++) {
   csArr[i] = new Collidescope();
  }
  
  nbob = new NoizeBob(1., 0.1, 0.7);
  sbob = new NoizeBob(1., 0.1, 0.5);
}
void draw() {
  if (frameCount % bpmms() == 0) init();
  background(0);
  nbob.getBob();
  sbob.getBob();
  int xoff = floor(1.0*width/cntX);
  int yoff = floor(1.0*height/cntY);
 
  for (int i = 0; i < cntX; i++) {
    for(int j = 0; j < cntY; j++) {
      pushMatrix();
      
      float zoff = 0.;
      if (i==1) {
        zoff += 10.;
      }
      if (j==1) {
        zoff += 10.;
      }
      zoff = 0.;
      translate((i+0.5)*xoff,(j+0.5)*yoff, zoff);
      pushMatrix();
      
      // 3: scale(1. + 0.2*sbob.getBobTail(3*i+j));
      // 2: scale(1. + 0.9*sbob.getBobTail(3*i+j));
      // 4: scale(0.6 + 0.2 * sbob.getBobTail(3*i+j));
      switch(rdim) {
        case 2: 
          scale(1. + 0.9*sbob.getBobTail(3*i+j));
          break;
        case 3: 
          scale(1. + 0.2*sbob.getBobTail(3*i+j));
          break;
        default:
          scale(0.6 + 0.2 * sbob.getBobTail(3*i+j));
          break;
      }
      csArr[cntX*i+j].draw();
      popMatrix();
      popMatrix();
    }
  }
  
  println(frameCount);
  saveFrame();
  
}

float bpmms() {
  float ret  = 0.;
  ret = floor(1000*0.5*60/BPM);
  
  return ret;
}
