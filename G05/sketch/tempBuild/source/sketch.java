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


// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 1480;
int alto = 750;
String pathData = "../../data/";

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
  background(20);
  grd(10, 10, 2, 750-20);
  grd(740, 10, 2, 750-20);
}

// FUNCIONES ************** //
//////////////////////////////

public void grd(int xPos, int yPos, int rf, int sz){
  fill(20);
  noStroke();
  rect(xPos, yPos, sz, sz);
  noFill();
  stroke(255);
  int cellSize = sz/rf;
  for(int y=0; y<rf; y++){
    for(int x=0; x<rf; x++){
      cell(xPos+x*cellSize, yPos+y*cellSize, cellSize, cellSize);
      if(sz > 50 && 0.5f < random(1)){
        grd(xPos+x*cellSize, yPos+y*cellSize, rf, cellSize);
      }
    }
  }
}

public void cell(int cellX, int cellY, int cellW, int cellH){
  int c = color(100+noise(cellX, cellY)*50, 255, 255);
  stroke(c);
  noFill();
  ellipse(cellX+cellW/2, cellY+cellH/2, cellW/2, cellH/2);
  line(cellX, cellY, cellX+cellW, cellY+cellH);
  line(cellX, cellY+cellH, cellX+cellW, cellY);
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
