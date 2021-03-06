// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 4 / SMALL AREAS OF SYMMETRY
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////
import processing.video.*;

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 960;
int alto = 540;
String pathData = "../../data/";
String pathExport = "../../export/";

Movie img;

int[] pos = new int[5];
int[] tam = new int[5];


// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  frameRate(24);
  noStroke();
  img = new Movie(this, "vid001.mp4");
  img.loop();
  img.speed(0.25);
  for(int i = 0; i < pos.length; i++){
    pos[i] = (int)random(width);
    tam[i] = (int)random(50, 200);
  }
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  image(img, 0, 0);
  for(int i = 0; i < pos.length; i++){
    espejo(pos[i] + (int)(noise(frameCount*0.01/i)*200), 0, tam[i], height);
    espejo(width/2, pos[i]*(width/height), width/2, tam[i]);
  }
  saveFrame(pathExport + "G04b/frames/" + "G04b - ####.png");
  surface.setTitle("FPS: " + frameRate);
}

// FUNCIONES ************** //
//////////////////////////////

void movieEvent(Movie m) {
  m.read();
}

void espejo(int _x, int _y, int _w, int _h){
  int x = _x; int y = _y; int w = _w; int h = _h;

  copy(x,y,-w,h,x,y,w,h);
  // stroke(255);
  // noFill();
  // rect(x, y, w, h);
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G04b/" + timeStamp() + ".png");
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
  switch(mouseButton) {
    case LEFT:
      setup();
    break;
    case RIGHT:
      for(int i = 0; i < pos.length; i++){
        pos[i] = (int)random(width);
        tam[i] = (int)random(50, 200);
      }
    break;
    default:
      //
    break;
  }
}
