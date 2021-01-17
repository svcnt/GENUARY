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
GENUARY 2021 / DAY 11 / Use something other than a computer as an autonomous process (or use a non-computer random source).
José Vicente Araújo - 2021
*/

// LIBRERÍAS ************** //
//////////////////////////////


// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 800;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

String csv[];
String data[][];

int sep = 10;
float ang;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);

}

public void setup(){
  colorMode(HSB);
  //noStroke();
  fill(255, 200);
  stroke(255, 125);
  csv = loadStrings(pathData + "terraclimate_003.csv");
  data = new String[csv.length][5];
  for(int i = 0; i < csv.length; i++){
    data[i] = csv[i].split(",");
  }
  ang = TWO_PI / csv.length;
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff202020);
  translate(ancho/2, alto/2);
  rotate(- HALF_PI);
  pushMatrix();
  translate(-ancho/2, -alto/2);
  noStroke(); fill(20);
  beginShape();
  for(int i = 1; i < csv.length; i++){
    vertex(
      ancho/2 + sin(HALF_PI - ang*i) * (300 + PApplet.parseFloat(data[i][2])),
      alto/2 + cos(HALF_PI - ang*i) * (300 + PApplet.parseFloat(data[i][2]))
    );
  }
  endShape(CLOSE);
  popMatrix();

  for(int i = 1; i < csv.length; i++){
    rotate(ang);
    stroke(map(PApplet.parseFloat(data[i][3]), 0, 45, 0, 75), 255, 255, 175);
    line(300 + PApplet.parseFloat(data[i][3]), 0, 300 + PApplet.parseFloat(data[i][2]), 0);
    stroke(map(PApplet.parseFloat(data[i][4]), 0, 180, 150, 180), 255, 255, 175);
    line(150, 0, 150 + PApplet.parseFloat(data[i][4])*0.6f, 0);

    if(PApplet.parseFloat(data[i][1]) == 1){
      stroke(255, 125); strokeWeight(5);
      //text(data[i][0], 360, 0);
      point(350, 0);
      strokeWeight(1);
    }

    if(PApplet.parseFloat(data[i][0]) % 10 == 0 && PApplet.parseFloat(data[i][1]) == 1){
      noFill();
      ellipse(350, 0, 14, 14);
    }
  }
  noStroke(); fill(0xff202020);
  ellipse(0, 0, 280, 280);
}

// FUNCIONES ************** //
//////////////////////////////

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G11/" + timeStamp() + ".png");
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
