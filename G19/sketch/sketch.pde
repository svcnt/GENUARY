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
  for(int i = margen; i < height-margen; i+=sep){
    for(int ii = margen; ii < width-margen; ii+=sep){
      fill(
        noise(i*ii)*i*0.5,
        noise(i, i/ii)*i*0.5,
        noise(i, i/ii)*i*0.75
      );
      rect(ii+noise(ii), i+noise(i)*i*0.01, sep*noise(ii*i*0.01), sep*noise(ii*i*0.01));
    }
  }
}

// LOOP ******************* //
//////////////////////////////
void draw(){

}

// FUNCIONES ************** //
//////////////////////////////
void keyPressed(){
  if(key == 's'){
    save(pathExport + "G19/" + timeStamp() + ".png");
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
