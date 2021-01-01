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
int ancho = 750;
int alto = 750;
String pathData = "../../data/";
String pathExport = "../../export/";

//
float sep;
int num = 20;
int tam = 50;
PImage img;
int colores = 5;
int[] paleta = new int[colores];

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto, P3D);
}

public void setup(){
  colorMode(HSB);
  noStroke();
  img = loadImage(pathData + "paleta01.png");
  for(int i = 0; i < colores; i++){
    paleta[i] = img.get(Math.round((int)random(img.width)), 10);
  }
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff202020);
  lightFalloff(1.0f, 0.001f, 0.0f);
  lights();
  pointLight(125,125,125,mouseX,mouseY,500);
  translate(ancho*0.5f, alto*0.5f, 250);

  rotateX(frameCount * 0.001f);
  rotateY(frameCount * 0.001f);
  rotateZ(noise(frameCount*0.0001f) * TWO_PI);
  //sep = ancho / num;
  sep = tam*0.4f;
  for(int i = -num/2; i < num/2; i++){
    for(int ii = -num/2; ii < num/2; ii++){
      for(int iii = -num/2; iii < num/2; iii++){
        if(noise(i, ii, iii + frameCount*0.001f) > 0.5f){
          pushMatrix();
          /*fill(
            noise(i, ii, iii + frameCount*0.01)*50,
            255,
            125);*/
          int c = abs((i + ii + iii)) % colores;
          fill(paleta[c]);
          translate(i*sep, ii*sep, iii*sep);
          rotateX(iii + frameCount * 0.001f);
          box(
            tam*noise(i, ii, iii + frameCount*0.01f),
            tam*noise(i, ii, iii + frameCount*0.015f)*0.5f,
            tam*noise(i, ii, iii + frameCount*0.02f)*0.25f
            );
          box(
            tam*noise(i, ii, iii + frameCount*0.015f)*0.5f,
            tam*noise(i, ii, iii + frameCount*0.01f),
            tam*noise(i, ii, iii + frameCount*0.02f)*0.25f
            );
          popMatrix();
        }
      }
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////
public void mouseClicked(){
  setup();
}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + random(999) + ".png");
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
