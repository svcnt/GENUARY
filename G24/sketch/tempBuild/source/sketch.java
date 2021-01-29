import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch extends PApplet {

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
public void settings(){
  size(ancho, alto);
}

public void setup(){
  frameRate(1);
  noStroke();

}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff202020);
  for(int i = 1; i < height-margen*2; i+=sep){
    for(int ii = 1; ii < width-margen*2; ii+=sep){
      fill(0xffCC0000);
      cell(margen+ii, margen+i, 10);
      fill(255);
      cell(margen+ii, margen+i, 10);
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////
public void cell(float x, float y, float sz){
  for(int n = 0; n < 3; n++){
    for(int nn = 0; nn < 3; nn++){
      if(random(1) < 0.5f){
        rect(x+nn*sz, y+n*sz, sz, sz);
      }
    }
  }
}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G25/" + timeStamp() + ".png");
  }
}

public String timeStamp(){
  String y = str(year());
  String m = nf(month(), 2);
  String d = nf(day(), 2);
  String h = nf(hour(), 2);
  String mn = nf(minute(), 2);
  String s = nf(second(), 2);

  String ts = y + m + d + h + h + m + s;

  return ts;
}

public void mousePressed(){
  setup();
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
