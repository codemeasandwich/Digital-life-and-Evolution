class onScreenTxt
{
 
 boolean show_xy, helpShow, dispaly_H;
 helpScreen helpFrame;
 float helpScreenScale;
 int helpAlfaNum;
 boolean helpAlfaBool;
 
 
  onScreenTxt()
  {

    helpAlfaBool = true;
    helpAlfaNum = 225;
    
      show_xy = true;
      dispaly_H = true;
      helpShow = false;
      helpFrame = new helpScreen(true);
      helpScreenScale = 0.0f;
  }
  void display()
  {
    textFont(fontA, 26);              //font type and size
    
      if(keyPressed)
    {
      if (key == TAB)
      {
        show_xy = !show_xy;
      }
      else if('h' == key || 'H' == key)
      {
        dispaly_H = false;
        helpShow = !helpShow;
      }
      key = '?';
    }
  
    pushMatrix();
      translate(10,height/2);
      rotate(4.710);
      fill(23,54,203);
      text("X00022027", 0, 10); //my number
    popMatrix();
  
    if(true == show_xy)
    {
      ShowMouse_xy();
    }
    if(dispaly_H)
    {
      if(254<helpAlfaNum)
      {
            helpAlfaBool = false;
    
      }
      else if(150>helpAlfaNum)
      {
          helpAlfaBool = true;
      }
      
      if(helpAlfaBool)
      {
        helpAlfaNum += 2;
      }
      else
      {
        helpAlfaNum -= 2;
      }
      
      
      fill(235,helpAlfaNum);
      textFont(fontC, 24);
      
      text("H for Help",width - 120,height-10);

    }
    help();
    
  }
  void help()
  {
    if(helpShow)
    {
         if(helpScreenScale<1.0f)
        {
         helpScreenScale += 0.1f;
        }
    }
    else// if(!helpShow)
    {
        if(helpScreenScale>0.1f)
        {
         helpScreenScale -= 0.1f;
        }
        else
        {
          helpScreenScale = 0.0f;
        }
    }

    helpFrame.display(helpScreenScale);

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
}
