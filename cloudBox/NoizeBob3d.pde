class NoizeBob_3D {
  
  // xinc, yinc: the size of the waves in x-y plane
  // zinc: the freqency of the oscillations
  float xoff, yoff, zoff;
  float xinc, yinc, zinc;
  float factor;
  int nload;
  float falloff;
  
  NoizeBob_3D() {
    float factor = 1.0;
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
    yoff = 0.0 + random(1); 
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

  float getBob(float xoff, float yoff, float zoff) {
   noiseDetail(nload, falloff);
   return factor * noise( xoff, yoff, zoff);
  }
}
