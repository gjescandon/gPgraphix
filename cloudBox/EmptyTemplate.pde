class NoizeBob {
  float bob, bobInc;
  float factor;
  int nload;
  float falloff;
  NoizeBob() {
    float factor = 30.0;
    float falloff = 0.5;
    init(factor, falloff);
  }
  
  NoizeBob(float factor_, float falloff_) {
    init(factor_, falloff_);
  }
  
  void init(float factor_, float falloff_) {
    bob = 0.0;
    bobInc = 0.001 * random(1);
    factor = factor_;
    nload = 5;
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
