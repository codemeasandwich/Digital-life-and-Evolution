/****************************\
* Brian Shannon       Year 4 *
* X00022027           CA 1   *
* -=Digital Life-  ? Lines=- *
\****************************/

 int fps;
 int frameDrawen;
 int background_colour;
 
 int Array_drops_counter, Array_drops_size;

 boolean clicked;
 drop[] Array_drops;
 hills [] bg_hills;
 int hills_points, hills_overlap, hills_point_of_last_hill, hill_min_hight, hill_max_hight;
 color hill_gray;
 Mouse couser;
//==============================================================================void setup - Start

void setup()
{
  print("Loading...");
  fps = 30;
  framerate(fps);
  noStroke(); 
  smooth();
  size(400, 300);                   //setup window
  PFont fontA = loadFont("Asman-18.vlw"); //load font
  textFont(fontA, 16);              //font type and size
  noCursor();
  
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
    //  fill(255);
//  text("LOADING...", width/2, height/2); //my number
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
    else if (mouseButton == RIGHT)
    else //(mouseButton == MIDDEL)
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
  int ofset;
  int Mouse_line;      //line_size
  boolean Mouse_clicked;
  tree_pice tree;
//==============================================================================1st step - end

//==============================================================================Contructor - Start
  
  drop(int num)
  {
    dropID = num;
    head_y = mouseY;
    head_x = mouseX;
    base_y = mouseY;
    base_x = mouseX;
    ofset = 0;
 
    Mouse_clicked = true;
    Mouse_line = 0;
  }
//==============================================================================Contructor - End

  void dispaly()//draw the line
  {
    if (true == Mouse_clicked)
    {
//==============================================================================compensate - Start
      if(mouseX<base_x)
      {
        //ofset++;
        base_x--;
      }
      else if (mouseX>base_x)
      {
        //ofset--;
        base_x++;
      }
//==============================================================================compensate - end
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

//==============================================================================Draw line - start
       strokeWeight(Mouse_line/50);
       stroke(255);
       line(mouseX, mouseY, base_x, mouseY+Mouse_line);
//==============================================================================Draw line - end

    }
    else
    {
      if(head_y>height)
      {
        if(null == tree)
        {
        tree = new tree_pice(head_x - (Mouse_line/4), height+5,head_x + (Mouse_line/4), height+5,head_x, height,Mouse_line);
        }
        else
        {
          tree.dispaly();
        }
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
class tree_pice
{
    int base1_x, base1_y; 
    int base2_x, base2_y;
    int end_point_x, end_point_y;
    int offset_x, offset_y;
    int hops;
    int hops_count;
    int[] past_hops;
    past_vertex[] past_vertex_array;
    int stroke_colour;
    int tree_size;
    
  tree_pice(
    int base1_x_input,int base1_y_input, 
    int base2_x_input,int base2_y_input,
    int end_point_x_input,int end_point_y_input,int tree_size_input)
  {
    base1_x = base1_x_input;
    base1_y = base1_y_input;
    base2_x = base2_x_input;
    base2_y = base2_y_input;
    end_point_x = end_point_x_input;
    end_point_y = end_point_y_input;
    
    offset_x = (base1_x + base2_x)/2;
    offset_y = (base1_y + base2_y)/2;
    hops = 10;//number of hops
    hops_count = 0;
    past_vertex_array = new past_vertex[hops];
    past_hops = new int [hops*6];// 6 points
    stroke_colour = (int)random(100)+100;
    if(tree_size_input<50)
    {
      tree_size = tree_size_input;
    }
    else
    {
      tree_size = 50;
    }
  }
 
  void dispaly()
  {
        strokeWeight(1);
        stroke(255);
        fill(0,stroke_colour,0);
        
        beginShape(TRIANGLE_STRIP);
          vertex(base1_x,base1_y);
          vertex(base2_x, base2_y);
          vertex(offset_x, offset_y);
        endShape();
        

          for(int i = 0; i<hops_count;i++)
          {
              past_vertex_array[i].dispaly();
          }

        if(offset_x<end_point_x)
        {
          offset_x++;
        }
        else if(offset_x>end_point_x)
        {
          offset_x--;
        }
        
        if(offset_y<end_point_y)
        {
          offset_y++;
        }
        else if(offset_y>end_point_y)
        {
          offset_y--;
        }
        
        if(offset_y == end_point_y && offset_x == end_point_x && hops_count<hops)
        {
             past_vertex_array[hops_count] = new past_vertex(base1_x, base1_y, base2_x, base2_y, end_point_x, end_point_y);
          
          if(0.5>random(1))
          {
              base1_x = end_point_x;
              base1_y = end_point_y;
          }
          else
          {
              base2_x = end_point_x;
              base2_y = end_point_y;
          }
          if(0.5>random(1))
          {
              end_point_x = end_point_x+(int)random(tree_size);
          }
          else
          {
            end_point_x = end_point_x-(int)random(tree_size);
          }
          end_point_y = end_point_y-(int)random(tree_size/1.6);
          hops_count++;
        }
    }
}
//==============================================================================
class past_vertex
{
  int x1, y1; 
  int x2, y2; 
  int x3, y3;
  
  past_vertex(int x1,int y1, int x2, int y2, int x3, int y3)
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
  }
  void dispaly()
  {
       beginShape(TRIANGLE_STRIP);
          vertex(x1,y1);
          vertex(x2,y2);
          vertex(x3,y3);
        endShape();
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
