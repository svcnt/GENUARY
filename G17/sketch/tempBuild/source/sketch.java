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
GENUARY / DÍA 17 / Draw a line, pick a new color, move a bit.
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);

}

public void setup(){
  colorMode(HSB);
  background(0xff202020);

}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  surface.setTitle("FPS: " + frameRate);
  float t = frameCount*0.01f;

  stroke(
    map(sin(t), -1, 1, 0, 100),
    map(sin(t*0.9f), -1, 1, 100, 200),
    map(sin(t*0.8f), -1, 1, 100, 200),
    100
  );

  line(
    ancho/2 + sin(t)*50,
    alto/2 - cos(t)*50,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*150,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*150
    );

  stroke(0xff202020, 100);
  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*150,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*150,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*160,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*160
    );

  stroke(
    map(sin(t*0.7f), -1, 1, 100, 175),
    map(sin(t*0.6f), -1, 1, 100, 200),
    map(sin(t*0.5f), -1, 1, 100, 200),
    200
  );

  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*160,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*160,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*250,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*250
    );

  stroke(0xff202020, 100);
  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*250,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*250,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*260,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*260
    );

  stroke(
    map(sin(t*0.7f), -1, 1, 175, 255),
    map(sin(t*0.6f), -1, 1, 100, 200),
    map(sin(t*0.5f), -1, 1, 100, 200),
    100
  );

  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9f))*260,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8f))*260,
    // ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*375,
    // alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*375
    ancho/2 + sin(t)*300,
    alto/2 - cos(t)*300
    );




}

// FUNCIONES ************** //
//////////////////////////////
public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G17/" + timeStamp() + ".png");
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
  switch(mouseButton) {
    case LEFT:
      setup();
    break;
    case RIGHT:
      //
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
