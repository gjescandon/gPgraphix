PImage nuImg;
ImageBox02Collection imgBoxs;
int imgOff;

void setup() {
  size(1280,720, P3D);

  //nuImg = loadImage("forestStream_1280w.jpg");
  nuImg = loadImage("foil.jpg");
  
  imgOff = 0;
  if (nuImg.height > 720) imgOff = floor(random(nuImg.height-720));
  imgBoxs = new ImageBox02Collection(nuImg, imgOff);

}

void draw() {
  colorMode(HSB,1.0);
  background(0.3);
  image(nuImg,0, 0-imgOff);
  imgBoxs.drawCollection();
  println(frameCount);
  //saveFrame();
}
