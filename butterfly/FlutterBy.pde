class FlutterBy {
 
  PImage[] fb0, fb;
  PImage[] bkimg;
  float fbMax = 13.;
  
  int fbint = 0;
  int bkint = 0;
  NoizeBob fbob, tbob;
  FibberCircles fc;
  float toff, tinc;
  FlutterBy() {
    fc = new FibberCircles();
    toff = 0;
    tinc = 0.001;
    setup();
    
  }
  
  void draw() {
    
    //background
    if (random(1)  > 0.97) bkint = floor(random(3));
    pushMatrix();
    //translate(0,0,-100);
    image(bkimg[bkint], 0 , 0 , width, height);
    popMatrix();
    
    /*
    if (random(1)  > 0.97) fbint = floor(random(10));
    pushMatrix();
    translate(0.5*(width - fb[0].width), 0.5*(height- fb[0].height), 0);
    image(fb[fbint],0,0);
    popMatrix();
    */
    tbob.getBob();
    
    for (int i = 0; i < fbMax; i++) {
    if (random(1)  > 0.97) fb[i] = fb0[floor(random(10))];
      //fc.draw(fb[i], i * (TWO_PI / fbMax) + toff + tbob.getBobTail(i*10));
      
    }
    
    toff += tinc;
    
    
  }
  
  
  void setup() {
    fbob = new NoizeBob(1.0, 0.01, 0.3);
    tbob = new NoizeBob(1.0, 0.01, 0.3);
    fb0 = new PImage[10];
    fb = new PImage[floor(fbMax)];
    fb0[0] = loadImage("bf01_blu.png");
    fb0[1] = loadImage("bf01.png");
    fb0[2] = loadImage("bf02_blu.png");
    fb0[3] = loadImage("bf02.png");
    fb0[4] = loadImage("bf03_blu.png");
    fb0[5] = loadImage("bf03.png");
    fb0[6] = loadImage("bf04_blu.png");
    fb0[7] = loadImage("bf04.png");
    fb0[8] = loadImage("bf05_blu.png");
    fb0[9] = loadImage("bf05.png");

    fb[0] = loadImage("bf01_blu.png");
    fb[1] = loadImage("bf01.png");
    fb[2] = loadImage("bf02_blu.png");
    fb[3] = loadImage("bf02.png");
    fb[4] = loadImage("bf03_blu.png");
    fb[5] = loadImage("bf03.png");
    fb[6] = loadImage("bf04_blu.png");
    fb[7] = loadImage("bf04.png");
    fb[8] = loadImage("bf05_blu.png");
    fb[9] = loadImage("bf05.png");
    fb[10] = loadImage("bf05.png");
    fb[11] = loadImage("bf05.png");
    fb[12] = loadImage("bf05.png");
    
    bkimg = new PImage[10];
    bkimg[0] = loadImage("flowerGerry2806.jpg");
    bkimg[1] = loadImage("flowerGerry2821.jpg");
    bkimg[2] = loadImage("flowerGerry2822.jpg");
    
  }
}
