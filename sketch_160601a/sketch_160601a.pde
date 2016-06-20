color current;

void setup() {
  fullScreen();
  background(0);
  noStroke();
  colorMode(RGB, 256);
  current = color(random(256), random(256), random(256));
}

void draw() {
  fill(0, 5);
  rect(0, 0, width, height);
  drawCircle(width/2, height, 10, current);
  current = alterarColor(current, 20);
}

void drawCircle(int x, int radius, int level, color c) {
  if (level == 0) {
    return;
  }
  fill(c, 50);
  ellipse(x, height / 2, radius, radius);      
  drawCircle(x - radius / 4, radius / 2, level - 1, alterarColor(c, 10));
  drawCircle(x + radius / 4, radius / 2, level - 1, alterarColor(c, 10));
}

color alterarColor(color c, float maxAlt) {
  return color(
    alterarValor(red(c), maxAlt), 
    alterarValor(green(c), maxAlt), 
    alterarValor(blue(c), maxAlt));
}

float alterarValor(float v, float maxAlt) {
  float res = v + random(maxAlt * 2) - maxAlt;
  if (res < 0) {
    res = 0;
  }
  if (res > 255) {
    res = 255;
  }
  return res;
}

color complementoComplemento(color c) {
  float r = red(c);
  float g = green(c);
  float b = blue(c);
  float max = max(r, max(g, b));
  float min = min(r, min(g, b));
  float sum = min + max;
  r = sum - r;
  g = sum - g;
  b = sum - b;
  return color(r, g, b);
}