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
  for(int i = margen; i < height-margen; i+=sep){
    for(int ii = margen; ii < width-margen; ii+=sep){
      fill(
        noise(i*ii)*i*0.5f,
        noise(i, i/ii)*i*0.5f,
        noise(i, i/ii)*i*0.75f
      );
      rect(ii+noise(ii), i+noise(i)*i*0.01f, sep*noise(ii*i*0.01f), sep*noise(ii*i*0.01f));
    }
  }
}

// LOOP ******************* //
//////////////////////////////
public void draw(){

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
