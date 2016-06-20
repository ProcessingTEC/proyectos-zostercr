// Mauricio Avilés

Turtle t;
Node root;

void setup() {
  fullScreen();
  background(0);
  t = new Turtle(width / 2, height * 2 / 3, 0, color(0, 0, 0));
  t.setHeading(HALF_PI);
  t.penUp();
  arbol(200, 10);
}

void draw() {
  dibujarArbol(root);
}

void arbol(float len, int prof) {
  root = arbolAux(len, prof);
}

Node arbolAux(float len, int prof) {
  if (prof == 0) {
    return null;
  }
  Node root = new Node(t.getX(), t.getY());
  t.forward(len);
  t.left(QUARTER_PI);
  root.setLeft(arbolAux(len * 0.7, prof - 1));
  t.right(HALF_PI);
  root.setRight(arbolAux(len * 0.7, prof - 1));
  t.left(QUARTER_PI);
  t.back(len);
  return root;
}

void dibujarArbol(Node root) {
  if (root == null) {
    return;
  }
  PVector pos = root.getPos();
  ellipse(pos.x, pos.y, 10, 10);
  dibujarArbol(root.getLeft());
  dibujarArbol(root.getRight());
}