
/****************************\
* Brian Shannon       Year 4 *
* X00022027           CA 1   *
\****************************/

int window_h;
int window_w;
int fps;
int frameDrawen;
int Array_drops_counter;
int Array_drops_size;

int mouse_fill;
boolean mouse_fill_up;

boolean clicked;
drop[] Array_drops;

void setup()
{
  window_w = 400;
  window_h = 300;
  fps = 30;
  frameDrawen = 0;
  mouse_fill = 200;
  mouse_fill_up = true;
  
  clicked = false;

  Array_drops_counter = 0;
  
  framerate(fps);
  
  noStroke(); 
  smooth();
  Array_drops_size = 99;
  Array_drops = new drop[Array_drops_size];
  Array_drops_counter = -1;
  
  size(window_w, window_h);                   //setup window
  PFont fontA = loadFont("CourierNew36.vlw"); //load font
  textFont(fontA, 16);                        //font type and size
}

void draw()
{
  //println("x"+mouseX+" y"+mouseY);
  
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

  if(true == clicked)
  {
    //print("hellp");
    for(int i = 0; i<=Array_drops_counter; i++)
    {
      //print("xxx");
      Array_drops[i].dispaly();
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
  //print("1");
  Array_drops_counter++;
  Array_drops[Array_drops_counter] = new drop(Array_drops_counter);
  clicked = true;
 // print("2");
}
void mouseReleased()
{
  //Mouse_clicked = false;
  //Mouse_line = 0;
  Array_drops[Array_drops_counter].end();
  
}

//==================================================Custom Classes - Start

class drop
{
  int dropID;
  int head_y;
  int head_x;
  int base_y;
  //int base_x;
  int Mouse_line;//line_size
  boolean Mouse_clicked;
  
  drop(int num)// Contructor
  {
    //print("dro");
    dropID = num;
    head_y = 0;
    head_x = 0;
    base_y = 0;
   // base_x = 0;
    Mouse_clicked = true;
    Mouse_line = 0;
  }

  void dispaly()
  {
    //draw the line
    //print("dis");
    
    if (true == Mouse_clicked)
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
    else
    {
      if(head_y>window_h)
      {
        println("gro!"+dropID);
      }
      else
      {
        stroke(255);
        line(head_x, head_y, head_x, base_y);
        head_y += 1.5;
        base_y += 1.5;
        
        /*
        stroke(255);
fill(233,0,0);
beginShape(TRIANGLE_STRIP);
//vertex(x,y);
vertex(150, 100);
vertex(125, 75);
vertex(100, 100);
vertex(140, 70);
vertex(105, 60);
vertex(110, 80);

endShape();
        */
      }
    }
  }

  void end()
  {
    //keep leant
    head_y = mouseY;
    head_x = mouseX;
    base_y = mouseY+Mouse_line;
    //base_x = mouseX;
    Mouse_clicked = false;
  }
}


//==================================================Custom Classes - End

