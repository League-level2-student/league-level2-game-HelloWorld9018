class SpecialEffects {

  
  
  void displayCharacterDirection() {

    if (RightVisable == true) {
      image(RIGHTcharacter, characterX, characterY);
    } else {
      image(LEFTcharacter, characterX, characterY);
    }
  }



  void displayHealth() {
    

    if (characterHealth == 30) {
      healthBar = loadImage("full6.png");
        //healthBar.resize(630/3, 146/4);

    } else if (characterHealth == 25) {
      healthBar = loadImage("health5.png");
    
    } else if (characterHealth == 20) {
      healthBar = loadImage("health4.png");
      
    } else if (characterHealth == 15) {
      healthBar = loadImage("health3.png");
      
    } else if (characterHealth == 10) {
      healthBar = loadImage("health2.png");
   
    } else if (characterHealth == 5) {
      healthBar = loadImage("health1.png");
     
    }
    
    if(characterHealth < 10){
    healthTextX = 1003;  
    }

    image(healthBar, 1020, 39);
    
    image(heart, 980, 25);
    //MAKE GAME RUN SMOOTHER, THEN LOOP MUSIC AND ADD SOUND EFFECTS
    textSize(25);
    text(characterHealth, healthTextX, 61);
    
  }
  
  
}
