import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

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
GENUARY / DÍA 4 / SMALL AREAS OF SYMMETRY
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////


// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 960;
int alto = 540;
String pathData = "../../data/";
String pathExport = "../../export/";

Movie img;

int[] pos = new int[5];
int[] tam = new int[5];


// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  noStroke();
  img = new Movie(this, "vid001.mp4");
  img.play();
  for(int i = 0; i < pos.length; i++){
    pos[i] = (int)random(width);
    tam[i] = (int)random(50, 200);
  }
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  image(img, 0, 0);
  for(int i = 0; i < pos.length; i++){
    espejo(pos[i] + (int)(noise(frameCount*0.01f/i)*200), 0, tam[i], height);
    espejo(width/2, pos[i]*(height/width), width/2, tam[i]);
  }
}

// FUNCIONES ************** //
//////////////////////////////

public void movieEvent(Movie m) {
  m.read();
}

public void espejo(int _x, int _y, int _w, int _h){
  int x = _x; int y = _y; int w = _w; int h = _h;

  copy(x,y,-w,h,x,y,w,h);
  // stroke(255);
  // noFill();
  // rect(x, y, w, h);
}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G04b/" + timeStamp() + ".png");
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
