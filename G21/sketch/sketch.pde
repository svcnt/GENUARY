// INFO ************** //
//////////////////////////////
/*
GENUARY / DAY 21 /
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  background(#202020);
  colorMode(HSB);
  rectMode(CENTER);
  noFill();
  stroke(255, 1);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  pushMatrix();
  translate(ancho/2, alto/2);
  f(100+noise(frameCount*0.005)*300);
  popMatrix();
}

// FUNCIONES ************** //
//////////////////////////////

void f(float x){
  d(x);
  if(x > 100){
    f(1*x/4);
    f(2*x/4);
    f(3*x/4);
  }
}

void d(float x){
  pushMatrix();
  rotate(x*0.02);
  stroke(x, 10);
  noFill();
  rect(0, x, x, x);
  rect(0, -x, x, x);
  fill(x, 150, 150, 10);
  rect(x, 0, x, x);
  rect(-x, -0, x, x);
  popMatrix();
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G21/" + timeStamp() + ".png");
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
