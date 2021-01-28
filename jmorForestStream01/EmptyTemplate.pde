class NoizeBob {
  float bob, bobInc;
  float factor;
  int nload;
  float falloff;
  NoizeBob() {
    float factor = 30.0;
    float falloff = 0.5;
    float inc = random(1);
    init(factor, inc, falloff);
  }
  
  NoizeBob(float factor_, float inc_, float falloff_) {
    init(factor_, inc_, falloff_);
  }
  
  void init(float factor_, float inc_, float falloff_) {
    bob = 0.0;
    bobInc = inc_;
    factor = factor_;
    nload = 5;
    falloff = falloff_;        
  }

  float getBob() {
   noiseDetail(nload, falloff);
   bob += bobInc;
   return factor * noise(bob);
  }
  
  float getBobTail(int inc_) {
   noiseDetail(nload, falloff);
   return factor * noise(bob + bobInc * inc_);
  }  
}

class NoizeBob_2D {
  float bob1, bob2, bob1Inc, bob2Inc;
  float factor;
  int nload;
  float falloff;
  
  NoizeBob_2D() {
    float factor = 30.0;
    float falloff = 0.5;
    float inc = 0.1;
    init(factor, inc, falloff);
  }
  
  NoizeBob_2D(float factor_, float inc_, float falloff_) {
    init(factor_, inc_, falloff_);
  }
  
  void init(float factor_, float inc_, float falloff_) {
    bob1 = bob2 = 0.0;
    bob1Inc = inc_ * random(1);
    bob2Inc = inc_ * random(1);
    factor = factor_;
    nload = 5;
    falloff = falloff_;        
  }

  float getBob() {
   noiseDetail(nload, falloff);
   bob1 += bob1Inc;
   bob2 += bob2Inc;
   return factor * noise(bob1, bob2);
  }

  float getBobtail(float inc_) {
   noiseDetail(nload, falloff);

   return factor * noise(bob1 + inc_ * bob1Inc, bob2 + inc_ * bob2Inc);
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
  
