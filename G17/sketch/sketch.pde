// INFO ************** //
//////////////////////////////
/*
GENUARY / DÍA 17 / Draw a line, pick a new color, move a bit.
José Vicente Araújo - 2021
----

*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);

}

void setup(){
  colorMode(HSB);
  background(#202020);

}

// LOOP ******************* //
//////////////////////////////
void draw(){
  surface.setTitle("FPS: " + frameRate);
  float t = frameCount*0.01;

  stroke(
    map(sin(t), -1, 1, 0, 100),
    map(sin(t*0.9), -1, 1, 100, 200),
    map(sin(t*0.8), -1, 1, 100, 200),
    100
  );

  line(
    ancho/2 + sin(t)*50,
    alto/2 - cos(t)*50,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*150,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*150
    );

  stroke(#202020, 100);
  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*150,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*150,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*160,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*160
    );

  stroke(
    map(sin(t*0.7), -1, 1, 100, 175),
    map(sin(t*0.6), -1, 1, 100, 200),
    map(sin(t*0.5), -1, 1, 100, 200),
    200
  );

  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*160,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*160,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*250,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*250
    );

  stroke(#202020, 100);
  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*250,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*250,
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*260,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*260
    );

  stroke(
    map(sin(t*0.7), -1, 1, 175, 255),
    map(sin(t*0.6), -1, 1, 100, 200),
    map(sin(t*0.5), -1, 1, 100, 200),
    100
  );

  line(
    ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*260,
    alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*260,
    // ancho/2 + sin(t)*noise(sin(t), cos(t*0.9))*375,
    // alto/2 - cos(t)*noise(sin(t), cos(t*0.8))*375
    ancho/2 + sin(t)*300,
    alto/2 - cos(t)*300
    );




}

// FUNCIONES ************** //
//////////////////////////////
void keyPressed(){
  if(key == 's'){
    save(pathExport + "G17/" + timeStamp() + ".png");
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
  switch(mouseButton) {
    case LEFT:
      setup();
    break;
    case RIGHT:
      //
    break;
    default:
      //
    break;
  }
}
