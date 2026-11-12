package §_-1iV§
{
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   
   public class §_-BkM§
   {
      private static var §_-57E§:§_-42y§;
      
      private static var §_-AkL§:Stage = null;
      
      private static var §_-5Xe§:DisplayObjectContainer = null;
      
      public function §_-BkM§()
      {
         super();
      }
      
      public static function getStage() : Stage
      {
         return §_-BkM§.§_-AkL§;
      }
      
      public static function §_-n1§() : DisplayObjectContainer
      {
         return §_-5Xe§;
      }
      
      public static function §_-Gv§() : §_-42y§
      {
         return §_-57E§;
      }
      
      public static function §_-0zv§(param1:Stage) : void
      {
         §_-AkL§ = param1;
         §_-5Xe§ = param1;
         §_-57E§ = new §_-4TA§(param1);
      }
      
      public static function §_-6pi§(param1:DisplayObjectContainer, param2:§_-42y§) : void
      {
         §_-5Xe§ = param1;
         §_-57E§ = param2;
      }
   }
}

