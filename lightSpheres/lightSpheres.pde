/**
 * Directional. 
 * 
 * Move the mouse the change the direction of the light.
 * Directional light comes from one direction and is stronger 
 * when hitting a surface squarely and weaker if it hits at a 
 * a gentle angle. After hitting a surface, a directional lights 
 * scatters in all directions. 
 */

RotSphere[] rsArr;
float lx, lxInc;
NoizeBob lbob, cbob, yBob;
BackStripe bs;

void setup() {
  size(1280, 720, P3D);
  noStroke();
  fill(204);
  
  rsArr = new RotSphere[8];
  for (int i = 0; i< 8; i++) {
    rsArr[i] = new RotSphere(2.0 * i * PI / 8.0);
  }
  lx = 0.0;
  lxInc = 0.001;
  lbob = new NoizeBob(0.03, 0.5);
  cbob = new NoizeBob(10, 0.4, 5, 0.1);
  bs = new BackStripe();
  yBob = new NoizeBob(0.6, 0.3);
}

void draw() {
  noStroke(); 
  background(0); 


  //float dirY = (mouseY / float(height) - 0.5) * 2;
  //float dirX = (mouseX / float(width) - 0.5) * 2;
  rotateY(yBob.getBob());
  colorMode(HSB, 100);
  ambientLight(10 + cbob.getBob(), 100, 60);
  directionalLight(90, 20, 80, sin(lx), -1,  0.4 * sin(lx) - 0.6); 
  
  bs.draw();
  
  noStroke();
  lx += lbob.getBob();
    for (int i = 0; i< 8; i++) {
    rsArr[i].move();
  }
  
  //saveFrame();
}
