// Mauricio Avilés
// Basado en el código de Matt Pearson

float xstart, ynoise;
float xstartOff, ynoiseOff;

void setup() {
  fullScreen(P3D);
  //stroke(200, 50);
  noStroke();
  xstartOff = random(100);
  ynoiseOff = random(100);
}
void draw() {
  background(0, 0, 0, 50);
  xstartOff += 0.002;
  ynoiseOff += 0.004;
  xstart = xstartOff;
  ynoise = ynoiseOff;
  translate(width/2, height/2, 0);
  for (float y = -height/8; y <= height/8; y += 3) {
    ynoise += 0.02;
    float xnoise = xstart;
    for (float x = -width/8; x <= width/8; x += 3) {
      xnoise += 0.02;
      drawPoint(x, y, noise(xnoise, ynoise));
    }
  }
}
void drawPoint(float x, float y, float noiseFactor) {
  pushMatrix();
  translate(x * noiseFactor * 5, y * noiseFactor * 5, -y);
  float edgeSize = noiseFactor * 26;
  fill(110 + 145 * noiseFactor, 20, 55 + 200 * (1 - noiseFactor), 30);
  ellipse(0, 0, edgeSize, edgeSize);
  popMatrix();
}