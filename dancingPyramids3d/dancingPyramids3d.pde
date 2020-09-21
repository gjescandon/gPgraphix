Pyramid pyramids;
PImage bgimg;
NoizeBob xbob, ybob;
NoizeBob sbob, cbob;
float loopTimer;
void setup() {
  size(720, 720, P3D);
  
  pyramids = new Pyramid();
      bgimg = loadImage("pattern11_contrast.png");
  xbob = new NoizeBob(5., 0.1*random(1), 0.5);
  ybob = new NoizeBob(5., 0.1*random(1), 0.5);
  sbob = new NoizeBob(0.1, 0.1*random(1), 0.5);
  cbob = new NoizeBob(0.1, 0.1*random(1), 0.5);
  loopTimer = 0.;
}

void draw() {
  background(70);
  loopTimer = 0.01*frameCount;

  if (loopTimer < 8*PI) {
  colorMode(RGB, 100);
  pushMatrix();
  translate(0,0,0-200);
  image(bgimg,0-.25*width+xbob.getBob(),0-0.25*height + ybob.getBob(),1.5*width,1.5*height);
  popMatrix();
   translate(0.5*width-25,0.5*height-15);
   pushMatrix();
   rotateX(sin(loopTimer)*(0.4*sin(0.003*frameCount + sbob.getBob())));
   rotateY(sin(loopTimer)*(0.4*cos(0.003*frameCount)+ cbob.getBob()));
   pyramids.drawPyramid();
   popMatrix();
   //directionalLight(100, 100, 100, 0, 0, -1);
  }
    
}
