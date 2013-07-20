class star
{
  int x;
  int y;
  float round_num;
  int alphaFill;
  
 public star(int input_x, int input_y)
 {
   x = input_x;
   y = input_y;
   round_num = 0.0f;
 }
 public void dispaly()
 {
  pushMatrix();
  
  translate(x,y);
  rotate(round_num);
  dispalyStar();
  round_num +=0.01;
  popMatrix();
 }
 private void dispalyStar()
 {
   pushMatrix();
   stroke(0,0);
   fill(255);
   //translate(x,y);
   rect(-8,-8,16,16);

    for(int i=0; i<4; i++)
    {
    pushMatrix();
    rotate(i*1.55);
       beginShape(TRIANGLE_STRIP);
          vertex(-5,0);
          vertex(5,0);
          vertex(0,20);
        endShape();
    popMatrix();
    }
    
    //fill(255,0,0);
    //rect(-1,-1,1,1); //CEANTER
   popMatrix();
 }
 
}
