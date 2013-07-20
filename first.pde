/****************************\
* Brian Shannon       Year 4 *
* X00022027           CA 1   *
\****************************/


//random(0.05, 0.8);

int window_h;
int window_w;
int fps;
int frameDrawen;

int Mouse_line;

boolean Mouse_clicked;

int mouse_fill;
boolean mouse_fill_up;

void setup()
{
  
  window_w = 400;
  window_h = 300;
  fps = 30;
  frameDrawen = 0;
  mouse_fill = 200;
  mouse_fill_up = true;
  Mouse_clicked = false;
  Mouse_line = 0;
  framerate(fps);
  
  noStroke(); 
  smooth();
  
  size(window_w, window_h);                   //setup window
  PFont fontA = loadFont("CourierNew36.vlw"); //load font
  textFont(fontA, 16);                        //font type and size
}


void draw()
{
  frameDrawen++;
  background(0);
//translate(window_w/2, window_h/2);

//==================================================Mouse Stuff - Start
//hidemouse ???

//rectMode(CENTER);
//rotate(frameDrawen);
stroke(0);

if(true == mouse_fill_up)
{
  mouse_fill++;
  
  if(mouse_fill>=255)
  {
    mouse_fill_up = false;
  }
}
else
{
    mouse_fill--;
  
  if(mouse_fill<=200)
  {
    mouse_fill_up = true;
  }
}
fill(mouse_fill);
rect(mouseX-7, mouseY-7, 15, 15);
 
//==================================================Mouse Stuff - End

//==================================================Draw Drop Line - Start
if(true == Mouse_clicked)
{
  stroke(255);
   line(mouseX, mouseY, mouseX, mouseY+Mouse_line);
   
  if(mouseY>window_h)
  {
    Mouse_line = 0;
  }
   else if(mouseY+Mouse_line >=window_h)
   {
     Mouse_line = window_h - mouseY;
   }
   else
   {
     Mouse_line++;
   }
}
  //==================================================Draw Drop Line - End
  
  //==================================================Dispaly ID - Start
  //to be draw last so it sittes on top
  fill(23,54,203);
  text("X00022027 (fps:"+fps+") "/*+frameDrawen*/, /*window_w -*/ 10, window_h - 10); //my number
  
  //==================================================Dispaly ID - End
}

void mousePressed()
{
  Mouse_clicked = true;
}
void mouseReleased()
{
  Mouse_clicked = false;
  Mouse_line = 0;
}

//==================================================Custom Classes - Start

class drop
{
  int head_y;
  int head_x;
  int base_y;
  int base_x;
  
  drop()// Contructor
  {
    
  }
  void dispaly()
  {
    //draw the line
  }
  void add()
  {
    // add one val
  }
  void add(int num)
  {
    // add the val to the line
  }
  void end()
  {
    //keep leant
  }
}


//==================================================Custom Classes - End

