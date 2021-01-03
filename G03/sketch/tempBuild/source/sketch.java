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
GENUARY 2021 / DAY3 / Make something human
José Vicente Araújo - 2021
Based on D. Shiffman
----
What's more human than bleeding?
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 450;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";
int t = 0; // temporizador

// PARÁMETROS INICIALES
// Sobreescritos más abajo, vinculados a posición
float dA = 1; // Difusión de la sustancia A
float dB = 0.5f; // Difusión de la sustancia B
float feed = 0.055f; // Aparición
float k = 0.062f; // Muerte
// Aquí se almacenan los estados de las células
PVector[][] grid = new PVector[ancho][alto];
PVector[][] next = new PVector[ancho][alto];
PVector[][] temp = new PVector[ancho][alto];
int pix;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  frameRate(100);
  colorMode(HSB);
  // Estados iniciales
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      grid[x][y] = new PVector(1, 0); // x=a, y=b
      next[x][y] = new PVector(1, 0); // x=a, y=b
    }
  }

  for(int i = 0; i < width; i++){
    for(int ii = 0; ii <= height; ii++){
      float radio = 0.2f;
      if(dist(i, ii, width*random(radio, 1-radio), height*random(radio, 1-radio)) < width*radio){
        grid[i][ii].x = noise(i*0.1f, ii*0.1f);
        grid[i][ii].y = noise(ii*0.1f, i*0.1f);
      }
    }
  }
}

// LOOP ******************* //
//////////////////////////////
public void draw(){

  //background(255);
  // REACCIÓN - DIFUSIÓN
  // Redefinición de parámetros según posición
  for(int i = 1; i < width-1; i++){
    for(int ii = 1; ii < height-1; ii++){
      dA = map(
        noise(i*0.1f, ii*0.1f, frameCount*0.01f),
        0, 1,
        0.6f, 1.15f // inicial: 1
        );
      dB = map(
        noise(i*0.05f, ii*0.05f, frameCount*0.02f),
        0, 1,
        0.25f, 0.7f // inicial: 0.5
        );
      feed = map(
        noise(i*0.15f, frameCount*0.03f, ii*0.15f),
        0, 1,
        0.015f, 0.1f // inicial: 0.055
        );
      k = map(
        noise(frameCount*0.04f, i*0.02f, ii*0.02f),
        0, 1,
        0.002f, 0.112f //inicial: 0.062
        );
      // Aquí se producen los cambios
      float a = grid[i][ii].x;
      float b = grid[i][ii].y;
      next[i][ii].x = a +
                      (dA * laplaceA(i, ii)) -
                      (a * b * b) +
                      (feed * (1 - a))
                      ;

      next[i][ii].y = b +
                      (dB * laplaceB(i, ii)) +
                      (a * b * b) -
                      ((k + feed) * b)
                      ;
    }
  }

  // MOSTRAR
  loadPixels();
  for(int i = 0; i < width; i++){
    for(int ii = 0; ii < height; ii++){
      //if(next[i][ii].x < 0.75){
        float h = 0;
        float s = 255 - next[i][ii].x * 255;
        float b = 255;
        int c = color(h, s, b);
        pix = (i + ii * width);
        pixels[pix] = c;
      //}

    }
  }
  updatePixels();

  // ACTUALIZAR
  swap();

  surface.setTitle("FPS: " + frameRate);

  t++;

}

// FUNCIONES ************** //
//////////////////////////////
public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G02/" + timeStamp() + ".png");
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

public float laplaceA(int x, int y){
  float sumA = 0;
  sumA += grid[x][y].x * -1;
  sumA += grid[x-1][y].x * 0.2f;
  sumA += grid[x+1][y].x * 0.2f;
  sumA += grid[x][y+1].x * 0.2f;
  sumA += grid[x][y-1].x * 0.2f;
  sumA += grid[x-1][y-1].x * 0.05f;
  sumA += grid[x+1][y-1].x * 0.05f;
  sumA += grid[x+1][y+1].x * 0.05f;
  sumA += grid[x-1][y+1].x * 0.05f;
  return sumA;
}

public float laplaceB(int x, int y){
  float sumB = 0;
  sumB += grid[x][y].y * -1;
  sumB += grid[x-1][y].y * 0.2f;
  sumB += grid[x+1][y].y * 0.2f;
  sumB += grid[x][y+1].y * 0.2f;
  sumB += grid[x][y-1].y * 0.2f;
  sumB += grid[x-1][y-1].y * 0.05f;
  sumB += grid[x+1][y-1].y * 0.05f;
  sumB += grid[x+1][y+1].y * 0.05f;
  sumB += grid[x-1][y+1].y * 0.05f;
  return sumB;
}


public void swap(){
  temp = grid;
  grid = next;
  next = temp;
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
