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
GENUARY / DÍA 14 / DON'T REPEAT
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

int bg = 0xffffeddb;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  frameRate(1);
  colorMode(HSB);
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(bg);
  grd(10, 10, 2, 750-20);

  surface.setTitle("FPS: " + frameRate);
}

// FUNCIONES ************** //
//////////////////////////////
public void grd(float xPos, float yPos, int rf, float sz){
  fill(bg);
  stroke(bg);
  rect(xPos, yPos, sz, sz);
  noFill();
  stroke(255);
  float cellSize = sz/rf;
  for(int y=0; y<rf; y++){
    for(int x=0; x<rf; x++){
      cell(xPos+x*cellSize, yPos+y*cellSize, cellSize, cellSize);
      if(sz > 50 && 0.5f < random(1)){
        grd(xPos+x*cellSize, yPos+y*cellSize, rf, cellSize);
      }
    }
  }
}

public void cell(float cellX, float cellY, float cellW, float cellH){
  int c = color(0, noise(cellX, cellY)*150, noise(cellX, cellY)*150);
  stroke(c);
  strokeWeight(3);
  noFill();
  int rnd = PApplet.parseInt(random(0.6f, 2.9f));
  switch(rnd) {
    case 1:
      // top-left -> cellX, cellY,
      // top-right -> cellX+cellW, cellY,
      // bottom-left -> cellX, cellY+cellH,
      // bottom-right -> cellX+cellW, cellY+cellH,
      for(float i = cellW; i > cellW*0.33f; i-=8){
        arc(cellX, cellY, 0.33f*cellW+i, 0.33f*cellH+i, 0, HALF_PI);
        arc(cellX+cellW, cellY+cellH, 0.33f*cellW+i, 0.33f*cellH+i, PI, 3*HALF_PI);
      }
    break;
    case 2:
      // arc(cellX+cellW, cellY, cellW, cellH, HALF_PI, PI);
      //arc(cellX, cellY+cellH, cellW, cellH, 3*HALF_PI, TWO_PI);
      for(float i = cellW; i > cellW*0.33f; i-=8){
        arc(cellX+cellW, cellY, 0.33f*cellW+i, 0.33f*cellH+i, HALF_PI, PI);
        arc(cellX, cellY+cellH, 0.33f*cellW+i, 0.33f*cellH+i, 3*HALF_PI, TWO_PI);
      }
    break;
    default:
      //line(cellX, cellY+cellH, cellX+cellW, cellY);
    break;
  }


}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G14/" + timeStamp() + ".png");
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
