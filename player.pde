int size_x = 400, size_y = 400;
Ising grid;
float T = 2.02, deltaT = 0.1f;

boolean overButton = false;

PFont font;

void setup(){
  size(400,400);
  background(0);
  windowResize(size_x+80,size_y);
  grid = new Ising(size_x,size_y,(byte)0,T,1);
  grid.render();
  
  font = createFont("Times New Roman", 20, true);
  fill(255);
  textFont(font,14);
  
}

void keyPressed(){
  if(key == 'w' || key == 'W') T += deltaT;
  if((key == 's' || key == 'S') && T > 0.1f) T -= deltaT;
  grid.set_temp(T);
}

void mousePressed(){
  if(overRect(size_x+10,45,60,25)){
    grid = new Ising(size_x,size_y,(byte)0,T,1);
  }
}

void draw(){
  background(0);
  for(int i=0;i<size_x*size_y;i++)
    grid.monte_carlo();
  grid.render();
  text("T: " + String.format("%.2f",T), size_x+10, 20);
  text("M: " + String.format("%.2f",grid.get_magnetisation()+0.0f), size_x+10, 37);
  fill(0,0,0,0);
  stroke(255);
  rect(size_x+10,45,60,25);
  fill(255);
  text("Restart", size_x+20, 62);
}
