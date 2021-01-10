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
GENUARY 2021 / DAY 6 / Triangle subdivision
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

int iterations[] = {2, 3, 4, 5, 6, 7};

PVector A, B, C, D, E, F, G, H;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);
}

public void setup(){
  frameRate(0.5f);
  colorMode(HSB);
  stroke(255);
  noFill();

  for(int i = 0; i < iterations.length; i++){
    iterations[i] = PApplet.parseInt(random(4, 7));
  }

  int var = 0;

  A = new PVector(width/2 + random(-var, var), 10);
  B = new PVector(width -10, height/2 + random(-var, var));
  C = new PVector(10, height/2 + random(-var, var));
  D = new PVector(width/2 + random(-var, var), height - 10);

  E = new PVector(10, 10);
  F = new PVector(width - 10, 10);
  G = new PVector(width - 10, height - 10);
  H = new PVector(10, height - 10);


}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(20);
  recursiveT(A, B, C, iterations[0]);
  recursiveT(D, B, C, iterations[1]);
  recursiveT(A, C, E, iterations[2]);
  recursiveT(A, B, F, iterations[3]);
  recursiveT(B, G, D, iterations[4]);
  recursiveT(D, C, H, iterations[5]);

  setup();
}

// FUNCIONES ************** //
//////////////////////////////
public void recursiveT(PVector rtA, PVector rtB, PVector rtC, int iteracion){
  int n = 0;
  if(iteracion < 3){
    noStroke();
    fill(iteracion * 127);
  } else {
    stroke(40);
    noFill();
  }
  triangulo(rtA, rtB, rtC);
  //pMedio(rtA, rtB);
  //pMedio(rtB, rtC);
  //pMedio(rtC, rtA);
  if(iteracion > 0){
    iteracion--;

    recursiveT(
      rtC,
      pMedio(rtA, rtB),
      rtB,
      iteracion
    );

    recursiveT(
      rtC,
      pMedio(rtC, rtA),
      pMedio(rtA, rtB),
      iteracion
    );


    // if(random(1) < 0.5){
    //   recursiveT(
    //     rtB,
    //     pMedio(rtB, rtA),
    //     pMedio(rtB, rtC),
    //     iteracion
    //   );
    // } else {
    //   recursiveT(
    //     rtA,
    //     pMedio(rtA, rtC),
    //     pMedio(rtA, rtB),
    //     iteracion
    //   );
    // }
  }
}

public PVector pMedio(PVector pmA, PVector pmB){
  PVector pm = new PVector(0, 0);
  if(pmA.x < pmB.x){
    pm.x = pmA.x + (pmB.x - pmA.x)/2;
  } else {
    pm.x = pmB.x + (pmA.x - pmB.x)/2;
  }
  if(pmA.y < pmB.y){
    pm.y = pmA.y + (pmB.y - pmA.y)/2;
  } else {
    pm.y = pmB.y + (pmA.y - pmB.y)/2;
  }

  //ellipse(pm.x, pm.y, 5, 5);
  return(pm);
}

public void triangulo(PVector tA, PVector tB, PVector tC){
  triangle(tA.x, tA.y, tB.x, tB.y, tC.x, tC.y);
}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G06/" + timeStamp() + ".png");
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
