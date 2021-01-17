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
int num = 12;
JSONArray[] data = new JSONArray[num];
String[] urls = new String[num];
JSONObject[] weather = new JSONObject[num];
float[] ws = new float[num]; // wind_speed
float[] wd = new float[num]; // wind_direction
float sep = ancho/12;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto);

}

void setup(){
  background(20);
  loading();
  for(int i = 1; i < data.length; i++){
    urls[i] = "https://www.metaweather.com/api/location/766273/2014/" + nf(i, 2) +"/01";
    data[i] = loadJSONArray(urls[i]);
  }
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  for(int i = 1; i < data.length; i++){
    if(data[i] != null){
      weather[i] = data[i].getJSONObject(0);
      ws[i] = weather[i].getFloat("wind_speed");
      wd[i] = weather[i].getFloat("wind_direction");
      pushMatrix();
      translate(i * sep, sep);
      rotate(radians(wd[i]));
      float sz = ws[i] * 5;
      ellipse(0, 0, sz, sz);
      line(
        0 - sz / 2, 0,
        0 + sz / 2, 0
        );
      popMatrix();
    }
  }

}

// FUNCIONES ************** //
//////////////////////////////

void loading(){
  text("loading", 20, 20);
}

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
