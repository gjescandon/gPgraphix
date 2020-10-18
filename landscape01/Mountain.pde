class Mountain{
 
  NoizeBob bob1, bob2, bob3;
  int q = 3;
  PShape ps;
  color c;
  
  Mountain() {
    bob1 = new NoizeBob(1., 1.6, 0.2);
    bob2 = new NoizeBob(1., 1.6, 0.2);
    bob3 = new NoizeBob(1., 1.0, 0.9);
    c = color(0.1, 0.6, 0.3 + 0.5*random(1));
  }
  
  void draw() {
    pushMatrix();
    rotateX(PI);
    colorMode(HSB,1.0);
    drawM3();
    popMatrix();
  }
  
  void drawM3() {
    if (frameCount %50 == 0) {
      bob1.getBob();
      bob2.getBob();
      bob3.getBob();
    }
    
    PShape ps = createShape();
    ps.setFill(c);
    ps.beginShape();
    ps.vertex(0,0);
    //drawPoles(ps, 0, width);
    float d = 1.0*width/q/q/q;
    for (int i = 0; i < q; i++) {
      for (int j = 0; j < q; j++) {
        for (int k = 0; k < q; k++) {
          float hh = 200.;
          hh += 64.* d * (bob1.getBobTail(i) + (bob1.getBobTail(i+1)-bob1.getBobTail(i))*((j*q+k))/(q));
          hh += 8.*d*(bob2.getBobTail(j) + (bob2.getBobTail(j+1)-bob2.getBobTail(j))*((k)));
          //hh += 1.*d*bob3.getBobTail(k);
          ps.vertex((i*q*q+j*q+k)*d, hh );
        }
      }
    }

    float hh = 200.;
    hh += 64.* d * (bob1.getBobTail(q-1));
    hh += 8.*d*(bob2.getBobTail(q-1));
    hh += 1.*d*bob3.getBobTail(q);

    ps.vertex(width, hh);
    ps.vertex(width,0);
    ps.endShape();
    shape(ps,0,0,width,100);
    
  }
  
  
}
