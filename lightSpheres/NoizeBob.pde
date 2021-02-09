class NoizeBob {
  float bob, bobInc;
  float factor;
  int nload;
  float falloff;
  NoizeBob() {
    float factor = 30.0;
    float falloff = 0.5;
    init(factor, falloff, 5, 0.01);
  }
  
  NoizeBob(float factor_, float falloff_) {
    init(factor_, falloff_, 5, 0.001);
  }
  
  NoizeBob(float factor_, float falloff_, int nLoad_) {
    init(factor_, falloff_, nLoad_, 0.01);
  }
  
  NoizeBob(float factor_, float falloff_, int nLoad_, float bInc) {
    init(factor_, falloff_, nLoad_, bInc);
  }
  

  void init(float factor_, float falloff_, int load_, float bobInc_) {
    bob = 0.0;
    bobInc = bobInc_ * random(1);
    factor = factor_;
    nload = load_;
    falloff = falloff_;        
  }

  float getBob() {
   noiseDetail(nload, falloff);
   bob += bobInc;
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
