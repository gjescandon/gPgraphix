class Chords {
  
  float index = 1;
     float ll;
  NoizeBob swbob, llbob, xbob, ybob;
 Chords() {
   llbob = new NoizeBob(1.0, 0.01, 0.5);
   swbob = new NoizeBob(1.0, 0.01, 0.5);
   xbob = new NoizeBob(100.0, 0.01, 0.5);
   ybob = new NoizeBob(100.0, 0.01, 0.5);
 }
 
 void draw() {
   ll = width * 0.5 * llbob.getBob();
   strokeWeight(100 * swbob.getBob());
   stroke(1.);
   fill(1.);
   pushMatrix();
   rotateZ(-0.001*frameCount);
   drawBox();
   popMatrix();
 }
 
 
 void drawChord() {
    
   
   
 }
}
