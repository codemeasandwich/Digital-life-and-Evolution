class past_vertex
{  
  int x1, y1; 
  int x2, y2; 
  int x3, y3;
  
  past_vertex(int x1,int y1, int x2, int y2, int x3, int y3,int big,int lORr)
  {
    this.x1 = x1;
    this.y1 = y1;
    this.x2 = x2;
    this.y2 = y2;
    this.x3 = x3;
    this.y3 = y3;
  }

  void dispaly()
  {
       beginShape(TRIANGLE_STRIP);
          vertex(x1,y1);
          vertex(x2,y2);
          vertex(x3,y3);
        endShape();
  }
}
