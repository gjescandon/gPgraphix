Spirograph spiro;
void setup() {
  size(720, 720);
  spiro = new Spirograph(10, 13, -5, 10);  
}

void draw() {
  spiro.draw();
}
