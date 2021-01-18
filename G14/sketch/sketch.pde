// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 14 / DON'T REPEAT
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = 750;
String pathData = "../../data/";
String pathExport = "../../export/";

color bg = #ffeddb;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  frameRate(1);
  colorMode(HSB);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(bg);
  grd(10, 10, 2, 750-20);

  surface.setTitle("FPS: " + frameRate);
}

// FUNCIONES ************** //
//////////////////////////////
void grd(float xPos, float yPos, int rf, float sz){
  fill(bg);
  stroke(bg);
  //noStroke();
  rect(xPos, yPos, sz, sz);
  noFill();
  stroke(255);
  float cellSize = sz/rf;
  for(int y=0; y<rf; y++){
    for(int x=0; x<rf; x++){
      cell(xPos+x*cellSize, yPos+y*cellSize, cellSize, cellSize);
      if(sz > 50 && 0.5 < random(1)){
        grd(xPos+x*cellSize, yPos+y*cellSize, rf, cellSize);
      }
    }
  }
}

void cell(float cellX, float cellY, float cellW, float cellH){
  color c = color(0, noise(cellX, cellY)*150, noise(cellX, cellY)*150);
  fill(c);
  stroke(c);
  int rnd = int(random(0.6, 5.9));
  switch(rnd) {
    case 1:
      //line(cellX, cellY, cellX+cellW, cellY+cellH);
      triangle(
        cellX, cellY,
        cellX+cellW, cellY+cellH,
        cellX, cellY+cellH
        );
    break;
    case 2:
      //line(cellX, cellY+cellH, cellX+cellW, cellY);
      triangle(
        cellX, cellY+cellH,
        cellX+cellW, cellY,
        cellX+cellW, cellY+cellH
        );
    break;
    case 3:
      //line(cellX, cellY+cellH, cellX+cellW, cellY);
      triangle(
        cellX, cellY,
        cellX+cellW, cellY,
        cellX+cellW, cellY+cellH
        );
    break;
    case 4:
      //line(cellX, cellY+cellH, cellX+cellW, cellY);
      triangle(
        cellX, cellY,
        cellX+cellW, cellY,
        cellX, cellY+cellH
        );
    break;
    default:
      //line(cellX, cellY+cellH, cellX+cellW, cellY);
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
