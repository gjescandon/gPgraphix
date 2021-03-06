class Horizon{
  
 float yoff, yinc, xoff, xinc;
 float ynot, yMax;
 color myFill, myStroke;
 int octaveCount;
 float noiseLevel;
 float ydrift, driftInc;
 float thetaOff, tInc;
 AutoPalette apal;
 NoizeBob cbob, tbob;
 
 Horizon(int octaveCount_, float noiseLevel_, float ninc_, float yMax_, float thetaOff_) {

   cbob = new NoizeBob(1.0,0.001*random(1),0.5);
   apal = new AutoPalette(random(1));
   tbob = new NoizeBob(1.0,0.001*random(1),0.5);
   
   ynot = 0.0;
   yoff = random(8);
   yinc = (0.01 + 0.0001 * random(0, 1));
   xoff = random(8);
   xinc = (0.01 + 0.01 * random(0, 1));
   myFill = getMyColor();
   myStroke = getMyColor();
   octaveCount = octaveCount_;
   noiseLevel = noiseLevel_;
   yMax = yMax_;
   ydrift = 0.0;
   driftInc = (0.001 + 0.005 * random(0, 1));
   if (random(0, 1) > 0.6) {
     driftInc = - driftInc;
   }
   thetaOff = thetaOff_;
   tInc = ninc_;
   
 }
 
  void draw() {
   xoff = 0.0;
   noiseDetail(octaveCount, noiseLevel);
   fill(myFill);
   strokeWeight(1+cbob.getBob());
    
   stroke(myStroke);
   
   pushMatrix();
   //translate(xnPropOff * 0.5 * width, ynPropOff * 0.5* height);
   translate((0.5 * width)+(0.4*width*xnPropOff - 0.2*width), (0.5* height)+(0.4*height*ynPropOff - 0.2*height));
   pushMatrix();
   //rotateZ(thetaOff + tbob.getBob());
   rotate(thetaOff);
   pushMatrix();
   beginShape();
   myFill = getMyColor();
   myStroke = getMyColor();
   for (int i=0; i<  1.3*width; i++) {
     float y = ynot + (map(0.3+noise(xoff, yoff), 0, 1.3, 13, yMax)) * 1 * i / width;
     float x = i;
     vertex(x, y);
     xoff += xinc;
   }
   for (int i=  floor(1.3*width); i>= 0; i--) {
     float y = ynot - (map(0.3+noise(xoff, yoff), 0, 1.3, 13, yMax)) * 1 * i / width;; 
     float x = i;
     vertex(x, y);
     xoff -= xinc;
   }
   endShape(CLOSE);
   popMatrix();
   popMatrix();
   popMatrix();
   yoff += yinc;
   thetaOff += tInc + 0.003*tbob.getBob();
  }
  
  color getMyColor() {
   return apal.getColor50(cbob.getBob(),0.8); 
  }
}
