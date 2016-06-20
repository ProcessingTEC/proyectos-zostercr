float iOff = random(100);
float dOff = random(100);

void setup() {
  //size(400, 400);
  fullScreen();
  background(0);
}

void draw() {
  background(0);
  translate(width / 2, height);
  stroke(255, 255, 255);
  float tam = map(mouseX, 0, width, 100, 400);
  arbol(tam, 12);
  iOff += 0.001;
  dOff += 0.001;
}

void arbol(float len, int prof) {
  if (prof == 0) {
    return;
  }
  line(0, 0, 0, -len);
  pushMatrix();
  translate(0, -len);
  rotate(HALF_PI * noise(iOff));
  arbol(len * 0.8, prof - 1);
  popMatrix();
  pushMatrix();
  translate(0, -len);
  rotate(-HALF_PI * noise(dOff));
  arbol(len * 0.8, prof - 1);
  popMatrix();
}