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
public void settings(){
  size(ancho, alto);
}

public void setup(){
  stroke(255, 50); noFill();
  strokeWeight(sw);
  colorMode(HSB);
  background(60);
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  // fill(60, 1);
  // rect(0, 0, ancho, alto);
  translate(0, 250);
  for(int i = 1; i < 10; i++){
    noStroke();
    rejo(ancho/4, alto/30*i, ancho*0.25f, i);
  }
}

// FUNCIONES ************** //
//////////////////////////////
public void rejo(int x, int y, float length, float seed){
  float v = (frameCount/length)*0.1f;
  pushMatrix();
  translate(x,y); rotate(map(noise(v, seed), 0, 1, -3, 3));
  line(0, 0, length, 0);
  if(length > 1){
    if (length < 2){stroke(20); strokeWeight(2);}
    else if (length < 64){stroke(255, 5);}
    else {noStroke();}
    rejo(PApplet.parseInt(length), 0, length*0.6f, seed);
  }
  popMatrix();

}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G08/" + timeStamp() + ".png");
  }
}

public String timeStamp(){
  String y = str(year());
  String m = str(month());
  String d = str(day());
  String h = str(hour());
  String mn = str(minute());
  String s = str(second());

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
