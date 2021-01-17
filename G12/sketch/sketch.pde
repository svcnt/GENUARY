// INFO ************** //
//////////////////////////////
/*
GENUARY 2021 / DAY 12 / Use an API.
José Vicente Araújo - 2021
*/

// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 800;
int alto = ancho;
String pathData = "../../data/";
String pathExport = "../../export/";

JSONArray data;
JSONObject weather;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);

}

void setup(){
  String url = "https://www.metaweather.com/api/location/766273/2014/01/01/";
  data = loadJSONArray(url);
  weather = data.getJSONObject(0);
  float wind_speed = weather.getFloat("wind_speed");
  text(wind_speed, 20, 20);
}

// LOOP ******************* //
//////////////////////////////
void draw(){

}

// FUNCIONES ************** //
//////////////////////////////

void keyPressed(){
  if(key == 's'){
    save(pathExport + "G12/" + timeStamp() + ".png");
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
