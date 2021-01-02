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
int ancho = 400;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";
int t = 0; // temporizador

// PARÁMETROS
float dA = 1; // Diffusion rate =1
float dB = 0.5f; // Diffusion rate = 0.5
float feed = 0.055f; // How fast = 0.055
float k = 0.062f; // kill rate = 0.062

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
  pixelDensity(1);
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



  // for(int i = 200; i < width-200; i++){
  //   for(int ii = 200; ii <= height-200; ii++){
  //
  //       grid[i][ii].x = noise(1, 0);
  //       grid[i][ii].y = noise(0, 1);
  //
  //   }
  // }


}

// LOOP ******************* //
//////////////////////////////
public void draw(){

  //background(255);
  // Reacción-difusión
  for(int i = 1; i < width-1; i++){
    for(int ii = 1; ii < height-1; ii++){
      //
      dA = map(
        noise(i*0.1f, ii*0.1f, frameCount*0.01f),
        0, 1,
        0.6f, 1.3f // 1
        );
      dB = map(
        noise(i*0.05f, ii*0.05f, frameCount*0.02f),
        0, 1,
        0.25f, 0.7f // 0.5
        );
      feed = map(
        noise(i*0.15f, frameCount*0.03f, ii*0.15f),
        0, 1,
        0.015f, 0.1f //0.055
        );
      k = map(
        noise(frameCount*0.04f, i*0.02f, ii*0.02f),
        0, 1,
        0.002f, 0.112f //0.062
        );
      //
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

  // Mostrar
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

  swap();

  surface.setTitle("FPS: " + frameRate);

  // if(t % 50 == 0){
  //   save(pathExport + "V02/" + "RDV02" + nf(t, 4) + ".png");
  // }
  t++;

}

// FUNCIONES ************** //
//////////////////////////////
public void mousePressed(){
  setup();
}

public void keyPressed(){
  switch(key) {
    case 'q':
      dA += 0.001f;
      println("dA: " + dA);
    break;
    case 'a':
      dA -= 0.001f;
      println("dA: " + dA);
    break;
    case 'w':
      dB += 0.001f;
      println("dB: " + dB);
    break;
    case 's':
      dB -= 0.001f;
      println("dB: " + dB );
    break;
    case 'e':
      feed += 0.001f;
      println("feed: " + feed);
    break;
    case 'd':
      feed -= 0.001f;
      println("feed: " +feed);
    break;
    case 'r':
      k += 0.001f;
      println("kill: " + k);
    break;
    case 'f':
      k -= 0.001f;
      println("kill: " + k);
    break;
    case 'p':
      save( pathExport + "diffreactV01-" + day() + "-" + hour() + "-" + minute() + ".jpg");
    break;
    default:
      //
    break;
  }
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
