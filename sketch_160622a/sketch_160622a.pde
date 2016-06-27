ArrayList<Mover> movers;
int cant = 2000;
void setup() {
  fullScreen();
  noCursor();
  movers = new ArrayList();
  for (int i = 0; i < cant; i++) {
    movers.add(new Mover());
  }
  background(0);
}

void draw() {
  background(0);
  if (mousePressed) {
    for (Mover m : movers) {
      PVector mouse = new PVector(mouseX, mouseY);
      PVector wind = PVector.sub(mouse, m.location);
      wind.normalize();
      wind.mult(-1);
      m.applyForce(wind);
    }
  }
  for (Mover m : movers) {
    m.update();
    m.display();
  }
  drawMouse();
}
void drawMouse() {
  noStroke();
  fill(255, 255, 255, 50);
  ellipse(mouseX, mouseY, 50, 50);
}