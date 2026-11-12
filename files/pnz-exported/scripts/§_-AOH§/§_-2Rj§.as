package §_-AOH§
{
   import §_-ti§.§_-1RU§;
   import §_-ti§.§_-NM§;
   
   public class §_-2Rj§ extends §_-1RU§
   {
      public function §_-2Rj§(param1:String, param2:int = -1)
      {
         super(param1,param2);
      }
      
      override public function execute(param1:Object) : §_-NM§
      {
         var validation:Object;
         var params:Object = param1;
         if(!_descriptor)
         {
            return new §_-NM§(false,"Command descriptor not initialized");
         }
         validation = _descriptor.validateParameters(params);
         if(!validation.valid)
         {
            return new §_-NM§(false,"Parameter validation failed:\n" + validation.errors.join("\n"));
         }
         params = validation.convertedParams;
         try
         {
            return this.executeClient(params);
         }
         catch(e:Error)
         {
            return new §_-NM§(false,"Execution error: " + e.message);
         }
      }
      
      protected function executeClient(param1:Object) : §_-NM§
      {
         return new §_-NM§(false,"Method executeClient not implemented");
      }
   }
}

