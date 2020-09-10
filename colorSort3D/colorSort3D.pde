import java.util.Map;
PImage img, imgCs;
color[] carr;
int cl;
ColorSortImg csi;


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
  
}

void draw() {
  background(0);
  //image(csi.fall_splash(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96);
  csi.draw3d();
  saveFrame();
}
