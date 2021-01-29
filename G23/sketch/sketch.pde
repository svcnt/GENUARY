// INFO ************** //
//////////////////////////////
/*
GENUARY / DAY 22 / DRAW A LINE. WRONG ANSWERS ONLY
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 600;
int alto = 600;
String pathData = "../../data/";
String pathExport = "../../export/";

float nX, nY;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);
}

void setup(){
  nX = random(0.001, 0.05);
  nY = random(0.001, 0.05);

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  float t = frameCount*0.005;
  loadPixels();
  for(int y = 0; y < alto; y++){
    for(int x = 0; x < ancho; x++){
      float n1 = noise(x*nX, y*nY, t);
      float n2 = sin(y*nY*0.5*t);
      int cual = int((n1*n2)*6);
      switch(cual) {
        case 1:
          pixels[( y * width ) + x] = #264653;
        break;
        case 2:
          pixels[( y * width ) + x] = #2a9d8f;
        break;
        case 3:
          pixels[( y * width ) + x] = #e9c46a;
        break;
        case 4:
          pixels[( y * width ) + x] = #f4a261;
        break;
        case 5:
          pixels[( y * width ) + x] = #e76f51;
        break;
        default:
          pixels[( y * width ) + x] = #e76f51;
        break;
      }
    }
  }
  updatePixels();
}

// FUNCIONES ************** //
//////////////////////////////

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G23/" + timeStamp() + ".png");
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
