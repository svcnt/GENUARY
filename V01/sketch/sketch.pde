// LIBRERÍAS ************** //
//////////////////////////////

// VARIABLES GLOBALES ***** //
//////////////////////////////
int ancho = 750;
int alto = 750;
String pathData = "../../data/";
String pathExport = "../../export/";

//
float sep;
int num = 20;
int tam = 50;

// SETUP ****************** //
//////////////////////////////
void settings(){
  size(ancho, alto, P3D);
}

void setup(){
  colorMode(HSB);
  noStroke();
  //fill(#202020);
}

// LOOP ******************* //
//////////////////////////////
void draw(){
  background(#202020);
  lightFalloff(1.0, 0.001, 0.0);
  lights();
  pointLight(125,125,125,mouseX,mouseY,500);
  translate(ancho*0.5, alto*0.5, 300);

  rotateX(frameCount * 0.001);
  rotateY(frameCount * 0.001);
  rotateZ(noise(frameCount*0.001) * TWO_PI);
  //sep = ancho / num;
  sep = tam*0.4;
  for(int i = -num/2; i < num/2; i++){
    for(int ii = -num/2; ii < num/2; ii++){
      for(int iii = -num/2; iii < num/2; iii++){
        if(noise(i, ii, iii + frameCount*0.001) > 0.5){
          pushMatrix();
          fill(
            noise(i, ii, iii + frameCount*0.01)*50,
            255,
            125);
          translate(i*sep, ii*sep, iii*sep);
          rotateX(iii + frameCount * 0.001);
          box(
            tam*noise(i, ii, iii + frameCount*0.01),
            tam*noise(i, ii, iii + frameCount*0.015)*0.5,
            tam*noise(i, ii, iii + frameCount*0.02)*0.25
            );
          box(
            tam*noise(i, ii, iii + frameCount*0.015)*0.5,
            tam*noise(i, ii, iii + frameCount*0.01),
            tam*noise(i, ii, iii + frameCount*0.02)*0.25
            );
          popMatrix();
        }
      }
    }
  }
}

// FUNCIONES ************** //
//////////////////////////////
