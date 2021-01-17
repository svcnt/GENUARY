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
JSONObject[][] weather = new JSONObject[num][num];
float[][] ws = new float[num][num]; // wind_speed
float[][] wd = new float[num][num]; // wind_direction
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
  background(#404040);
  for(int i = 1; i < data.length; i++){
    for(int ii = 1; ii < num; ii++){
      if(data[i] != null){
      weather[i][ii] = data[i].getJSONObject(ii*4);
      ws[i][ii] = weather[i][ii].getFloat("wind_speed");
      wd[i][ii] = weather[i][ii].getFloat("wind_direction");
      pushMatrix();
      translate(i * sep, ii * sep);
      rotate(radians(wd[i][ii]));
      float sz = ws[i][ii] * 5;
      fill(255);
      ellipse(0, 0, sz, sz);
      fill(#202020);
      arc(0, 0, sz, sz, 0, PI);
      line(
        0 - sz / 2, 0,
        0 + sz / 2, 0
        );
      popMatrix();
      }
    }
  }

  if(frameCount % 1 == 0){
    for(int i = 1; i < data.length; i++){
      urls[i] = "https://www.metaweather.com/api/location/766273/2014/" + nf(i, 2) + "/" + int(map(second(), 0, 60, 1, 28));
      data[i] = loadJSONArray(urls[i]);
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
