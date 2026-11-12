package §_-4pB§
{
   import §_-0N8§.§_-0V9§;
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-9M2§.§_-3G5§;
   import §_-GM§.Context;
   
   public class §_-5gH§ extends §_-6v4§
   {
      private var §_-AJB§:int = 0;
      
      private var §_-Cby§:String = "";
      
      public function §_-5gH§()
      {
         super();
         §_-1-t§(§_-0Lu§.§_-9P7§,this.§_-3uJ§);
         var _loc1_:§_-0V9§ = Context.§_-2ap§.getComponent(§_-0V9§);
         if(_loc1_ != null)
         {
            _loc1_.addEventListener(§_-3G5§.§_-2oG§,this.§_-A22§);
         }
      }
      
      private function §_-3uJ§(param1:§_-9ai§) : void
      {
         this.updateStatus(param1.data.getInt(§_-AAM§.§_-9pb§),param1.data.getString(§_-AAM§.§_-6XN§));
      }
      
      private function §_-A22§(param1:§_-3G5§) : void
      {
         this.updateStatus(param1.§_-7e7§,param1.§_-Bnx§);
      }
      
      private function updateStatus(param1:int, param2:String) : void
      {
         this.§_-AJB§ = param1;
         this.§_-Cby§ = param2;
         dispatchEvent(new §_-3G5§(§_-3G5§.§_-9yr§,this.§_-AJB§,this.§_-Cby§));
      }
      
      public function get §_-1IZ§() : int
      {
         return this.§_-AJB§;
      }
      
      public function get §_-Bnx§() : String
      {
         return this.§_-Cby§;
      }
   }
}

