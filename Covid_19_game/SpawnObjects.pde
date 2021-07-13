
class SpawnObjects{
  
  int currentX;
  
  int ran;
  int smlRan;
  int x;
  int y;
  int speed;
  
  int randomItemX;
  int randomObjectSelector;
  PImage newItem;
  
  ArrayList<PImage> items  = new ArrayList<PImage>();
  
  void initialSpawn(){
    // add if statement
    if (currentState == MENU){
      background(255, 0, 0);
    }
    else if (currentState == GAME){
      
      background = loadImage("SuperMarket.jpg");
  RIGHTcharacter = loadImage("fixedCharacter2.gif");
  LEFTcharacter = loadImage("LEFTfixedCharacter2.gif");
  
  toiletPaper = loadImage("toiletPaper.png");
  
  RIGHTcharacter.resize(300,300);
  LEFTcharacter.resize(300, 300);
  toiletPaper.resize(50,50);
  
    //testing
    covidMonster = loadImage("covidMonster.png");
    covidMonster.resize(50,50);
    
    heart = loadImage("heart.png");
    heart.resize(65, 60);
    
     
      
    }
    
    else{
      background (0, 225, 0);
    }
     
  }
  
  void randomToiletSpawn(){
    
    //motion.toiletBox.isActive=true;
    //collisionManager = new CollisionManager(currentX, toiletY, toiletHitBoxSize, toiletHitBoxSize);
   
 distance  = 1252 + deviation;
 
 
 
 if (!motion.toiletBox.isActive){
    toiletX = 0;
   deviation = (int)random(800, 1300);
   score++;
   motion.toiletBox.isActive=true;
 }
 
 else if (toiletX <= -distance){
   toiletX = 0;
   deviation = (int)random(800, 1300);
   
 }
 
 currentX = toiletX + 1252 + deviation;
   
    image(toiletPaper, currentX, toiletY);
    
    motion.toiletBox.updateLocation(currentX, toiletY, toiletHitBoxSize, toiletHitBoxSize);
 
  }
  
  void spawnMonster(){
    
    if (millis() - time2 >= monsterSpawnTime) {
      //keyPressed && 

      time2 = millis();

      println("......................................spawn");

      ran = (int) random(10, 1252);
      smlRan = (int) random (-60, 20);
      x = 1252 + ran;
      y = 500 + smlRan;
      speed = (int) random (2, 4);

      motion.monsters.add(new covidMonster(x, y, speed));
    }
   
  }
  
  
  void spawnItems(){
    
     randomItemX = (int) random(10, 1252*2);
     randomObjectSelector = (int) random(1, 4);
     
     if(randomObjectSelector == 1){
       
     }
     
     else if(randomObjectSelector == 2){
       
     }
     
     else{
       // randomObjectSelector = 3
       
     }
    
    
    
  }
  
  
}
