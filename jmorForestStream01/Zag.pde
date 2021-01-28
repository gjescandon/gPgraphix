class Zag {
  
  NoizeBob zbob, xbob, ybob;
  QuilezFunctions qf;
  AutoPalette apal;
  float cc, cinc;
  float cw;
  
  Zag() {
    init();
  }
  
  void draw() {
    zbob.getBob();
    xbob.getBob();
    ybob.getBob();
    
    float yy = 0.5*height;
    float imax = 18;
    for (int i=0; i < imax; i++) {
      cc -= cinc;
      stroke(apal.getColor(cc + 1.0*i/imax));
      strokeWeight(4);
      drawline(yy*(1-(0.7*i/imax))-ybob.getBobTail(i));
      drawInvertLine(yy*(1+(0.7*i/imax))+ybob.getBobTail(i));
    }

  }

    void drawline(float yy) {
    float xx = 0.0;
    float xc = 0.5*width;
    
    int inc =0;
    float cwbob = cw + ybob.getBobTail(inc);

    while(xx<=width) {
      
      line(xc+xx, yy-(zbob.getBobTail(inc)*qf.cubicPulse(xc, cwbob, xc+xx )),xc+xx+xbob.getBobTail(inc), yy-(zbob.getBobTail(inc-1)*qf.cubicPulse(xc, cwbob, xc+xx+xbob.getBobTail(inc) )));
      line(xc-xx, yy-(zbob.getBobTail(inc)*qf.cubicPulse(xc, cwbob, xc-xx )),xc-xx-xbob.getBobTail(inc), yy-(zbob.getBobTail(inc-1)*qf.cubicPulse(xc, cwbob, xc-xx-xbob.getBobTail(inc) )));
      xx += xbob.getBobTail(inc);
      inc--;
    }
    }

    void drawInvertLine(float yy) {

    float xx = 0.0;
    float xc = 0.5*width;
    
    int inc =0;
    float cwbob = cw + ybob.getBobTail(inc);
    
      while(xx<=width) {
      
      line(xc+xx, yy+(zbob.getBobTail(inc)*qf.cubicPulse(xc, cwbob, xc+xx )),xc+xx+xbob.getBobTail(inc), yy+(zbob.getBobTail(inc-1)*qf.cubicPulse(xc, cwbob, xc+xx+xbob.getBobTail(inc) )));
      line(xc-xx, yy+(zbob.getBobTail(inc)*qf.cubicPulse(xc, cwbob, xc-xx )),xc-xx-xbob.getBobTail(inc), yy+(zbob.getBobTail(inc-1)*qf.cubicPulse(xc, cwbob, xc-xx-xbob.getBobTail(inc) )));
      xx += xbob.getBobTail(inc);
      inc--;
    }
    
  }
  
  void init() {
    float z1 = 150.0;
    float zinc = 0.0009;
    float x1 = 10.0;
    float xinc = 0.5;
    float y1 = 50.0;
    float yinc = 0.005;
    zbob = new NoizeBob(z1, zinc, 1.0);
    xbob = new NoizeBob(x1, xinc, 0.7);
    ybob = new NoizeBob(y1, yinc, 0.3);
    
    qf = new QuilezFunctions();
    apal = new AutoPalette(0.5,0.3);
    
    cc = 0.1;
    cinc = 0.00003;
    
    cw = 320.0;
  }
}
