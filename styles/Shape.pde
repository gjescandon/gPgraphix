class ShapeDemo {
 PShape s;
 ShapeDemo() {
 }
 
 
 void drawTriangle() {
  s = createShape();
  s.beginShape(TRIANGLE_STRIP);
  s.vertex(30, 75);
  s.vertex(40, 20);
  s.vertex(50, 75);
  s.vertex(60, 20);
  s.vertex(70, 75);
  s.vertex(80, 20);
  s.vertex(90, 75);
  s.endShape();
  shape(s, 0, 0);
 }


 void drawArc() {
  s = createShape();
  s.beginShape(ARC);
  s.vertex(30, 75);
  s.vertex(40, 20);
  s.vertex(50, 75);
  s.vertex(60, 20);
  s.vertex(70, 75);
  s.vertex(80, 20);
  s.vertex(90, 75);
  s.endShape();
  shape(s, 0, 0);
 }
 
 void drawAlien() {
   
// Create the shape group
  PShape alien, head, body;
  alien = createShape(GROUP);

  // Make two shapes
  ellipseMode(CORNER);
  head = createShape(ELLIPSE, -25, 0, 50, 50);
  head.setFill(color(255));
  body = createShape(RECT, -25, 45, 50, 40);
  body.setFill(color(0));

  // Add the two "child" shapes to the parent group
  alien.addChild(body);
  alien.addChild(head);
  
  shape(alien, 50, 15);
 }
}
