class leaf
{
  boolean all_done;
  color colour;
  int Start_x;
  int Start_y;
  
  int sideA_x, sideA_x_temp;
  int sideA_y, sideA_y_temp;
  
  int sideB_x, sideB_x_temp;
  int sideB_y, sideB_y_temp;
  
  int end_x, end_x_temp;
  int end_y, end_y_temp;
  
  //int how_big;
  
  leaf(int x, int y, int big, int left_OR_Right)//left_OR_Right => 0 = go left, 1 = go right
  {
    //print("called");
    all_done = false;
    Start_x = x;
    Start_y = y;
    //how_big = big;
    
    float num = random(1);
    int fill_colour = (int)random(100)+155;
    
    if (0.3>num)
    {
      colour = color(fill_colour,0,0);
    }
    else if(0.6>num)
    {
      colour = color(0,fill_colour,0);
    }
    else
    {
      colour = color(0,0,fill_colour);
    }
    
    //================================================
    
    if(0 == left_OR_Right)
    {
      end_x = big - Start_x;
    }
  else if(1 == left_OR_Right)
  {
    end_x = big + Start_x;
  }
  else
  {
    print("error at left_OR_Right");
  }

      if (random(1)>0.5)
      {
        end_y = (int)random(big)-Start_y;
      }
      else
      {
        end_y = (int)random(big)+Start_y;
      }
  }
  //=================================================================
  
  void dispaly()
  {
    stroke(colour);
        
        beginShape(POLYGON);
          vertex(Start_x, Start_y);
          vertex(sideA_x_temp, sideA_y_temp);
          vertex(sideB_x_temp, sideB_y_temp);
          vertex(end_x_temp, end_y_temp);
        endShape();
        print(all_done);
        if(false == all_done)
        {
          if(end_x_temp == end_x && end_x_temp == end_y)
          {
            //===================================================== A
            if(sideA_x_temp == sideA_x && sideA_y_temp == sideA_y && sideB_x_temp == sideB_x && sideB_y_temp == sideB_y)
            {
              all_done = true;
            }
            
                if(sideA_x_temp<sideA_x)
                 {
                     sideA_x_temp++;
                 }
                 else if(sideA_x_temp>sideA_x)
                 {
                      sideA_x_temp--;
                 }
          
                  if(sideA_y_temp<sideA_y)
                  {
                      sideA_y_temp++;
                  }
                  else if(sideA_y_temp>sideA_y)
                  {
                       sideA_y_temp--;
                  }
                //================================================= A
                
                //================================================= B
                
                  if(sideB_x_temp<sideB_x)
                 {
                     sideB_x_temp++;
                 }
                 else if(sideB_x_temp>sideB_x)
                 {
                      sideB_x_temp--;
                  }
          
                  if(sideB_y_temp<sideB_y)
                  {
                      sideB_y_temp++;
                  }
                  else if(sideB_y_temp>sideB_y)
                  {
                       sideB_y_temp--;
                  }
                  
                  //================================================== B
            }
            else
            {
             if(end_x_temp<end_x)
            {
              end_x_temp++;
            }
            else if(end_x_temp>end_x)
            {
              end_x_temp--;
            }
          
            if(end_y_temp<end_y)
            {
              end_y_temp++;
            }
            else if(end_y_temp>end_y)
            {
              end_y_temp--;
            }
          }
        }//end all_done
  }
}
