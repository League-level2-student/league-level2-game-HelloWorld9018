class covidMonster{
  
  int x;
  int y;
  int speed;
  CollisionManager monsterBox;
  boolean passedThru = false;
  
   Rectangle secondBox;
  
  boolean withinRange;
  
  int monsterHealth;
  
  boolean canAttack = true;
  
  covidMonster(int x, int y, int speed){
    
    this.x = x;
    this.y = y;
    this.speed = speed;
    
    monsterBox = new CollisionManager(x, y, 50, 50);
   // image(covidMonster, x, y);
   
    secondBox = new Rectangle(x-200, y, 50+400, 50);
   
   monsterHealth = 8;
   
   
  }
  
  void testDraw(){
    //println("drawing monster" + "X: " + x + "Y: " + y);
  image(covidMonster, x, y);
  
  }
  
  void spawn(){
    
  }
  
}
