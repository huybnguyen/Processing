PImage img; //<>//
PImage stamp;

boolean bShowBox = true;
boolean bHaveStamp = false;
boolean bSpecialMode = false;

//you can make this any reasonable size (at least 10 x 10)
int stampWidth = 80;
int stampHeight = 150;
float transX = 0;
void setup()
{
  size(940, 700);
  background(255);
  img = loadImage("coast.jpg");
  stamp = createImage(stampWidth, stampHeight, RGB);
}

void draw()
{

  image(img, 0, 0);

  //draw selection box
  if (bShowBox)
  {
    //black border
    stroke(0);
    //make box transparent
    fill(0, 0, 0, 0);
    rect(mouseX, mouseY, stampWidth, stampHeight);
  }
}

void mouseClicked() 
{


  if (bHaveStamp && mouseButton == LEFT)
  {
    if (!bSpecialMode)
    {
      //Do your basic stamp behavior here

      /*ADD CODE*/  
    }
  }
  
}

void keyPressed()
{
  if (key == 'b')
  {
    bShowBox = !bShowBox;
  } 
  else if (key == 'p')
  {
    //"pick up" your stamp by copying from the image
    
    /*ADD CODE*/
    
    
  } 
  else if (key == 's')
  {
    save("currentImage.jpg");
  }
  else if (key == 'e')
  {
    //turn on or off the special mode
    bSpecialMode = !bSpecialMode;
  }
  else if (key == 'r')
  {
    //release the current stamp image
    bHaveStamp = !bHaveStamp;
  }

}