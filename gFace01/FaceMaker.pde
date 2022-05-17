class FaceMaker {
  
  PImage[] gf;
  float xdiv, ydiv;
  NoizeBob xbob, ybob;
  NoizeBob_2D zbob;
  AutoPalette apal;
  float rfact;
  
 FaceMaker() {
   setup();
 }
 
 void draw() {
  //drawAsc(gf[2]);
  //image(gf[2],0,0,width,height);
  drawCircles(gf[2]);
  //drawSliced(gf[2]);
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
 
 void drawCircles(PImage simg) {
    simg.loadPixels();
    float xoff = width / xdiv;
    float yoff = height / ydiv;
    //stroke(1.0);
    noStroke();
    xbob.getBob();
    ybob.getBob();
    //if (frameCount % 100 == 0) zbob.getBob();
    for (int x = 0; x < (width - 1); x+=10) {
      for (int y = 0; y < (height -1); y += 10) {
          //fill(simg.pixels[floor(y * width + x)]);
          float r = zbob.getBobTail(2*x,2*y);
          float roff = rfact;
          if (r > roff) {
            r = map(r, roff, 1.0, 1., 3.0);
            fill(apal.getColor(r));
            r *= 10.;
            pushMatrix();
            translate(x,y, 0-50-8*rfact*r);
            sphere(r);
            popMatrix();
          }      
    }
     
     
   }
    
   
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

   xdiv = 5;
   ydiv = 23;
   rfact = 0.8 + 0.2 * random(1);
   
   xbob = new NoizeBob(1.0, 0.0001, 0.5);
   ybob = new NoizeBob(1.0, 0.1, 0.7);
   zbob = new NoizeBob_2D(1.0, 0.3, 0.3, 0.7);
   zbob.getBob();
   
   apal = new AutoPalette();
  gf = new PImage[13];
  gf[0] = loadImage("gfaces/gface_0179.jpg");
  gf[1] = loadImage("gfaces/gface_0180.jpg");
  gf[2] = loadImage("gfaces/gface_0181.jpg");
  gf[2] = loadImage("gfaces/gface_0182.jpg");
  
  gf[2].resize(width,height);
 }
 
}
