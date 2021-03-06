// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY3 / Make something human
José Vicente Araújo - 2021
Based on D. Shiffman
----
What's more human than bleeding?
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 400;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";
int t = 0; // temporizador

PImage fondo;

// PARÁMETROS INICIALES
// Sobreescritos más abajo, vinculados a posición
float dA = 1; // Difusión de la sustancia A
float dB = 0.5; // Difusión de la sustancia B
float feed = 0.055; // Aparición
float k = 0.062; // Muerte
// Aquí se almacenan los estados de las células
PVector[][] grid = new PVector[ancho][alto];
PVector[][] next = new PVector[ancho][alto];
PVector[][] temp = new PVector[ancho][alto];
int pix;
color clr;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  frameRate(100);
  colorMode(HSB);
  fondo = loadImage(pathData + "TEXTO.png");
  //pixelDensity(1);
  // Estados iniciales
  for(int x=0; x<width; x++){
    for(int y=0; y<height; y++){
      grid[x][y] = new PVector(1, 0); // x=a, y=b
      next[x][y] = new PVector(1, 0); // x=a, y=b
    }
  }

  for(int i = 0; i < width; i++){
    for(int ii = 0; ii <= height; ii++){
      float radio = 0.2;
      if(dist(i, ii, width*random(radio, 1-radio), height*random(radio, 1-radio)) < width*radio){
        clr = fondo.get(i, ii);
        //grid[i][ii].x = noise(i*0.1, ii*0.1);
        //grid[i][ii].y = noise(ii*0.1, i*0.1);
        grid[i][ii].x = brightness(clr)/255;
        grid[i][ii].y = brightness(clr)/255;
      }
    }
  }
}

// LOOP ******************* //
//////////////////////////////
void draw(){

  //background(255);
  // REACCIÓN - DIFUSIÓN
  // Redefinición de parámetros según posición
  for(int i = 1; i < width-1; i++){
    for(int ii = 1; ii < height-1; ii++){
      dA = map(
        noise(i*0.1, ii*0.1, frameCount*0.01),
        0, 1,
        0.6, 1.15 // inicial: 1
        );
      dB = map(
        noise(i*0.05, ii*0.05, frameCount*0.02),
        0, 1,
        0.25, 0.7 // inicial: 0.5
        );
      feed = map(
        noise(i*0.15, frameCount*0.03, ii*0.15),
        0, 1,
        0.015, 0.1 // inicial: 0.055
        );
      k = map(
        noise(frameCount*0.04, i*0.02, ii*0.02),
        0, 1,
        0.002, 0.112 //inicial: 0.062
        );
      // Aquí se producen los cambios
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

  // MOSTRAR
  loadPixels();
  for(int i = 0; i < width; i++){
    for(int ii = 0; ii < height; ii++){
      //if(next[i][ii].x < 0.75){
        float h = 0;
        float s = 255 - next[i][ii].x * 255;
        float b = 255;
        color c = color(h, s, b);
        pix = (i + ii * width);
        pixels[pix] = c;
      //}

    }
  }
  updatePixels();

  // ACTUALIZAR
  swap();

  surface.setTitle("FPS: " + frameRate);

  t++;

}

// FUNCIONES ************** //
//////////////////////////////
void keyPressed(){
  if(key == 's'){
    save(pathExport + "G03b/" + timeStamp() + ".png");
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
  setup();
}

float laplaceA(int x, int y){
  float sumA = 0;
  sumA += grid[x][y].x * -1;
  sumA += grid[x-1][y].x * 0.2;
  sumA += grid[x+1][y].x * 0.2;
  sumA += grid[x][y+1].x * 0.2;
  sumA += grid[x][y-1].x * 0.2;
  sumA += grid[x-1][y-1].x * 0.05;
  sumA += grid[x+1][y-1].x * 0.05;
  sumA += grid[x+1][y+1].x * 0.05;
  sumA += grid[x-1][y+1].x * 0.05;
  return sumA;
}

float laplaceB(int x, int y){
  float sumB = 0;
  sumB += grid[x][y].y * -1;
  sumB += grid[x-1][y].y * 0.2;
  sumB += grid[x+1][y].y * 0.2;
  sumB += grid[x][y+1].y * 0.2;
  sumB += grid[x][y-1].y * 0.2;
  sumB += grid[x-1][y-1].y * 0.05;
  sumB += grid[x+1][y-1].y * 0.05;
  sumB += grid[x+1][y+1].y * 0.05;
  sumB += grid[x-1][y+1].y * 0.05;
  return sumB;
}


void swap(){
  temp = grid;
  grid = next;
  next = temp;
}
