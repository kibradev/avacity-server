package §_-BRr§
{
   import flash.display.SimpleButton;
   
   public class Button extends SimpleButton
   {
      public static const §_-8W6§:uint = 0;
      
      public static const §_-7Cx§:uint = 1;
      
      public static const §_-7Lg§:uint = 2;
      
      internal var bt:uint = 0;
      
      internal var s:String = null;
      
      public function Button(param1:String, param2:int, param3:int, param4:uint)
      {
         super();
         this.x = param2;
         this.y = param3;
         this.bt = param4;
         useHandCursor = true;
         this.label = param1;
      }
      
      public function set label(param1:String) : void
      {
         this.s = param1;
         this.updateButton();
      }
      
      public function get label() : String
      {
         return this.s;
      }
      
      internal function updateButton() : void
      {
      }
   }
}

