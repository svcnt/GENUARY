// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 14 / SUBDIVISION
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 1000;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

color bg = #ffeddb;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  frameRate(0.5);
  colorMode(HSB);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(bg);
  grd(100, 100, 2, 800);
  surface.setTitle("FPS: " + frameRate);
}

// FUNCIONES ************** //
//////////////////////////////
void grd(float xPos, float yPos, int rf, float sz){
  color c = color(0, noise(xPos, yPos)*150, noise(xPos, yPos)*150);
  fill(c);
  stroke(c);
  rect(xPos, yPos, sz, sz);
  noFill();
  stroke(255);
  float cellSize = sz/rf;
  for(int y=0; y<rf; y++){
    for(int x=0; x<rf; x++){
      cell(xPos+x*cellSize, yPos+y*cellSize, cellSize, cellSize);
      if(sz > 50 && 0.6 < random(1)){
        grd(xPos+x*cellSize, yPos+y*cellSize, rf, cellSize);
      }
    }
  }
}

void cell(float cellX, float cellY, float cellW, float cellH){
  // color c = color(0, noise(cellX, cellY)*150, noise(cellX, cellY)*150);
  stroke(bg);
  strokeWeight(3);
  noFill();
  int rnd = int(random(1, 2.99));

  float start = 10; float end = 20;
  if(cellW > 200){ start = 250; end = 550; } else
  if(cellW > 100){ start = 150; end = 250; } else
  if(cellW > 50){ start = 80; end = 120; } else
  if(cellW > 25){ start = 20; end = 50; } else
  if(cellW > 0){ start = 20; end = 30; }

  switch(rnd) {
    case 1:
      // top-left -> cellX, cellY,
      // top-right -> cellX+cellW, cellY,
      // bottom-left -> cellX, cellY+cellH,
      // bottom-right -> cellX+cellW, cellY+cellH,
      for(float i = start; i <= end; i+=10){
        arc(cellX, cellY, i, i, 0, HALF_PI);
        arc(cellX+cellW, cellY+cellH, i, i, PI, 3*HALF_PI);
      }
    break;
    case 2:
      for(float i = start; i <= end; i+=10){
        arc(cellX+cellW, cellY, i, i, HALF_PI, PI);
        arc(cellX, cellY+cellH, i, i, 3*HALF_PI, TWO_PI);
      }
    break;
    default:
      println(rnd);
    break;
  }
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G14/" + timeStamp() + ".png");
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
  switch(mouseButton) {
    case LEFT:
      setup();
    break;
    case RIGHT:

    break;
    default:
      //
    break;
  }
}
