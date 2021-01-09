// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY 8 / Only curves
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

int num = 300;
int sep = alto / num;
float sw = 1;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  stroke(255, 50); noFill();
  strokeWeight(sw);
  colorMode(HSB);
  background(60);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  translate(0, 250);
  for(int i = 1; i < 10; i++){
    noStroke();
    rejo(ancho/4, alto/30*i, ancho*0.25, i);
  }
}

// FUNCIONES ************** //
//////////////////////////////
void rejo(int x, int y, float length, float seed){
  float v = (frameCount/length)*0.1;
  pushMatrix();
  translate(x,y); rotate(map(noise(v, seed), 0, 1, -2, 2));
  line(0, 0, length, 0);
  if(length > 1){
    if (length < 2){stroke(20);}
    else if (length < 32){stroke(255, 10);}
    else {noStroke();}
    rejo(int(length), 0, length*0.6, seed);
  }
  popMatrix();

}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G08/" + timeStamp() + ".png");
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
