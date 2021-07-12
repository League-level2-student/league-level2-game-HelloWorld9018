
//Images

PImage background;
PImage RIGHTcharacter;
PImage LEFTcharacter;
PImage toiletPaper;
PImage covidMonster;

PImage healthBar;
PImage heart;

//Booleans

boolean RightVisable = true;

boolean backgroundLEFT = true;

boolean jumping;
boolean airDriftR;
boolean airDriftL;

boolean attacked = false;

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

final int MENU = 0;
final int GAME = 1;
final int END = 2;

int currentState = GAME;

int healthTextX;

//class objects

ObjectMotion motion = new ObjectMotion();
SpawnObjects spawner = new SpawnObjects();
SpecialEffects effects = new SpecialEffects();

//CollisionManager collisionManager
//InputManager inputManager = new InputManager();

void setup() {

  frameRate(70);
  spawner.initialSpawn();
  size(1252, 626);

  time = millis();
  
  healthTextX = 995;
  
}



void draw() {

  //Movement of background
  //println(deviation);
  if (currentState== GAME) {

    motion.backgroundMovement();

    fill(0, 0, 0);
    textSize(50);
    text(" = " + score, 50, 50);
    

    effects.displayCharacterDirection();
  

    spawner.randomToiletSpawn();

    motion.checkIntersection();

    motion.monsterMovement();
    
    effects.displayHealth();
    
  }
  motion.jump();
  //inputManager.keyPressed();

  //updateCurrentState();
}


//ObjectMotion motion = new ObjectMotion();

void keyPressed() {
  if (key == CODED) {

    motion.characterActions();
    //.updateLocation();
  }
  motion.switchScreenState();

 /* for (int i = 0; i < motion.monsters.size(); i++) {

      if (keyCode == TAB && motion.monsters.get(i).withinRange == true) {
        
            motion.monsters.get(i).monsterHealth = motion.monsters.get(i).monsterHealth - 10;
            println("......................................................ATTACK");
        
      
      }
    }
    */
}

//   ATTACK ONLY WITHIN RANGE USING CHECK INTERSECTION METHOD. CHECK INTERSECTION FOR EACH COVID MONSTER USING MONSTERS.GET(I) AND THE FOR LOOP INSIDE MONSTERMOVENT METHOD IN THE OBJECT MOTION CLASS. 
//   SET THE SPECIFIC MONSTER.GET(i)'S BOOLEAN CALLED 'WITHIN RANGE' EQUAL TO TRUE. Move the code from keyReleased method to the proper classes for functionality.

void keyReleased() {
  //if (key == CODED) {
    for (int i = 0; i < motion.monsters.size(); i++) {

      if (keyCode == TAB && motion.monsters.get(i).withinRange == true) {

        motion.monsters.get(i).monsterHealth = motion.monsters.get(i).monsterHealth - 1;
        println("......................................................ATTACK");
      }
    }
  //}
}
