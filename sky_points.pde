//planetary motion

class sky_points
{
  int x;
  int y;
  float round_num;
  float round_add;
  int alphaDot;

  public sky_points(int input_x, int input_y)
  {
      x = input_x-width/2;
      y = input_y-20;
      
     round_num = 0.0f;
     round_add = 0.01 +random(0.03);
     alphaDot = (int)random(255);
  }
  
  public void dispaly()
  {
     strokeWeight(3);
     stroke(alphaDot);
       
    pushMatrix();
      translate(width/2,20);
      rotate(round_num);
      point(x,y);
      round_num += round_add;
    popMatrix();
  }
}
