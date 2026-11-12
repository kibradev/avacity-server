package §_-CF7§
{
   import §_-07O§.§_-9PB§;
   import §_-0Uz§.§_-m3§;
   import §_-0xZ§.§_-4n9§;
   import §_-40e§.§_-B8M§;
   import §_-7OD§.§_-0dP§;
   import §_-7xl§.§_-5m-§;
   import §_-8Hp§.§_-5KD§;
   import §_-8rl§.Relation;
   import §_-9VF§.§_-3t1§;
   import §_-GM§.Context;
   import ags.§_-5x-§;
   
   public class §_-2U6§ extends §_-5m-§ implements §_-m3§
   {
      public static const §_-7U9§:String = "nsPassport";
      
      public static const §_-BNG§:String = "nsPassportDecor";
      
      public static const §_-8N-§:String = "passBg1";
      
      private var _netManager:§_-0qh§ = null;
      
      private var §_-80Z§:Object = {};
      
      private var _passportCallback:Function = null;
      
      public function §_-2U6§()
      {
         super();
         this._netManager = new §_-0qh§();
         this._netManager.addEventListener(§_-B8M§.§_-Bth§,this.§_-6Cv§);
         this._netManager.addEventListener(§_-B8M§.§_-29g§,this.§_-40-§);
         this._netManager.addEventListener(§_-B8M§.§_-0Da§,this.§_-17c§);
         this._netManager.addEventListener(§_-B8M§.§_-7e9§,this.§_-9Sz§);
         this._netManager.addEventListener(§_-B8M§.§_-6Co§,this.§_-AHd§);
      }
      
      public static function §_-1vq§(param1:§_-3t1§) : void
      {
         if(§_-5KD§.instance.getModuleItem(§_-7U9§) != null)
         {
            new §_-4n9§(param1).showModal();
         }
         else
         {
            new §_-0dP§(param1).showModal();
         }
      }
      
      public static function get §_-1oR§() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(§_-BNG§) != null;
      }
      
      public function §_-4l9§(param1:Boolean) : void
      {
         this._netManager.§_-4l9§(param1);
      }
      
      public function §_-BAC§(param1:Boolean) : void
      {
         this._netManager.§_-BAC§(param1);
      }
      
      public function §_-3rm§(param1:String, param2:Function) : void
      {
         this._passportCallback = param2;
         if(Boolean(this.§_-80Z§.hasOwnProperty(param1)) && this._passportCallback != null)
         {
            this._passportCallback(this.§_-80Z§[param1]);
            this._passportCallback = null;
            return;
         }
         this._netManager.§_-CJq§(param1);
      }
      
      public function §_-8Z1§(param1:Function) : void
      {
         var relationUserIds:Array;
         var relation:Relation;
         var passport:§_-3t1§ = null;
         var callback:Function = param1;
         passport = new §_-3t1§();
         passport.userId = Context.cityPlayer.id;
         passport.achievements = Context.cityPlayer.§_-7AS§;
         relationUserIds = [];
         relation = null;
         if(Context.cityPlayer.cityInfo.§_-Mg§ > 0)
         {
            relation = Context.§_-AI9§.§_-112§(Context.cityPlayer.id,String(Context.cityPlayer.cityInfo.§_-Mg§));
            if(relation != null)
            {
               passport.§_-8wi§(String(Context.cityPlayer.cityInfo.§_-Mg§),relation);
               relationUserIds.push(Context.cityPlayer.cityInfo.§_-Mg§);
            }
         }
         else if(Context.cityPlayer.cityInfo.§_-4-7§ > 0)
         {
            relation = Context.§_-AI9§.§_-112§(Context.cityPlayer.id,String(Context.cityPlayer.cityInfo.§_-4-7§));
            if(relation != null)
            {
               passport.§_-8wi§(String(Context.cityPlayer.cityInfo.§_-4-7§),relation);
               relationUserIds.push(Context.cityPlayer.cityInfo.§_-4-7§);
            }
         }
         if(relationUserIds.length > 0)
         {
            Context.§_-3B2§.§_-ADX§(relationUserIds,"selfPassport" + Context.cityPlayer.id,function(param1:Array):void
            {
               callback(passport);
            });
         }
         else
         {
            callback(passport);
         }
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function setTrophy(param1:String) : void
      {
         this._netManager.setTrophy(param1);
      }
      
      public function setPassportDecor(param1:String) : void
      {
         this._netManager.setPassportDecor(param1);
      }
      
      public function §_-BUn§(param1:String) : void
      {
         this._netManager.§_-BUn§(param1);
      }
      
      private function §_-40-§(param1:§_-B8M§) : void
      {
         Context.cityPlayer.cityInfo.§_-0nf§ = param1.§_-6bA§["display"];
      }
      
      private function §_-17c§(param1:§_-B8M§) : void
      {
         Context.cityPlayer.cityInfo.§_-9qn§ = param1.§_-6bA§["display"];
      }
      
      private function §_-9Sz§(param1:§_-B8M§) : void
      {
         var _loc2_:§_-9PB§ = Context.§_-3hG§.currentScreen as §_-9PB§;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.refreshAvatar();
      }
      
      private function §_-6Cv§(param1:§_-B8M§) : void
      {
         var relationUserIds:Array;
         var passport:§_-3t1§ = null;
         var userId:String = null;
         var event:§_-B8M§ = param1;
         passport = event.§_-6bA§ as §_-3t1§;
         this.§_-80Z§[passport.userId] = passport;
         if(this._passportCallback == null)
         {
            return;
         }
         relationUserIds = [];
         if(passport.relations != null)
         {
            for(userId in passport.relations)
            {
               relationUserIds.push(userId);
            }
         }
         if(relationUserIds.length > 0)
         {
            Context.§_-3B2§.§_-ADX§(relationUserIds,"passport" + Context.cityPlayer.id,function(param1:Array):void
            {
               _passportCallback(passport);
               _passportCallback = null;
            });
         }
         else
         {
            this._passportCallback(passport);
            this._passportCallback = null;
         }
      }
      
      private function §_-AHd§(param1:§_-B8M§) : void
      {
         var _loc2_:§_-9PB§ = Context.§_-3hG§.currentScreen as §_-9PB§;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.refreshAvatar();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-B8M§.§_-Bth§,this.§_-6Cv§);
            this._netManager.removeEventListener(§_-B8M§.§_-29g§,this.§_-40-§);
            this._netManager.removeEventListener(§_-B8M§.§_-0Da§,this.§_-17c§);
            this._netManager.removeEventListener(§_-B8M§.§_-7e9§,this.§_-9Sz§);
            this._netManager.removeEventListener(§_-B8M§.§_-6Co§,this.§_-AHd§);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

