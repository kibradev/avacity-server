package §_-ti§
{
   import §_-7np§.ConsoleService;
   import §_-7np§.§_-8rk§;
   
   public class §_-1RU§
   {
      protected var §_-C6H§:String;
      
      protected var §_-2WJ§:int = 0;
      
      protected var _descriptor:§_-7E1§;
      
      public function §_-1RU§(param1:String, param2:int)
      {
         super();
         this.§_-C6H§ = param1;
         this.§_-2WJ§ = param2;
         this.§_-8ey§();
      }
      
      public function get commandId() : String
      {
         return this.§_-C6H§;
      }
      
      public function get description() : String
      {
         return !!this._descriptor ? this._descriptor.description : "";
      }
      
      public function get §_-8WU§() : String
      {
         return !!this._descriptor ? this._descriptor.§_-8WU§ : "";
      }
      
      public function get §_-7Of§() : int
      {
         return this.§_-2WJ§;
      }
      
      public function get descriptor() : §_-7E1§
      {
         return this._descriptor;
      }
      
      public function execute(param1:Object) : §_-NM§
      {
         if(!this._descriptor)
         {
            return new §_-NM§(false,"Command descriptor not initialized");
         }
         var _loc2_:Object = this._descriptor.validateParameters(param1);
         if(!_loc2_.valid)
         {
            return new §_-NM§(false,"Parameter validation failed:\n" + _loc2_.errors.join("\n"));
         }
         param1 = _loc2_.convertedParams;
         return new §_-NM§(false,"Метод execute не реализован");
      }
      
      public function §_-172§() : String
      {
         if(this._descriptor)
         {
            return this._descriptor.§_-76L§();
         }
         return "Command descriptor not initialized";
      }
      
      public function §_-A9S§() : String
      {
         if(this._descriptor)
         {
            return this._descriptor.§_-A9S§();
         }
         return "Command descriptor not initialized";
      }
      
      protected function log(param1:String, param2:int = -1) : void
      {
         if(param2 < 0)
         {
            param2 = int(§_-8rk§.COMMAND);
         }
         ConsoleService.instance.log(param1,param2);
      }
      
      protected function createDescriptor() : §_-7E1§
      {
         return null;
      }
      
      protected function §_-8ey§() : void
      {
         this._descriptor = this.createDescriptor();
      }
   }
}

