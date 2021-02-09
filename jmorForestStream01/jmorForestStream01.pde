PImage nuImg;
ImageBox02Collection imgBoxs;
int imgOff;

void setup() {
  size(720,720, P3D);
  imgOff = 400;
  //nuImg = loadImage("jmor01/forestStream_1280w.jpg");
  nuImg = loadImage("forestStream_1280w.jpg");
  //nuImg = loadImage("foil.jpg");
  imgBoxs = new ImageBox02Collection(nuImg, imgOff);

}

void draw() {
  colorMode(HSB,1.0);
  background(0.3);
  image(nuImg,0, 0-imgOff);
  imgBoxs.drawCollection();
  //saveFrame();
}
