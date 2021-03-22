class LoseWaves {
 NoizeBob tbob, xbob, ybob, cbob, xysbob;
 NoizeBob_2D lbob;
 AutoPalette apal;
 PImage limg, timg, catImg;
 float xoff, yoff, xs, ys;
 float xyinc, xysinc;
   int direction = 1;
  float signal = 0;
 QuilezFunctions qf;
 LoseWaves() {
   apal = new AutoPalette(0.45);
   cbob = new NoizeBob(1.0, 0.009, 0.3);
   lbob = new NoizeBob_2D(1.0, 0.000009, 0.8);
   ybob = new NoizeBob(3.0, 0.009, 0.3);
   xbob = new NoizeBob(3.0, 0.009, 0.3);
   xysbob = new NoizeBob(10.0, 0.009, 0.3);
   limg = loadImage("xpCat.png");
   catImg = loadImage("xpCatCat.png");
   timg = loadImage("Teahupoo_1280.png");
   qf = new QuilezFunctions();
   xs = 3.0 * limg.width;
   ys = 3.0 * limg.height;
   xoff = 0- 0.7*limg.width;
   yoff = 0 - 1.3* limg.height;
   xyinc = 0.03;
   xysinc = 0.;
 }
 
 
 void draw() {
   pushMatrix();
   translate(0,0,-500.*qf.expSustainedImpulse(frameCount, 4000, 0.3));
   translate(0, 0, 0-xysbob.getBob());
   image(limg, xoff + 100 * sin(xbob.getBob()) ,yoff + 200 * cos(ybob.getBob()), xs, ys);
   //image(catImg, xoff + 100 * sin(xbob.getBob()) ,yoff + 200 * cos(ybob.getBob()), xs, ys);
   popMatrix();

   pushMatrix();
   //translate(0,0,-1000.*qf.expSustainedImpulse(frameCount, 2000, 0.3));
   //drawLinearImage();
   popMatrix();
   
 }
  
  
  /**
   * Linear Image. 
   * 
   * Click and drag mouse up and down to control the signal. 
   * Press and hold any key to watch the scanning. 
   */
  
  
  
  
  void drawLinearImage() {
    timg.loadPixels();
    
    PImage img2 = (new EmptyTemplate()).getEmpty();
    if (signal > timg.height-1 || signal < 0) { 
      direction = direction * -1;
    }
      signal += (0.1*direction);
      int signalOffset = int(signal)*timg.width;
      //println("soffset " + signalOffset);
      for (int y = 0; y < timg.height; y++) {
        arrayCopy(timg.pixels, signalOffset, img2.pixels, y*timg.width, timg.width);
      }
      for (int x = 0; x < timg.width; x++) {
         lbob.getBob();
          
         for (int y = 0; y < timg.height; y++) {
           float h = hue(img2.pixels[x + y*width]);
           float s = saturation(img2.pixels[x + y*width]);
           float b = brightness(img2.pixels[x + y*width]);
           float alph = map(lbob.getBobTail(1), 0., 0.2, 0., 1.) * qf.expSustainedImpulse(frameCount, 1000, 0.8);
           //alph = map(lbob.getBobTail(1) * qf.expSustainedImpulse(frameCount, 1000, 0.8);
           img2.pixels[x + y*width] = color(h, s, b, alph);
        }
        if(abs(lbob.getBobTail(x) - 0.5) < 0.2) {
         for (int y = 0; y < timg.height; y++) {
           img2.pixels[x + y*width] = color(1.,1.,1.,0); 
        }
        }
    
      }
     img2.updatePixels();
     image(img2, - 0.5*abs(width - xs*xbob.getBobTail(1)), -0.5*abs(height - ys*ybob.getBobTail(1)), xs * xbob.getBobTail(1), ys * ybob.getBobTail(1));
  }
  
}
