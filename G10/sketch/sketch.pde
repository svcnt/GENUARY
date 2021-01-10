// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY 9 / Interference patterns
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
// Variación en nodos
float var[] = {
  0.6,    // Primera rama
  1.1,    // Segunda rama
  1.25    // Tercera rama
};


// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto, P3D);
}

void setup(){
  cam = new PeasyCam(this, 600);
  noStroke();
  sphereDetail(3);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#606060);
  //lights();
  luces();
  translate(0, height*0.25);
  rama(-100, 60);  // Llamamos la func. recursiva

  // Head Up Display
  cam.beginHUD();
  textSize(12);
  fill(255);
  text("Nodo 1: " + var[0], 20, 20);
  text("Nodo 2: " + var[1], 20, 40);
  text("Nodo 3: " + var[2], 20, 60);
  textSize(14);
  fill(#FFCC00);
  text("r = Refresh", 20, 90);
  //text("h = Hi Res.", 20, 110);
  //text("l = Lo Res.", 20, 130);
  cam.endHUD();
}

// FUNCIONES ************** //
//////////////////////////////

//// FUNCIÓN RECURSIVA
void rama(float longitud, float ang){
  float r = radians(ang);

  if(abs(longitud) < 5){
    fill(255);
  } else {
    fill(#505050);
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
    rama(longitud * 0.8, ang);
    popMatrix();

    pushMatrix();
    translate(0,longitud);
    rotateX(-r*var[1]);
    rama(longitud * 0.6, ang);
    popMatrix();

    pushMatrix();
    translate(0,longitud);
    rotateZ(r*var[2]);
    rama(longitud * 0.5, ang);
    popMatrix();
  }
}

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
