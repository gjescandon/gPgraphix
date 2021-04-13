class FaceMaker {
  
  PImage[] gf;
  float xdiv, ydiv;
  NoizeBob xbob, ybob;
  NoizeBob_2D zbob;
 FaceMaker() {
   setup();
   
   xdiv = 5;
   ydiv = 23;
   
   xbob = new NoizeBob(1.0, 0.0001, 0.5);
   ybob = new NoizeBob(1.0, 0.1, 0.7);
   zbob = new NoizeBob_2D(1.0, 0.001, 0.001, 0.7);
 }
 
 void draw() {
  //drawAsc(gf[2]);
  image(gf[2],0,0,width,height);
  drawSliced(gf[2]);
 }
 
 void drawAsc(PImage simg) {
    EmptyTemplate et = new EmptyTemplate();
    PImage tim = et.getEmpty();
    int yoff = floor(0.5*frameCount % height); 
    //floor(0.5*height * (1 + sin(0.01*frameCount)));
    
    //println(yoff);
    
    //image(gf[0], 0, 0, width, height);
    copy(simg,0,0,width,yoff,0,height-yoff,width,yoff);
    copy(simg,0,yoff,width,height-yoff,0,0,width,height-yoff);
    
   
 }
 
 void drawSliced(PImage simg) {
    simg.loadPixels();
    float xoff = width / xdiv;
    float yoff = height / ydiv;
    //stroke(1.0);
    noStroke();
    xbob.getBob();
    ybob.getBob();
    zbob.getBob();
    for (int x = 0; x < xdiv; x++) {
      for (int y = 0; y < ydiv; y++) {
          fill(simg.pixels[floor(y * yoff * width + (0.5 + x + xbob.getBobTail(x)) * xoff)]);
          pushMatrix();
          translate(0,0, 100*zbob.getBobTail(x,y));
          rect(x * xoff, y * yoff, xoff, yoff);
          popMatrix();
      
    }
     
     
   }
    
   
 }
 
 
 void setup() {
   
  gf = new PImage[13];
  gf[0] = loadImage("gfaces/IMG_2341r.jpg");
  gf[1] = loadImage("gfaces/IMG_2340.jpg");
  gf[2] = loadImage("gfaces/IMG_2798.jpg");
  gf[2] = loadImage("gfaces/IMG_2899.jpg");
  
  gf[2].resize(width,height);
 }
 
}
