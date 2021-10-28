//Samantha Chung D101
//301426865

/* Interactions
Left mouse click = 1 frog tongue extending and blinking
mouse drag = frog jumping off rock

Some drawCharacter methods are called inside other methods for mouse interactions
*/

//Background color values
color a = color (6,198,97); //grass fill
color b = color (16,78,157); //bg
color c = color (104,218,229); //pond fill
color d = color (0,118,52); //lilypad fill
color e = color (1,80,36);//Lilipad lines (stroke)
color f = color (20,162,82);//Grass fill
color g = color (80);//cattail stem (stroke)
color h = color (183,110,0);//cattail fuzz fill
color i = color (36);//cattail fuzz outline(stroke)
color j = color (130);//rock outline (stroke)
color k = color (160);//rock fill
color l = color (4,198,41);//Leaves fill
color m = color(255,144,178);//lotus outline (stroke)
color n = color (192,212,224);//cloud fill
color o = color (255,188,208);//lotus fill
color p = color (255,185,98);//fish fill
color q = color (255,170,64);//fish outline (stroke)

//Character color values
color r = color (95,201,67);//frog fill
color s = color(255,178,178);//frog cheeks and bow fill
color t = color(255,118,187);//bow stroke
color u = color(249,250,81);//bow detail fill
color v = color(250,81,92);//tongue fill


//Background Variables
float rot = (35);
int cloud = 0;
int spin = 0;
int f1 = 0;
int f2 = 0;

//Character Variables
float tongue = 0;
float rock = 0;
float rocking = 0.01;
float scal = 0;
float rise = 0;



void setup(){
  size(1100,800);
  background (b);
  frameRate(20);
  smooth();
}

void draw(){
  background(b);
  drawBackground();
  drawCharacter(120,30,1,0);
  drawCharacter(-1480,100,0.36,radians(-35));
  grass();//Redraw grass on top
  drawCharacter(-800,130,0.4,0);
  drawCharacter(650,700,0.4,0);
  drawCharacter(-135,625,0.4,0);
  lotus();//Redraw lotus on top
  tong(120,30,1,0);//a frog grows a tongue
  blink(650,700,0.4,0);//a frog blinks
  jump();//makes a frog jump down
  bounce();//makes a frog jump up
  enlarge();
}




//////////MY METHODS///////////

void enlarge(){ 
  //Enlarges one of the frogs when right mouse button is held. Once relesed, it resets
  pushMatrix();
  translate(-100,-150);
  if (mousePressed){
    if (mouseButton == RIGHT){
      scal += 0.04;     
    }
  }
  drawCharacter(0,0,0.8+scal,0); 
  popMatrix();
}

void mouseReleased(){//resets the animations
  scal = 0;
  tongue = 0;
}

void bounce(){
  //one is the frog jumps up and down on a lilypad 
  //based off mouseY coordinates. (Part 3 ECO requirement)
  pushMatrix();
  translate(440,0);
  float up = map(mouseY,0,width,0,200);
  translate (0,up);
  drawCharacter(0,0,0.6,0);
  popMatrix();
}

void jump(){
  //Frog jumps off a rock based off mouseX and mouseY coordinates
  pushMatrix();
  translate(-390,-170);
  float hop = map(mouseX,0,width,0,110);
  float hops = map(mouseX,0,width,0,50);
  translate (hops,hop);
  drawCharacter(0,0,0.4,0);
  popMatrix();
}

void tong(int x, int y, float scale,float rotation){
  // Lengthens a tongue on one of a frog is mouse pressed
  //Resets after a certain size
  pushMatrix();
  translate(width/2,height/2);
  scale(scale);
  rotate(rotation);
       
  pushMatrix();
  translate(x,y);
         
  pushMatrix();
  rotate(rock);
  fill(v);
  stroke(v);
  rotate(radians(180));
  if (mousePressed){
  arc(0,-12,20,0+tongue,PI,PI*2);
  tongue += 2;
  }
  if (tongue > 100){
  tongue = tongue * -1; 
  }
  popMatrix();

  //mouth to cover edges
  rotate(rock);
  stroke(0);
  strokeWeight(6);
  line(0,15,-40,0);
  line(0,15,40,0);

rock = rock + rocking;
if(abs(rock) > radians(25)) rocking *=-1;

popMatrix();
  
  popMatrix();
}

void blink(int x, int y, float scale,float rotation){
  //One of the frogs eyes "blinks" when mouse pressed
  //blinks by covering eyes with more ellipses
  pushMatrix();
  translate(width/2,height/2);
  scale(scale);
  rotate(rotation);
  
  pushMatrix();
  translate(x,y);
  rotate(rock);
  if (mousePressed){
       fill(r);
       ellipse(-40,-65,50,60);
       ellipse(40,-65,50,60);
       }
  rock = rock + rocking;
  if(abs(rock) > radians(25)) rocking *=-1;
  popMatrix();
  popMatrix();
}





///////REQUIRED METHODS/////////
//Same as Part 1 and 2

void drawCharacter(int x, int y, float scale,float rotation){
 ellipseMode(CENTER);
 rectMode(CENTER);
 
 pushMatrix();
 
 translate(width/2,height/2);
 scale(scale);
 rotate(rotation);
 //float rot2 = map(mouseX, 0, width, radians(45), radians(-45));
 //float enlarge = map(mouseY, 0, width, 0.5, 2);
 //scale(enlarge);
 //rotate(rot2);
 
   //back 2 legs
   pushMatrix();
   stroke(0);
   fill(r);
   strokeWeight(5);
   
   triangle(-60+x,40+y-rise,-115+x,70+y-rise,-85+x,85+y-rise);
   triangle(60+x,40+y-rise,115+x,70+y-rise,85+x,85+y-rise);
   
   rise += 0.5;
       
   if (rise == 20){
     rise *= -1;
   }
       
   popMatrix();
   
   //body
   ellipse(0+x,40+y,150,110);
   
     //For head rocking
   pushMatrix();
   translate(x,y);
 
     pushMatrix();
    
       rotate(rock);
       
       //bow
       stroke(t);
       strokeWeight(3);
       fill(s);
       
       quad(-50,-120,-50,-40,50,-120,50,-40);
       
       fill(u);
       ellipse(-50,-120,10,10);
       ellipse(50,-120,10,10);
       
       stroke(0);
       fill(r);
       strokeWeight(5);
       
       //head
       ellipse(0,-20, 150,110);
       
       //eyes
       fill(255);
       ellipse(-40,-65,50,60);
       ellipse(40,-65,50,60);
       arc(-41,-60,30,20,PI,PI*2);
       arc(41,-60,30,20,PI,PI*2);
       
       //mouth
       stroke(0);
       strokeWeight(6);
       line(0,15,-40,0);
       line(0,15,40,0);
       
       //cheeks
       fill(s);
       noStroke();
       ellipse(53,-17,25,25);
       ellipse(-53,-17,25,25);
       
       rock = rock + rocking;
       if(abs(rock) > radians(25)) rocking *=-1;
       
       popMatrix();
       
     popMatrix();
   
   //front 2 legs
   stroke(0);
   fill(r);
   strokeWeight(5);
   
   triangle(-35+x,60+y,-50+x,120+y,-20+x,120+y);
   triangle(35+x,60+y,50+x,120+y,20+x,120+y);
 
 popMatrix();
 
}

void drawBackground(){
 
 rectMode(CENTER);
 ellipseMode(CENTER);
 
 //bottom grassy area
 noStroke();
 fill(a);
 rect (550,600,1100,600);
 
 //pond
 fill(c);
 ellipse(800,650,1000,700);
 rect(970, 400, 400, 200);
 
 //fish
 fill(p);
 stroke(q);
 strokeWeight(3);
  
 pushMatrix();
 translate(495,675);
 rotate(radians(40));
 triangle(-10+f1,40+f2,10+f1,40+f2,0+f1,20+f2);
 ellipse(0+f1,0+f2,20,50);
 
 stroke(j);
 noFill();
 arc(0+f1,0+f2,15,10,PI,PI*2);
 stroke(0);
 fill(0);
 ellipse(0+f1,-15+f2,5,5);
 
 f1+=1;
 f2+=-3;
 
 if (f1 == 170){
  f1 = 0; 
  f2 = 0;
  }
 popMatrix();
 
 //lilypad
 noStroke();
 fill(d);
 ellipse(1000, 600, 175, 125);
 ellipse(500, 700, 200, 150);
 ellipse(675, 500, 325, 200);
 ellipse(810, 720, 150, 100);
 ellipse(980, 420, 150, 100);
 fill(c);
   //Small cut for lilypad
 triangle(625,400,700,400,675,467);
 triangle(460,625,500,625,485,675);
 triangle(750,615,805,615,800,705);
 triangle(945,350,980,350,970,400);
 triangle(965,530,1000,530,990,575);
   //lines for the lilypad
 stroke(e);
 strokeWeight(5); 
     //set 1
 line(650,485, 575,460);
 line(655,510, 590,545);
 line(680,515, 695,570);
 line(720,510, 780,540);
 line(720,510, 780,540);
 line(715,480, 780,450);
     //set 2
 line(475,695,435,680);
 line(478,715,440,735);
 line(505,725,520,750);
 line(525,710,575,710);
 line(515,690,555,665);
     //set 3
 line(800,720,765,710);
 line(805,735,785,750);
 line(825,735,850,750);
 line(825,715,850,700);
     //set 4
 line(980,595,945,580);
 line(980,615,955,630);
 line(1000,625,1005,650);
 line(1020,610,1060,605);
 line(1005,590,1025,560);
     //set 5
 line(970,420,925,410);
 line(975,435,955,450);
 line(995,435,1020,450);
 line(995,415,1020,400);
 
 //cattail
 //stem
 noFill();
 stroke(g);
 strokeWeight(4);
 curve(390,380,250,500,180,750,380,420);
 curve(390,380,300,450,230,700,380,420);
 curve(390,380,360,500,290,750,380,420);
 curve(390,380,310,520,240,770,380,420);
 //fuzzy part
 pushMatrix();
 translate(360,500);
 rotate(rot);
 fill(h);
 stroke(i);
 ellipse(98,-90,20,50);
 ellipse(70,-30,20,50);
 ellipse(28,-100,20,50);
 ellipse(-10,-40,20,50);
 popMatrix();
 
 //grass
 noStroke();
 fill(f);
 triangle(150,810,230,810,180,650);
 triangle(160,810,260,810,210,650);
 triangle(190,810,290,810,240,650);
 triangle(220,810,320,810,270,650);
 triangle(250,810,350,810,300,650);
 triangle(280,810,360,810,330,650);
 
 //leaves
 stroke(f);
 strokeWeight(5);
 fill(l);
 arc(230,445,10,30,PI,PI*2);
 arc(130,595,10,30,PI,PI*2);
 arc(30,545,10,30,PI,PI*2);
 arc(80,700,10,30,PI,PI*2);
 arc(430,395,10,30,PI,PI*2);
 arc(35,450,10,30,PI,PI*2);
 arc(140,695,10,30,PI,PI*2);
 arc(15,340,10,30,PI,PI*2);
  
  //cloud
  pushMatrix();
  noStroke();
  fill(n);
  
    pushMatrix();
    ellipse(150 + cloud,150,300,60);
    ellipse(95 + cloud,120,100,60);
    ellipse(150 + cloud,90,100,60);
    ellipse(175+ cloud,120,100,60);
    ellipse(225+ cloud,120,100,60);
    cloud = cloud + 1;
    if (cloud == 1100){
      cloud = -350;
    }
    popMatrix();
  
  ellipse(150 + 500 + cloud,250,300,60);
  ellipse(95 + 500 + cloud,220,100,60);
  ellipse(150 + 500 + cloud,190,100,60);
  ellipse(175 + 500+ cloud,220,100,60);
  ellipse(225 + 500+ cloud,220,100,60);
  cloud = cloud + 1;
  if (cloud == 1100){
    cloud = -850;
  }
  
  popMatrix();
  
 //rock
 stroke(j);
 strokeWeight(3);
 fill(k);
 rect(90,350,50,20);
 quad(105,260,80,360,210,360,230,265);
 quad(210,235,190,360,340,360,315,220);
 rect(330,355,50,20);
 noFill();
 arc(130,295,40,50,PI,PI*5/3);
 arc(235,270,40,50,PI,PI*5/3);
     
 //Dragonfly
    
 pushMatrix();
 
 translate(220,450);
 rotate(radians(spin));
 
     //body
    fill(h);
    noStroke();
    rect(100,110,8,65);
    stroke(0);
    strokeWeight(2); //stroke weight 4
    line(96,105,103,105);
    line(96,118,103,118);
    line(96,130,103,130);
    
      //head
    fill(h);
    noStroke();
    ellipse(100,75,15,15);
    
      //antenae
    noFill();
    stroke(0);
    arc(109,66,15,15,-PI,0);
    arc(89,67,15,15,-PI,0);
    
      //Wings
    stroke(0);
    strokeWeight(3);
    fill(255);
    ellipseMode(CORNER);
    
        //right bottom wing
    pushMatrix();
    rotate(PI/3*0.2);
    ellipse(120,65,65,12);
    popMatrix();
    
        //right top wing
    pushMatrix();
    rotate(-PI/3*0.2);
    ellipse(80,105,65,12);
    popMatrix();
    
        //left bottom wing
    pushMatrix();
    rotate(-PI/3*0.2);
    ellipse(10,108,65,12);
    popMatrix();
    
        //left top wing
    pushMatrix();
    rotate(PI/3*0.2);
    ellipse(50,63,65,12);
    popMatrix();
  
  spin = spin + -2;
  
  popMatrix();
  
  //top Lotus
  pushMatrix();
  ellipseMode(CENTER);
  
  fill(o);
  stroke(m);
  strokeWeight(3);
  translate(980,400);
  
  pushMatrix();
  rotate(radians(-80));
  ellipse(-30,-20,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(-30));
  ellipse(-20,5,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(80));
  ellipse(30,-20,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(30));
  ellipse(20,5,20,50);
  popMatrix();
  
  ellipse(0,10,20,50);
  popMatrix();
  
  //bottom lotus
  pushMatrix();
  translate(495,675);
  
  pushMatrix();
  rotate(radians(-80));
  ellipse(-30,-20,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(-30));
  ellipse(-20,5,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(80));
  ellipse(30,-20,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(30));
  ellipse(20,5,20,50);
  popMatrix();
  
  ellipse(0,10,20,50);
  popMatrix();
}
 
void grass(){
  noStroke();
  fill(f);
  triangle(150,810,230,810,180,650);
}

void lotus(){
  fill(o);
  stroke(m);
  strokeWeight(3);
  
  pushMatrix();
  translate(495,675);
  
  pushMatrix();
  rotate(radians(-80));
  ellipse(-30,-20,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(-30));
  ellipse(-20,5,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(80));
  ellipse(30,-20,20,50);
  popMatrix();
  
  pushMatrix();
  rotate(radians(30));
  ellipse(20,5,20,50);
  popMatrix();
  
  ellipse(0,10,20,50);
  popMatrix();
}
