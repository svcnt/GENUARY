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
int ancho = 750;
int alto = 750;
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
  frameRate(24);
  background(0xff202020);
  //noStroke();
  stroke(255);
  img = new Movie(this, "vid002.mp4");
  img.loop();
  img.volume(0);
  //img.speed(0.25);
  for(int i = 0; i < pos.length; i++){
    pos[i] = (int)random(width);
    tam[i] = (int)random(50, 200);
  }
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  // image(img, 0, 0, 750, 750);
  float t = frameCount * 0.5f;
  for(int i = 0; i < 360; i++){
    //strokeWeight(3);
    int c = img.get(
      PApplet.parseInt(img.width/2 + sin(radians(t*0.01f)) * i*0.5f),
      PApplet.parseInt(img.height/2 + cos(radians(t*0.1f)) * i*0.5f)
      );
    if(brightness(c) > noise(t*0.1f)*175 && i > 100){
      stroke(c);
    } else {
      noStroke();
    }
    point(
      ancho/2 + sin(radians(t)) * i,
      alto/2 + cos(radians(t)) * i
      );
  }

  surface.setTitle("FPS: " + frameRate);
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
    save(pathExport + "G13/" + timeStamp() + ".png");
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
  switch(mouseButton) {
    case LEFT:
      setup();
    break;
    case RIGHT:
      for(int i = 0; i < pos.length; i++){
        pos[i] = (int)random(width);
        tam[i] = (int)random(50, 200);
      }
    break;
    default:
      //
    break;
  }
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
