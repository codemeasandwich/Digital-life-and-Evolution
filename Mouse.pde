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
pushMatrix();
translate(mouseX, mouseY);
rotate(rond);
rect(-7, -7, 15, 15);
//rect(mouseX-7, mouseY-7, 15, 15);
rond-=0.03;
popMatrix();
//rotate(rond*-1);

//translate(width - mouseX, height - mouseY);
//translate((mouseX/2)*-1,mouseY/2*-1);
//translate(mouseX - width,mouseY - height);
//translate(mouseX*-1,mouseY*-1);
//translate(0,0);

//println ((mouseX - width)*-1);
  }
  
}
