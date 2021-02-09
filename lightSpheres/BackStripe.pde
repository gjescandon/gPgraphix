class BackStripe {
  color[] scolorArr;
  NoizeBob[] sbobArr;
  int ii;
  
  BackStripe() {
    ii = 13;
    scolorArr = new color[ii];
    sbobArr = new NoizeBob[ii];
    for (int i=0; i < ii; i++) {
     sbobArr[i] = new NoizeBob(1.0, 0.5, 6, 0.001);
     scolorArr[i] = color(10 + sbobArr[i].getBob(), 100, 100);
     
    }
  }
    
    void draw() {
    
      for (int i =0; i<ii; i++) {

        float bb = sbobArr[i].getBob();
        float x1 = 0.7 * width * bb;
        float y1 = -600;
        float z1 = -900 + 100 * bb;
        
        float x2 = x1 + (260  * bb);
        float y2 = 0.5 * height * bb;
        float z2 = -900 + 100 * bb;;
        
        float x3 = x1 - (260  * bb);
        float y3 = height * bb;
        float z3 = -900 + 100 * bb;;
        
        float x4 = x1 * bb;
        float y4 = height - y1;
        float z4 = -900 + 100 * bb;;
        
        noFill();
        stroke(color(40 + 40 * sbobArr[i].getBob(), 100, 100));
        strokeWeight(80*bb);
        bezier(x1, y1, z1, x2, y2, z2, x3, y3, z3, x4, y4, z4);
      }
    
    
  }
}
