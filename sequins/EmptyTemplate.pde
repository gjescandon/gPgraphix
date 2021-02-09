class NoizeBob {
  float bob, bobInc;
  float factor;
  int nload;
  float falloff;
  NoizeBob() {
    float factor = 30.0;
    float falloff = 0.5;
    float incIn = 0.001;
    init(incIn, factor, falloff);
  }
  
  NoizeBob(float incIn, float factor_, float falloff_) {
    init(incIn, factor_, falloff_);
  }
  
  void init(float incIn, float factor_, float falloff_) {
    bob = 0.0;
    bobInc = incIn * random(1);
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

class NoizeBob_3D {
  
  // xinc, yinc: the size of the waves in x-y plane
  // zinc: the freqency of the oscillations
  float xoff, yoff, zoff;
  float xinc, yinc, zinc;
  float factor;
  int nload;
  float falloff;
  
  NoizeBob_3D() {
    float factor = 30.0;
    float falloff = 0.5;
    float incIn = 0.01;
    float incZin = 0.005;
    init(incIn, incZin, factor, falloff);
  }
  
  NoizeBob_3D(float incIn, float incZin, float factor_, float falloff_) {
    init(incIn, incZin, factor_, falloff_);
  }
  
  void init(float incXYin , float incZin, float factor_, float falloff_) {

    xoff = 0.0 + random(1);
    yoff = 0.0; 
    zoff = 0.0 + random(1);
    xinc = incXYin;
    yinc = incXYin ;
    zinc = 0.01; //incZin;
    
   factor = factor_;
    nload = 4;
    falloff = falloff_;        
  }
  
  void resetYoff() {
   yoff = 0.0; 
  }
  void resetXoff() {
   xoff = 0.0; 
  }
  
  void incX() {
   xoff += xinc;
  }
  void incY() {
   yoff += yinc;
  }
  
  void incZ() {
   zoff += zinc;
   println(zoff);
  }

  float getBob(float offset) {
   noiseDetail(nload, falloff);
   return factor * noise(offset * xoff,offset * yoff, zoff);
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
