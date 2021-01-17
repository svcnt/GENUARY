// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY 11 / Use something other than a computer as an autonomous process (or use a non-computer random source).
José Vicente Araújo - 2021
Datasets -> https://climatetoolbox.org/data
*/

// LIBRERÍAS ************** //
//////////////////////////////
import peasy.PeasyCam;

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
void settings(){
  size(ancho, alto);

}

void setup(){
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
void draw(){
  background(#202020);
  translate(ancho/2, alto/2);
  rotate(- HALF_PI);
  pushMatrix();
  translate(-ancho/2, -alto/2);
  noStroke(); fill(20);
  beginShape();
  for(int i = 1; i < csv.length; i++){
    vertex(
      ancho/2 + sin(HALF_PI - ang*i) * (300 + float(data[i][2])),
      alto/2 + cos(HALF_PI - ang*i) * (300 + float(data[i][2]))
    );
  }
  endShape(CLOSE);
  popMatrix();

  for(int i = 1; i < csv.length; i++){
    rotate(ang);
    stroke(map(float(data[i][3]), 0, 45, 0, 75), 255, 255, 175);
    line(300 + float(data[i][3]), 0, 300 + float(data[i][2]), 0);
    stroke(map(float(data[i][4]), 0, 180, 150, 180), 255, 255, 175);
    line(150, 0, 150 + float(data[i][4])*0.6, 0);

    if(float(data[i][1]) == 1){
      stroke(255, 125); strokeWeight(5);
      //text(data[i][0], 360, 0);
      point(350, 0);
      strokeWeight(1);
    }

    if(float(data[i][0]) % 10 == 0 && float(data[i][1]) == 1){
      noFill();
      ellipse(350, 0, 14, 14);
    }
  }
  noStroke(); fill(#202020);
  ellipse(0, 0, 280, 280);
}

// FUNCIONES ************** //
//////////////////////////////

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
