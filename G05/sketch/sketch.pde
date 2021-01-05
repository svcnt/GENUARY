
// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 1480;
int alto = 750;
String pathData = "../../data/";

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
  background(20);
  grd(10, 10, 2, 750-20);
  grd(740, 10, 2, 750-20);
}

// FUNCIONES ************** //
//////////////////////////////

void grd(int xPos, int yPos, int rf, int sz){
  fill(20);
  noStroke();
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
  color c = color(100+noise(cellX, cellY)*50, 255, 255);
  stroke(c);
  noFill();
  ellipse(cellX+cellW/2, cellY+cellH/2, cellW/2, cellH/2);
  line(cellX, cellY, cellX+cellW, cellY+cellH);
  line(cellX, cellY+cellH, cellX+cellW, cellY);
}
