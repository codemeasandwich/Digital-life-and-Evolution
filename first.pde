
//random(0.05, 0.8);

int window_h;
int window_w;

drops[] drops_of_mouse;//line(0, y, width, y);

void setup()
{
  window_w = 400;
  window_h = 300;
  
  noStroke(); 
  smooth();
  
  size(window_w, window_h);                   //setup window
  PFont fontA = loadFont("CourierNew36.vlw"); //load font
  textFont(fontA, 16);                        //font type and size
}


void draw()
{
  background(120);
  
  fill(23,54,203);
  text("X00022027", 10, window_h - 10); //my number
}

void mousePressed()
{
   fill(23,54,203);
  line(mouseX-30, mouseY, mouseX+30, mouseY);
  drops aClick = new drops(mouseX,mouseY);
 
 // drops_of_mouse[]
}

class drops
{
   drops(int mousX, int mousY)
  {
    line(mousX, mousY, 10, 10);
  }
  
   drops(float mousX, float mousY)
  {
    line(mouseX-30, mouseY, mouseX+30, mouseY);
  }
 
}
