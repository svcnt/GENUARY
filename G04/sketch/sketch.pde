// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 4 / SMALL AREAS OF SYMMETRY
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

PImage img;

int[] pos = new int[5];
int[] tam = new int[5];
int num[] = {5, 6, 8};
int orden = 0;


// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  noStroke();
  img = loadImage(pathData + num[orden] + ".jpg");
  surface.setSize(img.width, img.height);
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
    espejo(pos[i]+(int)(noise(frameCount*0.01/i)*200), 0, tam[i], height);
    espejo(width/2, pos[i]*(height/width), width/2, tam[i]);
  }
}

// FUNCIONES ************** //
//////////////////////////////

void espejo(int _x, int _y, int _w, int _h){
  int x = _x; int y = _y; int w = _w; int h = _h;

  copy(x,y,-w,h,x,y,w,h);
  // stroke(255);
  // noFill();
  // rect(x, y, w, h);
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G04/" + timeStamp() + ".png");
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
      if (orden < num.length-1) {orden++;} else {orden = 0;}
      setup();
    break;
    default:
      //
    break;
  }
}
