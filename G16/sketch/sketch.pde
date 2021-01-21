// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 4 / SMALL AREAS OF SYMMETRY
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////
import processing.video.*;

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 1280;
int alto = 540;
String pathData = "../../data/";
String pathExport = "../../export/";

Movie img;

int[] pos = new int[5];
int[] tam = new int[5];


// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);

}

void setup(){
  frameRate(24);
  surface.setResizable(true);
  noStroke();
  img = new Movie(this, "vid001.mp4");
  img.loop();
  img.speed(0.5);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  // image(img, 0, 0);
  float temp = frameCount*0.01;

  for(int i = 0; i < height; i+=10){
    for(int ii = 0; ii < width; ii+=10){
      color c = img.get(int(ii*noise(temp)), int(i*noise(temp*2)));
      fill(c);
      // strokeWeight(2);
      // noFill();
      float sz = map(brightness(c), 0, 255, 01, 10);
      float sz2 = map(saturation(c), 0, 255, 01, 8);
      float d = map(hue(c), 0, 255, -50, 50);
      if(sz > 05){
        //ellipse(ii+sin(d)*10, i+cos(d)*10, d, d);
        ellipse(ii+d, i+d, sz, sz);
        fill(#202020, brightness(c));
        ellipse(ii+d, i+d, sz2, sz2);
      }

    }
  }

  surface.setTitle("FPS: " + frameRate);
}

// FUNCIONES ************** //
//////////////////////////////

void movieEvent(Movie m) {
  m.read();
}

void espejo(int _x, int _y, int _w, int _h){
  int x = _x; int y = _y; int w = _w; int h = _h;

  copy(x,y,-w,h,x,y,w,h);
  // stroke(255);
  // noFill();
  // rect(x, y, w, h);
}

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G16/" + timeStamp() + ".png");
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
      for(int i = 0; i < pos.length; i++){
        pos[i] = (int)random(width);
        tam[i] = (int)random(50, 200);
      }
    break;
    default:
      //
    break;
  }
}
