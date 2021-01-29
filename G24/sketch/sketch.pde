// INFO ************** //
//////////////////////////////
/*
GENUARY / DAY 24 / Make a grid of permutations of something.
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
int tam = 10;
float sep = 65;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  frameRate(1);
  noStroke();

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  for(int i = 1; i < height-margen*2; i+=sep){
    for(int ii = 1; ii < width-margen*2; ii+=sep){
      fill(#CC0000);
      cell(margen+ii, margen+i, 10);
      fill(255);
      cell(margen+ii, margen+i, 10);
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////
void cell(float x, float y, float sz){
  for(int n = 0; n < 3; n++){
    for(int nn = 0; nn < 3; nn++){
      if(random(1) < 0.5){
        rect(x+nn*sz, y+n*sz, sz, sz);
      }
    }
  }
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G25/" + timeStamp() + ".png");
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
