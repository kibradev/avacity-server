package §_-CC7§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-0VH§.§_-20N§;
   import §_-2qd§.§_-9ai§;
   import §_-2uN§.§_-4Mo§;
   import §_-39l§.§_-5t6§;
   import §_-5Zh§.§_-19w§;
   import §_-64D§.§_-LU§;
   import §_-6Ak§.§_-BSH§;
   import §_-7YM§.§_-84I§;
   import §_-7YM§.§_-CYR§;
   import §_-7u5§.§_-0vC§;
   import §_-7w5§.§_-6J2§;
   import §_-BVO§.§_-4h0§;
   import §_-BVO§.§_-6Go§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-A4Q§ extends §_-6v4§
   {
      private var §_-7kH§:Array = [];
      
      public function §_-A4Q§()
      {
         super();
         §_-1-t§(§_-CYR§.§_-AZA§,this.§_-A3W§);
         §_-1-t§(§_-CYR§.§_-7Bd§,this.§_-0rj§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-4Mo§ = null;
         for each(_loc2_ in (param1.elements("awards")[0] as XML).elements("award"))
         {
            _loc3_ = new §_-4Mo§();
            _loc3_.configure(_loc2_);
            if(_loc3_.place > 0)
            {
               this.§_-7kH§.push(_loc3_);
            }
         }
      }
      
      public function showHelpDialog() : void
      {
         new §_-BSH§().showModal();
      }
      
      public function §_-3Ec§(param1:int) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-6J2§.§_-5im§,param1);
         §_-6gl§.sendExtMessage(§_-CYR§.§_-43Q§,_loc2_);
      }
      
      public function get §_-4lW§() : Array
      {
         return this.§_-7kH§;
      }
      
      public function §_-8jf§(param1:Boolean) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-6YJ§(§_-84I§.§_-1G2§,param1);
         §_-6gl§.sendExtMessage(§_-CYR§.§_-6tV§,_loc2_);
      }
      
      public function §_-AoT§(param1:§_-LU§) : void
      {
         if(Context.cityPlayer.inventory.gameCollection.getItemCount(param1.typeId) < 1)
         {
            new §_-0vC§(Context.craftManager.§_-3sJ§(param1.typeId),null,true).showModal();
            return;
         }
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-84I§.§_-4I1§,param1.typeId);
         §_-6gl§.sendExtMessage(§_-CYR§.§_-7Bd§,_loc2_);
      }
      
      public function §_-A3W§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4h0§ = param1.data.§_-2jV§(§_-84I§.§_-AtI§,§_-4h0§);
         var _loc3_:int = param1.data.getInt(§_-84I§.§_-8hk§);
         var _loc4_:§_-20N§ = new §_-20N§(§_-20N§.§_-5bl§);
         _loc4_.§_-5aN§(§_-20N§.§_-CEh§,_loc2_);
         _loc4_.§_-5aN§(§_-20N§.§false§,_loc3_);
         dispatchEvent(_loc4_);
      }
      
      private function §_-0rj§(param1:§_-9ai§) : void
      {
         var _loc5_:§_-19w§ = null;
         var _loc2_:§_-6Go§ = param1.data.§_-2jV§(§_-84I§.§_-18k§,§_-6Go§);
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:int = param1.data.getInt(§_-6J2§.§_-5im§);
         if(_loc2_ != null)
         {
            _loc5_ = §_-5t6§.instance.§_-5Dg§(_loc4_);
            if(_loc5_ == null)
            {
               return;
            }
            if(_loc5_.members.hasOwnProperty(parseInt(_loc3_)))
            {
               _loc5_.members[parseInt(_loc3_)].clanMemberContestModel = _loc2_;
            }
         }
      }
   }
}

