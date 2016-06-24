void setup()
{
  size(480,279);
  background(204,255,255);
}

void draw()
{
  pushMatrix(); 
  ellipseMode(CENTER); //make ellipses be in the center
  rectMode(CENTER); // make rectangle be in the center
  strokeWeight(2); //thicker line
  stroke(0); // line color is black
  fill(150); //color grey
  rect(240,145,20,100); //body
  
  fill(204,0,102);      
  ellipse(206,75,10,10);    //attena balls
  ellipse(275,75,10,10);
  
  fill(255,255,0);
  ellipse(240,115,60,60);   //head
  
  fill(0);
  ellipse(221,115,16,32);  //eyes
  ellipse(259,115,16,32);
  
  stroke(0);
  line(230,195,220,205);  //legs
  line(250,195,260,205);
  
  fill(255,0,0); //mouth
  arc(240,130,20,20,radians(0),radians(180)); //draw arc
  
  pushMatrix();
  translate(0,-100); //translation to the top
  stroke(255,0,0);
  line(220,195,230,205); //hands
  line(260,195,250,205);
  popMatrix();
  
  pushMatrix();
  translate(-10,-115);
  stroke(0,0,255);
  line(220,195,230,205); //atena left
  popMatrix();
  
  pushMatrix();
  translate(10,-115);
  stroke(0,0,255);
  line(260,195,250,205); //atena right
  popMatrix();
  
  pushMatrix();
  translate(0,-40);
  stroke(0);
  line(230,195,220,205); //eye brows
  line(250,195,260,205);
  popMatrix();
  
  popMatrix(); //finish first figure
  
  pushMatrix();
  translate(-150,0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(0);
  fill(150);
  rect(240,145,20,100);
  
  fill(255,255,0);
  ellipse(240,115,60,60);
  
  fill(204,0,102);
  ellipse(206,75,10,10);
  ellipse(275,75,10,10);
  
  
  fill(0);
  ellipse(221,115,16,32);
  ellipse(259,115,16,32);
  
  stroke(0);
  line(230,195,220,205);
  line(250,195,260,205);
  fill(255,0,0);
  arc(240,140,20,20,radians(180),radians(360));
  
  pushMatrix();
  translate(0,-100);
  stroke(255,0,0);
  line(220,195,230,205);
  line(260,195,250,205);
  popMatrix();
  
  pushMatrix();
  translate(-10,-115);
  stroke(0,0,255);
  line(220,195,230,205);
  popMatrix();
  
  pushMatrix();
  translate(10,-115);
  stroke(0,0,255);
  line(260,195,250,205);
  popMatrix();
  
  pushMatrix();
  translate(0,-40);
  stroke(0);
  line(230,195,220,205);
  line(250,195,260,205);
  popMatrix();
  
  popMatrix();//finish second figure
 
 pushMatrix();
  translate(150,0);
  ellipseMode(CENTER);
  rectMode(CENTER);
  strokeWeight(2);
  stroke(0);
  fill(150);
  rect(240,145,20,100);
  
  fill(255,255,0);
  ellipse(240,115,60,60);
  
  fill(204,0,102);
  ellipse(206,75,10,10);
  ellipse(275,75,10,10);
  
  fill(0);
  ellipse(221,115,16,32);
  ellipse(259,115,16,32);
  
  stroke(0);
  line(230,195,220,205);
  line(250,195,260,205);
  line(230,135,250,135);
  
  pushMatrix();
  translate(0,-100);
  stroke(255,0,0);
  line(220,195,230,205);
  line(260,195,250,205);
  popMatrix();
  
  pushMatrix();
  translate(-10,-115);
  stroke(0,0,255);
  line(220,195,230,205);
  popMatrix();
  
  pushMatrix();
  translate(10,-115);
  stroke(0,0,255);
  line(260,195,250,205);
  popMatrix();
  
  pushMatrix();
  translate(0,-40);
  stroke(0);
  line(230,195,220,205);
  line(250,195,260,205);
  popMatrix();
  
  popMatrix(); //finish last figure
  
}

void mousePressed()
{
  save("alien.jpg");
}