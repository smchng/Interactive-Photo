class Special{
  
  //All extra things that were added to make the game more presentable class
  
  //Method that placed the PokeDex
  void pokedex(){
    pushMatrix();
    scale(0.25);
    image(pic, -200,-200);
    popMatrix();
  }
  
  //Method that made the PokeBall follow the cursor
  //So it simulates catching in the game
  void pokeball(){
    if (counter>0){
    pushMatrix();
    translate(mouseX,mouseY);
    scale(0.12);
    image(cursor, -300,-350);
    popMatrix();
    }
  }
  
  //Method that places the Pokemart to get more balls from
  void pokeMart(){
    pushMatrix();
    scale(0.30);
    image(pokeMart, 2900,2000);
    popMatrix();
  }
  
  //Method to show how many balls you have left
  void ballLife(){
    pushMatrix();
    fill(#FBFF48);
    textAlign(CENTER);
    translate(width,height);
    text(counter, -128,-145);
    popMatrix();
  }
   
}
