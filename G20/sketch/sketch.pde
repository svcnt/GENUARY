// INFO ************** //
//////////////////////////////
/*

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

int margen = 100;
int sep = 6;


// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  background(#202020);
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
  // stroke(255);
  // strokeWeight(5);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  float t = frameCount*0.01;
  pushMatrix();
  translate(ancho/2, alto/2);
  rotate(t);
  pushMatrix();
  translate(200,0);
  rotate(t);
  fill(255, 10);
  stroke(0, 10);
  rect(0, 0, 100, 100);
  rotate(-t);
  fill(0, 10);
  stroke(255, 10);
  rect(0, 0, 100, 100);
  popMatrix();
  popMatrix();



}

// FUNCIONES ************** //
//////////////////////////////
void keyPressed(){
  if(key == 's'){
    save(pathExport + "G20/" + timeStamp() + ".png");
  }
}

String timeStamp(){
  String y = str(year());
  String m = nf(month(), 2);
  String d = nf(day(), 2);
  String h = nf(hour(), 2);
  String mn = nf(minute(), 2);
  String s = nf(second(), 2);

  String ts = y + m + d + h + h + m + s;

  return ts;
}

void mousePressed(){
  setup();
}
