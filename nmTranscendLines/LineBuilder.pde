class LineBuilder {
  int levels;
  int[] lineArr;
  NoizeBob sbob, lbob;
  int x0, y0, orient, len0, sep0;
  int xoff, yoff;
  
  LineBuilder() {
    setup();
  }
  
  void setup() {
    levels = 2 + floor(random(4));
    
    x0 = floor(random(width));
    y0 = floor(random(height));
    x0 = 100;
    y0 = 100;
    len0 = 100 + floor(random(0.6*height));
    sep0 = 13 + floor(random(21.));
    orient = floor(random(2)); // 0 = vertical ; 1 = horizontal
    
    println(levels);
    println(len0);
    println(sep0);
    println(orient);
    
    sbob = new NoizeBob(sep0, 0.1, 0.7);
    lbob = new NoizeBob(1., 0.1, 0.7);
    sbob.getBob();
    lbob.getBob();
    lineArr = new int[levels];
    for (int i = 0; i < levels; i++) {
     lineArr[i] = 2 + floor(random(3)); 
     println("lineArr " + i + " : " + lineArr[i]);
    }
    
    xoff = floor(random(width));
    yoff =  floor(random(height));
    
  }
  
  
  void draw() {
    pushMatrix();
    translate(xoff, yoff);
    for (int i = 0; i < levels; i++) {
      pushMatrix();
      rotate(i*(0.5)*PI);
      translate(0.5*x0, 0);
      stroke(0.5 + lbob.getBobTail(i));
      strokeWeight(1. + 5.* lbob.getBobTail(i));
      
      for (int j = 0; j < lineArr[i]; j++) {
       //int orientMe = (orient + i) % 2;
       
       int x1 = j* sep0 +  floor(0 - 0.5*x0 + sbob.getBobTail(i*levels + j));        
       int x2 = x1; //+ floor(100 + lbob.getBobTail(i*levels + j)); 
       int len = floor(len0 * (1. + lbob.getBobTail(i*levels + j)));
       int y1 = y0 - floor(0.5* len  + sbob.getBobTail(i*levels + j));
       int y2 = y1 + floor(0.5* len);
       line(x1, y1, x2, y2);
      }
      popMatrix();
    }
    popMatrix();
  }
  

}
