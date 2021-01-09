// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY 9 / Interference patterns
José Vicente Araújo - 2021
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = 750;
String pathData = "../../data/";
String pathExport = "../../export/";



// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);

}

void setup(){
  rectMode(CENTER);
  //blendMode(MULTIPLY);
  noFill();
  strokeWeight(8);

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(50);
  pushMatrix();
  translate(ancho/1.95, alto/2);
  rotate(frameCount*0.001);
  stroke(255, 125);
  r(0, 0, ancho-20);
  popMatrix();
  // pushMatrix();
  // translate(ancho/2.05, alto/2);
  // rotate(frameCount*0.0015);
  // stroke(0, 125);
  // r(0, 0, ancho-20);
  // popMatrix();
}

// FUNCIONES ************** //
//////////////////////////////

void r (int x, int y, float sz){
  for(int i = int(sz); i > 10; i-=20){
    sz -= 20;
    pushMatrix();
    translate(x, y);
    rotate(frameCount*0.000015*i);
    rect(x, y, sz, sz, /*(sz/2) +*/ mouseX);
    popMatrix();

  }

}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G09/" + timeStamp() + ".png");
  }
}

String timeStamp(){
  String y = str(year());
  String m = str(month());
  String d = str(day());
  String h = str(hour());
  String mn = str(minute());
  String s = str(second());

  String ts = y + m + d + h + h + m + s;

  return ts;
}

void mousePressed(){
  setup();
}
