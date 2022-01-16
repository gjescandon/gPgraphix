class Collidescope {
  PImage img;
  String name;
  PImage canvas;
  float ratio;
  float theta0, thetaInc, thetaOffset;
  float x0, y0;
  NoizeBob rbob;
  int lifetime;
  
  Collidescope() {
    init();
  }
  
  void draw(){
  //if (frameCount % lifetime == 0) init();
  updateCanvas();
  image(canvas, 0.-0.5*img.width, 0.-0.5*img.height);

}
  
  void drawScaled(float scale){

  //image(img,0,0);
  updateCanvas();
  image(canvas, x0, y0, scale * canvas.width, scale * canvas.height);
  }
  
  void updateCanvas(){
    EmptyTemplate et = new EmptyTemplate();
    canvas = et.getEmpty(img.width, img.height);
    canvas.loadPixels();
    img.loadPixels();

    /*for (int yy = 0 ; yy < img.height /2; yy++) {
      int xoff = getXoff(img.height/2 - yy, ratio);

      for (int xx = 0 - xoff; xx <= xoff; xx++) {
        color pixel = img.pixels[(img.height - yy) * img.width + (img.width/2 + xx)];
        canvas.pixels[yy*canvas.width + canvas.width/2 + xx] = pixel;
      }
    }
    */
    
    float rmax = img.height/2;
    float toff = thetaOffset;// * (1 + noise(theta0));
    for (float t = theta0; t <= theta0 + toff; t = t + 0.01) {
      float trev = getRevAngle(t, theta0, toff);
      for (float r = 0.0; r < rmax; r = r + 0.1) {
        int xx = floor( r * cos(t));
        int yy = floor(r * sin(t));
        
        color pc = img.pixels[getPixelIndex(img, xx, yy)];
        
         if(alpha(pc) > 0.3) {
          for (int i = 0; i < ratio; i++) {
            xx = floor( r * cos(t + i * 2 * PI / ratio));
            yy = floor(r * sin(t + i * 2 * PI / ratio));
            
            canvas.pixels[getPixelIndex(canvas, xx, yy)] = pc;
            
            xx = floor( r * cos(trev + i * 2 * PI / ratio));
            yy = floor(r * sin(trev + i * 2 * PI / ratio));
            canvas.pixels[getPixelIndex(canvas, xx, yy)] = pc;
            
          }
        }
      }
      
    }
    canvas.updatePixels();
    theta0 += rbob.getBob() - 0.5;
    
    if (theta0 > 2*PI) {
      theta0 = 0.0;
    }

  }
  
  int getXoff(int yy, float ratio) {
    return floor(yy * tan(PI * ratio));
  }
  
  int getPixelIndex(PImage img, int yy, int xx) {
    int result = floor((img.height/2 -yy)*img.width) + (img.width/2 + xx);
    if (result < 0) {
      result = 0;
    }
    if (result >= img.pixels.length) {
      result = img.pixels.length - 1;
    }
    return result;
  }
  
  float getRevAngle(float t, float t0, float toff) {
    float result = t + toff;
    float tmin = t0 + toff;
    float tmax = t0 + 2 * toff;
    result = map(t, t0, t0 + toff, tmax, tmin);
    return result;
    
  }
  
  void init() {
    lifetime = 100;
    name = "tstar0" + floor(1 + random(9)) + ".png";
    img = loadImage(name);
    ratio = 3+floor(random(5));
    theta0 = 0.0;
    thetaInc = 0.1 * random(1);
    thetaOffset = PI / ratio;
    x0 = floor(( 0.5 * random(1)) * width);
    y0 = floor((0.9 * random(1)) * height);
    //x0 = 100.0;
    y0 = 100.0;
    rbob = new NoizeBob(1., 0.01, 0.6);
  }
}
