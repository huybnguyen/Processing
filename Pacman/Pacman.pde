import controlP5.*;
import processing.sound.*;


ControlP5 cp5;
Slider red;
Slider blue;
Slider green;

class food{
  int x, y;
  food(int x, int y){
    
      this.x = x;
      this.y = y;
    
  }
  void display() {
    noStroke();
    fill(#FCA900);
    ellipse(x, y, 10, 10);
  }
};

class menu
{
  menu(){}
  boolean is_press = false;
  boolean over = false;
  boolean hide = false;
  boolean is_over(int x, int y, int width, int height)  {    //checking if the button are pressed.
    if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) 
    {
      return true;
    } 
    else 
    {
      return false;
    }
  }
  void draw_box(String my_text)
  {
    if(over)
      fill(128,128,128,180);
    else
      fill(255, 50,0, 180);
    rect(20,65,250,50);
    textSize(32);
    fill(255, 238, 0);
    text(my_text,50,100);
  }
};
SoundFile introSound;
SoundFile gameSound;
SoundFile eatFood;
Boolean intro = true;
PImage title;
PImage img;
PImage pac;
PImage man;
PImage g1;
PImage g2;
PImage g3;
PImage g4;
PImage g5;
float SPEED = 2;
int introX = 0;
int introY = 400;
int pass = 0;
boolean isOpening = true;
boolean ingame = false;
boolean easy = false;
boolean med = false;
boolean hard = false;
boolean easy_press = false;
boolean med_press = false;
boolean hard_press = false;
boolean food_drawn = false;
float mouthAngle = 0;
float mouthChange = TWO_PI/180;
int my_x = 0, my_y = 0,my_x2 = 100, my_y2 = 250,my_x3 = 400, my_y3= 550,my_x4= 600, my_y4=50, my_x5=100, my_y5=450;
float easing = 0.005;
int direction = 1;
int direction2 = 0;
int number_food = 0;
int radius = 30;
int x = 250;
int y = 250;
int timer=3600;
ArrayList<food> food_array = new ArrayList();
String difficulty = "easy";

//Walker w;

void setup(){
  noLoop();
  size(1000,768);
  cp5 = new ControlP5(this);
  red = cp5.addSlider("rslider")
   .setPosition(0,height - 50)
   .setWidth(1000)
   .setHeight(50)
   .setSliderMode(Slider.FLEXIBLE)
   .setDecimalPrecision(0)
   .setRange(0,255)
   .showTickMarks(false)
   .setColorForeground(color(150, 0, 0))
   .setColorBackground(color(255, 0, 0))
   .setColorActive(color(0))
   .setValue(240)
   .hide();
  green = cp5.addSlider("gslider")
   .setPosition(0,height - 150)
   .setWidth(1000)
   .setHeight(50)
   .setSliderMode(Slider.FLEXIBLE)
   .setDecimalPrecision(0)
   .setRange(0,255)
   .showTickMarks(false)
   .setColorForeground(color(0, 150, 0))
   .setColorBackground(color(0, 255, 0))
   .setColorActive(color(0))
   .setValue(250)
   .hide();
  blue = cp5.addSlider("bslider")
   .setPosition(0,height - 250)
   .setWidth(1000)
   .setHeight(50)
   .setSliderMode(Slider.FLEXIBLE)
   .setDecimalPrecision(0)
   .setRange(0,255)
   .showTickMarks(false)
   .setColorActive(color(0))
   .hide();
  background(0);
  smooth();
  img = loadImage("data/pic/Pacman.jpg");
  pac = loadImage("data/pic/pac.png");
  pac.resize(0,100);
  man = loadImage("data/pic/man.png");
  man.resize(0,100);
  g1 = loadImage("data/pic/g0.png");
  g1.resize(0,100);
  g2 = loadImage("data/pic/g1.png");
  g2.resize(0,85);
  g3 = loadImage("data/pic/g2.png");
  g3.resize(0,100);
  g4 = loadImage("data/pic/g3.png");
  g4.resize(0,100);
  g5 = loadImage("data/pic/g4.png");
  g5.resize(0,95);
  //w = new Walker();
  title = loadImage("data/pic/title.gif");
  
  introSound = new SoundFile(this,"sound/pacman_beginning.mp3");
  gameSound = new SoundFile(this,"sound/ingame.mp3");
  eatFood = new SoundFile(this,"sound/pacman_chomp.mp3");
  ellipseMode(RADIUS);
  //for (int i=0; i<50; i++) {
  //  food P = new food((int)random(width), (int)random(height));
  //  food_array.add(P);
  //}
  introSound.play();
}
 
 menu SinglePlayer = new menu();
 menu ChangeColor = new menu();
 menu Highscore = new menu();
 menu Difficulty = new menu();
 menu Back = new menu();
 menu RecentScore = new menu();

void draw(){
  if(!intro){
    red.hide();
    green.hide();
    blue.hide();
    update();
    image(img, 0,0);
    image(pac,25,50);
    image(man,700,50);
        
    pushMatrix();
    translate(365,200);
    SinglePlayer.draw_box("Start Game");
    popMatrix();
    
    pushMatrix();
    translate(365,300);
    ChangeColor.draw_box("Change Color");
    popMatrix();
    
    pushMatrix();
    translate(365,400);
    Highscore.draw_box("Highscore");
    popMatrix();
    
    pushMatrix();
    translate(365, 500);
    Difficulty.draw_box("Difficulty");
    popMatrix();
    
    if(SinglePlayer.is_press){
      if(timer<=0)
      {
       //timer=0;
       end_game();
       
      }
      else{
      timer--;

      background(0);
      draw_map();
      if(dist(x,y, my_x + 10, my_y + 10)  < radius + 10 ){
        end_game();
      }
      if(dist(x,y, my_x - 10, my_y + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x - 10, my_y - 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x + 10, my_y - 10)  < radius + 10){
        end_game();
      }
      //2
      if(dist(x,y, my_x2 + 10, my_y2 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x2 - 10, my_y2 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x2 - 10, my_y2 - 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x2 + 10, my_y2 - 10)  < radius + 10){
        end_game();
      }
      if(difficulty == "medium" || difficulty == "hard"){
      //3
      if(dist(x,y, my_x3 + 10, my_y3 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x3 - 10, my_y3 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x3 - 10, my_y3 - 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x3 + 10, my_y3 - 10)  < radius + 10){
        end_game();
      }
      //4
      if(dist(x,y, my_x4 + 10, my_y4 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x4 - 10, my_y4 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x4 - 10, my_y4 - 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x4 + 10, my_y4 - 10)  < radius + 10){
        end_game();
      }
      }
      //5
      if(difficulty == "hard"){
      if(dist(x,y, my_x5 + 10, my_y5 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x5 - 10, my_y5 + 10)  < radius + 10){
        end_game();
      }
      if(dist(x,y, my_x5 - 10, my_y5 - 10)  < radius + 10){
       end_game(); 
      }
      if(dist(x,y, my_x5 + 10, my_y5 - 10)  < radius + 10){
        end_game();
      }
      }
      if(!food_drawn){
        loadPixels();
        for (int i=0; i<50; i++) {
          int tx;
          int ty;
          while(true){
            tx = (int)random(50, width-50);
            ty = (int)random(50, height-50);
            int blue = 0;
            for(int k = tx - 10; k < tx + 10; k ++){
              for(int j = ty - 10; j < ty + 10; j ++){
                if(pixels[k + j*width] == color(0,0,255)){
                    blue = 1;           
                 }
              }
            }
            if(blue == 0){
              break;
            }
          }
          food P = new food(tx,ty);
          food_array.add(P);
        }
        food_drawn = true;
      }
      smooth();
      noStroke();
      loadPixels();
      if (key == CODED) {
        if (keyCode == LEFT) {
          if(!(pixels[(x - 10 - radius) +y*width] == color(0,0,255))){
             x = x - 10;
          }
          direction = -1;
          direction2 = 0;
        }
        else if (keyCode == RIGHT) {  
          if(!(pixels[(x + 10 + radius) +y*width] == color(0,0,255))){
            x = x + 10;
          }
          direction = 1;
          direction2 = 0;
        }
        else if (keyCode == UP) {
          if(!(pixels[x + (y - 10 - radius)*width] == color(0,0,255))){
            y = y - 10;
          }
          direction = 0;
          direction2 = -1;
        }
        else if (keyCode == DOWN) { 
          if(!(pixels[x + (y + 10 + radius)*width] == color(0,0,255))){
            y = y + 10;
          }
          direction = 0;
          direction2 = 1;
        }
      }
      game_PacMan();
      game_ghost();
      textAlign(CENTER);
      textSize(40);
      fill(255,0,0);
      text("SCORE: " + number_food, width/2 - 300, 30);
      text("TIMER:  " + timer / 60 , width/2 + 300, 30);
      fill (0, 175, 255);
      //if(food_array.size() < 30){
      //   food P = new food((int)random(width), (int)random(height));
      //   food_array.add(P);
      //}
      for (int i=0;i<food_array.size();i++) {
        food Pn = (food)food_array.get(i);
        Pn.display();
        if (dist(x, y, Pn.x, Pn.y)<radius) {
          eatFood.play();
          food_array.remove(i);
          number_food++;
        }  
      } 
      }
    }
    if(ChangeColor.is_press){
      background(0);
      pushMatrix();
      if (Back.is_over(45, 75, 250, 50)) 
      {
        Back.over = true;
      } 
      pushMatrix();
      translate(25,10);
      Back.draw_box("Back");
      popMatrix();
      if(Back.is_press){
          draw();
      }
      popMatrix();
      red.show();
      green.show();
      blue.show();
      fill(red.getValue(),green.getValue(),blue.getValue());
      ellipse(width/2, height/2, 120, 120);
      
    }
    if(Highscore.is_press){
      background(255,0,0);
      pushMatrix();
      if (Back.is_over(45, 75, 250, 50)) 
      {
        Back.over = true;
      } 
      pushMatrix();
      translate(25,10);
      Back.draw_box("Back");
      popMatrix();
      if(Back.is_press){
          draw();
      }
      popMatrix();
      textAlign(CENTER);
      textSize(40);
      fill(0);
      String lines[] = loadStrings("data/score.txt");
      text("Highscore: " + lines[0], width/2, height/2);
      textAlign(CORNER);
    }
    if(Difficulty.is_press){
      menu Easy = new menu();
      menu Medium = new menu();
      menu Hard = new menu();
      if ( Easy.is_over(700 , 465 , 250, 50) ) {
         Easy.over = true;
         Medium.over = false;
         Hard.over = false;
      } 
      else if ( Medium.is_over(700, 565, 250, 50) ) 
      {
         Easy.over = false;
         Medium.over = true;
         Hard.over = false;
      } 
      else if ( Hard.is_over(700, 665, 250, 50) ) 
      {
         Easy.over = false;
         Medium.over = false;
         Hard.over = true;
      } 
      else 
      {
         Easy.over = false;
         Medium.over = false;
         Hard.over = false;
      }
      
      easy = Easy.over;
      med = Medium.over;
      hard = Hard.over;
      pushMatrix();
      translate(680, 400);
      Easy.draw_box("Easy");
      popMatrix();
    
      pushMatrix();
      translate(680, 500);
      Medium.draw_box("Medium");
      popMatrix();
    
      pushMatrix();
      translate(680, 600);
      Hard.draw_box("Hard");
      popMatrix();
      
      if(easy_press){
        difficulty = "easy";
        //SinglePlayer.is_press = true;
      }
      if(med_press){
       difficulty = "medium";
      }
      if(hard_press){
        difficulty = "hard";
      }
    }
  }
  else{ //intro animation
    if(pass > width) {
        intro = false;
     }  
    background(0);
    pushMatrix();
    translate(introX -450, 0);
    PacMan(200, 455, 120, 120);
    popMatrix();
    imageMode(CENTER);
    image(title,width / 2, 120);
    imageMode(CORNER);
    animateIntro();
  }
}


void keyPresed(){
  if(key == ESC){key = 0;} //implement to pop up menu 
}//note set hide to false with back button later
void mousePressed() {  //change to the appropriate feature when button is pressed.
  if (SinglePlayer.over && !SinglePlayer.hide) 
  {
    gameSound.loop();
    SinglePlayer.is_press = true;
    ChangeColor.is_press = false;
    Highscore.is_press = false;
    Difficulty.is_press = false;
    ChangeColor.hide = true;
    Highscore.hide = true;
    Difficulty.hide = true;
    Back.is_press = false;
    Back.hide = true;
  }
  if (ChangeColor.over && !ChangeColor.hide) 
  {
    SinglePlayer.is_press = false;
    ChangeColor.is_press = true;
    Highscore.is_press = false;
    Difficulty.is_press = false;
    SinglePlayer.hide = true;
    Highscore.hide = true;
    Difficulty.hide = true;
    Back.is_press = false;
    Back.hide = false;
  }
  if (Highscore.over && !Highscore.hide) 
  {
    SinglePlayer.is_press = false;
    ChangeColor.is_press = false;
    Highscore.is_press = true;
    Difficulty.is_press = false;
    Difficulty.hide = true;
    SinglePlayer.hide = true;
    ChangeColor.hide = true;
    Back.hide = false;
  }
  if (Difficulty.over && !Difficulty.hide) 
  {
    SinglePlayer.is_press = false;
    ChangeColor.is_press = false;
    Highscore.is_press = false;
    Difficulty.is_press = true;
    SinglePlayer.hide = false;
    ChangeColor.hide = false;
    Highscore.hide = false;
    Back.hide = true;
    Back.is_press = false;
  }
  if(easy)
  {
    easy_press = true;
    med_press = false;
    hard_press = false;
  }
   if(med)
  {
    easy_press = false;
    med_press = true;
    hard_press = false;
  }
   if(hard)
  {
    easy_press = false;
    med_press = false;
    hard_press = true;
  }
  if(Back.over && !Back.hide)
  {
    Back.is_press = true;
    Back.hide = true;
    ChangeColor.is_press = false;
    SinglePlayer.is_press = false;
    ChangeColor.is_press = false;
    Highscore.is_press = false;
    Difficulty.is_press = false;
    SinglePlayer.hide = false;
    ChangeColor.hide = false;
    Highscore.hide = false;
    Difficulty.hide = false;
  }
}

void game_ghost(){
  float wander_offset = random(-0.3, 0.3);
  float wander_offset2 = random(-0.3, 0.3);
  float wander_offset3 = random(-0.3, 0.3);
  float wander_offset4 = random(-0.3, 0.3);
   float wander_theta = random(TWO_PI);
   float wander_theta2 = random(TWO_PI);
   float wander_theta3 = random(TWO_PI);
   float wander_theta4 = random(TWO_PI);
   wander_theta += wander_offset;
   wander_theta2 += wander_offset2;
   wander_theta3 += wander_offset3;
   wander_theta4 += wander_offset4;
   
   
   //x += cos(wander_theta);
   //y += sin(wander_theta);
   
  float targetX = x;
     float dx = targetX - my_x;
     my_x += dx * easing;
      
     float targetY = y;
     float dy = targetY - my_y;
     my_y += dy * easing;
      
   float targetX2 = my_x;
    float dx2 = targetX2 - my_x2;
    my_x2 += dx2 * easing;
      
    float targetY2 = my_y;
    float dy2 = targetY2 - my_y2;
    my_y2 += dy2 * easing;
      
    float targetX3 = x;
    float dx3 = targetX3 - my_x3;
    my_x3 += dx3 * easing;
      
    float targetY3 = y;
    float dy3 = targetY3 - my_y3;
    my_y3 += dy3 * easing;
      
    float targetX4 = y;
    float dx4 = targetX4 - my_x4;
    my_x4 += dx4 * easing;
      
    float targetY4 = x;
    float dy4 = targetY4 - my_y4;
    my_y4 += dy4 * easing;
      
    float targetX5 = my_x4;
    float dx5 = targetX5 - my_x5;
    my_x5 += dx5 * easing;
      
    float targetY5 = my_y4;
    float dy5 = targetY5 - my_y5;
    my_y5 += dy5 * easing;
  
     if(my_x >= width)
       my_x = 0;
     else if(my_x <= 0)
       my_x = width;
     if(my_y >= height)
       my_y = 0;
     else if(my_y <= 0)
       my_x = height;
       
     if(my_x2 >= width)
       my_x2 = 0;
     else if(my_x2 <= 0)
       my_x2 = width;
     if(my_y2 >= height)
       my_y2 = 0;
     else if(my_y2 <= 0)
       my_x2 = height;  
        
     if(my_x3 >= width)
       my_x3 = 0;
     else if(my_x3 <= 0)
       my_x3 = width;
     if(my_y3 >= height)
       my_y3 = 0;
     else if(my_y3 <= 0)
       my_x3 = height;
        
     if(my_x4 >= width)
       my_x4 = 0;
     else if(my_x <= 0)
       my_x4 = width;
     if(my_y4 >= height)
       my_y4 = 0;
     else if(my_y4 <= 0)
       my_x4 = height;
        
     if(my_x5 >= width)
       my_x5 = 0;
     else if(my_x5 <= 0)
       my_x5 = width;
     if(my_y5 >= height)
       my_y5 = 0;
     else if(my_y <= 0)
       my_x5 = height;
      
  //    int ran = (int)random(1,10);
  //    if (ran % 2 == 0){
  //      ran = 1;
  //    }
  //    else{
  //      ran = -1;
  //    }
  //    int ran2 = (int)random(1,10);
  //    if (ran2 % 2 == 0){
  //      ran2 = 1;
  //    }
  //    else{
  //      ran2 = -1;
  //    }
      my_x2 += cos(wander_theta);
      my_y2 += sin(wander_theta);
      my_x3 += cos(wander_theta2);
      my_y3 += sin(wander_theta2);
      my_x4 += cos(wander_theta3);
      my_y4 += sin(wander_theta3);
      my_x5 += cos(wander_theta4);
      my_y5 += sin(wander_theta4);
      image(g1,my_x , my_y , 45, 45);
      image(g2,my_x2, my_y2, 45, 45);
      if(difficulty == "medium" || difficulty == "hard"){
        image(g3,my_x3 ,my_y3, 45, 45);
        image(g4,my_x4 , my_y4, 45, 45);
      }
      if(difficulty == "hard"){
        image(g5,my_x5 ,my_y5 , 45, 45);
      }
}

int randStep(int step){
  if((int) random(1,10) % 2 == 0){
    step += -1;
  }
  else{
    step += 1;
  }
  return step;
}
void game_PacMan() {
       pushMatrix();
       if(x >= width)
         x = 0;
       else if(x <= 0)
         x = width;
       else if(y >= height)
         y = 0;
       else if(y <= 0)
         y = height;
         
       translate(x,y);
       
      if ( direction == -1) { 
        rotate(PI);
      }
      if ( direction2 == 1) { 
        rotate(HALF_PI);
      }
      if ( direction2 == -1) { 
        rotate( PI + HALF_PI );
      }
      fill(red.getValue(),green.getValue(),blue.getValue());
      arc(0, 0, radius, radius, map((millis() % 500), 0, 500, 0, 0.52), map((millis() % 500), 0, 500, TWO_PI, 5.76) );
      popMatrix();
      // mouth movement //
}

void animateIntro(){
  loop();
 image(g5,introX - 120, introY);
 image(g1,introX + 100,introY);
 image(g2,introX,introY + 5);
 image(g3,introX + 200,introY);
 image(g4,introX + 300,introY);
 introX += 4;
 pass+= 3;
}

void PacMan(int coor_x, int coor_y, int pacman_width, int pacman_height){
  if (isOpening == true) mouthAngle += mouthChange;
  else mouthAngle -= mouthChange;
  
  if (mouthAngle >= TWO_PI/8 || mouthAngle <= 0) isOpening = !isOpening;
 
  pushMatrix();
  fill(240,250,0); //color the arc yellow and make it transparency 
  arc(coor_x, coor_y, pacman_width -40, pacman_height-40, 0+mouthAngle, TWO_PI-mouthAngle);
  fill(0);
  ellipse(coor_x +15, coor_y - 35,10,10);
  popMatrix();
}



void update() { //function to update all of the button flags, to see which one is being pressed.
  if ( SinglePlayer.is_over(385, 265, 250, 50) && !SinglePlayer.hide ) {
    SinglePlayer.over = true;
    ChangeColor.over = false;
    Highscore.over= false;
    Difficulty.over = false;
  } 
 
  else if ( ChangeColor.is_over(365, 365, 250, 50) && !ChangeColor.hide ) 
  {
    SinglePlayer.over = false;
    ChangeColor.over = true;
    Highscore.over = false;
    Difficulty.over = false;
  } 
  else if ( Highscore.is_over(365, 465, 250, 50) && !Highscore.hide ) 
  {
    SinglePlayer.over = false;
    ChangeColor.over = false;
    Highscore.over = true;
    Difficulty.over = false;
  } 
  else if ( Difficulty.is_over(365, 565, 250, 50 ) && !Difficulty.hide ) 
  {
    SinglePlayer.over = false;
    ChangeColor.over = false;
    Highscore.over = false;
    Difficulty.over = true;
  } 
  else 
  {
    SinglePlayer.over = false;
    ChangeColor.over = false;
    Highscore.over= false;
    Difficulty.over = false;
  }
}
void draw_map(){
  fill(0,0,255);
  rect(0,0,width, 50); 
  rect(0,height - 50, width , 50);
  rect(0,0,50,height /  3);
  rect(0,height /2,50,height);
  rect(width - 50,0,50,height /3);
  rect(width - 50 ,height /2,50,height);
  rectMode(CENTER);
  rect(width /2 - 160, height /2, 180, 200);
  rect(width /2 + 160, height /2, 180, 200);
  rectMode(CORNER);
}

void end_game()
{
  gameSound.stop();
  eatFood.stop();
  background(0);
  textAlign(CENTER);
  textSize(70);
  fill(255,0,0);
  text("GAME OVER", width/2, (height/2)-100);
  textSize(40);
  text("SCORE  " +number_food, width/2, (height/2)+100);
  textSize(30);
  text("Press q to exit  " , width/2, (height/2)+160);
   timer = -1;
  String lines[] = loadStrings("data/score.txt");
  int score = parseInt(lines[0]);
  if(score < number_food){
       PrintWriter output = createWriter("data/score.txt"); 
       output.print(number_food);
       output.close();
  }
  if(keyPressed )
   {
     if(key == 'q'){
     //setup();
      exit(); // Stops the program
     }
     if(key == 'r'){
       
     }
   }
//  
}