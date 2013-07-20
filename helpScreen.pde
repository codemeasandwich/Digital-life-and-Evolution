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
    if(0 != inputScale)
    {
     if(ceanter)
    {
      
      pushMatrix();
        translate(width/2, height/2);
        scale(inputScale);
        stroke(255);
        rect(-width/2+helpBorder,-height/2+helpBorder,width-helpBorder*2,height-helpBorder*2);
      
    fill(255);
      textFont(fontD,20);
        text("Digital life and Evolution", -145 , -85);
        textFont(fontE,14);
        text("interactive 2D scene", -109 , -73);
    fill(225);
        textFont(fontB, 16);
        text("press TAB \n  to hide and show the X Y \n"+
        "press H \n  to hide and show the Help screen \n"+
        "press Right \n  mouse button to add a star \n"+
        "press Left \n  mouse button to start droping a seed"
        , -150 , -40);
        
      popMatrix();
    }
    else
    {
      scale(inputScale);
      rect(helpBorder, helpBorder, width - helpBorder*2, height - helpBorder*2);// - 2 because TOP & BOTTEM
    }
    }
  }
}
