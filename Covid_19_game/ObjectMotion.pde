//covidMonster monster;

class ObjectMotion {

  boolean characterMoving = false;

  covidMonster monster; 



  ArrayList<covidMonster> monsters = new ArrayList<covidMonster>();

  int newToiletX;
  SpawnObjects objectGenerator = new SpawnObjects();
  CollisionManager toiletBox = new CollisionManager(newToiletX, toiletY, toiletHitBoxSize, toiletHitBoxSize);
  CollisionManager characterBox = new CollisionManager(characterX, characterY, characterHitBoxSize, characterHitBoxSize);



  ////////////////////////////////////////////////////////////////////////////////////////

  void backgroundMovement() {

    image(background, backgroundX, 0);

    image(background, backgroundX + 1252, 0);

    image(background, backgroundX -1252, 0);

    image(toiletPaper, 10, 10);

    //background loop:
    if (backgroundX <= -1252 || backgroundX >= 1252) {  
      backgroundX = 0;
    }
  }

  /////////////////////////////////////////////////////////////////////////////////////////

  void characterActions() {
    newToiletX = toiletX+ 1252 + deviation;

    toiletBox.updateLocation(newToiletX, toiletY, toiletHitBoxSize, toiletHitBoxSize);
    characterBox.updateLocation(characterX+95, characterY+80, characterHitBoxSize, characterHitBoxSize+50);


    // println(newToiletX);
    //println(characterX);



    //right key
    //frameRate(40);
    if (!jumping && !airDriftR && keyCode == RIGHT) {


      // if (keyPressed){

      RightVisable  = true;
      backgroundLEFT = true;

      if (characterX >= 820) {
        characterSpeed = 0;
        backgroundSpeed = speedValue;
        backgroundX = backgroundX - backgroundSpeed;

        toiletX = toiletX - backgroundSpeed;
        characterMoving = true;
      } else { 
        characterSpeed = speedValue;
        characterX = characterX + characterSpeed;
        backgroundSpeed = 0;
        characterMoving = false;
      }


      // }
    }


    //left key

    else if (!jumping && !airDriftL && keyCode == LEFT) {
      if (keyPressed) {

        RightVisable = false;
        backgroundLEFT = false;

        if (characterX <= -10) {
          characterSpeed = 0;
          backgroundSpeed = speedValue;
          backgroundX = backgroundX + backgroundSpeed;
          toiletX = toiletX + backgroundSpeed;
        } else {
          characterSpeed = speedValue;
          characterX = characterX - characterSpeed;
          backgroundSpeed = 0;
        }
      }
    }


    // Up key 


    if (keyCode == UP) { 

      if (characterY >=330 && millis() - time >= delayTime) {
        //keyPressed && 
        jumping = true;

        time = millis();
        //delay(100);
      }
    }


    if (jumping && keyCode == RIGHT) {
      jump();
    }
  }



  void jump() {
    //frameRate(70);

    if (keyCode == LEFT) {
      RightVisable = false;
      airDriftR = false;
      airDriftL = true;
    } else if (keyCode == RIGHT) {
      RightVisable  = true;
      airDriftL = false;
      airDriftR = true;
    }

    if (characterY <= 140) {

      jumping = false;
      //  airDriftL = false;
      //airDriftR = false;
      //println(characterY);
    }

    if (jumping == true) {
      //jump();

      characterY = characterY - jumpingSpeed;

      //println(characterY);
    } else if (jumping == false) { 
      if (characterY <= 330) {



        characterY = characterY+jumpingSpeed;
      }
    }

    if (characterY > 330) {
      //do stuff
      airDriftL = false;
      airDriftR = false;
    }



    if (airDriftL) {
      if (characterX <= -10) {
        characterSpeed = 0;
        backgroundSpeed = speedValue;
        backgroundX = backgroundX + backgroundSpeed;
        toiletX = toiletX + backgroundSpeed;
      } else {
        characterSpeed = speedValue;
        characterX = characterX - characterSpeed;
        backgroundSpeed = 0;
      }
    }

    if (airDriftR) {
      //characterX = 10 + characterX;
      if (characterX >= 820) {
        characterSpeed = 0;
        backgroundSpeed = speedValue;
        backgroundX = backgroundX - backgroundSpeed;

        toiletX = toiletX - backgroundSpeed;
      } else { 
        characterSpeed = speedValue;
        characterX = characterX + characterSpeed;
        backgroundSpeed = 0;
      }
    }
  }
  ///////////////////////////////////////////////////////////////////////////////////////////



  void switchScreenState() {
    //println(key);
    if (key == ENTER) {

      if (keyPressed) {



        if (currentState == END) {
          //reset variables
          currentState = MENU;
        } else {
          currentState++;
        }

        //println(currentState);
        setup();
      }
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



  void monsterMovement() {

    objectGenerator.spawnMonster();

    //CREATE SPAWN TIMER, AND FIGURE OUT HOW TO CREATE AND DRAW MULTIPLE MONSTERS AT A TIME. FIX MONSTER MOVEMENT WHEN BACKGROUND IS MOVING.
    //FIX TOMORROW, I JUST BROKE EVERYTHING TRYING TO SPAWN MULTIPLE COVID MONSTERS. NULL POINTER EXCEPTION.

    for (int i = 0; i < monsters.size(); i++) {
      monster = monsters.get(i);
      if (monster.x < -100 && monster.passedThru == false) {
        monster.speed *= -1;
        monster.passedThru = true;
      }

      if (monster.x > 1350 && monster.passedThru == true) {
        monster.speed *= -1;
        monster.passedThru = false;
      }

      checkMoving();
      if (characterX >= 820 && monster.passedThru == true && characterMoving  == true) {
        // println("FALSE");
        int g =  backgroundSpeed + monster.speed;
        // println("backgroundSpeed: " + backgroundSpeed + " , monster.speed: " + monster.speed);

        if (monster.x <= - 100) {
          monster.x = -94;
        }

        monster.x = monster.x - g; 
        characterMoving = false;
      } else {
        //println("...... ELSE STATEMENT IS RUNNING");
        monster.x = monster.x - monster.speed;
      }

      //ADD STUFF HERE.


      monster.secondBox.setBounds(monster.x-200, monster.y, 50+400, 50);
     // rect(monster.x-200, monster.y, 50+400, 50);

      monster.monsterBox.updateLocation(monster.x, monster.y, 50, 50);
      monster.testDraw();

      checkMonsterIntersection(monster);
    }
  }

  ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

  void checkIntersection() {
    // println("checking intersection");

    if (characterBox.collisionBox.intersects(toiletBox.collisionBox)) {

      //println("BAM");

      toiletBox.isActive = false;
    }
  }

  //////////////////////////////////////////////////////////////////////

  void checkMonsterIntersection(covidMonster monster) {

    if (characterBox.collisionBox.intersects(monster.secondBox)) {

      if (RightVisable && monster.x > characterX || !RightVisable && monster.x < characterX) {
       // println("monster is within attack range");
        monster.withinRange=true;

        //if(keyReleased){

        //}
        //monster.monsterHealth -=  10;
      }
    } else {
     // println("A monster is out of range");
      monster.withinRange = false;
    }

    if (monster.monsterHealth <= 0) {
      monster.monsterBox.isActive = false;
      monsters.remove(monster);
    }

    if (characterBox.collisionBox.intersects(monster.monsterBox.collisionBox) && monster.canAttack == true) {
      //character Hp decreases
//ADJUST THE AMOUNT OF DAMAGE THE CHARACTER RECEIVES. RN CHARACTER GETS DAMAGED X2 FOR EVERY TIME A COVIS PASSES. ALSO, THE COVID IS NOT ABLE TO ATTACK AGAIN FOR UNKNOWN REASONS. FIX!!!!!!!!!!
//NEXT: SOUND EFFECTS AND VISUAL HP BAR(S). COMPLETE SCREEN STATES
        characterHealth--;
        monster.canAttack = false;
        println(characterHealth);
     /* if (millis() - time4 >= invincibilityTime) {

        time4 = millis();

       // monster.canAttack = true;
        
      }*/
    }
    
    if(!characterBox.collisionBox.intersects(monster.monsterBox.collisionBox)){
      monster.canAttack = true;
    }

    if (characterHealth <=0) {
      //end game screen
      // currentState = END;
    }
  }

  ///////////////////////////////////////////////////////////////////////
  void checkMoving() {
    while (keyPressed && key == RIGHT) {
      characterMoving = true;
    }
    // println(characterMoving);
  }
}
