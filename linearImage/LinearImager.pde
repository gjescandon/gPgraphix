/**
 * Linear Image. 
 * 
 * Click and drag mouse up and down to control the signal. 
 * Press and hold any key to watch the scanning. 
 */

PImage img, img2;
int direction = 1;
float signal;

void loadImage() {
  img = loadImage("sunflower1.jpg");
  img2 = loadImage("sunflower1.jpg");
  img.loadPixels();
  //loadPixels();
}

void drawLinearImage() {
  if (signal > img.height-1 || signal < 0) { 
    direction = direction * -1;
  }
    signal += (0.3*direction);
    int signalOffset = int(signal)*img.width;
    //println("soffset " + signalOffset);
    for (int y = 0; y < img.height; y++) {
      arrayCopy(img.pixels, signalOffset, img2.pixels, y*img.width, img.width);
    }
   img2.updatePixels();
   image(img2, 0, 0);
}

color getColor() {
  int pint = round(img.pixels.length / 2 + img.pixels.length / 4 * random(-1,1));
  return img.pixels[pint];
}
