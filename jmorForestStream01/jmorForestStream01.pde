PImage nuImg;
ImageBoxCollection imgBoxs;

void setup() {
  size(1280,720, P3D);
  //nuImg = loadImage("jmor01/forestStream_1280w.jpg");
  nuImg = loadImage("forestStream_1280w.jpg");
  imgBoxs = new ImageBoxCollection(nuImg);

}

void draw() {
  colorMode(HSB,1.0);
  background(0.3);
  image(nuImg,0,0);
  imgBoxs.drawCollection();
}
