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
        base_x--;
        
        if(base_x-mouseX>Mouse_line)
        {
           base_x = mouseX+Mouse_line;
        }
        
      }
      else if (mouseX>base_x)
      {
        base_x++;

        if(mouseX-base_x>Mouse_line)
        {
          base_x = mouseX-Mouse_line;    
        }
        
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
