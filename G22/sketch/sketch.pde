// INFO ************** //
//////////////////////////////
/*
GENUARY / DAY 22 / DRAW A LINE. WRONG ANSWERS ONLY
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 300;
int alto = 800;
String pathData = "../../data/";
String pathExport = "../../export/";

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  stroke(255);

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  for(int i = 0; i < height; i++){
    line(0, i, map(noise(i*0.01+frameCount*noise(frameCount)), 0, 1, 100, 150), i);
    line(width, i, map(noise(i*0.01+frameCount*noise(frameCount)), 0, 1, 100, 160), i);
  }

}

// FUNCIONES ************** //
//////////////////////////////

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G22/" + timeStamp() + ".png");
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
