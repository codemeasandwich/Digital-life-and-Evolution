class dropHolder
{
    
   sky_points tempSky_points;
   
   ArrayList Array_drops;
 //  boolean clicked;
   //int Array_drops_counter;
  drop tempDrops;
  drop tempDrops_Dispaly;
  
  dropHolder()
  {
    Array_drops = new ArrayList();
   // Array_drops_counter = 0;//-1;
   tempDrops = null;
  }
  void dispaly()
  {
        for(int i = 0; i<Array_drops.size(); i++)
        {
           // Array_drops[i].dispaly();
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
    
    //Array_drops[Array_drops_counter] = new drop(Array_drops_counter);
   // clicked = true;
    
    
    //tempDrops = new drop();//(Array_drops_counter);
    
    
    Array_drops.add(new drop());
    //Array_drops_counter++;
  }
  void addClose()
  {
    //tempDrops.end();
    //Array_drops[Array_drops_counter].end();
    //Array_drops.add(tempDrops);
    //tempDrops = null;
    
   tempDrops = (drop)Array_drops.get(Array_drops.size()-1);
    tempDrops.end();
    
  }
}
