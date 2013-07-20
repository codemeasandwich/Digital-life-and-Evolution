class vaperDot
{
  int nowColour_R, nowColour_G, nowColour_B;
  int endColour_R, endColour_G, endColour_B;
  boolean boolColour_R, boolColour_G, boolColour_B;
  int x,y;
  int AFade;
  boolean side;
  int sideTime;
  int sideTimeVal;
  
 vaperDot()
 {
   this(255,255,255,0,0,255,(int)random(width),height);
 }
  vaperDot(int startColour_R,int startColour_G,int startColour_B,int endColour_R,int endColour_G,int endColour_B)
 {
   this(startColour_R, startColour_G, startColour_B, endColour_R, endColour_G, endColour_B,(int)random(width),height);
 }
   
 vaperDot(int startColour_R,int startColour_G,int startColour_B,int endColour_R,int endColour_G,int endColour_B, int x, int y)
 {
   nowColour_R = startColour_R;
   nowColour_G = startColour_G;
   nowColour_B = startColour_B;
   this.endColour_R = endColour_R;
   this.endColour_G = endColour_G;
   this.endColour_B = endColour_B;
   
   this.x = x;
   this.y = y;
   
   boolColour_R = true;
   boolColour_G = true; 
   boolColour_B = true;
   
   AFade = 255;
   sideTime = 3;
   sideTimeVal = 0;
   side = false;
 }
 
 void dispaly()
 {
   stroke(nowColour_R, nowColour_G, nowColour_B, AFade);
   strokeWeight(3);
   point(x,y);
   changeColour();
   noStroke();
   y--;
   AFade--;
   //moveSide();
   
 }
 
 void moveSide()
 {
   if(sideTime <= sideTimeVal)
   {
     int num = (int)random(3);
     
     if(0 == num)
     {
       //x = x;
     }
     else if(1 == num)
     {
       x--;
     }
     else if(2 == num)
     {
       x++;
     }
     else
     {
       print("ERROR vaperDot.moveSide()");
     }
     
     sideTimeVal = 0;
   }
   else
   {
     sideTimeVal++;
   }
 }
 
 void changeColour()
 {
   if(boolColour_R)
   {
     if(nowColour_R == endColour_R)
     {  boolColour_R = false; }
     else if(nowColour_R > endColour_R)
     {     nowColour_R--;   }
     else if(nowColour_R < endColour_R)
     {     nowColour_R++;   }
   }
   
   if(boolColour_G)
   {
     if(nowColour_G == endColour_G)
     {  boolColour_G = false; }
     else if(nowColour_G > endColour_G)
     {     nowColour_G--;   }
     else if(nowColour_G < endColour_G)
     {     nowColour_G++;   }
   }
   
   if(boolColour_B)
   {
     if(nowColour_B == endColour_B)
     {  boolColour_B = false; }
     else if(nowColour_B > endColour_B)
     {     nowColour_B--;   }
     else if(nowColour_B < endColour_B)
     {     nowColour_B++;   }
   }
 }

 boolean alive()
 {
   if(0>=AFade)
   {
     return false;
   }
   else
   {
     return true;
   }
 }
  
}
