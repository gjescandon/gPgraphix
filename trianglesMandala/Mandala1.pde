class Mandala1 {
  
  PShape[] shapeArr;
  NoizeBob[] thetaNoizeArr;
  float[] radArr;
  int[] leafArr;
  float radInc = 0.02;
  float rad0 = 10.0;
  float radMax = 0.025 * width;
  int scnt = 7;
  int mancnt = 22;
  int frameOffset = 50;
  boolean addCircle = true;
  AutoPalette apal;
  
  Mandala1() {
    apal = new AutoPalette(0.8, 2.5, 0.2);
    shapeArr = new PShape[mancnt];
    radArr = new float[mancnt];
    thetaNoizeArr = new NoizeBob[mancnt]; 
    leafArr = new int[mancnt];
    for (int i = 0; i < mancnt; i++) {
      shapeArr[i] = getShape();
      radArr[i] = rad0;
      thetaNoizeArr[i] = new NoizeBob(1.1, 0.6);
      leafArr[i] = 5 + floor(random(7));
    }
    

 }
  
  
  void draw() {
    for (int i=0; i < shapeArr.length; i++) {
      float radIn = radArr[i];
      if (frameCount > i * frameOffset) {
        float nbob = thetaNoizeArr[i].getBob();
        
        pushMatrix();
        translate(0,0,i*0.15*radIn);
        drawShape(shapeArr[i], radIn, nbob, leafArr[i]);
        popMatrix();
        radIn += radInc * nbob;
        if (radIn > radMax) {
          radIn = rad0;
          shapeArr[i] = getShape();
        } 
        radArr[i] = radIn;
        //println(radIn);
      }
    }
    
    
  }
  
  void drawShape(PShape thisShape, float rad, float tOff, int leafCnt) {
    int x0 = floor(random(1)) + width /2;
    int y0 = floor(random(1)) + height / 2;
    float theta0 = TWO_PI / leafCnt;

    float shapeOffX = 0.5 * thisShape.width;
    float shapeOffY = 0.5 * thisShape.height;

    pushMatrix();
    translate(x0, y0, map(rad, rad0, radMax, 100, 0));
    for(int i =0; i < leafCnt; i++) {
      float x = rad * cos(tOff + i* theta0) - shapeOffX;
      float y = rad * sin(tOff + i* theta0) - shapeOffY;
      pushMatrix();
      //translate(-shapeOffX, -shapeOffY);
      //rotate(i*theta0);
      scale(map(rad,rad0,radMax,1.0,50.0));
      //thisShape.rotateZ(tOff + i*theta0);
      shape(thisShape, x, y);
      thisShape.resetMatrix();
      popMatrix();
    }
    popMatrix();
       
    
    
  }
  
  
  PShape getShapeCircle() {
   PShape result;
    result = createShape(ELLIPSE, 0, 0, 5 + random(5), 3 + random(5));
    result.setFill(apal.getColor(random(1)));
    result.setStroke(apal.getColor(random(1)));
    return result;
  
  }
  PShape getShapeSquare() {
   PShape result;
    result = createShape(RECT, 0, 0, 5 + random(5), 5 + random(5));
    result.setFill(apal.getColor(random(1)));
    result.setStroke(apal.getColor(random(1)));
    return result;
  
  }

  PShape getShapeDiamond() {
   PShape s;
      s = createShape();
    s.beginShape();
    s.fill(apal.getColor(random(1)));
    int pval = floor(0.5 * (5 + random(5)));
    s.stroke(apal.getColor(random(1)));
    s.vertex(pval, 0);
    s.vertex(pval + pval, pval);
    s.vertex(pval, pval + pval);
    s.vertex(0, pval);
    s.endShape(CLOSE);
    return s;
  
  }

  PShape getShapeTriangle() {
   PShape s;
      s = createShape();
    s.beginShape();
    s.fill(apal.getColor(random(1)));
    int pval = floor(0.5 * (5 + random(5)));
    s.stroke(apal.getColor(random(1)));
    s.vertex(pval + pval, 0);
    s.vertex(pval + pval, -pval);
    s.vertex(0, -0.5 * pval);
    s.endShape(CLOSE);
    return s;
  
  }
  
  PShape getShape() {
    float f = 10 * random(1);
    PShape result = getShapeTriangle();
    if (f < 3.0) {
      result = getShapeCircle();
    } else if (f < 6.0) {
      result = getShapeDiamond();
    } 
    return result;
      
  }
  
  
  
}
