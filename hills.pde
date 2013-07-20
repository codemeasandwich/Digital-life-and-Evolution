class hills
{
  color hill_gray_iner = hill_gray;
  int x1, y1, x2, y2, x3, y3;
  
  hills(int x1_input,int y1_input,int x2_input,int y2_input,int x3_input,int y3_input)
  {
        x1 = x1_input;
        y1 = y1_input;
        x2 = x2_input;
        y2 = y2_input;
        x3 = x3_input;
        y3 = y3_input;
  }
  hills(int x1_input,int y1_input,int x2_input,int y2_input,int x3_input,int y3_input,int colour)
  {
        x1 = x1_input;
        y1 = y1_input;
        x2 = x2_input;
        y2 = y2_input;
        x3 = x3_input;
        y3 = y3_input;
        hill_gray_iner  = color(colour);
  }
  void dispaly()
  {
        stroke(hill_gray);
        strokeWeight(0);
        if(hill_gray != hill_gray_iner)
        {
          //stroke(hill_gray_iner);
          fill(hill_gray_iner);
        }
        else
        {
          //stroke(hill_gray);
          fill(hill_gray);
        }
        beginShape(TRIANGLE_STRIP);
          vertex(x1, y1);
          vertex(x2, y2);
          vertex(x3, y3);
        endShape();
  }
}
