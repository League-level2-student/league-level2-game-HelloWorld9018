
class SpawnObjects {

  int currentX;

  int ran;
  int smlRan;
  int x;
  int y;
  int speed;

  int randomItemX;
  int randomObjectSelector;
  PImage newItem;

  boolean isInitialized = false;
  boolean isReset = true;

  boolean menuLoaded = false;
  boolean endLoaded = false;
  boolean instructionsLoaded = false;

  ArrayList<PImage> items  = new ArrayList<PImage>();

  void initialSpawn() {
    // add if statement
    /* if (currentState == MENU){
     background(255, 0, 0);
     }*/
    if (currentState == GAME && !isInitialized) {
      isInitialized = true;


      background = loadImage("SuperMarket.jpg");
      RIGHTcharacter = loadImage("fixedCharacter2.gif");
      LEFTcharacter = loadImage("LEFTfixedCharacter2.gif");

      toiletPaper = loadImage("toiletPaper.png");

      RIGHTcharacter.resize(300, 300);
      LEFTcharacter.resize(300, 300);
      toiletPaper.resize(50, 50);

      //testing
      covidMonster = loadImage("covidMonster.png");
      covidMonster.resize(50, 50);

      heart = loadImage("heart.png");
      heart.resize(65, 60);

      healthTextX = 998;


      bgMusic.loop();
    }

    /*else{
     background (0, 225, 0);
     }*/
  }

  void randomToiletSpawn() {

    //motion.toiletBox.isActive=true;
    //collisionManager = new CollisionManager(currentX, toiletY, toiletHitBoxSize, toiletHitBoxSize);

    distance  = 1252 + deviation;



    if (!motion.toiletBox.isActive) {
      toiletX = 0;
      deviation = (int)random(800, 1300);
      score++;
      motion.toiletBox.isActive=true;
    } else if (toiletX <= -distance) {
      toiletX = 0;
      deviation = (int)random(800, 1300);
    }

    currentX = toiletX + 1252 + deviation;

    image(toiletPaper, currentX, toiletY);

    motion.toiletBox.updateLocation(currentX, toiletY, toiletHitBoxSize, toiletHitBoxSize);
  }

  void spawnMonster() {

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


  void spawnItems() {

    randomItemX = (int) random(10, 1252*2);
    randomObjectSelector = (int) random(1, 4);

    if (randomObjectSelector == 1) {
    } else if (randomObjectSelector == 2) {
    } else {
      // randomObjectSelector = 3
    }
  }

  void drawMenu() {
    if (!menuLoaded) {
      menuPic = loadImage("frontViewStore.jpg");
      menuPic.resize(1252, 700);
      menuLoaded = true;
      fill(0, 0, 0);
      tittleFont = createFont("Segoe Print Bold", 75);

      startFont  = createFont("Verdana", 45);

      objectiveFont = createFont("Verdana", 30);
    }

    /*for (String s : PFont.list()) {
      println(s);
    }*/

    image(menuPic, 0, 0);
    textFont(tittleFont);
    text("TOILET HOARDERS", 260, 150);
    textFont(startFont);
    text("Press ENTER to start", 380, 300);
    textFont(objectiveFont);
    text("OBJECTIVE: hoard the toilet paper. \n       Press space to attack.", 370, 450);
    //COMPLETE DRAW MENU, "ENTER TO START" "OBJECTIVE: HOARD THE TOILET PAPER"
  }

  void drawEnd() {
    if (!endLoaded) {
      endPic = loadImage("endBackground.jpg");
      endPic.resize(1252, 700);

      gameOverText = loadImage("gameOver.png");
      gameOverText.resize(500, 517);

      trophy = loadImage("trophy.png");
      trophy.resize(50, 70);

      endFont = createFont("Trebuchet MS", 40);

      highScoreFont = createFont("Trebuchet MS", 40);

      scoreFont = createFont("Trebuchet MS", 30);

      BufferedReader reader = createReader("highscores.txt");
      String line = null;
      int savedHighscore = 0;
      try {
        while ((line = reader.readLine()) != null) {
          savedHighscore = Integer.parseInt(line);
          
        }
        reader.close();
      } 
      catch (IOException e) {
        e.printStackTrace();
      }
      
      if(savedHighscore > highScore){
        highScore = savedHighscore;
      }

      PrintWriter output = createWriter("highscores.txt");

      if (score > highScore) {
        highScore = score;
        newHighScore = true;
      }

      output.println(highScore);

      output.flush();
      output.close();

      endLoaded = true;
    }

    image(endPic, 0, 0);
    image(gameOverText, 370, 0);
    image(trophy, 410, 460);
    textFont(endFont);
    fill(0, 0, 0);
    text("Press ENTER to restart ", 410, 390);
    textFont(highScoreFont);
    fill(225, 225, 225);
    text("HIGH SCORE: " + highScore, 490, 510);
    textFont(scoreFont);
    text("Score: " + score, 490, 560);
  }

  void drawInstructions(){
    
    if(!instructionsLoaded){
      instructionsFont = createFont("Verdana", 30);
      instructionsLoaded = true;
    }
    background(225, 225, 225);
    
    textFont(instructionsFont); 
    
    text("OBJECTIVE: hoard the toilet paper. \n       Press space to attack.", 370, 450);
    
  }

  void resetGame() {
    if (!isReset) {
      isReset = true;

      isInitialized = false;
      bgMusic.loop();
      motion.monsters.clear();
      characterHealth = 30;
      newHighScore = false;
      characterX = 10;
      characterY = 330;
      motion.gameEnded = false;
      menuLoaded = false;
      healthTextX = 998;
      endLoaded = false;
      instructionsLoaded = false;
      scoreHolder = score;
      score = 0;
      //add invincibility timer, textsixe - make more efficient, reset music, add spray bottle and damage (both character and covid) sound effects, add covid healthbars, complete MENU screen and END screen and add looping music to them.
    }
  }
}
