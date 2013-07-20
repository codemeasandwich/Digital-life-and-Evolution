class Vaper
{
  ArrayList points;
  vaperDot tempDot;
  int wait, waitCounter;
  
  Vaper()
  {
    waitCounter = 0;
    wait = 0;
    points = new ArrayList();
    
   // for(int i =0; i<6;i++)
  //  {
      add(); // start the ball rolling
  //  }
    
  }
  void dispaly()
  {
    
    //Dispaly
    for(int counter = 0; counter<points.size()-1; counter++)
    {
      tempDot = (vaperDot)points.get(counter);
      tempDot.dispaly();
    }
    
    
    if(wait <= waitCounter)//add a new
    {
      wait = (int)random(30);
      waitCounter = 0;
      add();
    }
    else
    {
      waitCounter++;
    }
    
  }
  void add()
  {
    points.add(new vaperDot());
  }
}
