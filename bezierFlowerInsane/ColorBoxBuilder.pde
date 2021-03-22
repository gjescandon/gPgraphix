class ColorBoxBuilder {
 
  AutoPalette apal;
  EmptyTemplate mt = new EmptyTemplate();
  PImage cbox;
  NoizeBob cbob;
  float coff, cinc;
  
  ColorBoxBuilder() {
    apal = new AutoPalette();
    cbob = new NoizeBob(0.3,0.00001,0.6);

    cbox = mt.getEmpty();
    cbox.loadPixels();
    for (int y = 0; y < height; y++) {
      //println(1.0*y/height);
      color c = apal.getColor(1.0*y/height);
      for (int x = 0; x < width; x++) {
        cbox.pixels[x+y*width] = c;
      }
    }
    
    cbox.updatePixels();
    
    coff = 0.0;
    cinc = 0.0005;
  }
  
  ColorBoxBuilder(float hue) {
    apal = new AutoPalette(hue);
    cbob = new NoizeBob(0.3,0.006,0.6);
    
    cbox = mt.getEmpty();
    cbox.loadPixels();
    for (int y = 0; y < height; y++) {
      //println(1.0*y/height);
      color c = apal.getColor(1.0*y/height+cbob.getBobTail(y));
      
      float sat = saturation(c);
      float brt = brightness(c);
      for (int x = 0; x < width; x++) {
        cbox.pixels[x+y*width] = color(hue, sat, brt*y/height);
      }
    }
    
    cbox.updatePixels();
    coff = 0.0;
    cinc = 0.5;
    
  }
  
  PImage getImage() {
    return cbox;
  }

  PImage getImageBob() {
    cbox.loadPixels();
    cbob.getBob();
    for (int y = 0; y < height; y++) {
      //println(1.0*y/height);
      color c = apal.getColor(1.0*y/height+cbob.getBobTail(y)+0.0007*frameCount);
      
      float hue = hue(c);
      float sat = saturation(c);
      float brt = brightness(c);
      for (int x = 0; x < width; x++) {
        cbox.pixels[x+y*width] = color(hue, sat, brt*y/height);
      }
    }
    
    cbox.updatePixels();    
    return cbox;
  }

  PImage getImageRot() {
    cbox.loadPixels();
    cbob.getBob();
    for (int y = 0; y < height; y++) {
      //println(1.0*y/height);
      color c = apal.getColor(coff + 1.0*(y)/height+cbob.getBobTail(y));
      
      float hue = hue(c);
      float sat = saturation(c);
      float brt = brightness(c);
      for (int x = 0; x < width; x++) {
        cbox.pixels[x+y*width] = color(hue, sat, brt*y/height);
      }
    }
    
    cbox.updatePixels();
    coff -= cinc;
    if (coff <= 0.) coff = 1.0;
    
    return cbox;
  }
}
