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
GENUARY 2021 / DAY 12 / Use an API.
José Vicente Araújo - 2021
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 800;
int alto = ancho * 3/4;
String pathData = "../../data/";
String pathExport = "../../export/";
int num = 12;
int n = 55;
JSONArray[] data = new JSONArray[num];
String[] urls = new String[num];
JSONObject[][] weather = new JSONObject[num][n];
float[][] ws = new float[num][n]; // wind_speed
float[][] wd = new float[num][n]; // wind_direction
float[][] mint = new float[num][n]; // min_temp
float[][] maxt = new float[num][n]; // max_temp
float[][] vis = new float[num][n]; // max_temp
float sepH = ancho/5;
float sepV = alto/4;

// SETUP ****************** //
//////////////////////////////
public void settings(){
  size(ancho, alto);

}

public void setup(){
  background(0xff202020);
  stroke(255);
  loading();
  for(int i = 0; i < data.length; i++){
    urls[i] = "https://www.metaweather.com/api/location/766273/2019/" + nf(i+1, 2) +"/15";
    data[i] = loadJSONArray(urls[i]);
  }

  for(int i = 0; i < data.length; i++){
    if(data[i] != null){
      for(int ii = 0; ii < n; ii++){
        weather[i][ii] = data[i].getJSONObject(ii);
        ws[i][ii] = weather[i][ii].getFloat("wind_speed");
        // wd[i][ii] = weather[i][ii].getFloat("wind_direction");
        mint[i][ii] = weather[i][ii].getFloat("min_temp");
        maxt[i][ii] = weather[i][ii].getFloat("max_temp");
        vis[i][ii] = weather[i][ii].getFloat("visibility");
      }
    }
  }

  // println(weather[1][0]);
}

// LOOP ******************* //
//////////////////////////////
public void draw(){
  background(0xff404040);
  fill(255, 127);
  textSize(32); text("2019", 20, 50);

  int c = 0;
  for(int i = 1; i <= 3; i++){
    for(int ii = 1; ii <= 4; ii++){
      fill(255, 25);
      // WIND SPEED
      stroke(255, 50);
      beginShape();
      for(int iii = 0; iii < 55; iii++){
        vertex(
          ii * sepH + sin(iii * TWO_PI/55) * ws[c][iii] * 5,
          i * sepV + cos(iii * TWO_PI/55) * ws[c][iii] * 5
        );
      }
      endShape(CLOSE);
      // MIN TMP
      stroke(0xffabdbe3, 75);
      beginShape();
      for(int iii = 0; iii < 55; iii++){
        vertex(
          ii * sepH + sin(iii * TWO_PI/55) * mint[c][iii] * 2.5f,
          i * sepV + cos(iii * TWO_PI/55) * mint[c][iii] * 2.5f
        );
      }
      endShape(CLOSE);
      // MAX TMP
      stroke(0xffe28743, 75);
      beginShape();
      for(int iii = 0; iii < 55; iii++){
        vertex(
          ii * sepH + sin(iii * TWO_PI/55) * maxt[c][iii] * 2.5f,
          i * sepV + cos(iii * TWO_PI/55) * maxt[c][iii] * 2.5f
        );
      }
      endShape(CLOSE);
      // VISIBILITY
      stroke(0xffCC0000, 75);
      beginShape();
      for(int iii = 0; iii < 55; iii++){
        vertex(
          ii * sepH + sin(iii * TWO_PI/55) * vis[c][iii] * 2.5f,
          i * sepV + cos(iii * TWO_PI/55) * vis[c][iii] * 2.5f
        );
      }
      endShape(CLOSE);


      ellipse(ii * sepH, i * sepV, 10, 10);
      c++;
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////

public void loading(){
  text("Cargando datasets", 20, 20);
}

public void keyPressed(){
  if(key == 's'){
    save(pathExport + "G12d/" + timeStamp() + ".png");
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
  //setup();
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
