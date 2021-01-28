PImage blue, red, gold, green;
int cinc;

void setup(){
  size(1080,720,P3D);
  blue = loadImage("0blue2.png");
  red = loadImage("0red2.png");
  gold = loadImage("0gold2.png");
  green = loadImage("0green2.png");
}

void draw() {
  colorMode(HSB,100);
  background(0);
  noStroke();
  directionalLight(100,0,100,0.5*sin(0.001*frameCount),0.5*cos(0.002*frameCount),-1);
  
  pushMatrix();
  translate(0.35*width, 0.72*height, 0);
  fill(getColorFromSwatch(gold));
  sphere(150);
  popMatrix();
  
  pushMatrix();
  translate(0.7*width, 0.27*height, 0);
  fill(getColorFromSwatch(green));
  sphere(150);
  popMatrix();
  
  pushMatrix();
  translate(0.35*width, 0.27*height, 0);
  fill(getColorFromSwatch(blue));
  sphere(150);
  popMatrix();
  
  pushMatrix();
  translate(0.7*width, 0.73*height, 0);
  fill(getColorFromSwatch(red));
  sphere(150);
  popMatrix();
}

color getColorFromSwatch(PImage pim) {
  color c;
  pim.loadPixels();
  int index = pim.pixels.length/2;
  float x = 0.4*pim.height*cos(0.00001*cinc);
  float y = 0.4*pim.height*sin(0.00001*cinc);
  x = x + 0.5*pim.width;
  y = y + 0.5*pim.height;
  index = floor(pim.width*y + x);
  c = pim.pixels[index];
  cinc++;
  return c;
  
}
