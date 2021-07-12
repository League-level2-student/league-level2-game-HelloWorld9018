import java.awt.Rectangle;

class CollisionManager{
  
   int x;
   int y;
   int wideness;
   int tallness;
   
   boolean isActive = true;
   
   Rectangle collisionBox;
  
  CollisionManager(int x, int y, int wideness, int tallness){
    this.x = x;
    this.y = y;
    this.wideness = wideness;
    this.tallness = tallness;
    
    collisionBox = new Rectangle(x, y, wideness, tallness);
    
  }
  
   void updateLocation(int x, int y, int wideness, int tallness){
     collisionBox.setBounds(x, y, wideness, tallness);
     //rect(x, y, wideness, tallness);
   }
  
}
