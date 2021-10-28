class Score{
  
  //Amount captured and reward system class
  
  int score;//Variable to monitor Digletts caught
  
  Score(){
    score = 0;
  }
  
  //Method that will receive global variable score and add in to here
  void addScore(int amount){
    score+= amount;
  }
  
  //Code for the text that will show the score on the PokeDez
  void showScore(){
    pushMatrix();
    fill(#FBFF48);
    textAlign(CENTER);
    translate(0,0);
    text("You"+"\n"+"Caught", 118,110);
    text(score, 118,170);
    popMatrix();
  }
  
  //Depending on the value of the score, a badge will appear for you if you reach a certain value captured
  void badge(){
    //If over 10
    if (score > 9){
      pushMatrix();
      scale(0.5);
      image(goldBadge, 1950,75);
      popMatrix();
    }    
    //If over 24
    if (score > 24){
      pushMatrix();
      scale(0.45);
      image(treeBadge, 1850,65);
      popMatrix();
    }
    //If over 50
    if (score > 50){
      pushMatrix();
      scale(0.30);
      image(fireBadge, 2380,75);
      popMatrix();
    }
  }
}
