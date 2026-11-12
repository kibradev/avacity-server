package §_-CC7§
{
   import §_-0Uz§.§_-6v4§;
   import §_-0VH§.§_-6L§;
   import §_-18o§.§_-8-S§;
   import §_-2qd§.§_-9ai§;
   import §_-39l§.§_-5t6§;
   import §_-5Zh§.§_-19w§;
   import §_-7YM§.§_-4-9§;
   import §_-7YM§.§_-BF2§;
   import §_-7w5§.§_-6J2§;
   import §_-8Hp§.§_-5KD§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BIp§.§_-4Wl§;
   import §_-BVO§.ClanVitalityRequest;
   import §_-BVO§.§_-1M8§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Bm4§.§_-C5l§;
   import §_-GM§.Context;
   
   public class §_-4Mi§ extends §_-6v4§
   {
      public static const §_-50a§:String = "vitalityRequest";
      
      private var §_-Ap2§:§_-1M8§;
      
      private var §_-27I§:int;
      
      private var §_-6jA§:int;
      
      public function §_-4Mi§()
      {
         super();
         §_-1-t§(§_-BF2§.§_-sU§,this.§_-8QV§);
         §_-1-t§(§_-BF2§.§_-5o4§,this.§_-35b§);
         §_-1-t§(§_-BF2§.§_-37I§,this.§_-5Y9§);
         §_-1-t§(§_-BF2§.§_-42e§,this.§_-6cn§);
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-27I§ = param1["vitalityRequest"]["@requestTtl"];
         this.§_-6jA§ = param1["vitalityRequest"]["@maxVitalityForRequest"];
      }
      
      public function isActive() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-50a§);
      }
      
      public function get §_-ABy§() : int
      {
         return this.§_-27I§;
      }
      
      public function get §_-6s6§() : int
      {
         return this.§_-6jA§;
      }
      
      public function §_-7rs§() : void
      {
         var _loc1_:ClanVitalityRequest = null;
         if(!this.isActive())
         {
            return;
         }
         if(this.§_-Ap2§ != null && this.§_-Ap2§.§_-9kd§)
         {
            _loc1_ = this.§_-Ap2§.§_-39d§;
            if(_loc1_ != null)
            {
               this.§_-me§(_loc1_);
            }
            return;
         }
         this.§_-3rr§();
      }
      
      public function §_-3cv§() : void
      {
         var _loc2_:§_-6L§ = null;
         if(this.§_-Ap2§ != null && this.§_-Ap2§.§_-Byy§ + Context.player.timeDelta > §_-8-S§.§_-9zq§() && Context.cityPlayer.§_-28R§(this.§_-Ap2§.clanId))
         {
            _loc2_ = new §_-6L§(§_-6L§.§_-A3j§);
            _loc2_.§_-5aN§(§_-6L§.§_-4L-§,this.§_-Ap2§);
            dispatchEvent(_loc2_);
            return;
         }
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         §_-6gl§.sendExtMessage(§_-BF2§.§_-42e§,_loc1_);
      }
      
      public function §_-BkB§(param1:ClanVitalityRequest) : void
      {
         if(param1 == null || param1.§_-39d§)
         {
            return;
         }
         if(param1.count >= §_-C5l§.§_-8gI§)
         {
            return;
         }
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-4-9§.§_-9Zg§,param1.userId);
         §_-6gl§.sendExtMessage(§_-BF2§.§_-5o4§,_loc2_);
      }
      
      public function §_-me§(param1:ClanVitalityRequest) : void
      {
         var request:ClanVitalityRequest = param1;
         if(request == null || !request.§_-39d§)
         {
            return;
         }
         if(request.count <= 0)
         {
            return;
         }
         §_-4OH§.confirm(Context.§_-5o8§.message("clanBuyConfirmDialogTitle"),Context.§_-5o8§.message("acceptVitalityRequestConfirm",{"vitality":Context.§_-5o8§.plural("vitality",request.count)}),function(param1:§_-2-c§):void
         {
            var _loc2_:§_-4Ww§ = null;
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               _loc2_ = new §_-4Ww§();
               §_-6gl§.sendExtMessage(§_-BF2§.§_-798§,_loc2_);
            }
         });
      }
      
      public function §_-3rr§() : void
      {
         if(!this.isActive())
         {
            return;
         }
         if(this.§_-Ap2§ != null && this.§_-Ap2§.§_-A-x§ && this.§_-9m5§())
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("confirmTitle"),Context.§_-5o8§.message("addVitalityRepeatedRequestAlert"));
            return;
         }
         if(!this.§_-9m5§())
         {
            this.§_-0LH§();
            return;
         }
         §_-4OH§.confirm(Context.§_-5o8§.message("clanBuyConfirmDialogTitle"),Context.§_-5o8§.message("addVitalityRequestConfirmDescription"),function(param1:§_-2-c§):void
         {
            var _loc2_:§_-4Ww§ = null;
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               _loc2_ = new §_-4Ww§();
               _loc2_.§_-CZf§(§_-6J2§.§_-5im§,Context.cityPlayer.clanInfo.clanId);
               §_-6gl§.sendExtMessage(§_-BF2§.§_-sU§,_loc2_);
            }
         });
      }
      
      private function §_-0LH§() : void
      {
         var _loc1_:int = Context.cityPlayer.cityInfo.§_-7qv§ + Context.player.timeDelta - §_-8-S§.§_-9zq§();
         var _loc2_:String = §_-8-S§.§_-2Xf§(_loc1_ * 1000);
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("confirmTitle"),Context.§_-5o8§.message("addVitalityRequestAlert",{"time":_loc2_}));
      }
      
      private function §_-6cn§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-1M8§ = param1.data.§_-2jV§(§_-4-9§.§_-BcK§,§_-1M8§);
         var _loc3_:§_-6L§ = new §_-6L§(§_-6L§.§_-A3j§);
         _loc3_.§_-5aN§(§_-6L§.§_-4L-§,_loc2_);
         dispatchEvent(_loc3_);
         this.§_-Ap2§ = _loc2_;
      }
      
      private function §_-8QV§(param1:§_-9ai§) : void
      {
         var _loc3_:§_-6L§ = null;
         var _loc4_:§_-19w§ = null;
         var _loc2_:ClanVitalityRequest = param1.data.§_-2jV§(§_-4-9§.§_-9Zg§,ClanVitalityRequest);
         if(_loc2_ != null)
         {
            if(this.§_-Ap2§ == null)
            {
               this.§_-Ap2§ = new §_-1M8§();
               this.§_-Ap2§.§_-Byy§ = _loc2_.§_-Byy§;
            }
            this.§_-Ap2§.requests[_loc2_.userId] = _loc2_;
            _loc3_ = new §_-6L§(§_-6L§.§_-A3j§);
            _loc3_.§_-5aN§(§_-6L§.§_-4L-§,this.§_-Ap2§);
            dispatchEvent(_loc3_);
            if(_loc2_.§_-39d§)
            {
               _loc4_ = §_-5t6§.instance.§_-5Dg§(Context.cityPlayer.clanInfo.clanId);
               Context.§_-BlB§.§_-CCK§(new §_-4Wl§(§_-4Wl§.§_-CKt§,_loc4_));
            }
         }
      }
      
      private function §_-35b§(param1:§_-9ai§) : void
      {
         var _loc3_:§_-6L§ = null;
         var _loc2_:ClanVitalityRequest = param1.data.§_-2jV§(§_-4-9§.§_-9Zg§,ClanVitalityRequest);
         if(_loc2_ != null)
         {
            this.§_-Ap2§.requests[_loc2_.userId] = _loc2_;
            _loc3_ = new §_-6L§(§_-6L§.§_-A3j§);
            _loc3_.§_-5aN§(§_-6L§.§_-4L-§,this.§_-Ap2§);
            dispatchEvent(_loc3_);
         }
      }
      
      private function §_-5Y9§(param1:§_-9ai§) : void
      {
         var _loc3_:ClanVitalityRequest = null;
         var _loc4_:§_-6L§ = null;
         var _loc2_:String = param1.data.getString(§_-4-9§.§_-9Zg§);
         if(_loc2_ != null)
         {
            _loc3_ = this.§_-Ap2§.requests[_loc2_];
            this.§_-Ap2§.requests[_loc2_] = null;
            _loc4_ = new §_-6L§(§_-6L§.§_-A3j§);
            _loc4_.§_-5aN§(§_-6L§.§_-4L-§,this.§_-Ap2§);
            dispatchEvent(_loc4_);
         }
      }
      
      private function §_-9m5§() : Boolean
      {
         var _loc1_:int = Context.cityPlayer.cityInfo.§_-7qv§ + Context.player.timeDelta;
         return _loc1_ < §_-8-S§.§_-9zq§();
      }
   }
}

