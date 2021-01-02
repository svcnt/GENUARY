// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY2 / Rule 30 (Elementary cellular automaton)
José Vicente Araújo - 2021

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 500;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

int tam = 1;
int sep = tam;
int numCelH = ancho / sep;
int numCelV = alto / sep;
Boolean[][] estados = new Boolean[numCelV][numCelH];
float umbral = 0.75;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  colorMode(HSB);
  noStroke();
  for(int i = 0; i < numCelV; i++){
    for(int ii = 0; ii < numCelH; ii++){
      estados[ii][i] = false;
    }
  }

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  for(int i = 0; i < numCelV; i++){
    for(int ii = 0; ii < numCelH; ii++){
      // Estados de la primera fila
      if(i == 0){
        if(noise(ii, frameCount*0.01) > umbral){ estados[ii][i] = true; } else { estados[ii][i] = false; }
        if (estados[ii][i] == true) { fill(0);} else {fill(255); }
      }
      // Estado de cada célula
      if(i > 0 && ii > 0 && ii < numCelH-1){
        // 1
        if (estados[ii-1][i-1] == true && estados[ii][i-1] == true && estados[ii+1][i-1] == true){
          estados[ii][i] = false;
        } else
        // 2
        if (estados[ii-1][i-1] == true && estados[ii][i-1] == true && estados[ii+1][i-1] == false){
          estados[ii][i] = false;
        } else
        // 3
        if (estados[ii-1][i-1] == true && estados[ii][i-1] == false && estados[ii+1][i-1] == true){
          estados[ii][i] = false;
        } else
        // 4
        if (estados[ii-1][i-1] == true && estados[ii][i-1] == false && estados[ii+1][i-1] == false){
          estados[ii][i] = true;
        } else
        // 5
        if (estados[ii-1][i-1] == false && estados[ii][i-1] == true && estados[ii+1][i-1] == true){
          estados[ii][i] = true;
        } else
        // 6
        if (estados[ii-1][i-1] == false && estados[ii][i-1] == true && estados[ii+1][i-1] == false){
          estados[ii][i] = true;
        } else
        // 7
        if (estados[ii-1][i-1] == false && estados[ii][i-1] == false && estados[ii+1][i-1] == true){
          estados[ii][i] = true;
        } else
        // 8
        if (estados[ii-1][i-1] == false && estados[ii][i-1] == false && estados[ii+1][i-1] == false){
          estados[ii][i] = false;
        }
      }
      // Colorear célula
      if (estados[ii][i] == true && dist(ancho/2, alto/2, ii*sep, i*sep) < (ancho/2)-10 ) {fill(0);} else {fill(255);}
      rect(ii*sep, i*sep, 10, 10);
    }
  }


  surface.setTitle("FPS: " + frameRate);
}

// FUNCIONES ************** //
//////////////////////////////
void keyPressed(){
  if(key == 's'){
    save(pathExport + "G02/" + timeStamp() + ".png");
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
