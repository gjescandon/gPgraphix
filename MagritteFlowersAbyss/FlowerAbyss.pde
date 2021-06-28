class FlowerAbyss {
  AutoPalette apal;
  
  FlowerAbyss(){
    apal = new AutoPalette();
  }
  
  void drawFlower() {

    pushMatrix();
    translate(0.5*width, 0.5*height,0);
    stroke(0.);
    line(-100,0,100,100,0,100);
    noStroke();
    float cc = 0.01*frameCount - floor(0.01*frameCount);
    fill(apal.getColor(cc));
    sphere(100);
    popMatrix();
    
  }
  
  
}
