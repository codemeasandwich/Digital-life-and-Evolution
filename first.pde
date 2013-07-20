/****************************\
* Brian Shannon       Year 4 *
* X00022027           CA 1   *
* -=Digital Life-  ? Lines=- *
\****************************/

 int fps;
 int frameDrawen;
 int background_colour;
 
  int Array_drops_counter, Array_drops_size;

 //int mouse_fill;
 //boolean mouse_fill_up;

 boolean clicked;
 drop[] Array_drops;
 hills [] bg_hills;
 int hills_points, hills_overlap, hills_point_of_last_hill, hill_min_hight, hill_max_hight;
 color hill_gray;
 Mouse couser;
//==============================================================================void setup - Start

void setup()
{
  fps = 30;
  framerate(fps);
  noStroke(); 
  smooth();
  size(400, 300);                   //setup window
  PFont fontA = loadFont("Asman-18.vlw"); //load font
 // PFont fontB = loadFont("BlueHighwayCondensed-26.vlw");
  textFont(fontA, 16);                        //font type and size
  
  noCursor();
  //width = 400;
  //height = 300;
  
  background_colour = 20;
  frameDrawen = 0;
  couser = new Mouse();
  clicked = false;

  Array_drops_counter = 0;
  Array_drops_size = 99;
  Array_drops = new drop[Array_drops_size];
  Array_drops_counter = -1;
  
  hill_gray = color(40);
  hills_point_of_last_hill = 0;
  hill_min_hight = 10;
  hill_max_hight = 30;//NOTE the min will be added to this val
  hills_overlap = 23;
  hills_points = 10;
  bg_hills = new hills[hills_points];
  
        for(int i = 0; i<hills_points; i++)
        {
          if(0 ==i)
          {
              bg_hills[i] = new hills(-10, height, (int)random(hill_max_hight), height-(int)random(hill_max_hight), 50, height);
              hills_point_of_last_hill = 50;
          }
          else
          {//                       [                 x1                   ][   y1   ][                 x2                    ][                             y2                 ][             x3              ][   y3  ][         colour         ]
            bg_hills[i] = new hills(hills_point_of_last_hill - hills_overlap, height, hills_point_of_last_hill+(int)random(30),height-(int)random(hill_max_hight)-hill_min_hight, 50 + hills_point_of_last_hill, height/*,hills_point_of_last_hill/3*/);
            hills_point_of_last_hill += 50;//bg_hills[i] = new hills( _ , height , _ , _ , _ ,height ) // this keeps the base at the bottem of the screen
           }  
        }
}

//==============================================================================void setup - End

void draw()
{
  frameDrawen++;
  background(background_colour);

//==============================================================================Hills - Start
        for(int i = 0; i<hills_points; i++)
        {
          bg_hills[i].dispaly();
        }
//==============================================================================Hills - End

//==============================================================================Draw Drop Line - Start

  if(true == clicked)
  {
    for(int i = 0; i<=Array_drops_counter; i++)
    {
      Array_drops[i].dispaly();
    }
  }

//==============================================================================Draw Drop Line - End
  
//==============================================================================Dispaly ID - Start
  
  //to be draw last so it sittes on top
  fill(23,54,203);
  text("X00022027 (fps:"+fps+")", 10, height - 10); //my number
  ShowMouse_xy();
  couser.dispaly();                                  //Mouse Stuff
//==============================================================================Dispaly ID - End
}
void ShowMouse_xy()// mouse info
{
  int offset_x = 90;
  int offset_y = 50;
  int offset = 0;
  int val = 0;
  String xy = "";
  fill(155);
  
  for(int counter = 0; counter<2; counter++)
  {
    if (1 == counter)
    {
      offset = offset_x;
      xy = "x";
      val = mouseX;
    }
    else
    {
      offset = offset_y;
      xy = "y";
      val = mouseY;
    }
      if(0 <= val && 10>val)
      {
         text(xy+"00"+val,width-offset,20);
      }
      else if(9 < val && 100>val)
      {
          text(xy+"0"+val,width-offset,20);
      }
      else
      {
          text(xy+val,width-offset,20);
      }
  }
}
void mousePressed()
{
  /*
    if (mouseButton == LEFT)
    {
      
    } 
    else if (mouseButton == RIGHT)
    {
       
    }
    else //(mouseButton == MIDDEL)
    {
        
    }
  */
  Array_drops_counter++;
  Array_drops[Array_drops_counter] = new drop(Array_drops_counter);
  clicked = true;
}
void mouseReleased()
{
  Array_drops[Array_drops_counter].end();
}
//==============================================================================Custom Classes - Start
class drop
{
//==============================================================================1st step - Start
  int dropID;
  int head_y, head_x;
  int base_y, base_x;
  int ofset_x, ofset_y;
  int Mouse_line;      //line_size
  boolean Mouse_clicked;
//==============================================================================1st step - end
//==============================================================================2nd step - Start
int grow_Val;

//==============================================================================2nd step - end

//==============================================================================Contructor - Start
  
  drop(int num)
  {
    dropID = num;
    head_y = mouseY;
    head_x = mouseX;
    base_y = mouseY;
    base_x = mouseX;
    
    ofset_x = 0;
    ofset_y = 0;
    
    Mouse_clicked = true;
    Mouse_line = 0;


    grow_Val = 0;
  }
//==============================================================================Contructor - End

  void dispaly()//draw the line
  {
    if (true == Mouse_clicked)
    {
//==============================================================================compensate - Start

      if(mouseX<base_x)
      {
        base_x--;
      }
      else if (mouseX>base_x)
      {
        base_x++;
      }
      
//==============================================================================compensate - end
      
//==============================================================================Draw line - start
       strokeWeight(Mouse_line/50);
       stroke(255);
       line(mouseX, mouseY, base_x, mouseY+Mouse_line);
//==============================================================================Draw line - end
   
//==============================================================================coleashion with bottem of screen - start
       if(mouseY>height)
       {
          Mouse_line = 0;
       }
       else if(mouseY+Mouse_line >=height)
       {
           Mouse_line = height - mouseY;
       }
       else
       {
           Mouse_line ++;
       }
//==============================================================================coleashion with bottem of screen - end
    }
    else
    {
      if(head_y>height)
      {
        if (Mouse_line/6>grow_Val)
        {
          grow_Val++;
        }
        strokeWeight(3);
        stroke(255);
        fill(0);
        beginShape(TRIANGLE_STRIP);
          vertex(head_x - (Mouse_line/4), height+5);
          vertex(head_x + (Mouse_line/4), height+5);
          vertex(head_x, height - grow_Val);
        endShape();
      }
      else
      {
        
          if(base_x<head_x)
          {
              head_x--;
              base_y++;
              Mouse_line ++;
          }
          else if (base_x>head_x)
          {
              head_x++;
              base_y++;
              Mouse_line++;
          }
        strokeWeight(Mouse_line/50);
        stroke(255);
        line(head_x, head_y, base_x, base_y);
        head_y += 1.5;
        base_y += 1.5;
      }
    }
  }

  void end()
  {
    //keep leant
    head_y = mouseY;
    head_x = mouseX;
    base_y = mouseY+Mouse_line;
    Mouse_clicked = false;
  }
}
//==============================================================================
//==============================================================================
class Mouse
{
  int mouse_fill;
  int mouse_fill_low;
  int mouse_fill_high;
  boolean mouse_fill_up;
  float rond;

  Mouse()
  {
    rond = 360.0;
      mouse_fill = 200;
      mouse_fill_low = 200;
      mouse_fill_high = 255;
      mouse_fill_up = true;
  }

  void dispaly()
  {
    //hidemouse ???
    //rectMode(CENTER);
    //rotate(frameDrawen);


if(true == mouse_fill_up)
{
  mouse_fill++;
  
  if(mouse_fill>=mouse_fill_high)
  {
    mouse_fill_up = false;
  }
}
else
{
  mouse_fill--;
  
  if(mouse_fill<=mouse_fill_low)
  {
    mouse_fill_up = true;
  }
}

stroke(mouse_fill);
fill(mouse_fill);
translate(mouseX, mouseY);
rotate(rond);
rect(-7, -7, 15, 15);
//rect(mouseX-7, mouseY-7, 15, 15);
rond-=0.03;

  }
  
}
//==============================================================================
//==============================================================================
class hills
{
  color hill_gray_iner = hill_gray;
  int x1, y1, x2, y2, x3, y3;
  
  hills(int x1_input,int y1_input,int x2_input,int y2_input,int x3_input,int y3_input)
  {
        x1 = x1_input;
        y1 = y1_input;
        x2 = x2_input;
        y2 = y2_input;
        x3 = x3_input;
        y3 = y3_input;
  }
  hills(int x1_input,int y1_input,int x2_input,int y2_input,int x3_input,int y3_input,int colour)
  {
        x1 = x1_input;
        y1 = y1_input;
        x2 = x2_input;
        y2 = y2_input;
        x3 = x3_input;
        y3 = y3_input;
        hill_gray_iner  = color(colour);
  }
  void dispaly()
  {
        stroke(hill_gray);
        strokeWeight(0);
        if(hill_gray != hill_gray_iner)
        {
          fill(hill_gray_iner);
        }
        else
        {
          fill(hill_gray);
        }
        beginShape(TRIANGLE_STRIP);
          vertex(x1, y1);
          vertex(x2, y2);
          vertex(x3, y3);
        endShape();
  }
}
//==============================================================================Custom Classes - End
