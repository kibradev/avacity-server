package §_-7vh§
{
   import §_-0Uz§.§_-6v4§;
   import §_-18o§.§_-ABX§;
   import §_-2qd§.§_-9ai§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-1kN§ extends §_-6v4§
   {
      public static const §_-BX-§:String = "cptch";
      
      private static const §_-7Xr§:String = §_-BX-§ + ".ask";
      
      private static const COMMAND_ANSWER:String = §_-BX-§ + ".ans";
      
      public function §_-1kN§()
      {
         super();
         §_-1-t§(§_-7Xr§,this.§_-4sE§);
      }
      
      private function §_-4sE§(param1:§_-9ai§) : void
      {
         var event:§_-9ai§ = param1;
         §_-4OH§.confirm(Context.§_-5o8§.message("captchaTitle"),§_-ABX§.§_-631§(event.data.getString("q")),function(param1:§_-2-c§):void
         {
            var _loc2_:§_-4Ww§ = new §_-4Ww§();
            _loc2_.§_-6YJ§("a",param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§);
            §_-6gl§.sendExtMessage(COMMAND_ANSWER,_loc2_);
         });
      }
   }
}

