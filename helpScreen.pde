class helpScreen
{
  int num,x,y;
  int helpHight, helpWidth, helpBorder;
  boolean ceanter;
  
  helpScreen(boolean ceanter)
  {
    this.ceanter = ceanter;
    helpBorder = 40;
    num = 0;
    x = 0;
    y = 0;
  }
  
  void display(float inputScale)
  {
    fill(200,0,0,225);
    
     if(ceanter)
    {
      
      pushMatrix();
        translate(width/2, height/2);
        scale(inputScale);//,inputScale);

        rect(-width/2+helpBorder,-height/2+helpBorder,width-helpBorder*2,height-helpBorder*2);
      
      /*
      
pushMatrix();
        
         stroke(255);
         
  num = (int)random(8);
  
  if(0 == num || 1 == num || 7 == num)
  {
    y++;
  }
  
  if(1 == num || 2 == num || 3 == num)
  {
    x++;
  }
  
  if(3 == num || 4 == num || 5 == num)
  {
    y--;
  }
  
  if(5 == num || 6 == num || 7 == num)
  {
    x--;
  }

 //translate(x,y);
  point(x,y);
        
popMatrix();
      
      */
      
      
    fill(255);
      textFont(fontD,20);
        text("Digital life and Evolution", -145 , -85);
    //fill(240);
        textFont(fontE,14);
        text("interactive 2D scene", -109 , -73);
    fill(225);
        textFont(fontB, 16);
        text("press TAB \n  to hide and show the X Y \n"+
        "press H \n  to hide and show the Help screen \n"+
        "press Right \n  mouse button to add a star \n"+
        "press Left \n  mouse button to start droping a seed"
        , -150 , -40);
        
        //Exception in thread "AWT-EventQueue-0" java.lang.OutOfMemoryError: Java heap space

      //  fill(0,0);
      //  strok
      //  rect(-width/2+helpBorder,-height/2+helpBorder,width-helpBorder*2,height-helpBorder*2);
        
      popMatrix();
    }
    else
    {
      scale(inputScale);
      rect(helpBorder, helpBorder, width - helpBorder*2, height - helpBorder*2);// - 2 because TOP & BOTTEM
    }
  }
}
