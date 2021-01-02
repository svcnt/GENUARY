// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY1 / Triple nested loop
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

//
float sep;
int num = 20;
int tam = 50;
PImage img;
int colores = 5;
color[] paleta = new color[colores];

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto, P3D);
}

void setup(){
  colorMode(HSB);
  noStroke();
  img = loadImage(pathData + "paleta01.png");
  for(int i = 0; i < colores; i++){
    paleta[i] = img.get(Math.round((int)random(img.width)), 10);
  }
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  lightFalloff(1.0, 0.001, 0.0);
  lights();
  pointLight(125,125,125,mouseX,mouseY,500);
  translate(ancho*0.5, alto*0.5, 250);

  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.001);
  rotateZ(noise(frameCount*0.0001) * TWO_PI);
  //sep = ancho / num;
  sep = tam*0.4;
  for(int i = -num/2; i < num/2; i++){
    for(int ii = -num/2; ii < num/2; ii++){
      for(int iii = -num/2; iii < num/2; iii++){
        if(noise(i, ii, iii + frameCount*0.001) > 0.5){
          pushMatrix();
          /*fill(
            noise(i, ii, iii + frameCount*0.01)*50,
            255,
            125);*/
          int c = abs((i + ii + iii)) % colores;
          fill(paleta[c]);
          translate(i*sep, ii*sep, iii*sep);
          rotateX(iii + frameCount * 0.001);
          box(
            tam*noise(i, ii, iii + frameCount*0.01),
            tam*noise(i, ii, iii + frameCount*0.015)*0.5,
            tam*noise(i, ii, iii + frameCount*0.02)*0.25
            );
          box(
            tam*noise(i, ii, iii + frameCount*0.015)*0.5,
            tam*noise(i, ii, iii + frameCount*0.01),
            tam*noise(i, ii, iii + frameCount*0.02)*0.25
            );
          popMatrix();
        }
      }
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////
void mouseClicked(){
  setup();
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G01/" + timeStamp() + ".png");
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
