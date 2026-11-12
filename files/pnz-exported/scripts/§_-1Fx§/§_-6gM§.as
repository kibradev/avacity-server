package §_-1Fx§
{
   import flash.display.Stage;
   import flash.utils.Dictionary;
   
   public class §_-6gM§
   {
      private static const §_-6Z9§:String = "defaultStage";
      
      private static var §_-9f1§:Dictionary = new Dictionary();
      
      public function §_-6gM§()
      {
         super();
      }
      
      public static function getStage(param1:String = "defaultStage") : Stage
      {
         return §_-6gM§.§_-9f1§[param1];
      }
      
      public static function §_-0zv§(param1:Stage, param2:String = "defaultStage") : void
      {
         §_-6gM§.§_-9f1§[param2] = param1;
      }
   }
}

