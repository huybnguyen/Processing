int rectWX, rectWY;      // Position of color button and tool button
int rectGX, rectGY; 
int rectBX, rectBY;
int rectRX, rectRY; 
int rectYX, rectYY;
int rectBLX, rectBLY; 
int line_buttonX, line_buttonY; 
int eraserX, eraserY; 
int clearX, clearY;
int rectwidth = 20;     // width of rectangle
int rectheight = 20;   //height of rectangle
int currentWeight;    //weight of current stroke
color rectWColor, rectGColor, rectBColor, rectRColor, rectYColor, rectBLColor,line_buttonColor, eraserColor, clearColor;
color currentColor, previousColor;   //all of the colors
boolean rectWOver = false;   //flag to check for button pressing
boolean rectGOver = false;
boolean rectBOver = false;
boolean rectROver = false;
boolean rectYOver = false;
boolean rectBLOver = false;
boolean line_buttonOver = false;
boolean eraserOver = false;
boolean clearOver = false;
boolean line_button = false;
boolean second_button = false;

void setup()
{
  size(800, 600);
  background(255);
  noStroke();
  rectWColor = color(255);   //setting up the color for the buttons
  rectGColor = color(128,255,0);
  rectBColor = color(0,0,153);
  rectRColor = color(255,0,0);
  rectYColor = color(255,255,0);
  rectBLColor = color(0);
  line_buttonColor = color(255);
  eraserColor = color(255);
  clearColor = color(255);
  rectWX = 420;
  rectWY = 10;
  rectGX = 470;
  rectGY = 10;
  rectBX = 520;
  rectBY = 10;
  rectRX = 570;
  rectRY = 10;
  rectYX = 620;
  rectYY = 10;
  rectBLX = 670;
  rectBLY = 10;
  line_buttonX = 750;
  line_buttonY = 40;
  eraserX = 750;
  eraserY = 90;
  clearX = 750;
  clearY = 140;
}

void draw()
{
  update(mouseX, mouseY); //calling the update function 
  pushMatrix();
  stroke(0);
  strokeWeight(0);
  if (rectWOver) {  //highlights the button once the mouse is over it.
    fill(128,128,128);
  } else {
    fill(rectWColor);
  }
  rect(rectWX, rectWY, rectwidth, rectheight); //draw the color button
  
  
  if (rectGOver) {
    fill(128,128,128);
  } else {
    fill(rectGColor);
  }
  rect(rectGX, rectGY, rectwidth, rectheight);
  
  
  if (rectBOver) {
    fill(128,128,128);
  } else {
    fill(rectBColor);
  }
  rect(rectBX, rectBY, rectwidth, rectheight);
   if (rectROver) {
    fill(128,128,128);
  } else {
    fill(rectRColor);
  }
  rect(rectRX, rectRY, rectwidth, rectheight);
  
  
  if (rectYOver) {
    fill(128,128,128);
  } else {
    fill(rectYColor);
  }
  rect(rectYX, rectYY, rectwidth, rectheight);
  
  
  if (rectBLOver) {
    fill(128,128,128);
  } 
  else {
    fill(rectBLColor);
  }
  rect(rectBLX, rectBLY, rectwidth, rectheight);
  
  pushMatrix();    //the line command button
  if (line_buttonOver) {
    fill(128,128,128);
  }
  else {
    fill(line_buttonColor);
  }
  rect(line_buttonX, line_buttonY, rectwidth, rectheight);
  line(760, 40,760, 60);
  popMatrix();
  
  pushMatrix();  //the eraser
  if (eraserOver) {
    fill(128,128,128);
  }
  else {
    fill(eraserColor);
  }
  rect(eraserX, eraserY, rectwidth, rectheight);
  fill(0);
  ellipse(760,100, rectwidth-10, rectheight);
  popMatrix();
  
  pushMatrix();  //the clear button
  if (clearOver) {
    fill(128,128,128);
  }
  else {
    fill(clearColor);
  }
  rect(clearX, clearY, rectwidth, rectheight);
  line(clearX, clearY, 770, 160);
  line(750,160,770,140);
  popMatrix();
  
  popMatrix(); //done with configuring all buttons
  
  stroke(currentColor);  //updating color
  strokeWeight(currentWeight); //updating the thickness of the line
}

void update(int x, int y) { //function to update all of the button flags, to see which one is being pressed.
  if ( overRect(rectWX, rectWY, rectwidth,rectheight) ) {
    rectWOver = true;
    rectGOver = false;
    rectBOver = false;
    rectROver = false;
    rectYOver = false;
    rectBLOver = false;
  } 
  else if ( overRect(rectGX, rectGY, rectwidth, rectheight) ) 
  {
    rectWOver = false;
    rectGOver = true;
    rectBOver = false;
    rectROver = false;
    rectYOver = false;
    rectBLOver = false;
  } 
  else if ( overRect(rectBX, rectBY, rectwidth, rectheight) ) 
  {
    rectWOver = false;
    rectGOver = false;
    rectBOver = true;
    rectROver = false;
    rectYOver = false;
    rectBLOver = false;
  } 
  else if ( overRect(rectRX, rectRY, rectwidth, rectheight) ) 
  {
    rectWOver = false;
    rectGOver = false;
    rectBOver = false;
    rectROver = true;
    rectYOver = false;
    rectBLOver = false;
  } 
  else if ( overRect(rectYX, rectYY, rectwidth, rectheight) ) 
  {
    rectWOver = false;
    rectGOver = false;
    rectBOver = false;
    rectROver = false;
    rectYOver = true;
    rectBLOver = false;
  } 
  else if ( overRect(rectBLX, rectBLY, rectwidth, rectheight) ) 
  {
    rectWOver = false;
    rectGOver = false;
    rectBOver = false;
    rectROver = false;
    rectYOver = false;
    rectBLOver = true;
  } 
  else if ( overRect(line_buttonX, line_buttonY, rectwidth, rectheight) ) 
  {
    line_buttonOver = true;
    eraserOver = false;
    clearOver = false;
  } 
   else if ( overRect(eraserX, eraserY, rectwidth, rectheight) ) 
  {
    line_buttonOver = false;
    eraserOver = true;
    clearOver = false;
    
  } 
   else if ( overRect(clearX, clearY, rectwidth, rectheight) ) 
  {
    line_buttonOver = false;
    eraserOver = false;
    clearOver = true;
  } 
  else 
  {
    rectWOver = false;
    rectGOver = false;
    rectBOver = false;
    rectROver = false;
    rectYOver = false;
    rectBLOver = false;
    line_buttonOver = false;
    eraserOver = false;
    clearOver = false;
  }
}

boolean overRect(int x, int y, int width, int height)  {    //checking if the button are pressed.
  if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) 
  {
    return true;
  } 
  else 
  {
    return false;
  }
}

void mousePressed() {  //change to the appropriate feature when button is pressed.
  if (rectWOver) 
  {
    currentColor = rectWColor;
    previousColor = currentColor;
  }
  if (rectGOver) 
  {
    currentColor = rectGColor;
    previousColor = currentColor;
  }
  if (rectBOver) 
  {
    currentColor = rectBColor;
    previousColor = currentColor;
  }
  if (rectROver) 
  {
    currentColor = rectRColor;
    previousColor = currentColor; 
  }
  if (rectYOver) 
  {
    currentColor = rectYColor;
    previousColor = currentColor;
  }
  if (rectBLOver) 
  {
    currentColor = rectBLColor;
    previousColor = currentColor;
  }
  if(line_buttonOver)
  {
    line_button = true;
    second_button = false;
  }
  if(eraserOver)
  {
    second_button = true;
    line_button = false;
  }
  if(clearOver)
  {
    background(255);
  }
}

void mouseDragged()  //draw line when drag and press mouse
{
    if(line_button == true)
    {
      currentColor = previousColor; //make sure the color will not change after erasing.
      currentWeight = 1;
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
    else if(second_button == true)  //the second button is true
  {
    fill(currentColor); 
    ellipse(mouseX, mouseY, 10,20); //the dimaeter of the eraser is 10 by 20
  }
    else {
      line(pmouseX, pmouseY, mouseX, mouseY);
    }
}

void keyPressed()   //saving as jpg when pressed s
{
  if(key == 's')
  {
    save("MySketch.jpg");
  }
}