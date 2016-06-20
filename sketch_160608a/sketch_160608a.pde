// Ejemplo de movimiento y oscilaciones
// Esteban Castro y Mauricio Avilés
// Basado en el ejemplo de Tomás de Camino Beck

float amplitude;
float angle = 0;
float acc = 0;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  amplitude = width / 3;
  rectMode(CENTER);
  noCursor();
}

void draw() {
  //background(0);
  translate(width / 2, height / 2);
  fill(0, 0, 0, 5);
  rect(0, 0, width, height);
  float tempAngle = noise(angle) * 2;
  for (int y = 0; y < height; y++) {
    float x = amplitude * sin(tempAngle);
    float r = map(sin(tempAngle), -1, 1, 0, 255);
    float g = map(sin(tempAngle), -1, 1, 255, 0);
    float b = map(cos(tempAngle), -1, 1, 0, 255);
    fill(r, g, b, 25);
    ellipse(x, height / 2 * sin(y), cos(y) * 50, cos(y) * 50);
    tempAngle += 0.01;
  }
  angle += 0.00005 + acc;
  acc += 0.00001;
}