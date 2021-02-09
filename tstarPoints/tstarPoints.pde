TstarImage timg;
float theta, thetaInc;

void setup() {
 size(1280, 720);
 frameRate(24);
 timg = new TstarImage();
}

void draw() {
  background(0);
 timg.move(); 
 //saveFrame();
}

class TstarImage {
 PImage tsimg;
 PImage tsOut;
 float theta, thetaInc;
 int xfactor, offset;
 float xf;
 float noyz, ninc;
 
 TstarImage() {
  tsimg = getTstar(); 
  tsimg.loadPixels();
  theta = 0.0;
  thetaInc = 0.02;
  noyz = 0.0;
  ninc = 0.01;
  xfactor = 100;
  offset = 2000;
  resetTsout();
  xfactor = tsOut.width / 2;
  xf = xfactor;
  

  offset = floor(0.5 * tsOut.pixels.length - ((tsimg.height /2) * tsOut.width) - tsOut.width/2 - tsimg.width/2);
 }
 
 void move() {
   //resetTsout();
   float xratio =  tsOut.height / tsimg.height ;
   xf = xfactor * (1.0 - (abs(sin(theta) * sin(theta) * sin(theta))));
   if (xf > 0.9 * xfactor) {
    tsimg = getTstar(); 
    tsimg.loadPixels();     
   }
   float yf = tsOut.height * 0.5 * (1.005 - (abs(sin(theta))));
   
   for (int y = 0; y < tsimg.height; y++) {
     for (int x = 0; x < tsimg.width; x++) {
       int jittery = round(random(-yf, yf));   
       int jitterx = round(random(-xf, xf));   
       int pi = tsimg.width * y + x;
       int xo = floor(map(x, 0, tsimg.width, 0, tsimg.width * xratio)) + jitterx;
       int yo = (floor(map(y, 0, tsimg.height, 50, tsOut.height - 50)) + jittery);
       /*
       if (yo < 0 ) yo = -yo;
       if (yo > tsimg.height ) yo = yo - tsimg.height;
       if (xo < 0 ) xo = -xo;
       if (xo > tsimg.width ) xo = xo - tsimg.width;
       */
       offset = floor((tsOut.width *0.6) * noise(noyz));
       int po = offset + tsOut.width * yo + xo;
       
       if (po > tsOut.pixels.length - 10) {
         continue;
       }
       if (po < 10) {
         continue; 
       }
       color tc = tsimg.pixels[pi];
       if (alpha(tc) > 128) {
         tsOut.pixels[po] = tc;
       }
     }
   }

   tsOut.updatePixels();
   image(tsOut,0,0);
   
   theta += thetaInc * noise(noyz);
   noyz += ninc;
 }
  
 PImage getTstar() {
   String[] tsarr = new String[5];
   tsarr[0] = "tstar02.png";
   tsarr[1] = "tstar03.png";
   tsarr[2] = "tstar05.png";
   tsarr[3] = "tstar08.png";
   tsarr[4] = "tstar09.png";
   return loadImage(tsarr[floor(random(0,tsarr.length))]);
 }
 
 void resetTsout() {
  tsOut = createImage(width, height, ARGB);
  tsOut.loadPixels();
  for (int i = 0; i < tsOut.pixels.length; i++) {
    tsOut.pixels[i] = color(0, 90, 102, 0); 
  } 
  tsOut.updatePixels();
 }
}
