class twilight
{
   int Array_stars_counter;
   boolean clicked_stars;

   ArrayList Array_stars;
   sky_points tempSky_points;
   
  twilight()
  {
     Array_stars = new ArrayList();
  }
  
  void dispaly()
  {
    for(int i = 0; i<Array_stars.size(); i++)
    {
      tempSky_points = (sky_points)Array_stars.get(i);
      tempSky_points.dispaly();
    }
  }
  void addOpen()
  {
    Array_stars.add(new sky_points(mouseX, mouseY));
  }
  void addClose()
  {
    
  }
}
