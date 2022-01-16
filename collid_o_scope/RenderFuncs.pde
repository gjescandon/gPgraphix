float jitter(float val) {
 return val + random(-1,1); 
}

float nnoize(float val) {
 return 20.0 * noise(val);
}

PImage getBlankImg() {
  PImage oliRender = createImage(width, height, ARGB);
  oliRender.loadPixels();
  for (int i = 0; i < oliRender.pixels.length; i++) {
      oliRender.pixels[i] = color(0.0, random(128,255), random(128,255));
  }
  oliRender.updatePixels();
  return oliRender;
}

PImage getBlankImg(PImage img) {
  PImage oliRender = createImage(img.width, img.height, ARGB);
  oliRender.loadPixels();
  for (int i = 0; i < oliRender.pixels.length; i++) {
      oliRender.pixels[i] = color(0,0,0,0);
  }
  oliRender.updatePixels();
  return oliRender;
}
