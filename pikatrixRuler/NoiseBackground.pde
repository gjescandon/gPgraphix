class NoiseBackground {
  color[] cArr = new color[13];
  PImage imgBkgd;
 NoiseBackground() {
   setDefaultColors();
    imgBkgd = createImage(width, height, ARGB);
    imgBkgd.loadPixels();
  
    for (int i = 0; i < imgBkgd.pixels.length; i++) {
        if (random(1) > 0.96) {
          imgBkgd.pixels[i] = cArr[floor(random(0, cArr.length -1))];
        }
    } 
    imgBkgd.updatePixels();
    
 }
 
 NoiseBackground(PImage bimg) {
    setRandomColors(bimg);
 }
 
void draw() {
  PImage imgBkgd = createImage(width, height, ARGB);
  imgBkgd.loadPixels();

  for (int i = 0; i < imgBkgd.pixels.length; i++) {
      if (random(1) > 0.96) {
        imgBkgd.pixels[i] = cArr[floor(random(0, cArr.length -1))];
      }
  } 
  imgBkgd.updatePixels();
  image(imgBkgd, 0, 0);
}

void drawOnce() {
  image(imgBkgd, 0, 0);
}

void setRandomColors(PImage bimg) {
 for (int i = 0; i < cArr.length; i++ ) {
  cArr[i] =  bimg.pixels[floor(random(0, img.pixels.length -1))];
 }
}
  
  
  color getColor() {
   return cArr[floor(random(0, cArr.length - 1))]; 
  }
  
  void setDefaultColors() {
    cArr[0] = color(0, 0, 128);
    cArr[1] = color(0, 0, 256);
    cArr[2] = color(0, 64, 128);
    cArr[3] = color(0, 64, 256);
    cArr[4] = color(0, 128, 128);
    cArr[5] = color(0, 128, 256);
    cArr[6] = color(0, 128, 128);
    cArr[7] = color(0, 192, 128);
    cArr[8] = color(0, 192, 256);
    cArr[9] = color(0, 256, 128);
    cArr[10] = color(0, 256, 256);
    cArr[11] = color(0, 0, 0);
    cArr[12] = color(0, 0, 0);
  }

}
