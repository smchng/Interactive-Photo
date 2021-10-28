class Diglett {
  
  //Anything to do with the Digletts code
  
  int xPos; //Diglett positions
  int yPos;
  
  int widthVel; //Moves the Digletts
  int heightVel;
  
  int timer = -1;//Timer used to see if a Diglett should be spawned or removed
  float scal = 1;//Variable for capture animation
  
  float bobbing = 0; //Animates the Diglett to bob up and down
  float bob = 1;
  
  int spark = 0;//Variable to move white spark lines when capturing
  
  //constructer for the character position
  Diglett(int x, int y){
    xPos = x;
    yPos = y;
    
    widthVel = (int)(random(-5,8));
    heightVel = (int)(random(-5,8));
    
  }

  //Moves the Digletts and keeps them from leaving the window forever
  void move(){
    
    xPos += widthVel;
    yPos += heightVel;
    
    detectWall();
  }
 
 //Checks to see if the Digletts are within the window
 //If not, it respawns it to the other side
  void detectWall(){
    //Adds and subtracts characters side to make sure the entire Diglett disappears before respawning
    if (xPos > width+diglettWidth/2){
      xPos = (0-diglettWidth/2);
    }
    if (yPos > height+diglettWidth){
      yPos = (0-diglettWidth/2);
    }
    if (xPos < 0-diglettWidth/2){
      xPos = (width+diglettWidth/2);
    }
    if (yPos < 0-diglettWidth){
      yPos = (height+diglettWidth/2);
    }
  }
  
  //Used to make sure you can only click on a character once
  //So score does not continuously increase
  //Since it resets the times it can's keep ading points
  boolean free(){
    return timer == -1;
  }
  
  //What happens when the character is clicked
  void capture(){
    //If the timer is still -1 it is at its neutral position and only shows the regular Diglett
    if (timer == -1){
      drawDiglett();
    }
    //Once a Diglett is clicked, the timer is changed to 60; over 0
    //And the timer counts down until the Diglett will be removed
    //While doing so, the capture animation plays
    if (timer > 0){
      timer--; 
      captured(); 
    }
    //Once the timer hits 0, the character is removed and restarts at -1 again
    if (timer == 0){
      diggey.remove(this);
      }
  }
  
  //Once the character is clicked on, it stops and the timer is re-assigned
  void catching(){
    widthVel = 0;
    heightVel = 0;
    timer = 60;
  }
  
  //The animation for when the character is about to be removed
  void captured(){
    
    pushMatrix();
    translate(xPos,yPos);
    
    pushMatrix();
    spark+=5;
    stroke(255);
    strokeWeight(4);
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    line(10+spark,10+spark,30+spark,30+spark);
    rotate(radians(35));
    popMatrix();
    
    //slowly shrinks the Diglett
    scal-=0.01;
    scale(scal);
    fill(#FF5148);
    noStroke();
    rectMode(CENTER);
    ellipseMode(CENTER);
    
    //Body
    rect(0,0,75,100);
    arc(0,-49,75,80,-PI,0);
    
    //Eyes
    ellipse(-10,-53,8,18);
    ellipse(18,-53,8,18);
    ellipse(-10,-58,5,6);
    ellipse(18,-58,5,6);
    
    //Mouth or Nose
    ellipse(5,-30,35,20);
    ellipse(0,-33,18,10);
    
    //Rocks
    rect(0,40,100,25);
    triangle(-50,30,-30,30,-43,-5);
    triangle(-35,30,-15,30,-28,8);
    triangle(-15,30,5,30,-8,2);
    triangle(5,30,30,30,15,10);
    triangle(30,30,50,30,42,-5);
    popMatrix();
  }
 
 
  //Original Diglett drawing
  void drawDiglett(){
    
    pushMatrix();
    translate(xPos,yPos);
    fill(#B4653E);
    stroke(25);
    strokeWeight(1);
    rectMode(CENTER);
    ellipseMode(CENTER);
    
    pushMatrix();
    //Body
    rect(0,0+bobbing,75,100);
    arc(0,-49+bobbing,75,80,-PI,0);
    
    //Eyes
    fill(0);
    noStroke();
    ellipse(-10,-53+bobbing,8,18);
    ellipse(18,-53+bobbing,8,18);
    fill(255);
    ellipse(-10,-58+bobbing,5,6);
    ellipse(18,-58+bobbing,5,6);
    
    //Mouth or Nose
    fill(#EA5864);
    ellipse(5,-30+bobbing,35,20);
    fill(255,90);
    ellipse(0,-33+bobbing,18,10);
    
    bobbing+=bob;
    if (abs(bobbing) > 5){
      bob*=-1;
    }
    
    popMatrix();
    
    //Rocks
    fill(#939B88);
    rect(0,45,100,35);
    triangle(-50,30,-30,30,-43,-5);
    triangle(-35,30,-15,30,-28,8);
    triangle(-15,30,5,30,-8,2);
    triangle(5,30,30,30,15,10);
    triangle(30,30,50,30,42,-5);
    
    popMatrix();
  }
}
