//planetary motion

class sky_points
{
  int x;
  int y;
  float round_num;
  
  public sky_points(int input_x, int input_y)
  {

      x = input_x;
      y = input_y;
       
       /*
     pushMatrix();
        translate(width/2,20);
        x = mouseX;
        y = mouseY;
     popMatrix();
     */
     
     round_num = 0.0f;
  }
  
  public void dispaly()
  {
    pushMatrix();
    translate(width/2,20);
    rotate(round_num);
   stroke(255);
    point(x,y);
    round_num += 0.02;
    popMatrix();
  }
}
