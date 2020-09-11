import java.util.Map;
PImage img, imgCs;
color[] carr;
int cl;
ColorSortImg csi;
float theta, thetaInc;
NoizeBob nbob;
void setup() {
  size(720,720, P3D);
  frameRate(30);
  cl = 36;
  carr = new color[cl];
  
  for (int i = 0; i < cl; i++) {
     carr[i] = color(floor(255*random(1)),floor(255*random(1)),floor(255*random(1)));
  }
  img = loadImage("jmor01/seaShellFoam_720.jpg");
  csi = new ColorSortImg(img);
  
  theta = 0.;
  thetaInc = 0.1;
  float factor = 0.1;
  float inc = 0.001;
  float falloff = 4.;
  nbob = new NoizeBob(factor, inc, falloff);
  
}

void draw() {
  background(0);
  if(frameCount < 250) {
    image(img,0,0,width,height);
  } else {
    csi.draw3d();
  //directionalLight(255, 255, 255, 0., 1., 0.6*abs(sin(theta)));
  //theta += thetaInc;
  }
  saveFrame();
}
