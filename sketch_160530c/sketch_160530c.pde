Mover m;

void setup() {
  fullScreen();
  m = new Mover();
}

void draw() {
  background(0, 0, 0);
  m.update();
  m.display();
}