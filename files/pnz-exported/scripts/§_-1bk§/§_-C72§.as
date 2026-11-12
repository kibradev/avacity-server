package §_-1bk§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-2qd§.§_-9tB§;
   import §_-7np§.ConsoleService;
   import §_-7np§.§_-8rk§;
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-NM§;
   import ags.§_-5x-§;
   
   public class §_-C72§ extends §_-6v4§
   {
      public function §_-C72§()
      {
         super();
         §_-1-t§(§_-35A§.§_-4aD§,this.§_-8VS§);
         §_-1-t§(§_-35A§.§_-065§,this.§_-A6R§);
      }
      
      override public function set netClient(param1:§_-5x-§) : void
      {
         if(param1 != null)
         {
            param1.addEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         }
         super.netClient = param1;
      }
      
      private function §_-3vM§(param1:§_-9tB§) : void
      {
         §_-6gl§.sendExtMessage(§_-35A§.§_-065§,new §_-4Ww§());
      }
      
      private function §_-8VS§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString("commandId");
         var _loc3_:§_-NM§ = param1.data.§_-2jV§("result",§_-NM§);
         ConsoleService.instance.§_-8tC§(_loc2_,_loc3_);
      }
      
      public function §_-6M§(param1:String, param2:§_-4Ww§) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put("commandId",param1);
         _loc3_.put("params",param2);
         §_-6gl§.sendExtMessage(§_-35A§.§_-9jC§,_loc3_);
         ConsoleService.instance.log("Send command to server: " + param1,§_-8rk§.INFO);
      }
      
      private function §_-A6R§(param1:§_-9ai§) : void
      {
         var _loc2_:int = param1.data.getInt("level");
         ConsoleService.instance.§_-2oV§(_loc2_);
      }
   }
}

