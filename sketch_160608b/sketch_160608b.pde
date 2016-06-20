// Ejemplo sobre movimiento
// Mauricio Avilés
// Basado en el ejemplo de Tomás de Camino

int nBolas = 100;
ArrayList<Bola> bolas = new ArrayList<Bola>();
 
void setup() {
  fullScreen();
  noCursor();
  smooth();
  for (int i=0; i<nBolas; i++) {
    bolas.add(new Bola(random(width), random(height)));
  }
}
 
void draw() {
  noStroke();
  background(0);
  fill(116, 255, 255);
  ellipse(mouseX, mouseY, 20, 20);//dibuja la elipse del mouse
  for (Bola b : bolas) {
    b.dibujar();
  }
}