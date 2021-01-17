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
int ancho = 750;
int alto = 750;
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
  background(#202020);
  //noStroke();
  stroke(255);
  img = new Movie(this, "vid002.mp4");
  img.loop();
  img.volume(0);
  //img.speed(0.25);
  for(int i = 0; i < pos.length; i++){
    pos[i] = (int)random(width);
    tam[i] = (int)random(50, 200);
  }
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  // image(img, 0, 0, 750, 750);
  float t = frameCount * 0.5;
  for(int i = 0; i < 360; i++){
    //strokeWeight(3);
    color c = img.get(
      int(img.width/2 + sin(radians(t*0.01)) * i*0.5),
      int(img.height/2 + cos(radians(t*0.1)) * i*0.5)
      );
    if(brightness(c) > noise(t*0.1)*175 && i > 100){
      stroke(c);
    } else {
      noStroke();
    }
    point(
      ancho/2 + sin(radians(t)) * i,
      alto/2 + cos(radians(t)) * i
      );
  }

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
    save(pathExport + "G13/" + timeStamp() + ".png");
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
