class tree_pice
{
    int base1_x, base1_y; 
    int base2_x, base2_y;
    int end_point_x, end_point_y;
    int offset_x, offset_y;
    int hops;
    int hops_count;
    int[] past_hops;
    past_vertex[] past_vertex_array;
    int stroke_colour;
    int tree_size;
    
  tree_pice(
    int base1_x_input,int base1_y_input, 
    int base2_x_input,int base2_y_input,
    int end_point_x_input,int end_point_y_input,int tree_size_input)
  {
    base1_x = base1_x_input;
    base1_y = base1_y_input;
    base2_x = base2_x_input;
    base2_y = base2_y_input;
    end_point_x = end_point_x_input;
    end_point_y = end_point_y_input;
    
    offset_x = (base1_x + base2_x)/2;
    offset_y = (base1_y + base2_y)/2;
    hops = 10;//number of hops
    hops_count = 0;
    past_vertex_array = new past_vertex[hops];
    past_hops = new int [hops*6];// 6 points
    stroke_colour = (int)random(100)+100;
    if(tree_size_input<50)
    {
      tree_size = tree_size_input;
    }
    else
    {
      tree_size = 50;
    }
  }
 
  void dispaly()
  {
        strokeWeight(1);
        stroke(255);
        fill(0,stroke_colour,0);
        
        beginShape(TRIANGLE_STRIP);
          vertex(base1_x,base1_y);
          vertex(base2_x, base2_y);
          vertex(offset_x, offset_y);
        endShape();
        

          for(int i = 0; i<hops_count;i++)
          {
              past_vertex_array[i].dispaly();
          }

        if(offset_x<end_point_x)
        {
          offset_x++;
        }
        else if(offset_x>end_point_x)
        {
          offset_x--;
        }
        
        if(offset_y<end_point_y)
        {
          offset_y++;
        }
        else if(offset_y>end_point_y)
        {
          offset_y--;
        }
        
        if(offset_y == end_point_y && offset_x == end_point_x && hops_count<hops)
        {
             past_vertex_array[hops_count] = new past_vertex(base1_x, base1_y, base2_x, base2_y, end_point_x, end_point_y);
          
          if(0.5>random(1))
          {
              base1_x = end_point_x;
              base1_y = end_point_y;
          }
          else
          {
              base2_x = end_point_x;
              base2_y = end_point_y;
          }
          if(0.5>random(1))
          {
              end_point_x = end_point_x+(int)random(tree_size);
          }
          else
          {
            end_point_x = end_point_x-(int)random(tree_size);
          }
          end_point_y = end_point_y-(int)random(tree_size/1.6);
          hops_count++;
        }
    }
}
