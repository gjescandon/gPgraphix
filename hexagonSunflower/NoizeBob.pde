class NoizeBob {
  float bob, bobInc;
  float factor;
  int nload;
  float falloff;
  
  NoizeBob() {
    float factor = 30.0;
    float falloff = 0.5;
    init(factor, falloff, 0.01);
  }
  
  NoizeBob(float factor_, float falloff_) {
    init(factor_, falloff_, 0.01);
  }
  
  NoizeBob(float factor_, float falloff_, float inc_) {
    init(factor_, falloff_, inc_);
  }
  
  void init(float factor_, float falloff_, float inc_) {
    bob = 0.0;
    bobInc = inc_ * random(1);
    factor = factor_;
    nload = 5;
    falloff = falloff_;        
  }

  float getBobPlusAlpha(int alpha) {
   noiseDetail(nload, falloff);
   return factor * noise(bob + alpha * bobInc);
  }
  
  float getBobInc() {
   noiseDetail(nload, falloff);
   bob += bobInc;
   if(falloff > 1.0) {
    println("WARNING: Falloff (" + falloff + ") should be less than 1"); 
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
  }
}
