//Huy Nguyen
class fish  //creating a class fish
{
  float m_xPos = 0;  //position of x coor
  float m_yPos = 0; //position of y coor
  int body_wid = 65; //fish body width
  int body_hei = 50; //fish body height
  int tail_wid = 30; //fish tail width
  int tail_hei = 40; //fish tail height
  int eye_wid = 24; //fish fin width
  int eye_hei = 20; //fish fin height
  int mouth_wid_upper = 10; //fish mouth width upper
  int mouth_hei_upper = 8; //fish mouth height upper
  int mouth_wid_lower = 15; //fish mouth widtth lower
  int mouth_hei_lower = 15; //fish mouth height lower
  
  fish(){} //empty constructor
  
  void setsize(float x, float y, int b_wid, int b_hei, int t_wid, int t_hei, int e_wid, int e_hei, int m_wid_up, int m_wid_low, int m_hei_up, int m_hei_low)
  {
    this.m_xPos = x; //initialize position x
    this.m_yPos = y; //initialize position y
    this.body_wid = b_wid; //initialize body width 
    this.body_hei = b_hei; //initialize body height
    this.tail_wid = t_wid; //initialize tail width
    this.tail_hei = t_hei; //initialize tail height
    this.eye_wid = e_wid; //initialize fin width
    this.eye_hei = e_hei; //initialize fin height
    this.mouth_wid_upper = m_wid_up; //initialize mouth width upper
    this.mouth_wid_lower = m_wid_low; //initialize mouth width lower
    this.mouth_hei_upper = m_hei_up; //initialize mouth height upper
    this.mouth_hei_lower = m_hei_low;  //initialize mouth height lower
  } //setsize() function to define the size of the fish and its location
  
  void drawSeaCreature()
  {
    float x_body_offset = 40;
    float y_body_offset = 50;
    float x_tail_offset = 86;
    float y_tail_offset = 50;
    float x_cut_offset1 = 35;
    float y_cut_offset1 = 28;
    float x_cut_offset2 = 60;
    float y_cut_offset2 = 20;
    float x_cut_offset3 = 65;
    float y_cut_offset3 = 38;
    float x_eye_offset = 28;
    float y_eye_offset = 42;
    float x_mouth_upper_offset = 18;
    float y_mouth_upper_offset = 60;
    float x_mouth_lower_offset = 32;
    float y_mouth_lower_offset = 42;
    float x_fin_offset1 = 45;
    float y_fin_offset1 = 55;
    float x_fin_offset2 = 65;
    float y_fin_offset2 = 55;
    float x_fin_offset3 = 60;
    float y_fin_offset3 = 63;
    
    if(bot_boundary == true)
    {
      noStroke();
      fill(random(255), random(255), random(255));
      //body
      ellipse(m_xPos + x_body_offset, m_yPos + y_body_offset, body_wid, body_hei);
      //tail-
      arc(m_xPos + x_tail_offset, m_yPos + y_tail_offset, tail_wid, tail_hei,(PI/180)*50,(PI/180)*310);
      triangle(m_xPos + x_cut_offset1,m_yPos + y_cut_offset1, m_xPos + x_cut_offset2, m_yPos + y_cut_offset2, m_xPos + x_cut_offset3, m_yPos + y_cut_offset3);
 
      fill(255);
      //fin
      triangle(m_xPos + x_fin_offset1, m_yPos + y_fin_offset1, m_xPos + x_fin_offset2, m_yPos + y_fin_offset2, m_xPos + x_fin_offset3, m_yPos + y_fin_offset3);
      //eye
      arc(m_xPos + x_eye_offset, m_yPos + y_eye_offset, eye_wid, eye_hei,(PI/180)*0,(PI/180)*180);
 
      //mouth
      arc(m_xPos + x_mouth_upper_offset, m_yPos + y_mouth_upper_offset, mouth_wid_upper, mouth_hei_upper,(PI/180)*0,(PI/180)*180);
   
      fill(000);
      arc(m_xPos + x_mouth_lower_offset, m_yPos + y_mouth_lower_offset, mouth_wid_lower, mouth_hei_lower,(PI/180)*0,(PI/180)*180);
    }
    else
    {
      noStroke();
      fill(random(255), random(255), random(255));
      //body
      ellipse(m_xPos + x_body_offset, m_yPos + y_body_offset, body_wid, body_hei);
      //tail-
      arc(m_xPos + x_tail_offset, m_yPos + y_tail_offset, tail_wid, tail_hei,(PI/180)*50,(PI/180)*310);
      triangle(m_xPos + x_cut_offset1,m_yPos + y_cut_offset1, m_xPos + x_cut_offset2, m_yPos + y_cut_offset2, m_xPos + x_cut_offset3, m_yPos + y_cut_offset3);
 
      fill(255);
      //fin
      triangle(m_xPos + x_fin_offset1, m_yPos + y_fin_offset1, m_xPos + x_fin_offset2, m_yPos + y_fin_offset2, m_xPos + x_fin_offset3, m_yPos + y_fin_offset3);
      //eye
      arc(m_xPos + x_eye_offset, m_yPos + y_eye_offset, eye_wid, eye_hei,(PI/180)*0,(PI/180)*180);
 
      //mouth
      arc(m_xPos + x_mouth_upper_offset, m_yPos + y_mouth_upper_offset, mouth_wid_upper, mouth_hei_upper,(PI/180)*0,(PI/180)*180);
   
      fill(000);
      arc(m_xPos + x_mouth_lower_offset, m_yPos + y_mouth_lower_offset, mouth_wid_lower, mouth_hei_lower,(PI/180)*0,(PI/180)*180);
    }
  }
};//drawSeaCreature() function to draw a fish

fish [] myFishList = new fish[60]; //array containing fishes

boolean bot_boundary = false; //a boolean variable to check whether the fish is locates at the top of the screen

void setup()
{
  frameRate(20);
  size(600,600);
  noLoop();
  background(255);
  smooth();
  for(int i = 0; i<60; i++) //setting the size and positions of the fishes
  {
     myFishList[i] = new fish();  
     float my_y = random(600); //this variable will be there for me to grab region of the screen
     if(my_y <200)
     {
       bot_boundary = false; //not bottom of the screen
       myFishList[i].setsize(random(100,300), my_y, 55, 40, 40, 40, 14, 10, 6, 8, 10, 15);
     } // setting up the size
     else if(my_y>200 && my_y < 400)
     {
        bot_boundary = false;
        myFishList[i].setsize(random(50,400), my_y, 65, 50, 30, 40, 24, 20, 10, 8, 15, 15);
     }
     else
     {
        bot_boundary = true; //is bottom of the screen
        myFishList[i].setsize(random(600), my_y, 90, 50, 30, 30, 24, 20, 10, 8, 15, 15);
     }
  }
    
}

void draw()
{
  background(28, 107, 160); //blue ocean
  for(int i=0; i<60;i++)
  {
    myFishList[i].drawSeaCreature();  //starting drawing fishes
  }
}

void mousePressed()  //save picture when mouse is pressed
{
  save("SeaCreature3.jpg");
}