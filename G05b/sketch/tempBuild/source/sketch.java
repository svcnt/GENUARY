import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch extends PApplet {



public void setup(){
  
  colorMode(HSB);
  background(20);
}

public void draw(){
  float f = frameCount * 0.001f;
  for(int i = 0; i < width; i+=50){
      stroke(i, noise(i+f)*255, noise(f-i)*250);
      noFill(); strokeWeight(20);
      ellipse(noise(i)*width, i, noise(i, f)*width, noise(i, f)*height);
      blendMode(DIFFERENCE);
  }
}

public void mousePressed(){
  save(frameCount + ".png");
}
  public void settings() {  size(300, 300); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
