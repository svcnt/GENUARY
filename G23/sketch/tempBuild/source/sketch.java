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

float nX, nY;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  nX = random(0.001f, 0.05f);
  nY = random(0.001f, 0.05f);

}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  float t = frameCount*0.005f;
  loadPixels();
  for(int y = 0; y < alto; y++){
    for(int x = 0; x < ancho; x++){
      float n1 = noise(x*nX, y*nY, t);
      float n2 = sin(y*nY*0.5f*t);
      int cual = PApplet.parseInt((n1*n2)*6);
      switch(cual) {
        case 1:
          pixels[( y * width ) + x] = 0xff264653;
        break;
        case 2:
          pixels[( y * width ) + x] = 0xff2a9d8f;
        break;
        case 3:
          pixels[( y * width ) + x] = 0xffe9c46a;
        break;
        case 4:
          pixels[( y * width ) + x] = 0xfff4a261;
        break;
        case 5:
          pixels[( y * width ) + x] = 0xffe76f51;
        break;
        default:
          pixels[( y * width ) + x] = 0xffe76f51;
        break;
      }
    }
  }
  updatePixels();
}

// FUNCIONES ************** //
//////////////////////////////

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G23/" + timeStamp() + ".png");
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
