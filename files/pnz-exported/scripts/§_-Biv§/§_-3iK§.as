package §_-Biv§
{
   import §_-7np§.ConsoleService;
   import §_-7np§.§_-8rk§;
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-1RU§;
   import §_-ti§.§_-NM§;
   
   public class §_-3iK§ extends §_-1RU§
   {
      public function §_-3iK§(param1:String, param2:int = 5)
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
         if(ConsoleService.instance.netClient == null || !ConsoleService.instance.netClient.connected)
         {
            return new §_-NM§(false,"No connection to server");
         }
         try
         {
            ConsoleService.instance.§_-6M§(§_-C6H§,this.prepareParams(params));
            return new §_-NM§(true,"Command sent to server...");
         }
         catch(e:Error)
         {
            log("Send command to server error: " + e.message,§_-8rk§.ERROR);
            return new §_-NM§(false,"Send command error: " + e.message);
         }
      }
      
      protected function prepareParams(param1:Object) : §_-4Ww§
      {
         return new §_-4Ww§(param1);
      }
      
      public function handleServerData(param1:§_-4Ww§) : void
      {
      }
   }
}

