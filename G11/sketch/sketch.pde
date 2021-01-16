// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY 11 / Use something other than a computer as an autonomous process (or use a non-computer random source).
José Vicente Araújo - 2021
*/

// LIBRERÍAS ************** //
//////////////////////////////
import peasy.PeasyCam;

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

PeasyCam cam;

String csv[];
String data[][];

int sep = 10;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto, P3D);

}

void setup(){
  colorMode(HSB);
  cam = new PeasyCam(this, 600);
  noStroke();
  csv = loadStrings(pathData + "terraclimateSOG.csv");
  data = new String[csv.length][5];
  for(int i = 0; i < csv.length; i++){
    data[i] = csv[i].split(",");
  }

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  //lights();
  luces();
  translate(-65/2*sep, -6*5*sep);
  for(int i = 1; i < csv.length; i++){

      pushMatrix();
      translate(
        -1958*sep + float(data[i][0])*sep,
        float(data[i][1])*5*sep,
        -50 + float(data[i][4]) / 2
      );
      fill(map(float(data[i][2]), 0, 40, 75, 0), 255, 255);
      box(
        // 8,
        // map(float(data[i][4]), 0, 150, 10, 48),
        map(float(data[i][2]), 0, 30, 10, 50),
        map(float(data[i][3]), -2, 10, 10, 50),
        map(float(data[i][4]), 0, 120, 0, 50)
      );
      popMatrix();

      // pushMatrix();
      // translate(
      //   -1958*sep + float(data[i][0])*sep,
      //   float(data[i][1])*5*sep,
      //   -51 + float(data[i][3]) / 2
      // );
      // //rotate(HALF_PI);
      // fill(map(float(data[i][3]), 0, 20, 150, 75), 255, 255);
      // box(10, map(float(data[i][4]), 0, 150, 10, 50), float(data[i][3]));
      // popMatrix();
  }

  // Head Up Display
  cam.beginHUD();
  textSize(12);
  fill(255);
  text("Temperaturas 1958-2020", 20, 20);
  text("Estrecho de Gibraltar", 20, 40);
  cam.endHUD();
}

// FUNCIONES ************** //
//////////////////////////////



// Luces
void luces(){
  lightFalloff(1,0.001,0.00001);
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

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G11/" + timeStamp() + ".png");
  }
}

String timeStamp(){
  String y = str(year());
  String m = str(month());
  String d = str(day());
  String h = str(hour());
  String mn = str(minute());
  String s = str(second());

  String ts = y + m + d + h + h + m + s;

  return ts;
}

void mousePressed(){

}
