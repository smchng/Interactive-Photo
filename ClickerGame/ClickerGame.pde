//Samantha Chung D101
//301426865

//Diglett MANIA!!!
//Your backyard is infested with Digletts!
//You much catch 'em all before your garden is ruined
//You have Pokeballs that will capture a Diglet with each click on a Diglet
//Diglets will turn red and shrink if captured
//But you can only have 5 pokeBalls max at a time
//To get more, you must "go to" the Pokemart to replenish
//Pokedex displays how many you caught
//If you catch 10, 25, 50 Diglets, you get a gym badge

//I used Photoshop to make some of the images in the game
//Here are the files I imported and I also sumbitted the .png's
PImage pic;
PImage cursor;
PImage goldBadge;
PImage treeBadge;
PImage fireBadge;
PImage pokeMart;

int diglettWidth = 100; //The size of a diglett
int maxDig = 10; //Max amount of characters allowed
int ogDig = 6;  //Original spawn amount of Digletts
int counter = 5; //Initial amount of Pokeballs
int respawnTimer = 60; //Time intervals of spawning

ArrayList <Diglett> diggey = new ArrayList<Diglett>();

Score score;
Special special;

void setup(){
  size(1100,800);
  background(#93DAFF);
  score = new Score();
  special = new Special();
  
  //Variables used to hold my images
  pic = loadImage("PokeDex.png");
  cursor = loadImage("pokeball.png");
  goldBadge = loadImage("goldbadge.png");
  fireBadge = loadImage("fireBadge.png");
  treeBadge = loadImage("treeBadge.png");
  pokeMart = loadImage("pokeMart.png");
  
  //Initial spawn for Digletts
  for (int i=0; i<ogDig; i++){
    moreDiglett();
  }
  
  PFont font = loadFont("GillSans-UltraBold-48.vlw");
  textFont(font, 20);
  
}

//Gives Digletts a random spawn point
void moreDiglett(){
  int xPos = (int)random(0, width+diglettWidth/2);
  int yPos = (int)random(0, height+diglettWidth);
  diggey.add(new Diglett(xPos,yPos));
}

void draw(){
  background(#93DAFF);
  setting();
  respawn();
  
  //Adds each character as an object in to an ArrayList
  for (int i=0; i < diggey.size();i++){
    Diglett diglettNew = diggey.get(i);
    
    //Animates the Digletts when moving and clicked on
    diglettNew.move();
    diglettNew.capture();
    
    //Checks if the cursor actually clicked on the character area and player has sufficient Pokeballs
    if (diglettNew.free()&&mousePressed&&dist(mouseX,mouseY, diglettNew.xPos, diglettNew.yPos)<diglettWidth/1.4&&counter>0){
      //Calls actions from methods from separate classes if an object is clicked on
      diglettNew.catching();
      //Add a score so player know how many they have captured
      score.addScore(1);
      //if player catches one, they lose a ball
      counter --;
    }
  }
  
  //calles the images from different classes to be drawn 
  special.pokedex();
  score.showScore();
  score.badge();
  special.pokeMart();
  special.ballLife();
  special.pokeball();
}

//Helps with replenishing the balls
void mousePressed(){
  //If the press is within this zone, counter will go back to 5 and you can catch more
  if(mouseX<1050 && mouseY<750 &&mouseX>900&&mouseY>600){
    counter = 5;
  }
  
}

//Respawns more Digletts if the time interval is over and it is below the max amount of Digletts
void respawn(){
  respawnTimer--;
  if (respawnTimer<0){
    if (diggey.size()<maxDig){
      moreDiglett();
      respawnTimer = 60;
    }
  }
}

//Method that draws my background in draw()
void setting(){
  fill(#139323);
  noStroke();
  rectMode(CENTER);
  ellipseMode(CENTER);
  
  pushMatrix();
  translate(width/2,height/2);
  rect (0, 400, 1100,800);
  ellipse(500,0, 1000,height/2);
  ellipse(-300,-25, 1300,500);
  
  pushMatrix();
  translate(-width/2,-height/2);
  stroke(#0D6A18);
  strokeWeight(5);
  noFill();
  arc(100,500,10,30,PI,PI*2);
  arc(200,400,10,30,PI,PI*2);
  arc(100,300,10,30,PI,PI*2);
  arc(500,700,10,30,PI,PI*2);
  arc(400,600,10,30,PI,PI*2);
  arc(900,800,10,30,PI,PI*2);
  arc(800,300,10,30,PI,PI*2);
  arc(700,600,10,30,PI,PI*2);
  arc(1000,300,10,30,PI,PI*2);
  arc(900,400,10,30,PI,PI*2);
  arc(800,500,10,30,PI,PI*2);
  arc(700,600,10,30,PI,PI*2);
  arc(450,300,10,30,PI,PI*2);
  arc(550,450,10,30,PI,PI*2);
  arc(650,550,10,30,PI,PI*2);
  arc(320,320,10,30,PI,PI*2);
  popMatrix();
  popMatrix();
  
}
