class Bola {
  // posición
  private float x;
  private float y;

  // color
  private float r;
  private float g;
  private float b;
  private float a;
  
  private float tamano;
  private float distanciaReaccion;
  
  public Bola(float x, float y, float r, float g, float b) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.g = g;
    this.b = b;
    this.a = 100;
    tamano = random(40, 200);
    distanciaReaccion = 500 * 40 / tamano;
  }
  public Bola(float x, float y) {
    this(x, y, random(256), random(256), random(256));
  }
  public void dibujar() {
    dibujarCirculo();
    dibujarLinea();
  }
  private void dibujarCirculo() {
    noStroke();
    fill(r, g, b, a);
    ellipse(x, y, tamano, tamano);
  }
  private void dibujarLinea() {
    float distancia = sqrt(sq(mouseX - x) + sq(mouseY - y));
    if (distancia < distanciaReaccion) {
      strokeWeight(2);
      stroke(255, 255, 255, 50);
      line(mouseX, mouseY, x, y);
      actualizar();
    }
  }
  private void actualizar() {
     x += (mouseX - x) / (250 * tamano / 40);
     y += (mouseY - y) / (250 * tamano / 40);
  }
}