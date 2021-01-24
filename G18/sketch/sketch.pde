// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 18 / One process grows, another process prunes.
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////
import processing.video.*;

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 640;
int alto = 480;
String pathData = "../../data/";
String pathExport = "../../export/";

Movie img;

float sep = 40;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);

}

void setup(){
  colorMode(HSB);
  background(#202020);
  noStroke();
  img = new Movie(this, "01.mp4");
  img.loop(); img.speed(1);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  surface.setTitle("FPS: " + frameRate);
  fill(#202020, 25);
  rect(0, 0, ancho, alto);

  for(int i = 1; i < height; i+=sep){
    for(int ii = 1; ii < width; ii+=sep){
      color c = img.get(ii, i);
      float sz = map(brightness(c), 0, 255, 0, sep);
      fill(255, 100);
      ellipse(sep/2+ii, sep/2+i, sz, sz);
    }
  }

  for(int i = 1; i < height; i+=sep){
    for(int ii = 1; ii < width; ii+=sep){
      color c = img.get(ii, i);
      float sz = map(brightness(c), 0, 255, sep, 0);
      fill(
        c,
        100);
      ellipse(sep/2+ii, sep/2+i, sz, sz);
    }
  }

}

// FUNCIONES ************** //
//////////////////////////////

void movieEvent(Movie m) {
  m.read();
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G18/" + timeStamp() + ".png");
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
  switch(mouseButton) {
    case LEFT:
      setup();
    break;
    case RIGHT:
      //
    break;
    default:
      //
    break;
  }
}
