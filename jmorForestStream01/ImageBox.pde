class ImageBoxCollection {

  int colsize = 23;

  ImageBox[] boxes = new ImageBox[colsize];

  ImageBoxCollection(PImage image){
   setupCollection(image); 
  }
  void setupCollection(PImage image) {
   for (int i = 0; i < colsize; i++) {
     boxes[i] = new ImageBox(image);
    }
  }
  
  void drawCollection() {
   for (int i = 0; i < colsize; i++) {
     boxes[i].draw();
    }
    
  }
  
}

class ImageBox {

  PImage tex, tex0;
  PImage texL, texR, texT, texB;
  
  float rotx = PI/4; 
  float roty = PI/4;
  
  int x0, y0, z0, w0, h0;
  
  NoizeBob zBob,xBob, yBob;
  
  ImageBox(PImage image) {
    textureMode(NORMAL);
    setup(image);
  }
  
  

  void draw() {
    noStroke();
    float zOff = 50*(1+ sin(0.01*zBob.getBob()*frameCount - PI)) - z0*0.5;
    pushMatrix();
    translate(x0+0.5*w0, y0+0.5*h0, zOff);
    rotateX(0.2*sin(0.01*xBob.getBob()*frameCount));
    rotateY(0.2*sin(0.01*yBob.getBob()*frameCount));
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
   
   x0 = floor(map(random(1),0.,1.0,0.,0.9) * width);
   y0 = floor(map(random(1),0.,1.0,0.,0.9) * height);
   z0 = 200;
   w0 = floor((0.3)*(width-x0));
   h0 = floor((0.3)*(height-y0));
   
   tex = et.getEmpty(w0, h0); 
   tex.loadPixels();
   for ( y=0; y< h0; y++) {
     for ( x = 0; x < w0; x++) {
       tex.pixels[y*w0 + x] = image.pixels[(y+y0)*image.width+x+x0];
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
   
   
   zBob = new NoizeBob(1.0,0.05*random(1),0.5);
   xBob = new NoizeBob(1.0,0.05*random(1),0.5);
   yBob = new NoizeBob(1.0,0.05*random(1),0.5);
 }
 
}
