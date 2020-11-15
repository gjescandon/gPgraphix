class NoiseBox {
  PImage[] imgArr;
  color[] cArr = new color[13];
  int imgCnt = 8;
  
  float loadFactor = 0.3;
  float pixelLoad = 0.1;
  PImage imgBkgd;
  float nx, ny, nw, nh;
  NoiseBox() {
    setDefaultColors();
      imgBkgd = getNoiseBox();
      imgBkgd.loadPixels();

      for (int i = 0; i < imgBkgd.pixels.length; i++) {
        if (random(1) < jitter(pixelLoad, 0.2)) {
          imgBkgd.pixels[i] = cArr[floor(random(0, cArr.length -1))];
        }
      } 
      imgBkgd.updatePixels();
      nx = jitter(0.2 * width,200);
      ny = jitter(0.2 * height, 200);
      nw = jitter(0.5 * width,400);
      nh = jitter(0.5 * height, 400);
    
  }
  
  void drawNbox() {
    
    if (random(1) > loadFactor) {
      return;
    }
    
    moveNoise();
    
  }

  void drawNboxOnce() {
    
      image(imgBkgd, nx, ny, nw, nh);

    
  }
  
  void moveNoise() {

      PImage imgBkgd = getNoiseBox();
      imgBkgd.loadPixels();

      for (int i = 0; i < imgBkgd.pixels.length; i++) {
        if (random(1) < jitter(pixelLoad, 0.2)) {
          imgBkgd.pixels[i] = cArr[floor(random(0, cArr.length -1))];
        }
      } 
      imgBkgd.updatePixels();
      image(imgBkgd, jitter(0.2 * width,200), jitter(0.2 * height, 200), jitter(0.5 * width,400), jitter(0.5 * height, 400));
 }
  
  PImage getNoiseBox() {
     PImage imgBkgd = createImage(floor(width - 0.8 * random(1)), floor(height - 0.8 * random(1)), ARGB);
    return imgBkgd;
 
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
    cArr[11] = color(256, 256, 256);
    cArr[12] = color(256, 256, 256);
  }  
  
  float jitter(float n, float jfactor) {
    return n + jfactor * random(-1, 1); 
  }
}
