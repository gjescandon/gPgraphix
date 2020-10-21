class NoizeBob {
  float bob, bobInc;
  float factor;
  int nload;
  float falloff;
  float breakDuty =0.8;
  
  NoizeBob() {
    float factor = 30.0;
    float falloff = 0.5;
    float inc = 0.01;
    init(inc, factor, falloff);
  }
  
  NoizeBob(float inc, float factor_, float falloff_) {
    init(inc, factor_, falloff_);
  }
  
  NoizeBob(float inc, float factor_, float falloff_, float breakDuty_) {
    init(inc, factor_, falloff_);
    breakDuty = breakDuty_;
  }
  
  
  void init(float inc, float factor_, float falloff_) {
    bob = 0.0;
    bobInc = inc * random(1);
    factor = factor_;
    nload = 5;
    falloff = falloff_;        
  }


  float getBob() {
   noiseDetail(nload, falloff);
   bob += bobInc;
   return factor * noise(bob);
  }

  float getBobWithBreak() {
   getBob();
   if (random(1) > breakDuty) {
     bob += 20 * random(1) * bobInc;
   }
   return factor * noise(bob);
  }
}


class EmptyTemplate {

  // CONSIDER PGRAPHICS
  
  PImage getEmpty() {
    return getEmpty(width, height);
  }

  PImage getEmpty(int win, int hin) {
    PImage img = createImage(win, hin, ARGB);
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] = color(5,5,5,0); 
    }
    img.updatePixels();
       
    return img;
  }

  PImage getEmptyGrey() {
    PImage img = createImage(width, height, ALPHA);
    img.loadPixels();
    for (int i = 0; i < img.pixels.length; i++) {
      img.pixels[i] = color(0, 90, 102, i % img.width * 2); 
    }
    img.updatePixels();
       
    return img;
  }}
