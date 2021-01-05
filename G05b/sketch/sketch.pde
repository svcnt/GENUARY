

void setup(){
  size(300, 300);
  colorMode(HSB);
  background(20);
}

void draw(){
  float f = frameCount * 0.001;
  for(int i = 0; i < width; i+=50){
      stroke(i, noise(i+f)*255, noise(f-i)*250);
      noFill(); strokeWeight(20);
      ellipse(noise(i)*width, i, noise(i, f)*width, noise(i, f)*height);
      blendMode(DIFFERENCE);
  }
}

void mousePressed(){
  save(frameCount + ".png");
}
