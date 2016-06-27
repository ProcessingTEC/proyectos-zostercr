HashMap<String, Integer> apellidos = new HashMap();
BufferedReader reader;
String line;
PFont font;
int total;

void setup() {
  reader = createReader("padron.txt");
  fullScreen();
  background(0);
  font = loadFont("TimesNewRomanPSMT-250.vlw");
  total = 0;
}

void draw() {
  background(0);
  for (int i = 0; i < 100000; i++) {
    String line = getLine(reader);
    if (line != null) {
      String[] datos = split(line, ',');
      sumarApellido(trim(datos[6]));
      sumarApellido(trim(datos[7]));
    }
  }
  dibujarBarras();
}

void dibujarBarras() {
  float ancho = width / float(total);
  int i = 0;
  for (String apellido : apellidos.keySet()) {
    float cantidad = apellidos.get(apellido);
    pushMatrix();
    textFont(font, cantidad / 12);
    textAlign(LEFT, TOP);
    translate(0, height - 20);
    rotate(-HALF_PI);
    fill(generarColor(apellido), 150);
    text(apellido, 0, i * ancho);
    popMatrix();
    i += cantidad;
  }
}

color generarColor(String p) {
  int val = 0;
  for (int i = 0; i < p.length(); i++) {
    val += int(p.charAt(i));
  }
  float r = (val * 137 + 233) % 256;
  float g = (val * 337 + 11) % 256;
  float b = (val * 211 + 23) % 256;
  return color(r, g, b);
}

String getLine(BufferedReader r) {
  String l;
  try {
    l = r.readLine();
  } 
  catch (IOException e) {
    e.printStackTrace();
    l = null;
  } 
  return l;
}

void sumarApellido(String apellido) {
  total++;
  if (apellidos.get(apellido) != null) {
    apellidos.put(apellido, apellidos.get(apellido) + 1);
  } else {
    apellidos.put(apellido, 1);
  }
}