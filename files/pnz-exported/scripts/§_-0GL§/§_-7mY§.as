package §_-0GL§
{
   import §_-0Uz§.§_-m3§;
   import §_-39l§.§_-5t6§;
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-AlG§;
   import §_-76Z§.§_-2jg§;
   import §_-9MY§.§_-BL4§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-4OH§;
   import §_-BIp§.§_-4Wl§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-7mY§ extends §_-53f§ implements §_-m3§
   {
      private var §_-Ap2§:Object = {};
      
      private var _netManager:§_-6WC§ = null;
      
      public function §_-7mY§()
      {
         super();
      }
      
      public function init(param1:Class) : void
      {
         this._netManager = new §_-6WC§(param1);
         this._netManager.addEventListener(§_-4d9§.§_-0Nz§,this.§_-BCr§);
         this._netManager.addEventListener(§_-4d9§.§_-Aqn§,this.§_-61O§);
         this._netManager.addEventListener(§_-4d9§.§_-3tz§,this.§_-9Un§);
         this._netManager.addEventListener(§_-4d9§.§_-Bru§,this.§_-9Un§);
         this._netManager.addEventListener(§_-4d9§.§_-Nk§,this.§_-18j§);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      private function §_-BCr§(param1:§_-4d9§) : void
      {
         var event:§_-4d9§ = param1;
         var request:§_-AlG§ = event.§_-6bA§ as §_-AlG§;
         if(request != null)
         {
            if(request.userId.toString() == Context.player.id && request.source == §_-AlG§.§_-9UK§)
            {
               §_-5t6§.instance.§_-pr§(request.clanId,"clanNewRequestNotification",function(param1:Array):void
               {
                  Context.§_-BlB§.§_-CCK§(new §_-4Wl§(§_-4Wl§.§_-8sv§,param1[0]));
               });
            }
            this.§_-Ap2§[request.id] = request;
         }
         dispatchEvent(new §_-4d9§(§_-4d9§.§_-3P2§,null));
      }
      
      private function §_-61O§(param1:§_-4d9§) : void
      {
         var _loc2_:§_-19w§ = param1.§_-6bA§ as §_-19w§;
         if(_loc2_ != null)
         {
            if(_loc2_.status == §_-5t6§.§_-A4I§)
            {
               §_-5t6§.instance.updateClan(_loc2_);
               if(§_-5t6§.instance.§_-49m§(_loc2_))
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.message("clubFullDescription"),Context.§_-5o8§.message("clubFullDescription"));
               }
            }
            else
            {
               §_-5t6§.instance.§_-BZe§(_loc2_);
            }
         }
      }
      
      private function §_-9Un§(param1:§_-4d9§) : void
      {
         this.§_-Ae6§(param1.§_-9iB§);
         dispatchEvent(new §_-4d9§(§_-4d9§.§_-3P2§,null));
      }
      
      private function §_-18j§(param1:§_-4d9§) : void
      {
         var _loc2_:§_-AlG§ = null;
         this.§_-Ap2§ = {};
         if(param1.§_-5DH§.length != 0)
         {
            for each(_loc2_ in param1.§_-5DH§)
            {
               this.§_-Ap2§[_loc2_.id] = _loc2_;
            }
         }
         dispatchEvent(new §_-4d9§(§_-4d9§.§_-3P2§,null));
      }
      
      public function §_-9ui§(param1:int) : void
      {
         this._netManager.§_-9ui§(param1);
      }
      
      public function §_-BtI§(param1:int) : void
      {
         this._netManager.§_-BtI§(param1);
      }
      
      public function §_-3rr§(param1:int, param2:int, param3:int) : void
      {
         if(!this.§_-6AT§(param1))
         {
            return;
         }
         this._netManager.§_-CQS§(param1,param2,param3);
      }
      
      public function §_-B3C§(param1:int) : void
      {
         if(!this.§_-6Wv§(param1,§_-BL4§.APPROVE_NOVICE))
         {
            return;
         }
         this._netManager.§_-Al0§(param1);
      }
      
      public function §_-3eU§(param1:int) : void
      {
         if(!this.§_-6Wv§(param1,§_-BL4§.DELETE_REQUEST))
         {
            return;
         }
         this._netManager.§_-98R§(param1);
      }
      
      public function §_-Bkg§() : void
      {
         this._netManager.§_-Bkg§();
      }
      
      public function §_-pQ§(param1:int) : Boolean
      {
         var _loc2_:§_-AlG§ = null;
         for each(_loc2_ in this.§_-Ap2§)
         {
            if(_loc2_.clanId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-Ax8§(param1:String) : Boolean
      {
         var _loc2_:§_-AlG§ = null;
         for each(_loc2_ in this.§_-Ap2§)
         {
            if(_loc2_.userId == parseInt(param1))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-07V§(param1:int, param2:String) : Boolean
      {
         var _loc3_:§_-AlG§ = null;
         for each(_loc3_ in this.§_-Ap2§)
         {
            if(_loc3_.clanId == param1 && _loc3_.userId == parseInt(param2))
            {
               return true;
            }
         }
         return false;
      }
      
      public function §_-A5T§(param1:int) : Boolean
      {
         var _loc2_:§_-AlG§ = null;
         for each(_loc2_ in this.§_-Ap2§)
         {
            if(_loc2_.id == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      private function §_-6AT§(param1:int) : Boolean
      {
         var _loc2_:§_-5ab§ = Context.§_-3B2§.§_-07a§(param1.toString());
         if(_loc2_ == null)
         {
            return false;
         }
         if(_loc2_.level < §_-5t6§.instance.§_-qf§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("createClanRequestLevelMessage",{"level":§_-5t6§.instance.§_-qf§}));
            return false;
         }
         return true;
      }
      
      private function §_-6Wv§(param1:int, param2:String) : Boolean
      {
         if(!this.§_-Ap2§.hasOwnProperty(param1))
         {
            return false;
         }
         var _loc3_:§_-AlG§ = this.§_-Ap2§[param1];
         var _loc4_:§_-48g§ = Context.cityPlayer;
         if(_loc4_.clanInfo == null)
         {
            if(_loc3_.userId.toString() == _loc4_.id)
            {
               return true;
            }
         }
         else if(_loc4_.clanInfo.clanId == _loc3_.clanId && §_-2jg§.§_-67i§(param2,_loc4_.clanInfo.role))
         {
            return true;
         }
         return false;
      }
      
      private function §_-Ae6§(param1:int) : void
      {
         if(param1 != 0)
         {
            delete this.§_-Ap2§[param1];
         }
      }
      
      public function get §_-p1§() : Object
      {
         return this.§_-Ap2§;
      }
      
      public function §_-AeN§(param1:int) : Array
      {
         var _loc3_:§_-AlG§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-Ap2§)
         {
            if(_loc3_.source == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-AC5§(param1:int, param2:int) : §_-AlG§
      {
         var _loc3_:§_-AlG§ = null;
         for each(_loc3_ in this.§_-Ap2§)
         {
            if(_loc3_.clanId == param1 && _loc3_.userId == param2)
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public function §_-AQ1§(param1:int) : int
      {
         var _loc4_:§_-AlG§ = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         if(param1 == §_-AlG§.§_-9UK§)
         {
            _loc3_ = Context.cityPlayer.cityInfo.§_-8hq§;
         }
         else if(param1 == §_-AlG§.§_-4b9§ && Context.cityPlayer.clanInfo != null)
         {
            _loc3_ = Context.cityPlayer.clanInfo.§_-8hq§;
         }
         for each(_loc4_ in this.§_-AeN§(param1))
         {
            if(_loc4_.§_-7e-§ > _loc3_)
            {
               _loc2_++;
            }
         }
         return _loc2_;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-4d9§.§_-0Nz§,this.§_-BCr§);
            this._netManager.removeEventListener(§_-4d9§.§_-Aqn§,this.§_-61O§);
            this._netManager.removeEventListener(§_-4d9§.§_-3tz§,this.§_-9Un§);
            this._netManager.removeEventListener(§_-4d9§.§_-Bru§,this.§_-9Un§);
            this._netManager.removeEventListener(§_-4d9§.§_-Nk§,this.§_-18j§);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

