class ColorSortImg {
 PImage img0;
 PImage imgFalls;
 PImage imgX;
 
 float theta = 0.0;
 float thetaInc = 0.01;

 float perc = 0.0;
 float percInc = 0.005;
 int[] fally = new int[width];
 int height0, height0B, height0B_layers;
 
 float brightnessFactor,brightnessFactor_Splash;
 float bfInc, bfInc_layers;
 
 NoizeBob nbob, splashBob;
 
 ColorSortImg(PImage img) {
   img0 = img;
   for (int i = 0; i < width; i++) {
     fally[i] = 0;
   }
   
   imgFalls = setupImgX();
   imgX = sortAll();
   height0 = 1;
   height0B = height - 1;
   height0B_layers = floor(0.5 * height);
   
   brightnessFactor = 200.0;
   brightnessFactor_Splash = 130.0;
   bfInc = 0.02;
   bfInc_layers = 0.08;
   
   nbob = new NoizeBob();
    float factor = 60.0;
    float falloff = 0.6;
    float inc = 1.0;   
   splashBob = new NoizeBob(factor, inc, falloff);
   
   theta = 0.;
   thetaInc = 0.05;
 }
 
 PImage fall_perpetual() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   
   for (int y = 0; y < height0 - 1; y++) {
       for (int x = 0; x < width; x++){
         
       color ct;
       if (brightness(imgFalls.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
         ct = imgt.pixels[x + width*(y+1)];
         imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
         imgt.pixels[x + width*(y)] = ct;
       }

       if (brightness(imgFalls.pixels[x + width*y]) > brightness(imgX.pixels[x + width*y])) {
         if (y-1 >= 0) {
           ct = imgt.pixels[x + width*(y-1)];
           imgt.pixels[x + width*(y-1)] = imgt.pixels[x + width*(y)];
           imgt.pixels[x + width*(y)] = ct;
         }
       }
     }
   }
   
   imgFalls.updatePixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   
   
   if (height0 < height) height0++;
   return imgFalls;
   
 }
  PImage fall() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   
   for (int y = 0; y < height0 - 1; y++) {
       for (int x = 0; x < width; x++){
         
       color ct;
       if (brightness(imgt.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
         ct = imgt.pixels[x + width*(y+1)];
         imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
         imgt.pixels[x + width*(y)] = ct;
       }

       if (brightness(imgt.pixels[x + width*y]) > brightness(imgX.pixels[x + width*y])) {
         if (y-1 >= 0) {
           ct = imgt.pixels[x + width*(y-1)];
           imgt.pixels[x + width*(y-1)] = imgt.pixels[x + width*(y)];
           imgt.pixels[x + width*(y)] = ct;
         }
       }
     }
   }
   
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   
   imgFalls.updatePixels();
   
   if (height0 < height) height0++;
   return imgFalls;
   
 }
 
 PImage fall_bottom_chop() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   for (int y = height0B; y > 0; y--) {
       for (int x = 0; x < width; x++){
         
       color ct;
       if (brightness(imgt.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
         if (y <= height - 2) {
           ct = imgt.pixels[x + width*(y+1)];
           imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
           imgt.pixels[x + width*(y)] = ct;
         }
       }

       if (brightness(imgt.pixels[x + width*y]) > brightness(imgX.pixels[x + width*y])) {
         if (y >= 1) {
           ct = imgt.pixels[x + width*(y-1)];
           imgt.pixels[x + width*(y-1)] = imgt.pixels[x + width*(y)];
           imgt.pixels[x + width*(y)] = ct;
         }         
       }
     }
   }
   
   imgFalls.updatePixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   
   
   if (height0B > 0) height0B--;
   return imgFalls;
   
 }
 
 PImage fall_bottom_layers() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   for (int y = height0B -1; y > 0; y--) {
       for (int x = 0; x < width; x++){
        float bbob = nbob.getBob() * brightness(imgFalls.pixels[x + width*y]);

        if (brightnessFactor <  bbob) {
         color ct;
    /*     
         if (brightness(imgFalls.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
           if (y <= height - 2) {
             ct = imgt.pixels[x + width*(y+1)];
             imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
             imgt.pixels[x + width*(y)] = ct;
           }
         }
  */
         if (bbob > brightness(imgX.pixels[x + width*y])) {
           if (y >= 1) {
             ct = imgt.pixels[x + width*(y-1)];
             imgt.pixels[x + width*(y-1)] = imgt.pixels[x + width*(y)];
             imgt.pixels[x + width*(y)] = ct;
           }         
         }
         
       }
     }
   }
   
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   imgFalls.updatePixels();
   brightnessFactor -= bfInc_layers + 20. * sin(theta);
   
   theta += thetaInc;
   if (theta > TWO_PI) {
     theta = 0.;
   }
   
   
   if (height0B > 0) height0B--;
   return imgFalls;
   
 }
 
 PImage fall_splash1() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
    if (frameCount < 2000) {
       for (int y = height -1; y > 0; y--) {
           for (int x = 0; x < width; x++){
             
           color ct;
    /*
    if (brightness(imgFalls.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
             if (y <= height - 2) {
               ct = imgt.pixels[x + width*(y+1)];
               imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
               imgt.pixels[x + width*(y)] = ct;
             }
           }
    */
           if (brightness(imgFalls.pixels[x + width*y]) > brightness(imgX.pixels[x + width*y])) {
             if (y >= 1) {
               ct = imgt.pixels[x + width*(y-1)];
               imgt.pixels[x + width*(y-1)] = imgt.pixels[x + width*(y)];
               imgt.pixels[x + width*(y)] = ct;
             }         
           }
         }
       }
    }
   
   for (int y = 0; y < height; y++) {
       for (int x = 0; x < width; x++){
         
       color ct;

      if( brightness(imgFalls.pixels[x + width*y]) < brightnessFactor_Splash) {
          if (brightness(imgFalls.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
           if (y <= height - 2) {
             ct = imgt.pixels[x + width*(y+1)];
             imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
             imgt.pixels[x + width*(y)] = ct;
           }
         }
      }

       }
     }
     
     
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   imgFalls.updatePixels();
   
   
   if (height0B > 0) {
     height0B--;
   }
   return imgFalls;
   
 }
 
 PImage fall_splash2() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   for (int y = 0; y < height; y++) {
       for (int x = 0; x < width; x++){
         
       color ct;

      if (brightness(imgFalls.pixels[x + width*y]) < brightnessFactor_Splash - splashBob.getBob()) {
        if (brightness(imgFalls.pixels[x + width*y]) < brightness(imgX.pixels[x + width*y])) {
           if (y <= height - 2) {
             ct = imgt.pixels[x + width*(y+1)];
             if (random(1.) > 0.5) {
               imgt.pixels[x + width*(y+1)] = imgt.pixels[x + width*(y)];
               imgt.pixels[x + width*(y)] = ct;
             }
           }
         }
      }

       }
     }
     
     
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   imgFalls.updatePixels();
   //println(brightnessFactor_Splash);
   if (brightnessFactor_Splash < 300) {
     brightnessFactor_Splash += bfInc;
   }
   
   if (height0B > 0) {
     height0B--;
   }
   return imgFalls;
   
 }
 
 PImage fall_gradual_bottom() {
   imgFalls.loadPixels();
   imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   for (int y = height - 1; y > height0B; y--) {
       for (int x = 0; x < width; x++){
         
       color ct;
       int ybob = floor(y + nbob.getBob());
       if ((x + width*ybob) < imgt.pixels.length && brightness(imgt.pixels[x + width*ybob]) < brightnessFactor) {
         /*
         if (brightness(imgt.pixels[x + width*ybob]) < brightness(imgX.pixels[x + width*ybob])) {
           if (ybob <= height - 2) {
             ct = imgt.pixels[x + width*(ybob+1)];
             imgt.pixels[x + width*(ybob+1)] = imgt.pixels[x + width*(ybob)];
             imgt.pixels[x + width*(ybob)] = ct;
           }
         }
  */
         if (brightness(imgt.pixels[x + width*ybob]) > brightness(imgX.pixels[x + width*ybob])) {
           if (ybob >= 1) {
             ct = imgt.pixels[x + width*(ybob-1)];
             imgt.pixels[x + width*(ybob-1)] = imgt.pixels[x + width*(ybob)];
             imgt.pixels[x + width*(ybob)] = ct;
           }         
         }

       }
     }
   }
   
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
   imgFalls.updatePixels();
   
   
   if (height0B > 0) height0B--;
   
   brightnessFactor += bfInc;
   
   return imgFalls;
   
 }
 
 PImage lerp() {
   //imgFalls.loadPixels();
   //imgX.loadPixels();
   
   EmptyTemplate et = new EmptyTemplate();   
   PImage imgt = et.getEmpty();
    imgt.loadPixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgt.pixels[i] = imgFalls.pixels[i];
    } 
   
   
   
   for (int y = 0; y < height - 1; y++) {
       for (int x = 0; x < width; x++){
         imgt.pixels[x + width * y] = lerpColor(imgt.pixels[x + width * y], imgX.pixels[x + width * y], perc);
     }
   }
   
   imgFalls.updatePixels();
    for (int i = 0; i < imgt.pixels.length; i++) {
      imgFalls.pixels[i] = imgt.pixels[i];
    } 
  
   perc += percInc;   
   return imgFalls;
   
 }
 
 PImage sort() {
  img0.loadPixels();
  imgX = setupImgX(); 
  
  int wmin = floor((0.4 - 0.3 *abs(sin(theta))) * width ); //width / 3; //0;
  int wmax = floor((0.6 + 0.3*abs(sin(theta))) * width); //2 * width / 3; //width;
  
  theta += thetaInc;
  if (theta > PI) {
    theta = 0.0;
  }
  
  
  int hoff = floor(0.25 * height);
  int hh = floor(0.5* height); // height/10;
  
  for (int i = wmin; i < wmax; i++) {
    color[] vlc = new color[hh];
     for  (int j = 0; j < hh; j++) { 
       vlc[j] = img0.pixels[width * (hoff + j) + i];
     }
     
     ColorSorter cs = new ColorSorter(vlc);
     color[] sorted = cs.getSortedColors();
     
     //println(vlc.length + " " + sorted.length);
     
     
     for  (int j = 0; j < hh; j++) {
       imgX.pixels[width * (hoff + j) + i] = sorted[j];
     }   
  }
  
  imgX.updatePixels();
  return imgX;
 }

PImage sortAll() {
  img0.loadPixels();
  imgX = setupImgX(); 
  
  int wmin = 0; //width / 3; //0;
  int wmax = width; //2 * width / 3; //width;
  
  theta += thetaInc;
  if (theta > PI) {
    theta = 0.0;
  }
  
  
  int hoff = 0;
  int hh = height; // height/10;
  
  for (int i = wmin; i < wmax; i++) {
    color[] vlc = new color[hh];
     for  (int j = 0; j < hh; j++) { 
       vlc[j] = img0.pixels[width * (hoff + j) + i];
     }
     
     ColorSorter cs = new ColorSorter(vlc);
     color[] sorted = cs.getSortedColors();
     
     //println(vlc.length + " " + sorted.length);
     
     
     for  (int j = 0; j < hh; j++) {
       imgX.pixels[width * (hoff + j) + i] = sorted[j];
     }   
  }
  
  imgX.updatePixels();
  return imgX;
 }

 PImage setupImgX() {
  EmptyTemplate et = new EmptyTemplate();   
  PImage imgX = et.getEmpty();
  imgX.loadPixels();
  for (int i = 0; i < imgX.pixels.length; i++) {
    imgX.pixels[i] = img0.pixels[i];
  }
  return imgX;
 }
 
 
 float incGain(float x, float k) 
{
    float a = 0.5*pow(2.0*((x<0.5)?x:1.0-x), k);
    return (x<0.5)?a:1.0-a;
}
}
