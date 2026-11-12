package §_-AOH§
{
   import §_-7np§.ConsoleService;
   import §_-7np§.§_-8rk§;
   import §_-ti§.§_-7E1§;
   import §_-ti§.§_-NM§;
   
   public class §_-3J5§ extends §_-2Rj§
   {
      public function §_-3J5§()
      {
         super("clear");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§("clear","Clear console log","clear","client");
         _loc1_.§_-AqZ§("clear","Clear the console log");
         return _loc1_;
      }
      
      override protected function executeClient(param1:Object) : §_-NM§
      {
         ConsoleService.instance.console.clear();
         log("Log cleared",§_-8rk§.COMMAND);
         return new §_-NM§(true,"Log cleared");
      }
   }
}

