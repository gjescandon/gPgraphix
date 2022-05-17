/**
 * Linear Image. 
 * 
 * Click and drag mouse up and down to control the signal. 
 * Press and hold any key to watch the scanning. 
 */
class LinearImage{
    PImage img, imgSrc;
    int direction = 1;
    int signalOffset;
    float signal;
    EmptyTemplate et;

    LinearImage(String path) {
      imgSrc = loadImage(path);
      imgSrc.loadPixels();
      et = new EmptyTemplate();
      img = et.getEmpty(imgSrc.width,imgSrc.height);

      signalOffset = 1;//floor(0.5*imgSrc.width*imgSrc.height);
      signal = 100;//signalOffset; 
 }
    
    void drawLinearImage(int xa, int ya, int xb, int yb)  {
      if (signal > imgSrc.height-1 || signal < 0) { 
        direction = direction * -1;
      }
        signal += (0.3*direction);
        int signalOffset = int(signal)*imgSrc.width;
        //println("soffset " + signalOffset);
        for (int y = 0; y < imgSrc.height; y++) {
          arrayCopy(imgSrc.pixels, signalOffset, img.pixels, y*imgSrc.width, imgSrc.width);
        }
       img.updatePixels();
       image(img,xa, ya, xb, yb);
    }

    void drawVert(int xa, int ya, int xb, int yb)  {
      if (signal > imgSrc.height-1 || signal < 0) { 
        direction = direction * -1;
      }
        signal += (0.3*direction);
        int signalOffset = int(signal)*imgSrc.width;
        //println("soffset " + signalOffset);
        for (int y = 0; y < imgSrc.height; y++) {
          arrayCopy(imgSrc.pixels, signalOffset, img.pixels, y*imgSrc.width, imgSrc.width);
        }
        
        
       img.updatePixels();
       pushMatrix();
       translate(xb+xa, 0.6*height);
       pushMatrix();
       rotateZ(0.5*PI);
       translate(-0.5*img.width, -0.5*height);
       image(img,0, 0);
       popMatrix();
       popMatrix();
    }
    
    color getColor() {
      int pint = round(imgSrc.pixels.length / 2 + imgSrc.pixels.length / 4 * random(-1,1));
      return imgSrc.pixels[pint];
    }
}
