package §_-C48§
{
   import §_-07d§.§_-6ut§;
   import §_-0bn§.§_-461§;
   import §_-0i0§.§_-5KB§;
   import §_-18o§.§_-4jN§;
   import §_-1Df§.§_-1Rr§;
   import §_-1Df§.§_-AJ8§;
   import §_-1jB§.§_-5Pi§;
   import §_-1sb§.§_-2xb§;
   import §_-2as§.§_-3y6§;
   import §_-41v§.§_-Bn1§;
   import §_-7yD§.§_-8Uh§;
   import §_-99s§.§_-7Tj§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-4OH§;
   import §_-C-a§.§_-3uA§;
   import §_-CGs§.§_-8VW§;
   import §_-GM§.Context;
   
   public class §_-6PQ§ implements §_-3y6§
   {
      public static const §_-Zo§:int = 2;
      
      public static const §_-8N2§:String = "giftContent";
      
      private var §_-6gq§:Object = {};
      
      public function §_-6PQ§()
      {
         super();
      }
      
      public function init() : void
      {
         Context.§_-8Rv§.addEventListener(§_-5Pi§.§_-0BV§,this.§_-1qb§);
         Context.§_-8Rv§.addEventListener(§_-5Pi§.§_-6Nz§,this.§_-6pU§);
         Context.§_-8Rv§.addEventListener(§_-5Pi§.§_-2Wh§,this.§_-3AU§);
         Context.§_-8Rv§.addEventListener(§_-5Pi§.§_-ABv§,this.§_-9o3§);
         Context.§_-8Rv§.addEventListener(§_-5Pi§.§_-A6n§,this.§_-sm§);
      }
      
      public function initGift(param1:§_-48g§) : void
      {
         if(Context.cityPlayer.cityInfo.level < §_-Zo§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("makeGiftDialogTitle"),Context.§_-5o8§.message("giftLevelMessage",{"level":§_-Zo§}));
            return;
         }
         new §_-8Uh§(param1).showModal();
      }
      
      public function makeGiftRequest(param1:§_-7Tj§, param2:§_-5ab§) : void
      {
         Context.§_-8Rv§.makeGiftRequest(param1.typeId,param2.id);
      }
      
      public function §_-Bfi§(param1:§_-7Tj§, param2:§_-5ab§) : void
      {
         Context.§_-8Rv§.§_-Bfi§(param1.typeId,param2.id);
      }
      
      public function §_-3e8§(param1:§_-7Tj§, param2:§_-5ab§) : void
      {
         Context.§_-8Rv§.§_-3e8§(param1.typeId,param2.id);
      }
      
      public function §_-0-i§(param1:String, param2:String, param3:int) : void
      {
         Context.§_-8Rv§.§_-0-i§(param1,param2,param3);
      }
      
      public function §_-9aA§(param1:String, param2:String, param3:String, param4:int) : void
      {
         Context.§_-8Rv§.§_-9aA§(param1,param2,param3,param4);
      }
      
      public function §_-0s0§(param1:String) : Class
      {
         if(param1 == §_-8N2§)
         {
            return §_-AJ8§;
         }
         return null;
      }
      
      public function §_-Cbe§(param1:String, param2:Array) : void
      {
         var _loc3_:§_-AJ8§ = null;
         for each(_loc3_ in param2)
         {
            this.§_-6gq§[_loc3_.typeId] = _loc3_;
         }
      }
      
      public function §_-5ae§(param1:String, param2:int) : Array
      {
         var _loc5_:§_-1Rr§ = null;
         if(!this.§_-1e4§(param1))
         {
            return [];
         }
         var _loc3_:§_-AJ8§ = this.§_-6gq§[param1];
         if(_loc3_ == null)
         {
            return [];
         }
         var _loc4_:Array = [];
         for each(_loc5_ in _loc3_.content)
         {
            if(_loc5_.gender == param2 || _loc5_.gender == 0)
            {
               _loc4_.push(_loc5_);
            }
         }
         return _loc4_;
      }
      
      public function §_-1e4§(param1:String) : Boolean
      {
         return this.§_-6gq§.hasOwnProperty(param1);
      }
      
      private function §_-3AU§(param1:§_-5Pi§) : void
      {
         var _loc2_:int = param1.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
         Context.§_-BlB§.§_-CCK§(new §_-461§(param1.player,Context.§_-5o8§.message("makeGiftNotificationCancelTitle"),Context.§_-5o8§.gender("makeGiftNotificationCancelMessage",_loc2_,{"name":param1.player.avatarAppearance.name}),§_-6ut§.§_-AYV§));
      }
      
      private function §_-6pU§(param1:§_-5Pi§) : void
      {
         var _loc2_:int = 0;
         var _loc3_:§_-7Tj§ = null;
         if(Context.cityPlayer.id != param1.player.id)
         {
            _loc2_ = param1.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
            Context.§_-BlB§.§_-CCK§(new §_-461§(param1.player,Context.§_-5o8§.message("makeGiftNotificationConfirmTitle"),Context.§_-5o8§.gender("makeGiftNotificationConfirmMessage",_loc2_,{"name":param1.player.avatarAppearance.name}),§_-6ut§.§_-AYV§));
            §_-4jN§.play(§_-4jN§.§_-Bjz§);
         }
         else
         {
            _loc3_ = param1.item;
            if(_loc3_ != null && this.§_-Uy§(_loc3_))
            {
               Context.§_-BlB§.§_-CCK§(new §_-5KB§(_loc3_));
            }
         }
      }
      
      private function §_-Uy§(param1:§_-7Tj§) : Boolean
      {
         return Context.§_-70S§.§_-0ZU§().findTypeById(param1.typeId).category.categoryId == §_-Bn1§.§_-512§;
      }
      
      private function §_-sm§(param1:§_-5Pi§) : void
      {
         var _loc2_:String = param1.tag as String;
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("makeGiftNotificationTitle"),Context.§_-5o8§.message("makeGiftNotificationMessage",{"name":_loc2_}));
      }
      
      private function §_-9o3§(param1:§_-5Pi§) : void
      {
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("makeGiftNotificationTitle"),Context.§_-5o8§.message("makeOfflineGiftNotificationMessage"));
      }
      
      private function §_-1qb§(param1:§_-5Pi§) : void
      {
         Context.§_-BlB§.§_-CCK§(new §_-8VW§(param1.player,param1.item));
      }
   }
}

