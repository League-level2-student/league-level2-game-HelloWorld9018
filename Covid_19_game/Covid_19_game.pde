//sound

import ddf.minim.*;
Minim minim = new Minim(this);
AudioPlayer bgMusic;
AudioSample spraySoundEffect;
AudioPlayer menuMusic;
AudioSample gameOverSound;

//Images

PImage background;
PImage RIGHTcharacter;
PImage LEFTcharacter;
PImage toiletPaper;
PImage covidMonster;
PImage newBest;

PImage healthBar;
PImage heart;

PImage menuPic;
PImage endPic;

PImage gameOverText;
PImage trophy;

PImage sprayR;
PImage sprayL;

//Booleans

boolean RightVisable = true;

boolean backgroundLEFT = true;

boolean jumping;
boolean airDriftR;
boolean airDriftL;

boolean attacked = false;

boolean newHighScore = false;

boolean drawingInstructions = false;
int timesTABpressed = 0;

int score = 0;
int backgroundX = 0;
int toiletX = 100;
int characterX = 10;
int characterY = 330;
int characterSpeed = 7;
int jumpingSpeed = 10;
int backgroundSpeed = 3;
int deviation = 0;
float distance = 1252;
int speedValue = 8;

int delayTime = 700;
int time;

int monsterSpawnTime  = 6000;
int time2;

int attackDelayTime = 100;
int time3;

int invincibilityTime = 1000;
int time4;

int itemSpawnTime = 8000;

int toiletHitBoxSize = 50;
int toiletY = 540;

int characterHitBoxSize = 110;

int characterHealth = 30;

int scoreHolder = 0;

int highScore;

final int MENU = 0;
final int GAME = 1;
final int END = 2;

final int INSTRUCTIONS = 6;

int currentState = MENU;

int healthTextX;

PFont tittleFont;
PFont gameFont1;
PFont gameFont2;
PFont endFont;
PFont startFont;
PFont objectiveFont;
PFont highScoreFont;
PFont scoreFont;
PFont instructionsFont;
PFont exitFont;


//class objects

ObjectMotion motion = new ObjectMotion();
SpawnObjects spawner = new SpawnObjects();
SpecialEffects effects = new SpecialEffects();

//CollisionManager collisionManager
//InputManager inputManager = new InputManager();

void setup() {

  frameRate(70);
  //spawner.initialSpawn();
  size(1252, 626);

  time = millis();
  
  
  
  bgMusic = minim.loadFile("Action-background.mp3");
  spraySoundEffect = minim.loadSample("bottle-spray.wav");
  menuMusic  = minim.loadFile("Game-Menu_Looping.mp3");
  gameOverSound = minim.loadSample("Bells2.mp3");
  
}



void draw() {
  
  //motion.switchScreenState();
  
  if(currentState == MENU && drawingInstructions){
    spawner.drawInstructions();
  }
  
  if(currentState == MENU && !drawingInstructions){
     spawner.resetGame();
     // background(255, 0, 0);
      spawner.drawMenu();
      //spawner.isReset = false;
    
    if(bgMusic.isPlaying()){
      bgMusic.pause();
      bgMusic.rewind();
    }
  }
  
  if (currentState== GAME) {
    
    if(menuMusic.isPlaying()){
      menuMusic.pause();
      menuMusic.rewind();
    }
    spawner.initialSpawn();

    motion.backgroundMovement();

    fill(0, 0, 0);
    gameFont1 = createFont("Tahoma", 50);
      textFont(gameFont1);
    //textSize(50);
    //change text font to arial
    text(" = " + score, 50, 50);
    

    effects.displayCharacterDirection();
  

    spawner.randomToiletSpawn();

    motion.checkIntersection();

    motion.monsterMovement();
    
    effects.displayHealth();
    
  }
  
  else if(currentState == END){
        if(bgMusic.isPlaying()){
      bgMusic.pause();
      bgMusic.rewind();
    }
    
  spawner.drawEnd();
 
   //spawner.resetGame();
   spawner.isReset = false;
 
  }
  
  motion.jump();
  //inputManager.keyPressed();

  //updateCurrentState();
}


//ObjectMotion motion = new ObjectMotion();

void keyPressed() {
  if (key == CODED) {

    motion.characterActions();
    
  }
  
  
  
}

//   ATTACK ONLY WITHIN RANGE USING CHECK INTERSECTION METHOD. CHECK INTERSECTION FOR EACH COVID MONSTER USING MONSTERS.GET(I) AND THE FOR LOOP INSIDE MONSTERMOVENT METHOD IN THE OBJECT MOTION CLASS. 
//   SET THE SPECIFIC MONSTER.GET(i)'S BOOLEAN CALLED 'WITHIN RANGE' EQUAL TO TRUE. Move the code from keyReleased method to the proper classes for functionality.

void keyReleased() {
  //if (key == CODED) {
    for (int i = 0; i < motion.monsters.size(); i++) {

      if (key == 32) {
        spraySoundEffect.trigger();
        if(motion.monsters.get(i).withinRange == true){
        motion.monsters.get(i).monsterHealth = motion.monsters.get(i).monsterHealth - 1;
        println("......................................................ATTACK");
        }
      }
    }
  //}
  if(key == ENTER){
    if (currentState == MENU) {
          
          currentState = GAME;
        } else if (currentState == END) {
          currentState = MENU;
        }
  }
  
  
  
  
  if(keyCode == TAB){
    
    //timesTABpressed = 1;
    drawingInstructions = !drawingInstructions;
   // println("TAB is being pressed: " + timesTABpressed + " , "+drawingInstructions);
    

  }
  
}
