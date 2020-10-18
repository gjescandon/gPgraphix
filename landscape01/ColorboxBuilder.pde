class ColorBoxBuilder {
 
  AutoPalette apal;
  EmptyTemplate mt = new EmptyTemplate();
  PImage cbox;
  
  ColorBoxBuilder() {
    apal = new AutoPalette(0.67);
    
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
  }
  
  
  PImage getImage() {
    return cbox;
  }
}
