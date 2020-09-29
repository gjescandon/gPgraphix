class CyrusRoller {
 PImage img;
 Roller[] rollers;
 int rmax = 21;
 int yoff, xoff;
 EmptyTemplate et;
 NoizeBob noizeDuty;
 void setup() {
   
  et = new EmptyTemplate();
  img = et.getEmpty();
  
  rollers = new Roller[rmax];
  
   for (int i = 0; i < rmax; i++) {
     rollers[i] = new Roller();
   } 
   
   yoff = height-1;
   xoff = 10;
   
   noizeDuty = new NoizeBob(1., 0.5, 0.3);

 }
  
 void draw() {

      point(xoff, yoff);
      img.loadPixels();

      PImage tempc = et.getEmpty(width, 1);
      tempc.loadPixels();
      for(int j= 0; j < rmax; j++) {
        int yoff = rollers[j].getYoff();
        int xmin = yoff * width  + rollers[j].getXmin();
        xmin = xmin < 0 ? 0 : xmin;
        int xmax = yoff * width  + rollers[j].getXmax();
        xmax = xmax > img.pixels.length - 1 ? img.pixels.length - 1 : xmax;
        color rpaint = rollers[j].getPaint();
        for (int i = xmin; i < xmax; i++) {
          float duty = noizeDuty.getBob();
          if (duty < random(1)) img.pixels[i] = rpaint;
        }
      }
      
    img.updatePixels();    
    image(img, 0, 0);
    
 }
  
  
 class Roller {
  float slope;
  color paint;
  float aindex;
  int xindex;
  int yindex, ynow, yoffset;
  int rwidth;
  float myduty;
  int xmin, xmax;
  boolean isDelayed;
  int frameStartPoint;
  NoizeBob noizeBob;
  
  Roller() {
    init();
  }
  
  boolean isDelayed() {
    if (isDelayed && frameCount < frameStartPoint) {
      return true;
    } else {
      isDelayed = false;
      return false;
    }
  }
  
  int getYoff() {
    if (isDelayed()) return ynow;
    ynow--;
    if (ynow <= 0) init();
    
    float noff = noizeBob.getBob();
    
     xmin = floor(xindex + noff + (yindex-ynow) * sin(slope) - 0.5 * rwidth);
     xmin = xmin < 0? 0 : xmin;
     xmin = xmin > width - 1 ? width -1 : xmin;

     xmax = floor(xindex + noff + (yindex-ynow) * sin(slope) + 0.5 * rwidth);
     //xmax = floor(xindex + 0.5 * rwidth);
     xmax = xmax < 0? 0 : xmax;
     xmax = xmax > width - 1 ? width -1 : xmax;

    return ynow;
  }
  
  int getXmax() {
    return xmax;
  }
  
  int getXmin() {
    return xmin;
  }
  
  color getPaint() {
    return paint;
  }
  
  void init() {
    float slopeAngle = 0.067; // 0.125;
    float xoffset = 0.3; //0.5;;
    int xdrift = 50; //100;
    slope = random (-PI * slopeAngle, PI * slopeAngle);
    colorMode(HSB, 255, 255, 255);
    paint = color(random(80,100), random(56, 254), random(56, 254));
    aindex = 0.8 * 0.1 * random(1);
    rwidth = 50 + floor(random(100));
    yindex = height;
    xindex = floor(width * xoffset + floor(xdrift *(random(2) - 1))); 
    ynow = yindex;
    myduty = 0.6 + 0.3 * random(1);
    yoffset = 0; //floor(0.0 - random(34));
    isDelayed = true;
    frameStartPoint = frameCount + floor(random(230));
    noizeBob = new NoizeBob();
  }
}
 }
