class Mouse
{
  int mouse_fill;
  int mouse_fill_low;
  int mouse_fill_high;
  boolean mouse_fill_up;
  float rond;
  float moveSize;
  float tempMoveSize;

  Mouse()
  {
      mouse_fill = 200;
      mouse_fill_low = 200;
      mouse_fill_high = 255;
      mouse_fill_up = true;
      rond = 0;
      moveSize = 1.0f;
  }

  void dispaly()
  {

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

stroke(0,0);
fill(mouse_fill);

if((pmouseX - mouseX)<0)
{  tempMoveSize = -(pmouseX - mouseX); }
else
{  tempMoveSize = pmouseX - mouseX;    }

tempMoveSize = tempMoveSize/25;

if(tempMoveSize>moveSize)
{
   if(tempMoveSize>1)
  {
    moveSize += 0.075;
  }
}
else
{
  if(moveSize>1)
  {
    moveSize -= 0.05;
  }
  else
  {
    moveSize = 1;
  }
}

pushMatrix();
  translate(mouseX, mouseY);
  scale(moveSize);
  rotate(rond);
  rect(-7, -7, 15, 15);
  rond-=0.03;
popMatrix();

  }
  
}
