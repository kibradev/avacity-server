package §_-7os§
{
   import §_-04Y§.§_-14Q§;
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-5Zh§.§_-19w§;
   import §_-5qq§.§_-pt§;
   import §_-8tw§.§_-5-F§;
   import §_-8tw§.§_-C1m§;
   import §_-AMb§.§_-5kU§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-8Zg§ extends §_-6v4§
   {
      public function §_-8Zg§()
      {
         super();
         §_-1-t§(§_-BjH§.§_-3Jo§,this.§_-8Vr§);
      }
      
      private function §_-8Vr§(param1:§_-9ai§) : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            return;
         }
         var _loc2_:§_-pt§ = new §_-pt§();
         _loc2_.fromAGSObject(param1.data.§_-ANw§(§_-9BN§.§_-CJc§));
         var _loc3_:§_-19w§ = §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId);
         if(_loc3_ != null)
         {
            §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId).clanInventory = _loc2_;
         }
         dispatchEvent(new §_-5kU§(§_-5kU§.§_-8Il§,param1.data.§_-2jV§(§_-9BN§.§_-6Cl§,§_-5-F§)));
      }
      
      public function §_-5l5§(param1:Array, param2:String) : void
      {
         var _loc4_:§_-14Q§ = null;
         var _loc5_:§_-4Ww§ = null;
         var _loc3_:§_-1e5§ = new §_-1e5§();
         for each(_loc4_ in param1)
         {
            _loc3_.addObject(_loc4_);
         }
         _loc5_ = new §_-4Ww§();
         _loc5_.put(§_-C1m§.§_-4l5§,_loc3_);
         §_-6gl§.sendExtMessage(§_-BjH§.§_-3Jo§,_loc5_,param2);
      }
   }
}

