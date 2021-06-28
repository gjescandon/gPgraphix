class ImageBox02Collection {

  int colsize = 34;

  ImageBox02[] boxes = new ImageBox02[colsize];

  ImageBox02Collection(PImage image, int offset){
   setupCollection(image, offset); 
  }
  
  void setupCollection(PImage image, int offset) {
   for (int i = 0; i < colsize; i++) {
     boxes[i] = new ImageBox02(image, offset);
    }
  }
  
  void drawCollection() {
   for (int i = 0; i < colsize; i++) {
     boxes[i].draw();
    }
    
  }
  
}

class ImageBox02 {

  PImage tex, tex0, image0;
  PImage texL, texR, texT, texB;
  float tOff = 0.;
  float rotx = PI/4; 
  float roty = PI/4;
  int yImgOff;
  boolean isToggleReady;
  int frameOff;
  
  int x0, y0, z0, w0, h0;
  
  NoizeBob zBob,xBob, yBob;
  
  ImageBox02(PImage image, int yoffset) {
    textureMode(NORMAL);
    image0 = image;
    yImgOff = yoffset;
    setup(image);
    frameOff = 20 + floor(200*random(1));
  }
  
  

  void draw() {
    noStroke();
    float zOff = 0.;//50*(1+ sin(0.01*zBob.getBob()*frameCount - PI)) - z0*0.5;
    float fc = 0;
    if (frameCount > frameOff) fc = cos(0.01 *(frameCount-frameOff) + HALF_PI);
    fc = fc * fc;
    //println(fc);
    if (isToggleReady && fc < 0.02) {
      setup(image0);
      isToggleReady = false;
    }
    if (fc > 0.98 ) {
      isToggleReady = true;
    }
    
    fc = constrain(fc, 0.0, 0.8);
    zOff = 0. - 300.0 * (1 - fc) + 50*zBob.getBob();

    pushMatrix();
    translate(x0+0.5*w0, y0+0.5*h0, zOff);
    //rotateX(0.2*sin(0.01*xBob.getBob()*frameCount));
    //rotateY(0.2*sin(0.01*yBob.getBob()*frameCount));
    scale(0.5);
    drawTexturedCube(tex);
    popMatrix();
  }

void drawTexturedCube(PImage tex) {
  fill(0.2,1.,1.);
  // Given one texture and six faces, we can easily set up the uv coordinates
  // such that four of the faces tile "perfectly" along either u or v, but the other
  // two faces cannot be so aligned.  This code tiles "along" u, "around" the X/Z faces
  // and fudges the Y faces - the Y faces are arbitrarily aligned such that a
  // rotation along the X axis will put the "top" of either texture at the "top"
  // of the screen, but is not otherwised aligned with the X/Z faces. (This
  // just affects what type of symmetry is required if you need seamless
  // tiling all the way around the cube)
  
  // +Z "front" face
  PShape front = createShape();
  front.beginShape(QUADS);
  front.texture(tex);  
  front.vertex(-1*w0, -1*h0,  1*z0, 0, 0);
  front.vertex( 1*w0, -1*h0,  1*z0, 1, 0);
  front.vertex( 1*w0,  1*h0,  1*z0, 1, 1);
  front.vertex(-1*w0,  1*h0,  1*z0, 0, 1);
  front.endShape();

  // -Z "back" face
  /*
  PShape back = createShape();
  back.beginShape(QUADS);
  back.vertex( 1*w0, -1*h0, -1*z0, 0, 0);
  back.vertex(-1*w0, -1*h0, -1*z0, 1, 0);
  back.vertex(-1*w0,  1*h0, -1*z0, 1, 1);
  back.vertex( 1*w0,  1*h0, -1*z0, 0, 1);
  back.endShape();
*/

  // +Y "bottom" face
  PShape bot = createShape();
  bot.beginShape(QUADS);
  bot.texture(texB);
  bot.vertex(-1*w0,  1*h0,  1*z0, 0, 0);
  bot.vertex( 1*w0,  1*h0,  1*z0, 1, 0);
  bot.vertex( 1*w0,  1*h0, -1*z0, 1, 1);
  bot.vertex(-1*w0,  1*h0, -1*z0, 0, 1);
  bot.endShape();
  
  // -Y "top" face
  PShape top = createShape();
  top.beginShape(QUADS);
  top.texture(texT);
  top.vertex(-1*w0, -1*h0, -1*z0, 0, 0);
  top.vertex( 1*w0, -1*h0, -1*z0, 1, 0);
  top.vertex( 1*w0, -1*h0,  1*z0, 1, 1);
  top.vertex(-1*w0, -1*h0,  1*z0, 0, 1);
  top.endShape();
  
  PShape right = createShape();
  // +X "right" face
  right.beginShape(QUADS);
  right.texture(texR);
  right.fill(0.3,1.0,1.0);
  right.vertex( 1*w0, -1*h0,  1*z0, 0, 0);
  right.vertex( 1*w0, -1*h0, -1*z0, 1, 0);
  right.vertex( 1*w0,  1*h0, -1*z0, 1, 1);
  right.vertex( 1*w0,  1*h0,  1*z0, 0, 1);
  right.endShape();
  
  // -X "left" face
  PShape left = createShape();
  left.beginShape(QUADS);
  left.texture(texL);
  left.vertex(-1*w0, -1*h0, -1*z0, 0, 0);
  left.vertex(-1*w0, -1*h0,  1*z0, 1, 0);
  left.vertex(-1*w0,  1*h0,  1*z0, 1, 1);
  left.vertex(-1*w0,  1*h0, -1*z0, 0, 1);
  left.endShape();
  
  shape(bot);
  //shape(back);
  shape(front);
  shape(right);
  shape(left);
  shape(top);
  
}

 void setup(PImage image) {
   EmptyTemplate et = new EmptyTemplate();
   int x, y;
   x0 = 300;
   y0 = 200;
   z0 = 100;
   w0 = 600;
   h0 = 300;
   tOff = random(0.4*PI);
   isToggleReady = false;
   
   x0 = floor(map(random(1),0.,1.0,0.1,0.9) * width); // origin x
   y0 = floor(map(random(1),0.,1.0,0.1,0.9) * height); // origin y
   z0 = 400; // depth
   w0 = floor(map(random(1),0.,1.0,0.1,0.4)*(width-x0)); // width
   h0 = floor(map(random(1),0.,1.0,0.1,0.4)*(height-y0)); // height

   
   tex = et.getEmpty(w0, h0); 
   
   tex.loadPixels();
   for ( y=0; y< h0; y++) {
     int yy = y + yImgOff;
     for ( x = 0; x < w0; x++) {
       tex.pixels[y*w0 + x] = image.pixels[(yy+y0)*image.width+x+x0];
     }
   }
   tex.updatePixels();
   
   
   texB = et.getEmpty(tex.width, tex.height); 
   texB.loadPixels();

   for ( y=0; y<tex.height; y++) {
     for ( x = 0; x < tex.width; x++) {
       texB.pixels[y*tex.width + x] = tex.pixels[(tex.height-1)*tex.width +x];
     }
   }
   texB.updatePixels();
   
   texT = et.getEmpty(tex.width, tex.height); 
   texT.loadPixels();
   for ( y=0; y<tex.height; y++) {
     for ( x = 0; x < tex.width; x++) {
       texT.pixels[y*tex.width + x] = tex.pixels[x];
     }
   }
   texT.updatePixels();
   
   texL = et.getEmpty(tex.width, tex.height); 
   texL.loadPixels();
   for ( y=0; y<tex.height; y++) {
     for ( x = 0; x < tex.width; x++) {
       texL.pixels[y*tex.width + x] = tex.pixels[y*tex.width];
     }
   }
   texL.updatePixels();   

   texR = et.getEmpty(tex.width, tex.height); 
   texR.loadPixels();
   for ( y=0; y<tex.height; y++) {
     for ( x = 0; x < tex.width; x++) {
       texR.pixels[y*tex.width + x] = tex.pixels[(y+1)*tex.width - 1];
     }
   }
   texR.updatePixels();  
   
   
   zBob = new NoizeBob(1.0,0.5*random(1),0.5);
   xBob = new NoizeBob(1.0,0.5*random(1),0.5);
   yBob = new NoizeBob(1.0,0.5*random(1),0.5);
 }
 
}
