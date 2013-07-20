class dropHolder
{
    
  sky_points tempSky_points;
  ArrayList Array_drops;
  drop tempDrops;
  drop tempDrops_Dispaly;
  
  dropHolder()
  {
    Array_drops = new ArrayList();
   tempDrops = new drop();
  }
  void dispaly()
  {
        for(int i = 0; i<Array_drops.size(); i++)
        {
          tempDrops_Dispaly = (drop)Array_drops.get(i);
          tempDrops_Dispaly.dispaly();
          
          if(null != tempDrops)
          {
           tempDrops.dispaly();
          }
           
        }
  }
  void addOpen()
  {
    Array_drops.add(new drop());
  }
  void addClose()
  {
   tempDrops = (drop)Array_drops.get(Array_drops.size()-1);
   tempDrops.end();
    
  }
}
