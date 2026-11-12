package §_-BMw§
{
   import §_-2qd§.§_-9ai§;
   import §_-7Mq§.§_-3rG§;
   import §_-AaI§.§_-2CK§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-Byu§ extends §_-pH§
   {
      private static const §_-1sk§:String = §_-BRJ§.§_-BX-§ + "cev";
      
      private static const §_-1Tf§:String = §_-BRJ§.§_-BX-§ + "clev";
      
      private static const §_-6wc§:String = §_-BRJ§.§_-BX-§ + "cllb";
      
      private static const §_-A1r§:String = §_-BRJ§.§_-BX-§ + "swcr";
      
      public function §_-Byu§()
      {
         super();
         §_-1-t§(§_-1sk§,this.§_-1-h§);
         §_-1-t§(§_-1Tf§,this.§_-1Sd§);
      }
      
      private function §_-1Sd§(param1:§_-9ai§) : void
      {
         var _loc2_:int = param1.data.getInt(§_-74f§.§_-22h§);
         Context.§_-5aD§.§_-B2G§(_loc2_);
      }
      
      private function §_-1-h§(param1:§_-9ai§) : void
      {
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("eventComplainTitle"),Context.§_-5o8§.message("eventComplainComplete"));
         dispatchEvent(new §_-2CK§(§_-2CK§.§_-6r8§));
      }
      
      public function §_-4fm§(param1:String, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-74f§.§_-1Ei§,param1);
         _loc3_.put(§_-74f§.§_-22h§,param2);
         §_-6gl§.sendExtMessage(§_-1sk§,_loc3_);
      }
      
      public function closeCityEvent(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-74f§.§_-22h§,param1);
         §_-6gl§.sendExtMessage(§_-1Tf§,_loc2_);
      }
      
      public function §_-8TD§(param1:String, param2:Boolean) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-3rG§.§_-6Ud§,param1);
         _loc3_.§_-6YJ§(§_-74f§.§_-8vd§,param2);
         §_-6gl§.sendExtMessage(§_-6wc§,_loc3_);
      }
      
      public function §_-7Um§() : void
      {
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         §_-6gl§.sendExtMessage(§_-A1r§,_loc1_);
      }
   }
}

