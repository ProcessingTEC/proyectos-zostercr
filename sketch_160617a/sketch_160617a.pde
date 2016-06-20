ArrayList<Mover> movers = new ArrayList();
BackRect back = new BackRect();
int n = 2;

void setup() {
  fullScreen();
  for (int i = 0; i < n; i++) {
    movers.add(new Mover());
  };
  background(0, 0, 0);
}

void draw() {
  back.update();
  for (Mover m : movers) {
    m.update();
  }
}

void mousePressed() {
  movers.add(new Mover());
}