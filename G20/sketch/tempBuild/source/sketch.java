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
public void settings(){
  size(ancho, alto);
}

public void setup(){
  background(0xff202020);
  colorMode(HSB);
  rectMode(CENTER);
  noStroke();
  // stroke(255);
  // strokeWeight(5);
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  float t = frameCount*0.01f;
  pushMatrix();
  translate(ancho/2, alto/2);
  rotate(t);
  pushMatrix();
  translate(200,0);
  rotate(t);
  fill(255, 10);
  stroke(0, 10);
  rect(0, 0, 100, 100);
  rotate(-t);
  fill(0, 10);
  stroke(255, 10);
  rect(0, 0, 100, 100);
  popMatrix();
  popMatrix();



}

// FUNCIONES ************** //
//////////////////////////////
public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G19/" + timeStamp() + ".png");
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
