/****************************\
* Brian Shannon       Year 4 *
* X00022027           CA 1   *
* -=Digital Life-  ? Lines=- *
\****************************/

 int fps, frameDrawen;
 int background_colour;
 int Array_size;

Vaper screenMist;

 Mouse couser;
 onScreenTxt screenTxt;
 landScape scapeLand;
 dropHolder dropBag;
 twilight starLight;
 PFont fontA, fontB, fontC, fontD,fontE;
//==============================================================================void setup - Start

void setup()
{
  //bg = loadImage("");
  print("Loading");
  frameRate(30);
  noStroke(); 
  smooth();
  size(400, 300);                   //setup window
  fontA = loadFont("voxBOX-26.vlw"); //load font
  fontB = loadFont("Arial-BoldMT-16.vlw"); 
  fontC = loadFont("SugarCube-24.vlw");//("Violation-20.vlw");
  fontD = loadFont("Dust-Mites-20.vlw");
  fontE = loadFont("BankGothicBT-Medium-14.vlw");
  //textFont(fontA, 26);              //font type and size
  noCursor();
  print(".");
  //============================================================= objects Start
  //Array_size = 151;
  background_colour = 20;
  frameDrawen = 0;
  
  screenMist = new Vaper();
  couser = new Mouse();
  scapeLand = new landScape();
  dropBag = new dropHolder();//(Array_size);
  starLight = new twilight();//(Array_size);
  screenTxt = new onScreenTxt();
  //============================================================= object End

        println("..");
        println("All done.");
        /*
        println("");
        println("press TAB to hide and show the X Y");
        println("press H to hide and show the Help screen");
        println("press Right mouse button to add a star");
        println("press Left mouse button to start droping a seed");
        */
}

//==============================================================================void setup - End

void draw()
{
  //frameDrawen++;
  background(background_colour);
  //screenMist.dispaly();
  starLight.dispaly();
  scapeLand.dispaly();
  dropBag.dispaly();
  couser.dispaly();//to be draw last so it sittes on top
  screenTxt.display();
}

void mousePressed()
{
  /*
    if (mouseButton == LEFT)
    else if (mouseButton == RIGHT)
    else //(mouseButton == MIDDEL)
  */
  if (mouseButton == LEFT)
  {
    dropBag.addOpen();
  }
  else if (mouseButton == RIGHT)
  {
    starLight.addOpen();
  }
}

void mouseReleased()
{
  if (mouseButton == LEFT)
  {
    dropBag.addClose();
    
  }
  else if (mouseButton == RIGHT)
  {  }
}
