// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 15 / Let someone else decide the general rules of your piece.
José Vicente Araújo - 2021
----
Following Sol LeWitt's instructions for wall drawings
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 1500;
int alto = ancho/2;
String pathData = "../../data/";
String pathExport = "../../export/";

int margen = 100;
PFont BBR;


// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  BBR = createFont(pathData+"Block Berthold Regular.ttf",20);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  stroke(#CC0000);
  line(ancho/2, 0, ancho/2, alto);
  line(0, alto/2, ancho, alto/2);

  switch(key) {
    case '1':
      wallDrawing11();
    break;
    case '2':
      wallDrawing16();
    break;
    case '3':
      wallDrawing17();
    break;
    case '4':
      wallDrawing19();
    break;
    default:
      wallDrawing11();
    break;
  }

}

void wallDrawing19(){
  /*
  A wall divided vertically into six equal parts, with two of the four kinds of line directions superimposed in each part.
  September 1969
  Black pencil
  */
  noStroke();
  background(#f2f1e9);
  stroke(0, 125);

  int partW = (ancho-margen*2)/6;
  int partH = alto-margen*2;

  for(int i = 0; i < 6; i++){
    switch(i) {
      case 0:
        diagonalGrid01(margen+partW*i, margen, partW, partH, 7);
        hGrid(margen+partW*i, margen, partW, partH, 5);
      break;
      case 1:
        diagonalGrid02(margen+partW*i, margen, partW, partH, 7);
        vGrid(margen+partW*i, margen, partW, partH, 5);
      break;
      case 2:
        diagonalGrid02(margen+partW*i, margen, partW, partH, 7);
        diagonalGrid01(margen+partW*i, margen, partW, partH, 5);
      break;
      case 3:
        hGrid(margen+partW*i, margen, partW, partH, 7);
        vGrid(margen+partW*i, margen, partW, partH, 5);
      break;
      case 4:
        diagonalGrid01(margen+partW*i, margen, partW, partH, 7);
        vGrid(margen+partW*i, margen, partW, partH, 5);
      break;
      case 5:
        diagonalGrid02(margen+partW*i, margen, partW, partH, 7);
        hGrid(margen+partW*i, margen, partW, partH, 5);
      break;
      default:
        //
      break;
    }
  }

  fill(255);
  noStroke();
  rect(margen, margen/4, 600-margen, 50);
  textFont(BBR, 20);
  fill(#CC0000);
  text("Sol LeWitt", margen+15, margen/4+33);
  fill(0, 125);
  text("/ Wall Drawing 19. September 1969", margen+125, margen/4+33);
}

void wallDrawing17(){
  /*
  Four-part drawing with a different line direction in each part.
  September 1969
  Black pencil
  */
  noStroke();
  background(#f2f1e9);
  stroke(0, 125);
  int partW = (ancho-margen*2)/4;
  int partH = alto-margen*2;
  int espacio = 20;
  // Part 1
  diagonalGrid01(margen, margen, partW-espacio/2, partH, 7);
  // Part 2
  hGrid(margen+partW+espacio/2, margen, partW-espacio/2, partH, 7);
  // Part 3
  diagonalGrid02(margen+partW*2+2*espacio/2, margen, partW-espacio/2, partH, 7);
  // Part 4
  vGrid(margen+partW*3+3*espacio/2, margen, partW-espacio/2, partH, 7);

  fill(255);
  noStroke();
  rect(margen, margen/4, 600-margen, 50);
  textFont(BBR, 20);
  fill(#CC0000);
  text("Sol LeWitt", margen+15, margen/4+33);
  fill(0, 125);
  text("/ Wall Drawing 17. September 1969", margen+125, margen/4+33);

}

void wallDrawing16(){
  /*
  Bands of lines 12 inches (30 cm) wide, in three directions (vertical, horizontal, diagonal right) intersecting.
  September 1969
  Black pencil
  */
  noStroke();
  background(#f2f1e9);
  stroke(0, 125);
  // line 1
  pushMatrix();
  translate(ancho/2, alto/2);
  vGrid(-ancho/2, -75, ancho, 150, 5);
  popMatrix();
  // line 2
  pushMatrix();
  translate(ancho/2, alto/2);
  rotate(HALF_PI);
  vGrid(-ancho/2, -75, ancho, 150, 5);
  popMatrix();
  // line 2
  pushMatrix();
  translate(ancho/2, alto/2);
  rotate(radians(-28));
  vGrid(-ancho*2, -75, ancho*3, 150, 5);
  popMatrix();

  fill(255);
  noStroke();
  rect(margen, margen/4, 600-margen, 50);
  textFont(BBR, 20);
  fill(#CC0000);
  text("Sol LeWitt", margen+15, margen/4+33);
  fill(0, 125);
  text("/ Wall Drawing 16. September 1969", margen+125, margen/4+33);
}

void wallDrawing11(){
  /*
  A wall divided horizontally and vertically into four equal parts. Within each part, three of the four kinds of lines are superimposed.
  May 1969
  Black pencil
  */
  noStroke();
  background(#f2f1e9);
  stroke(0, 125);

  // Area 1
  //diagonalGrid01(margen, margen, ancho/2-margen, alto/2-margen, 7);
  diagonalGrid02(margen, margen, ancho/2-margen, alto/2-margen, 7);
  hGrid(margen, margen, ancho/2-margen, alto/2-margen, 5);
  vGrid(margen, margen, ancho/2-margen, alto/2-margen, 5);
  // Area 2
  diagonalGrid01(ancho/2, margen, ancho/2-margen, alto/2-margen, 7);
  //diagonalGrid02(ancho/2, margen, ancho/2-margen, alto/2-margen, 7);
  hGrid(ancho/2, margen, ancho/2-margen, alto/2-margen, 5);
  vGrid(ancho/2, margen, ancho/2-margen, alto/2-margen, 5);
  // Area 3
  diagonalGrid01(margen, alto/2, ancho/2-margen, alto/2-margen, 7);
  diagonalGrid02(margen, alto/2, ancho/2-margen, alto/2-margen, 7);
  //hGrid(margen, alto/2, ancho/2-margen, alto/2-margen, 5);
  vGrid(margen, alto/2, ancho/2-margen, alto/2-margen, 5);
  // Area 4
  diagonalGrid01(ancho/2, alto/2, ancho/2-margen, alto/2-margen, 7);
  diagonalGrid02(ancho/2, alto/2, ancho/2-margen, alto/2-margen, 7);
  hGrid(ancho/2, alto/2, ancho/2-margen, alto/2-margen, 5);
  //vGrid(ancho/2, alto/2, ancho/2-margen, alto/2-margen, 5);

  fill(255);
  noStroke();
  rect(margen, margen/4, 530-margen, 50);
  textFont(BBR, 20);
  fill(#CC0000);
  text("Sol LeWitt", margen+15, margen/4+33);
  fill(0, 125);
  text("/ Wall Drawing 11. May 1969", margen+125, margen/4+33);



}

void vGrid(int x, int y, int w, int h, int sep){
  for(int i = x; i < x+w; i+=sep){
    line(i, y, i, y+h);
  }
}

void hGrid(int x, int y, int w, int h, int sep){
  for(int i = y; i < y+h; i+=sep){
    line(x, i, x+w, i);
  }
}

void diagonalGrid01(int x, int y, int w, int h, int sep){
    for(int i = y; i < y+h-sep; i+=sep){
    for(int ii = x; ii < x+w; ii+=sep){
      line(ii, i, ii+sep, i+sep);
    }
  }
}

void diagonalGrid02(int x, int y, int w, int h, int sep){
    for(int i = y+sep; i < y+h; i+=sep){
    for(int ii = x; ii < x+w; ii+=sep){
      line(ii, i, ii+sep, i-sep);
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////
void keyPressed(){
  if(key == 's'){
    save(pathExport + "" + timeStamp() + ".png");
  }
}

String timeStamp(){
  String y = str(year());
  String m = nf(month(), 2);
  String d = nf(day(), 2);
  String h = nf(hour(), 2);
  String mn = nf(minute(), 2);
  String s = nf(second(), 2);

  String ts = y + m + d + h + h + m + s;

  return ts;
}

void mousePressed(){
  setup();
}
