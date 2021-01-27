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
int ancho = 300;
int alto = 800;
String pathData = "../../data/";
String pathExport = "../../export/";

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  stroke(255);

}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff202020);
  for(int i = 0; i < height; i++){
    line(0, i, map(noise(i*0.01f+frameCount*noise(frameCount)), 0, 1, 100, 150), i);
    line(width, i, map(noise(i*0.01f+frameCount*noise(frameCount)), 0, 1, 100, 160), i);
  }

}

// FUNCIONES ************** //
//////////////////////////////

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G22/" + timeStamp() + ".png");
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
