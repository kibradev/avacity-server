package §_-AOH§
{
   import §_-0uA§.§_-3YE§;
   import §_-ti§.§_-2Xl§;
   import §_-ti§.§_-4dj§;
   import §_-ti§.§_-7E1§;
   import §_-ti§.§_-NM§;
   
   public class §_-4xa§ extends §_-2Rj§
   {
      public function §_-4xa§()
      {
         super("loglevel");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = §_-7E1§.§_-2Az§(this,"Print and change log level");
         _loc1_.addParameter(new §_-2Xl§("set","Set log level",§_-4dj§.§_-9cQ§).setRequired(false).setPossibleValues([§_-3YE§.§_-3D5§,§_-3YE§.§_-B9X§,§_-3YE§.§_-7ag§,§_-3YE§.§_-65F§,§_-3YE§.§_-9YL§]));
         return _loc1_;
      }
      
      override protected function executeClient(param1:Object) : §_-NM§
      {
         if(param1["set"] != null)
         {
            §_-3YE§.instance.§_-5Kw§ = param1["set"];
         }
         return new §_-NM§(true,"Current log level: " + §_-3YE§.instance.§_-5Kw§);
      }
   }
}

