package §_-Bwh§
{
   import §_-05v§.§_-9me§;
   import §_-0uA§.§_-3YE§;
   import §_-0yZ§.§_-3qE§;
   import §_-0yZ§.§_-aD§;
   import §_-0z0§.§_-Dz§;
   import §_-1Q2§.§_-5fo§;
   import §_-1t9§.§_-4rn§;
   import §_-1x4§.FacebookAdapter;
   import §_-3TY§.§_-6k2§;
   import §_-52p§.§_-25R§;
   import §_-52p§.§_-8jF§;
   import §_-6BB§.§_-1KD§;
   import §_-6BB§.§_-8BS§;
   import §_-8h6§.GameXPAdapter;
   import §_-A2M§.§_-4Ba§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-B6f§.§_-7Qu§;
   import §_-B6f§.§_-7wF§;
   import §_-BxN§.§_-1fN§;
   import §_-BxN§.§_-1nO§;
   import §_-BxN§.§_-5Eh§;
   import §_-GM§.Context;
   import adept.social.vkontakteIFrame.§_-1MW§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import penzville.Config;
   
   public class §_-AMW§
   {
      public static const §_-1Hf§:int = 100;
      
      public static const §_-20i§:int = 1;
      
      public static const §_-85a§:int = 0;
      
      public static const §_-B7z§:int = 1;
      
      public static const §_-8X2§:int = 2;
      
      public static const §_-72B§:int = 3;
      
      public static const §_-7v8§:int = 4;
      
      public static const §_-6Xv§:int = 5;
      
      public static const §_-5OG§:Array = [1,3,5,10];
      
      private static const §_-A6L§:int = 180000;
      
      private static var §_-8HB§:§_-aD§ = null;
      
      private static var _offerList:Array = null;
      
      private static var _purchase:§_-4rn§ = null;
      
      private static var §_-7Wk§:Boolean = false;
      
      private static var _timer:Timer = null;
      
      private var §_-41k§:Boolean = true;
      
      protected var §_-7Ju§:Boolean = true;
      
      public function §_-AMW§(param1:Boolean = true, param2:Boolean = true)
      {
         super();
         this.§_-41k§ = param1;
         this.§_-7Ju§ = param2;
      }
      
      public static function getOfferList(param1:Function) : void
      {
         var callback:Function = param1;
         if(_offerList == null)
         {
            Context.§_-2BT§.getOfferList(function(param1:Array):void
            {
               _offerList = param1;
               callback(_offerList);
            });
         }
         else
         {
            callback(_offerList);
         }
      }
      
      public static function §_-8Ed§(param1:Boolean, param2:String, param3:int) : void
      {
         var success:Boolean = param1;
         var productId:String = param2;
         var transactionId:int = param3;
         if(!success && _timer != null)
         {
            §_-7Wk§ = false;
            return;
         }
         if(!success && _timer == null)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),§_-3IF§(productId) ? Context.§_-5o8§.message("billingSubscriptionDisableDescription") : Context.§_-5o8§.message("billingDisableDescription"));
            _timer = new Timer(§_-A6L§);
            _timer.addEventListener(TimerEvent.TIMER,§_-9ke§);
            _timer.start();
            §_-7Wk§ = false;
            return;
         }
         if(success && _timer != null)
         {
            _timer.removeEventListener(TimerEvent.TIMER,§_-9ke§);
            _timer.stop();
         }
         if(_purchase == null)
         {
            §_-3YE§.§_-ANW§("purchase is null before send to billing");
            _timer = null;
            §_-7Wk§ = false;
            return;
         }
         if(_purchase.serviceId != productId)
         {
            §_-3YE§.§_-ANW§("purchase has other productId, purchase.serviceId:" + _purchase.serviceId + ", came productId:" + productId);
            _timer = null;
            §_-7Wk§ = false;
            return;
         }
         if(transactionId != 0)
         {
            _purchase.serviceId = String(transactionId);
            §_-40o§("productId",productId);
         }
         if(_timer != null && !§_-7Wk§)
         {
            _timer = null;
            §_-4OH§.confirm(Context.§_-5o8§.message("warning"),§_-3IF§(productId) ? Context.§_-5o8§.message("billingSubscriptionEnableDescription") : Context.§_-5o8§.message("billingEnableDescription"),function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  showPayment(productId);
               }
               else
               {
                  _purchase = null;
               }
            });
            return;
         }
         _timer = null;
         §_-40o§("sid",§_-BkK§());
         if(Context.§_-2BT§.adapter is GameXPAdapter)
         {
            §_-40o§(GameXPAdapter.§_-5NA§,Context.cityPlayer.avatarAppearance.name);
         }
         showPayment(productId);
      }
      
      private static function §_-40o§(param1:String, param2:String) : void
      {
         if(_purchase.tags == null)
         {
            _purchase.tags = {};
         }
         _purchase.tags[param1] = param2;
      }
      
      private static function §_-3IF§(param1:String) : Boolean
      {
         var _loc2_:§_-7wF§ = Context.§_-2hc§.§_-5Yn§(param1);
         return _loc2_ != null ? _loc2_.§_-3IF§ : false;
      }
      
      private static function §_-9ke§(param1:TimerEvent) : void
      {
         Context.§_-pm§.§_-7mp§(_purchase.serviceId,_purchase.quantity,§_-8HB§);
      }
      
      private static function showPayment(param1:String = null) : void
      {
         if(param1 != null && §_-3IF§(param1))
         {
            §_-3PZ§();
         }
         else
         {
            showPaymentBox();
         }
      }
      
      private static function showPaymentBox() : void
      {
         if(Config.§_-0nZ§)
         {
            Context.§_-CLP§.§_-0KB§();
         }
         Context.§_-2BT§.showPaymentBox(_purchase,function(param1:String = null):void
         {
            var _loc2_:Number = Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BOa§ ? 0.05 : Context.§_-2BT§.adapter.pointsRate;
            var _loc3_:Number = _purchase.pointsPrice / Context.§_-2hc§.goldRate * _loc2_ * 100;
            §_-5fo§.instance.purchase(_loc3_);
            _purchase = null;
         },function(param1:§_-1KD§):void
         {
            if(param1.type != §_-1KD§.§_-9cu§)
            {
               §_-3YE§.§_-ANW§("Type: " + param1.type + " Code: " + param1.code + ". Message: " + param1.message,Context.§_-2BT§.adapter.socialNetwork);
            }
            _purchase = null;
         });
      }
      
      private static function §_-3PZ§() : void
      {
         if(Config.§_-0nZ§)
         {
            Context.§_-CLP§.§_-0KB§();
         }
         if(Context.§_-2BT§.adapter is §_-1MW§)
         {
            (Context.§_-2BT§.adapter as §_-1MW§).§_-41W§(_purchase.serviceId,function(param1:String = null):void
            {
               _purchase = null;
            },function(param1:§_-1KD§):void
            {
               if(param1.type != §_-1KD§.§_-9cu§)
               {
                  §_-3YE§.§_-ANW§("Type: " + param1.type + " Code: " + param1.code + ". Message: " + param1.message,Context.§_-2BT§.adapter.socialNetwork);
               }
               _purchase = null;
            });
         }
      }
      
      public static function §_-bl§() : void
      {
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("energyRestoredTitle"),Context.§_-5o8§.message("energyRestoredResult"));
      }
      
      public static function §_-B7i§(param1:int, param2:String = null) : String
      {
         var _loc3_:int = 0;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Number = NaN;
         var _loc11_:§_-Dz§ = null;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         if(Context.§_-2BT§.adapter.§_-A9A§() && param2 != null)
         {
            return Context.§_-2BT§.adapter.§_-5Ki§(param2);
         }
         switch(Context.§_-2BT§.adapter.socialNetwork)
         {
            case §_-8BS§.§_-8Lg§:
               _loc3_ = Context.§_-2BT§.adapter.pointsRate;
               _loc4_ = Math.round(param1 / _loc3_ * 100) / 100;
               return Context.§_-5o8§.plural("eurs",Math.round(_loc4_ / 0.702804 * 100) / 100);
            case §_-8BS§.§_-AVP§:
               if(Context.§_-2BT§.adapter is §_-9me§)
               {
                  _loc7_ = Context.§_-2BT§.adapter.pointsRate;
                  _loc8_ = (Context.§_-2BT§.adapter as §_-9me§).currency;
                  _loc9_ = "rubs";
                  _loc10_ = Math.round(param1 / _loc7_ * 100) / 100;
                  if(_loc8_ == §_-9me§.§_-8b4§)
                  {
                     _loc9_ = "eurs";
                  }
                  else if(_loc8_ == §_-9me§.§_-2xT§)
                  {
                     _loc9_ = "usds";
                  }
                  return Context.§_-5o8§.plural(_loc9_,_loc10_);
               }
            case §_-8BS§.§_-BOa§:
               if(Context.§_-2BT§.adapter is FacebookAdapter)
               {
                  _loc11_ = (Context.§_-2BT§.adapter as FacebookAdapter).§_-1f8§(Context.player.userInfo.socialId);
                  if(_loc11_ == null)
                  {
                     break;
                  }
                  _loc12_ = Context.§_-2BT§.adapter.pointsRate * _loc11_.§_-5rX§;
                  _loc13_ = Math.round(param1 / _loc12_ * 100) / 100;
                  switch(_loc11_.§_-7Nk§)
                  {
                     case "USD":
                        return "$" + _loc13_;
                     default:
                        return _loc13_ + " " + _loc11_.§_-7Nk§;
                  }
               }
         }
         _loc5_ = Context.§_-2BT§.adapter.pointsRate;
         _loc6_ = Math.ceil(param1 / _loc5_);
         return Context.§_-5o8§.plural(Context.§_-2hc§.§_-1Jf§,_loc6_);
      }
      
      public static function §_-9bM§(param1:Number) : String
      {
         var _loc3_:Number = NaN;
         var _loc2_:§_-Dz§ = (Context.§_-2BT§.adapter as FacebookAdapter).§_-1f8§(Context.player.userInfo.socialId);
         if(_loc2_ != null)
         {
            _loc3_ = param1;
            switch(_loc2_.§_-7Nk§)
            {
               case "USD":
                  return "$" + _loc3_;
               default:
                  return _loc3_ + " " + _loc2_.§_-7Nk§;
            }
         }
         else
         {
            return Context.§_-5o8§.plural(Context.§_-2hc§.§_-1Jf§,param1);
         }
      }
      
      public static function §_-AHh§() : Number
      {
         var _loc1_:§_-Dz§ = null;
         if(Context.§_-2BT§.adapter is FacebookAdapter)
         {
            _loc1_ = (Context.§_-2BT§.adapter as FacebookAdapter).§_-1f8§(Context.player.userInfo.socialId);
            if(_loc1_ != null)
            {
               return Context.§_-2BT§.adapter.pointsRate * _loc1_.§_-5rX§;
            }
         }
         return Context.§_-2BT§.adapter.pointsRate;
      }
      
      public static function get §_-Adm§() : Boolean
      {
         var _loc1_:Array = [§_-8BS§.§_-BOa§,§_-8BS§.§_-8Lg§,§_-8BS§.§_-BTG§,§_-8BS§.§_-AVP§,§_-8BS§.§_-Cs§];
         return _loc1_.indexOf(Context.§_-2BT§.adapter.socialNetwork) >= 0;
      }
      
      private static function §_-BkK§() : String
      {
         if(§_-6k2§.§_-7o0§(Config.socialNetwork))
         {
            return §_-6k2§.§_-2pB§(Context.§_-2BT§.adapter.socialNetwork) + ":" + Context.player.userInfo.socialId;
         }
         return Context.player.userInfo.socialId;
      }
      
      public function checkPrice(param1:§_-25R§, param2:§_-aD§ = null) : Boolean
      {
         if(!this.checkEnergy(param1.energy))
         {
            return false;
         }
         if(!this.checkGold(param1.gold,param2))
         {
            return false;
         }
         if(!this.checkSilver(param1.silver,param2))
         {
            return false;
         }
         if(param1 is §_-8jF§)
         {
            if(!this.§_-1Xm§((param1 as §_-8jF§).ruby))
            {
               return false;
            }
            if(!this.§_-7t4§((param1 as §_-8jF§).bones))
            {
               return false;
            }
         }
         return true;
      }
      
      public function checkSilver(param1:int, param2:§_-aD§ = null) : Boolean
      {
         var silver:int = param1;
         var paymentReason:§_-aD§ = param2;
         if(Context.player.resources.silver < silver)
         {
            if(this.§_-7Ju§)
            {
               §_-4OH§.confirm(Context.§_-5o8§.message("notEnoughSilverTitle"),Context.§_-5o8§.message("notEnoughSilverMessage"),function(param1:§_-2-c§):void
               {
                  if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                  {
                     new §_-5Eh§(needSilver(silver)).showModal();
                  }
               });
               if(paymentReason != null && paymentReason.typeId != null)
               {
               }
            }
            else
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughResourcesError"));
            }
            return false;
         }
         return true;
      }
      
      private function needSilver(param1:int) : int
      {
         return Math.max(0,param1 - Context.player.resources.silver);
      }
      
      public function checkGold(param1:int, param2:§_-aD§ = null) : Boolean
      {
         var _loc4_:§_-7wF§ = null;
         var _loc5_:int = 0;
         var _loc3_:int = Context.player.resources.gold;
         if(_loc3_ < param1)
         {
            if(Context.§_-2BT§.adapter.socialNetwork != §_-8BS§.§_-3YZ§)
            {
               _loc5_ = param1 - _loc3_;
               new §_-1nO§(_loc5_,param2).showModal();
               if(param2 != null && param2.typeId != null)
               {
               }
               return false;
            }
            _loc4_ = Context.§_-2hc§.products[0];
            this.§_-9k0§(_loc4_,1,param2);
         }
         return true;
      }
      
      public function §_-1Xm§(param1:int) : Boolean
      {
         var _loc2_:int = Context.player.resources.ruby;
         return _loc2_ >= param1;
      }
      
      public function §_-7t4§(param1:int) : Boolean
      {
         var _loc2_:int = Context.player.resources.bones;
         if(_loc2_ < param1)
         {
            new §_-1fN§().showModal();
            return false;
         }
         return true;
      }
      
      public function §_-9k0§(param1:§_-7wF§, param2:int = 1, param3:§_-aD§ = null) : void
      {
         _purchase = new §_-4rn§();
         _purchase.pointsPrice = param1.points;
         _purchase.exchangeRate = param1.points / §_-AMW§.§_-AHh§() / param1.gold;
         _purchase.description = Context.§_-5o8§.message("goldPurchaseDescription");
         if(param1.ruby > 0)
         {
            _purchase.serviceName = Context.§_-5o8§.plural("memberCoin",param1.ruby);
            if(param1.bonusRuby > 0)
            {
               _purchase.serviceName += ", " + Context.§_-5o8§.message("goldGift",{"gold":param1.bonusRuby});
            }
            §_-40o§("currency","ruby");
         }
         else
         {
            _purchase.serviceName = Context.§_-5o8§.message("goldPurchase",{"gold":Context.§_-5o8§.plural("golds",param1.gold)});
            if(param1.bonusGold > 0)
            {
               _purchase.serviceName += ", " + Context.§_-5o8§.message("goldGift",{"gold":param1.bonusGold});
            }
            §_-40o§("currency","gold");
         }
         _purchase.serviceId = param1.id;
         _purchase.quantity = param2;
         if(param1 is §_-3qE§)
         {
            §_-40o§("pricepoint_id",(param1 as §_-3qE§).§_-5kn§);
         }
         if(Context.§_-2BT§.adapter is GameXPAdapter)
         {
            §_-40o§(GameXPAdapter.§_-5NA§,Context.cityPlayer.avatarAppearance.name);
         }
         §_-7Wk§ = true;
         Context.§_-pm§.§_-7mp§(_purchase.serviceId,_purchase.quantity,param3);
         §_-8HB§ = param3;
      }
      
      public function checkEnergy(param1:int) : Boolean
      {
         if(param1 > Context.player.resources.energy)
         {
            if(this.§_-41k§)
            {
               §_-4OH§.confirm(Context.§_-5o8§.message("notEnoughEnergyTitle"),Context.§_-5o8§.message("notEnoughEnergyMessage",{"gold":Context.§_-5o8§.plural("golds",§_-7Qu§.§_-8UR§)}),this.onRestoreEnergy);
            }
            else
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughResourcesError"));
            }
            return false;
         }
         return true;
      }
      
      public function checkEnergyAsync(param1:int) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var energy:int = param1;
         if(energy > Context.player.resources.energy)
         {
            if(this.§_-41k§)
            {
               task = new §_-4Ba§();
               §_-4OH§.confirm(Context.§_-5o8§.message("notEnoughEnergyTitle"),Context.§_-5o8§.message("notEnoughEnergyMessage",{"gold":Context.§_-5o8§.plural("golds",§_-7Qu§.§_-8UR§)}),function(param1:§_-2-c§):void
               {
                  var event:§_-2-c§ = param1;
                  if(event.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
                  {
                     if(checkGold(§_-7Qu§.§_-8UR§,new §_-aD§(§_-aD§.§_-3Cl§)))
                     {
                        Context.§_-pm§.§_-A6k§(function():void
                        {
                           §_-4OH§.§_-B5P§(Context.§_-5o8§.message("energyRestoredTitle"),Context.§_-5o8§.message("energyRestoredResult"),function(param1:§_-2-c§):void
                           {
                              task.resolve();
                           });
                        });
                     }
                     else
                     {
                        task.reject();
                     }
                  }
                  else
                  {
                     task.reject();
                  }
               });
               return task;
            }
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughResourcesError"));
            §_-4Ba§.reject();
         }
         return §_-4Ba§.resolve();
      }
      
      protected function onRestoreEnergy(param1:§_-2-c§) : void
      {
         if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
         {
            if(this.checkGold(§_-7Qu§.§_-8UR§,new §_-aD§(§_-aD§.§_-3Cl§)))
            {
               Context.§_-pm§.§_-A6k§(§_-bl§);
            }
         }
      }
   }
}

