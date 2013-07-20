class landScape
{
 int nums_of_hill_lares;
 hills [][] bg_hills;
 int hills_points, hills_overlap, hills_point_of_last_hill, hill_min_hight, hill_max_hight;
 color hill_gray;
  
  landScape()
  {
      hill_gray = color(40);
      hills_point_of_last_hill = 0;
      hill_min_hight = 10;
      hill_max_hight = height/7;//NOTE the min will be added to this val
      hills_overlap = 23;
      hills_points = 10;
      nums_of_hill_lares = 3;
  
      bg_hills = new hills[nums_of_hill_lares][hills_points];
      int colour = 0;
      hills_point_of_last_hill = -10;
      
      for(int h = 0; h<nums_of_hill_lares; h++)
      {
        colour += 255/4;
        for(int i = 0; i<hills_points; i++)
        {//                       [                 x1                   ][   y1   ][                 x2                    ][                             y2                 ][             x3              ][   y3  ][         colour         ]
            bg_hills[h][i] = new hills(hills_point_of_last_hill - hills_overlap, height, hills_point_of_last_hill+(int)random(30),height-(int)random(hill_max_hight)-hill_min_hight, width/hills_points + hills_point_of_last_hill, height,colour/*,hills_point_of_last_hill/3*/);
            hills_point_of_last_hill += width/hills_points;//bg_hills[i] = new hills( _ , height , _ , _ , _ ,height ) // this keeps the base at the bottem of the screen
        }
       hills_point_of_last_hill = 0;
  }
  
  }
  void dispaly()
  {
    //==============================================================================Hills - Start
    for(int h = 0; h<nums_of_hill_lares; h++)
    {
        for(int i = 0; i<hills_points; i++)
        {
             bg_hills[h][i].dispaly();
        }
    }
//==============================================================================Hills - End
  }
}
