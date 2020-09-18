class Fractal{
  PImage img;
  Fractal() {
    setup();
  }
  
  void draw() {
    image(img, 0, 0, width, height);
  }
  
  
  float zn_turkey(float cx, float cy) {
    /// **** THIS IS A TURKEY *******
    int imax = 5;
    int cntr = 0;
    float a = cx;
    float b = cy;
    float d = 0;
    float dmax = 4.;
    float dOld = 0.;
    
    float diffToLast = 0.;
    float diffToMax = 0.;
    float cnum = 0.;
    int n = 0;
    while ( n < imax) {
      d = sqrt(sq(a)+sq(b));
      if (d >= dmax) {
        diffToLast = (d - dOld);
        diffToMax = (dmax - dOld);
        cnum = n + diffToMax/diffToLast;
        break;
      }
      a = sq(a) - sq(b) + cx;
      b = 2.*a*b + cy;
      dOld = d;
      n++;
    }
    
    return map(cnum, 0, imax, 0, 100);
  }

  float zn(float cx, float cy) {
    int imax = 100;
    int cntr = 0;
    float a = cx;
    float b = cy;
    float twoab = 0.;
    float d = 0;
    float dmax = 4.;
    float dOld = 0.;
    
    float diffToLast = 0.;
    float diffToMax = 0.;
    float cnum = 0.;
    int n = 0;
    while ( n < imax) {
      d = sqrt(sq(a)+sq(b));
      if (d >= dmax) {
        diffToLast = (d - dOld);
        diffToMax = (dmax - dOld);
        cnum = n + diffToMax/diffToLast;
        break;
      }
      
      // watch out here !!!
      twoab = 2.*a*b;
      a = sq(a) - sq(b) + cx;
      b = twoab + cy;
      dOld = d;
      n++;
    }
    
    return map(cnum, 0, imax, 0, 100);
  }
  
  
  void setup() {
    colorMode(HSB, 100);
    EmptyTemplate et = new EmptyTemplate();
    img = et.getEmpty();
    img.loadPixels();
    float xf = 2./width;
    float yf = 2./height;

    float xoff = 0.5*width;
    float yoff = 0.5*width;
    //xoff = 0.;
    //yoff = 0.;
    float cntr = 0;
    

    for (int x=0; x<width; x++) {
      for (int y=0; y<height; y++) {
        cntr = 0.;
        float zxn = (x-xoff)*xf;
        float zyn = (y-yoff)*yf;
        cntr = zn(zxn, zyn);

        //cntr = sq(zxn) + sq(zyn);
        //cntr = map(cntr, 0., 4., 0., 100.);
        img.pixels[y + x*height] = color(50, 100, cntr);
      }
    }
    println("scale: " + (0-xoff)*xf + ","+ (0-yoff)*yf + " :: "+ (width-xoff)*xf + ","+ (height-yoff)*yf);
    img.updatePixels();
  }
}
