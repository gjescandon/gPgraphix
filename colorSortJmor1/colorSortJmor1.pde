import java.util.Map;
PImage img, imgCs;
color[] carr;
int cl;
ColorSortImg csi;


void setup() {
  size(720,720);
  frameRate(240);
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
  if (frameCount < 10) {
    image(img, 0.02 * width, 0.02 * height, width * 0.96, height * 0.96);
  } else {
    //image(csi.fall_perpetual(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96); // looks good after full height is processing
    //image(csi.fall_bottom_chop(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96); // meh ok
    //image(csi.fall_bottom_layers(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96); //multi layer compressed clones - falling from top
    //image(csi.fall_splash1(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96); // up and down - loses bubbles
    //image(csi.fall_splash2(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96); // up and down - loses bubbles
    //image(csi.fall_gradual_bottom(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96); // slow raster falls
    image(csi.fall_splash2(), 0.02 * width, 0.02 * height, width * 0.96, height * 0.96);
  } 
  //saveFrame();
}
