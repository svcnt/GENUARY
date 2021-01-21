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
int ancho = 1280;
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
  frameRate(24);
  surface.setResizable(true);
  noStroke();
  img = new Movie(this, "vid001.mp4");
  img.loop();
  img.speed(0.5f);
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff202020);
  // image(img, 0, 0);
  float temp = frameCount*0.01f;

  for(int i = 0; i < height; i+=10){
    for(int ii = 0; ii < width; ii+=10){
      int c = img.get(PApplet.parseInt(ii*noise(temp)), PApplet.parseInt(i*noise(temp*2)));
      fill(c);
      // strokeWeight(2);
      // noFill();
      float sz = map(brightness(c), 0, 255, 01, 10);
      float sz2 = map(saturation(c), 0, 255, 01, 8);
      float d = map(hue(c), 0, 255, -50, 50);
      if(sz > 05){
        //ellipse(ii+sin(d)*10, i+cos(d)*10, d, d);
        ellipse(ii+d, i+d, sz, sz);
        fill(0xff202020, brightness(c));
        ellipse(ii+d, i+d, sz2, sz2);
      }

    }
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
    save(pathExport + "G16/" + timeStamp() + ".png");
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
