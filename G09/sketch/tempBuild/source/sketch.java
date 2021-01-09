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
GENUARY 2021 / DAY 9 / Only curves
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



// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);

}

public void setup(){
  rectMode(CENTER);
  //blendMode(MULTIPLY);
  noFill();
  strokeWeight(8);

}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(50);
  pushMatrix();
  translate(ancho/1.95f, alto/2);
  rotate(frameCount*0.001f);
  stroke(255, 125);
  r(0, 0, ancho-20);
  popMatrix();
  pushMatrix();
  translate(ancho/2.05f, alto/2);
  rotate(frameCount*0.0015f);
  stroke(0, 125);
  r(0, 0, ancho-20);
  popMatrix();
}

// FUNCIONES ************** //
//////////////////////////////

public void r (int x, int y, float sz){
  for(int i = PApplet.parseInt(sz); i > 10; i-=20){
    sz -= 20;
    rect(x, y, sz, sz, /*(sz/2) +*/ mouseX);
  }

}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G09/" + timeStamp() + ".png");
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
