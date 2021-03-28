PImage img, img2;
AutoPalette apal, apal2;
NoizeBob cb, cb2, bb;

void setup() {
 size(1280, 720);
 colorMode(HSB,1.);
 background(0.);
 
 apal = new AutoPalette();
 apal2 = new AutoPalette();
 
 cb = new NoizeBob(1.0, 0.01, 0.5);
 cb2 = new NoizeBob(1.0, 0.01, 0.5);
 bb = new NoizeBob(1.0, 0.01, 0.5);
}

void draw() {
  
 boolean useFader = false;
 boolean blowAway = false;
 
 

   drawBlock(1010, useFader, blowAway); 
 if (bb.getBob() > 0.6) {
   blowAway = true;
 }

   
   drawBlock(50, useFader, blowAway); 

blowAway = false;

   drawBlock(370, useFader, blowAway); 
   drawBlock(690, useFader, blowAway); 

}


void drawBlock(float x1, boolean useFader, boolean blowAway) {

 float y1 = 50;
 float w = 220;
 float h = 620;
 float alpha, alpha0;
 alpha = alpha0 = 128.0;
 color myColor = apal2.getColor(cb2.getBob());
 int fcMin = 200;
 float rh, rh0, rw, rw0;
 rh = rh0 = 2.0;
 rw = rw0 = 2.0;
 noStroke();
 boolean printIt = true;
 boolean isBlowing = false;
  
 if (blowAway && frameCount > 2 * fcMin) {
   printIt = false;
   isBlowing = true;
     float blow = map(frameCount, 2 * fcMin , 1000, 0, 100);

     if (blow > 100) {
       blow = 100;
     }
     
     
     w += (blow / 100) * 50 ;
     if (w > 500) {
       w = 500;
     }

     rh = rh0 +  blow * random (1, 3);
     rw = rw0 +  blow * random (1, 3);
     alpha = alpha0 - blow * 56; 

     stroke(apal.getColor(cb.getBob()));
     if (random(0, 1) > blow / 100) {
       printIt = true;
     }
   }

if (useFader && frameCount > fcMin) {
     myColor = apal2.getColor(cb2.getBob());
     float fade = map(frameCount, fcMin , 500, 0, 1);

     w += w * 3.0 * fade;
     if (w > 2 * width) {
       w = 2 * width;
     }
     rh = (rh0 + 100 * fade);
     rw = (rw0 + 100 * fade);
     
     if (random(0,1) > 0.8) {
       fill(0,0,0);
     }
}

 for (int i = 0; i < width; i++) {
   float x = random(x1, x1 + w);
   float y = random(y1, y1 + h);
   //rh = rh + random(-2, 2);
   //rw = rh + random(-2, 2);

   if(isBlowing) {
    stroke(apal2.getColor(cb2.getBob()));
     float blow = map(frameCount, fcMin , 500, 0, 100);
    x = x + random(0, blow);
    if(random(0,1) > 0.999) {
      continue;
    }
   }
    if (useFader && frameCount > fcMin) {
    if(random(0,1) > 0.999) {
      continue;
    }
     myColor = apal2.getColor(cb2.getBob());
     float fade = map(frameCount, fcMin , 500, 0, 1);
     x = x - (fade * w);
     println(frameCount + " :: " + fade  + " :: " + x );

     if (x < 400) {
      x = 400.0; 
     }

     alpha -= fade* 12;
     if (alpha < 8.0) {
       alpha = 8.0;
     }
     
   }

  fill(myColor, alpha);
  
   if (printIt) {
     ellipse(x, y, rh, rw);
   }
 }
  
}
