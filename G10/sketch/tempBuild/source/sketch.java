import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.PeasyCam; 

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
GENUARY 2021 / DAY 9 / Interference patterns
José Vicente Araújo - 2021
*/

// LIBRERÍAS ************** //
//////////////////////////////


// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

PeasyCam cam;
// Variación en nodos
float var[] = {
  0.6f,    // Primera rama
  1.1f,    // Segunda rama
  1.25f    // Tercera rama
};


// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto, P3D);
}

public void setup(){
  cam = new PeasyCam(this, 600);
  noStroke();
  sphereDetail(3);
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff606060);
  //lights();
  luces();
  translate(0, height*0.25f);
  rama(-100, 60);  // Llamamos la func. recursiva

  // Head Up Display
  cam.beginHUD();
  textSize(12);
  fill(255);
  text("Nodo 1: " + var[0], 20, 20);
  text("Nodo 2: " + var[1], 20, 40);
  text("Nodo 3: " + var[2], 20, 60);
  textSize(14);
  fill(0xffFFCC00);
  text("r = Refresh", 20, 90);
  //text("h = Hi Res.", 20, 110);
  //text("l = Lo Res.", 20, 130);
  cam.endHUD();
}

// FUNCIONES ************** //
//////////////////////////////

//// FUNCIÓN RECURSIVA
public void rama(float longitud, float ang){
  float r = radians(ang);

  if(abs(longitud) < 5){
    fill(255);
  } else {
    fill(0xff505050);
  }
  sphereDetail((int)map(longitud, -100, 0, 30, 4));
  sphere(longitud);
  //box(longitud);
  // Recursión
  if(abs(longitud) > 3){
    pushMatrix();
    translate(0,longitud);
    rotateY(r);
    rotateX(r*var[0]);
    rama(longitud * 0.8f, ang);
    popMatrix();

    pushMatrix();
    translate(0,longitud);
    rotateX(-r*var[1]);
    rama(longitud * 0.6f, ang);
    popMatrix();

    pushMatrix();
    translate(0,longitud);
    rotateZ(r*var[2]);
    rama(longitud * 0.5f, ang);
    popMatrix();
  }
}

// Luces
public void luces(){
  lightFalloff(1,0.001f,0.00001f);
  // Principales
  ambientLight(90, 90, 120);
  directionalLight(
    175,120,90,
    0,1,0
    );

  // Secundarias
  int maxL = 3; // Núm. luces
  float ang = TWO_PI / maxL; // Ángulo entre luces
  int dist = 600; // Distancia del centro

  for(int i = 1; i <= maxL; i++){
    pointLight(
      (255/maxL)*i,40,255/i,
      sin(ang*i)*dist,
      (height/maxL)*i,
      cos(ang*i)*dist
      );
  }
}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G10/" + timeStamp() + ".png");
  }

  if(key == 'r'){
    var[0] = random(-1, 1);
    var[1] = random(-1, 1);
    var[2] = random(-1, 1);
  }

  // if(key == 'h'){
  //   sphereDetail(30);
  // }
  //
  // if(key == 'l'){
  //   sphereDetail(3);
  // }
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
