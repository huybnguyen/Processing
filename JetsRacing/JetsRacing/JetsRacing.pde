float frameCnt = 0.0;
float timeAccel = 1.0;
float increment = 1.0;
float speed = 1.0;
float count = 0;

void setup()
{
  size(400, 600);
  background(255);
}

void draw()
{
  background(204,255,255);
  frameCnt -= 1.0; //updating frame
  increment = increment * 1.02; 
  float rot = frameCnt * speed; //rotating variable
  count = count + speed; 
  if(frameCnt < -90) //the lazer
  {
    pushMatrix();
    translate(150,390);
    translate(0,frameCnt*3);
    rotate(radians(count));
    stroke(255,102,178);
    fill(255,102,178);
    ellipse(0,0,50 ,5);
    ellipse(0,0,5,50);
    popMatrix();
  }
  
  pushMatrix();//sky1
  stroke(102,255,255);
  fill(102,255,255);
  translate(-frameCnt, 0); //make sky moving
  ellipse(30, 50, 55,55);
  ellipse(50,46,55,55);
  ellipse(70,43,55,55);
  ellipse(90,50,55,55);
  popMatrix();
  
  pushMatrix();//sky2
  stroke(102,255,255);
  fill(102,255,255);
  translate(80,300);
  translate(-frameCnt,0);
  ellipse(30, 50, 55,55);
  ellipse(50,46,55,55);
  ellipse(70,43,55,55);
  ellipse(90,50,55,55);
  popMatrix();
  
  pushMatrix();//sky3
  stroke(102,255,255);
  fill(102,255,255);
  translate(30, 200);
  translate(-frameCnt, 0);
  ellipse(30, 50, 55,55);
  ellipse(50,46,55,55);
  ellipse(70,43,55,55);
  ellipse(90,50,55,55);
  popMatrix();
  
  pushMatrix();//sky4
  stroke(102,255,255);
  fill(102,255,255);
  translate(200, 100);
  translate(-frameCnt, 0);
  ellipse(30, 50, 55,55);
  ellipse(50,46,55,55);
  ellipse(70,43,55,55);
  ellipse(90,50,55,55);
  popMatrix();
 
  strokeWeight(2);
  stroke(0);
  line(100,600,100,0);
  line(210,600,210,0);
  line(310,600,310,0);
  translate(0,frameCnt);
  println(frameCnt);
  
  pushMatrix(); //Jet 1
  translate(0,450);
  translate(0,frameCnt);
  if(frameCnt < -10)
  {
    translate(count,0);
  }
  if(frameCnt < -50)
  {
    translate(0,frameCnt*2);  //make jet fly up
  }
  strokeWeight(2);
  stroke(0,255,0);
  line(5,100,40,60);
  line(40,60,70,100);
  line(5,100,7,110);
  line(70,100,69,110);
  line(7,110,20,110);
  line(69,110,56,110);
  line(20,110,22,118);
  line(56,110, 54,118);
  line(22,118,18,123);
  line(54,118, 58,123);
  line(18,123,23,128);
  line(58,123,52,128);
  line(23,128,37,125);
  line(52,128,40,125);
  stroke(0);
  fill(255,0,0);
  triangle(25,145,38,130,50,145);
  popMatrix();
  
  pushMatrix();  //Jet 2
  translate(0,450);
  translate(110,frameCnt*0.3);
  if(increment > 60)
  {
    increment = 1;
  }
  timeAccel -= increment;
  translate(0, timeAccel); //changing the speed
  strokeWeight(2);
  stroke(0,0,255);
  line(5,100,40,60);
  line(40,60,70,100);
  line(5,100,7,110);
  line(70,100,69,110);
  line(7,110,20,110);
  line(69,110,56,110);
  line(20,110,22,118);
  line(56,110, 54,118);
  line(22,118,18,123);
  line(54,118, 58,123);
  line(18,123,23,128);
  line(58,123,52,128);
  line(23,128,37,125);
  line(52,128,40,125);
  stroke(0);
  fill(255,0,0);
  triangle(25,145,38,130,50,145);
  popMatrix();
  
  pushMatrix(); //Jet 3
  translate(220,450);
  translate(0, frameCnt);
  if(frameCnt < -60)
  {
    rotate(radians(rot)); //make the jet fly sweaky 
  }
  strokeWeight(2);
  stroke(120,0,255);
  line(5,100,40,60);
  line(40,60,70,100);
  line(5,100,7,110);
  line(70,100,69,110);
  line(7,110,20,110);
  line(69,110,56,110);
  line(20,110,22,118);
  line(56,110, 54,118);
  line(22,118,18,123);
  line(54,118, 58,123);
  line(18,123,23,128);
  line(58,123,52,128);
  line(23,128,37,125);
  line(52,128,40,125);
  stroke(0);
  fill(255,0,0);
  triangle(25,145,38,130,50,145);
  popMatrix();
  
  pushMatrix(); //Jet 4
  translate(320,450);
  translate(0,frameCnt);
  if(increment > 100)
  {
    increment = 2;
  }
  timeAccel -= increment;
  translate(0, timeAccel);
  strokeWeight(2);
  stroke(255,120,0);
  line(5,100,40,60);
  line(40,60,70,100);
  line(5,100,7,110);
  line(70,100,69,110);
  line(7,110,20,110);
  line(69,110,56,110);
  line(20,110,22,118);
  line(56,110, 54,118);
  line(22,118,18,123);
  line(54,118, 58,123);
  line(18,123,23,128);
  line(58,123,52,128);
  line(23,128,37,125);
  line(52,128,40,125);
  stroke(0);
  fill(255,0,0);
  triangle(25,145,38,130,50,145);
  popMatrix();
  
  if(frameCnt < -380) //resetting every variable
  {
    frameCnt = 0;
    increment = 1.0;
    timeAccel = 1.0;
    count = 0;
  }
  if(frameCnt > -131) //saving frame
  {
    saveFrame("frames/animTest###.tif");
  }
  println(frameCnt); 
}