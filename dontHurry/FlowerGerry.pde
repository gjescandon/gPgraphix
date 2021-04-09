class FlowerGerry {
  
  float index = 7;
  float ll;
  NoizeBob swbob, llbob, xbob, ybob;
  AutoPalette apal;
  float c0, cinc;
  PImage[] imgs;

  FlowerGerry() {
   setupImages();
   llbob = new NoizeBob(1.0, 0.001, 0.5);
   swbob = new NoizeBob(1.0, 0.001, 0.5);
   xbob = new NoizeBob(100.0, 0.001, 0.5);
   ybob = new NoizeBob(100.0, 0.001, 0.5);
   apal = new AutoPalette();
   c0 = 0.;
   cinc = 0.0004;

 }
 
 void draw(float rad) {
   
 }
 

 
 
 void setupImages() {
   imgs = new PImage[10];
   imgs[0] = loadImage("flowerLinda01.png");
    imgs[1] = loadImage("flowerLinda02.png");
    imgs[2] = loadImage("flowerLinda03.png");
    imgs[3] = loadImage("flowerLinda04.png");
    imgs[4] = loadImage("flowerLinda05.png");
    imgs[5] = loadImage("flowerLinda06.png");
    imgs[6] = loadImage("flowerLinda07.png");
    imgs[7] = loadImage("flowerLinda08.png");
    imgs[8] = loadImage("flowerLinda09.png");
    imgs[9] = loadImage("flowerLinda10.png"); 
   }
}
