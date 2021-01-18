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
void grd(int xPos, int yPos, int rf, int sz){
  fill(bg);
  stroke(bg);
  rect(xPos, yPos, sz, sz);
  noFill();
  stroke(255);
  int cellSize = sz/rf;
  for(int y=0; y<rf; y++){
    for(int x=0; x<rf; x++){
      cell(xPos+x*cellSize, yPos+y*cellSize, cellSize, cellSize);
      if(sz > 50 && 0.5 < random(1)){
        grd(xPos+x*cellSize, yPos+y*cellSize, rf, cellSize);
      }
    }
  }
}

void cell(int cellX, int cellY, int cellW, int cellH){
  color c = color(0, noise(cellX, cellY)*150, noise(cellX, cellY)*150);
  stroke(c);
  strokeWeight(2);
  noFill();
  int rnd = int(random(0.6, 2.9));
  switch(rnd) {
    case 1:
      // top-left -> cellX, cellY,
      // top-right -> cellX+cellW, cellY,
      // bottom-left -> cellX, cellY+cellH,
      // bottom-right -> cellX+cellW, cellY+cellH,
      for(int i = cellW; i > cellW*0.33; i-=8){
        arc(cellX, cellY, 0.33*cellW+i, 0.33*cellH+i, 0, HALF_PI);
        arc(cellX+cellW, cellY+cellH, 0.33*cellW+i, 0.33*cellH+i, PI, 3*HALF_PI);
      }
    break;
    case 2:
      // arc(cellX+cellW, cellY, cellW, cellH, HALF_PI, PI);
      //arc(cellX, cellY+cellH, cellW, cellH, 3*HALF_PI, TWO_PI);
      for(int i = cellW; i > cellW*0.33; i-=8){
        arc(cellX+cellW, cellY, 0.33*cellW+i, 0.33*cellH+i, HALF_PI, PI);
        arc(cellX, cellY+cellH, 0.33*cellW+i, 0.33*cellH+i, 3*HALF_PI, TWO_PI);
      }
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
