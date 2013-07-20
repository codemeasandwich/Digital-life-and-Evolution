/****************************\
* Brian Shannon       Year 4 *
* X00022027           CA 1   *
* -=Digital Life-  ? Lines=- *
\****************************/

 int fps, frameDrawen;
 int background_colour;
 float round_temp;
 int Array_drops_counter, Array_stars_counter, Array_size;
 boolean show_xy;
 boolean clicked, clicked_stars;
 //boolean kill_Tree;
 drop[] Array_drops;
 sky_points[] Array_stars;
 int nums_of_hill_lares;
 hills [][] bg_hills;
 int hills_points, hills_overlap, hills_point_of_last_hill, hill_min_hight, hill_max_hight;
 color hill_gray;
 Mouse couser;
//==============================================================================void setup - Start

void setup()
{
  
  //round_temp = 1.57;
  
  print("Loading");
  fps = 30;
  frameRate(fps);
  noStroke(); 
  smooth();
  size(400, 300);                   //setup window
  PFont fontA = loadFont("voxBOX-26.vlw"); //load font
  textFont(fontA, 26);              //font type and size
  noCursor();
  print(".");
  background_colour = 20;
  frameDrawen = 0;
  couser = new Mouse();
  clicked = false;
  clicked_stars = false;
  //kill_Tree = false;
  show_xy = true;
  Array_drops_counter = 0;
  Array_size = 99;
  Array_drops = new drop[Array_size];
  Array_drops_counter = -1;
  
  Array_stars = new sky_points[Array_size];
  Array_stars_counter = -1;
  
  hill_gray = color(40);
  hills_point_of_last_hill = 0;
  hill_min_hight = 10;
  hill_max_hight = height/7;//30;//NOTE the min will be added to this val
  hills_overlap = 23;
  hills_points = 10;
  nums_of_hill_lares = 3;
  print(".");
    //  fill(255);
    //  text("LOADING...", width/2, height/2); //my number
  bg_hills = new hills[nums_of_hill_lares][hills_points];
  int colour = 0;
  hills_point_of_last_hill = -10;
  for(int h = 0; h<nums_of_hill_lares; h++)
  {
    colour += 255/4;//nums_of_hill_lares;
        for(int i = 0; i<hills_points; i++)
        {
          //                       [                 x1                   ][   y1   ][                 x2                    ][                             y2                 ][             x3              ][   y3  ][         colour         ]
            bg_hills[h][i] = new hills(hills_point_of_last_hill - hills_overlap, height, hills_point_of_last_hill+(int)random(30),height-(int)random(hill_max_hight)-hill_min_hight, width/hills_points + hills_point_of_last_hill, height,colour/*,hills_point_of_last_hill/3*/);
            hills_point_of_last_hill += width/hills_points;//bg_hills[i] = new hills( _ , height , _ , _ , _ ,height ) // this keeps the base at the bottem of the screen
        }
        hills_point_of_last_hill = 0;
  }
        println(".");
        println("All done.");
        println("");
        println("press TAB to hide and show the X Y");
}

//==============================================================================void setup - End

void draw()
{
  frameDrawen++;
  background(background_colour);
//==============================================================================Stars - Start
  if(true == clicked_stars)
  {
    for(int i = 0; i<=Array_stars_counter; i++)
    {
      Array_stars[i].dispaly();
      //Array_stars[Array_stars_counter]
    }
  }
//==============================================================================Stars - End

//==============================================================================Hills - Start
    for(int h = 0; h<nums_of_hill_lares; h++)
    {
        for(int i = 0; i<hills_points; i++)
        {
             bg_hills[h][i].dispaly();
        }
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

    if(keyPressed)
    {
      //if (key == 'b' || key == 'B') {
      //fill(0);
      //print(key);
      if (key == TAB)
      {
        if(true == show_xy)
        {
          show_xy = false;
        }
        else
        {
          show_xy = true;
        }
        
        key = '?';
      }
    }

//==============================================================================Draw Drop Line - End
//==============================================================================Dispaly ID - Start
  
  //to be draw last so it sittes on top
  couser.dispaly();
  //translate(mouseX*-1,mouseY*-1);
  
  pushMatrix();
  translate(10,height/2);
  //rect(0,0,10,10);
 // println(round_temp);
    //rotate(round_temp);//width, height
    //round_temp +=0.01f;
    rotate(4.710);
    fill(23,54,203);
    text(/*"fps:"+fps+*/"X00022027", 0, 10); //my number
    
  popMatrix();
  
  if(true == show_xy)
  {
    ShowMouse_xy();
  }
                                    //Mouse Stuff
//==============================================================================Dispaly ID - End
}


void ShowMouse_xy()// mouse info
{
  int offset_x = 140;
  int offset_y = 70;
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
  if (mouseButton == LEFT)
  {
    Array_drops_counter++;
    Array_drops[Array_drops_counter] = new drop(Array_drops_counter);
    clicked = true;
  }
  else if (mouseButton == RIGHT)
  {
    //kill_Tree = true;
    Array_stars_counter++;
    Array_stars[Array_stars_counter] = new sky_points(mouseX, mouseY);
    clicked_stars = true;
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    Array_drops[Array_drops_counter].end();
  }
  else if (mouseButton == RIGHT)
  {
    //kill_Tree = false;
  }
}
