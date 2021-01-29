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
GENUARY / DAY 22 / DRAW A LINE. WRONG ANSWERS ONLY
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 600;
int alto = 600;
String pathData = "../../data/";
String pathExport = "../../export/";

float lng = 30;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  // stroke(255);
  background(0xff202020);
  for(float n = 1; n <= 360; n++){
    for(float nn = 1; nn <= 10; nn++){
      PVector v = new PVector(
        width/2+sin(radians(n))*(300-nn*10),
        height/2+cos(radians(n))*(300-nn*10)
      );
      stroke(noise(n/nn)*255);
      // line(v.x, v.y, v.x+random(-10, 10), v.y+random(-10, 10));
      line(
        v.x, v.y,
        v.x+map(noise(n/nn), 0, 1, -lng, lng),
        v.y+map(noise(nn/nn), 0, 1, lng, -lng)
      );
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
    save(pathExport + "G24/" + timeStamp() + ".png");
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
