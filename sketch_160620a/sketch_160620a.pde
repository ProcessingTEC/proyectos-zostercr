//Tomas de Camino Beck

import processing.serial.*;
Serial port;
float valorLuz = 0;
float valorTemp = 0;
float valorMic = 0;
float x = 0;


void setup() {
  port = new Serial(this, "COM7", 9600);
  port.bufferUntil('\n');  //clear the buffer
  fullScreen();
  background(0);
  noStroke();
  noCursor();
}

void draw() {
  fill(0, 0, 0, 10);
  rect(0, 0, width, height);
  float r = map(valorLuz, 0, 1023, 0, 255);
  float b = map(valorLuz, 0, 1023, 255, 0);
  fill(r, 0, b, 50);
  float size = map(valorMic, 0, 1023, 0, height);
  ellipse(x, height/2, size, size);
  x += 1;
  if (x > width) {
    x = 0;
  }
}

void serialEvent(Serial port) {
  String data = port.readString();
  String[] list = split(data, ',');
  valorLuz = float(list[0]);
  valorTemp = float(list[1]);
  valorMic = float(list[2]);
}

void stop() {
  port.stop();
}