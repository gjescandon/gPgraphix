/**
 * Linear Image. 
 * 
 * Click and drag mouse up and down to control the signal. 
 * Press and hold any key to watch the scanning. 
 */

PImage img;
int direction = 1;

float signal; // the vertical cursor
int colorNoiseSize = 13;
float cursorH; // horizontal cursor

NoiseBackground noiseBkgd;
PikatrixRuler pruler;
NoiseBox noiseBox;

void log(String msg) {
 println(msg); 
}

void setup() {
  size(1280, 720);
  stroke(255);
  img = loadImage("djivanMask.jpg");
  img.loadPixels();
  loadPixels();
  
  cursorH = 0;
  noiseBkgd = new NoiseBackground();
  noiseBox = new NoiseBox();
  pruler = new PikatrixRuler();
}

void draw() {
  background(0);
  noiseBkgd.draw();
  noiseBox.drawNbox();
  pruler.drawRulerV();
  //saveFrame();
}

class PikatrixRuler {
  
  float driftX, driftY, driftXinc, driftYinc;
  float signal; // the vertical cursor
  int colorNoiseSize = 13;
  float cursorH; // horizontal cursor

 PikatrixRuler() {
   basicSetup();
 }
 
void drawRulerV() {
  int rw = floor(0.1 * width);
  int rh = floor(0.6 * height);
  log(rw + ":: " + rh);
  
  PImage imgRuler = createImage(rw, rh, ARGB);
  imgRuler.loadPixels();
  
  //scan horizontally and apply color layers
    if (signal > img.width-5 || signal < 5) { 
    direction = direction * -1;
  }
  
  if (mousePressed == true) {
    signal = abs(mouseY % img.height);
  } 
  else {
    signal += (0.3*direction);
  }  

  if (keyPressed == true) {
    set(0, 0, img);
    line(0, signal, img.width, signal);
  } 
  else {
    /*
    1. get color pixel moving down a colum
    2. apply selected color to target row
    */
    for (int y = 0; y < imgRuler.height; y++) {
      float ymap = map(y, 0, imgRuler.height, 0, img.height);
      int offset = floor(signal + ymap * img.width);
      if (offset > img.pixels.length - 1) {
       offset = 0; 
      }
      color lcolor = img.pixels[offset];
      for (int x = 0; x < imgRuler.width; x++) {
         imgRuler.pixels[x + y * imgRuler.width] = lcolor; 
      }
    }
    imgRuler.updatePixels();
  }  
  
  log(imgRuler.width + " :: " + imgRuler.height);
  image(imgRuler, driftX(0.2 * (width - rw)), driftY(0.4 * (height - rh)));
}
 
float jitter(float n) {
  return n + random(-1,1);
}

float jitter(float n, float jsize) {
  return n + random(0-jsize,jsize);
}

float driftX(float n) {
  driftX += driftXinc;
  if (driftX > PI) {
    driftX = 0.0;
  }
  return n + 100 * noise(sin(driftX));
} 
float driftY(float n) {
  driftY += driftYinc;
  if (driftY > PI) {
    driftY = 0.0;
  }
  return n + 50 * noise(cos(driftY));  
} 

  
  void basicSetup() {
       driftX = 0.0; 
   driftY = 0.0;
   driftXinc = random(1) * 0.01; 
   driftYinc = random(1) * 0.01; 
   signal = 10.0;
  }
}
