package §_-9Nd§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-6p3§.§_-6P1§;
   import §_-859§.§_-7yM§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-GM§.§_-7VH§;
   import §_-bm§.§_-A2B§;
   import §_-ny§.§_-69X§;
   import flash.external.ExternalInterface;
   import penzville.§_-7tX§;
   
   public class §_-C8g§ extends §_-6v4§
   {
      private var §_-5ft§:Boolean = false;
      
      public function §_-C8g§()
      {
         super();
         §_-1-t§(§_-3iv§.ERROR,this.§_-7s0§);
      }
      
      public function set §_-7Vr§(param1:Boolean) : void
      {
         this.§_-5ft§ = param1;
      }
      
      public function §_-4er§(param1:String, param2:Array) : void
      {
         if(§_-6gl§ == null || !§_-6gl§.connected || !§_-6gl§.loggedIn)
         {
            return;
         }
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-3iv§.§_-97f§,param1);
         _loc3_.putString(§_-3iv§.§_-CYa§,param2.join("\r\n"));
         §_-6gl§.sendExtMessage(§_-3iv§.§_-3S6§,_loc3_);
      }
      
      private function §_-7s0§(param1:§_-9ai§) : void
      {
         var error:§_-Abe§ = null;
         var dressCode:String = null;
         var giftLimitCount:String = null;
         var itemId:String = null;
         var event:§_-9ai§ = param1;
         error = new §_-Abe§(§_-Abe§.ERROR);
         error.fromAGSObject(event.data);
         dispatchEvent(error);
         if(error.isDefaultPrevented())
         {
            return;
         }
         if(this.§_-5ft§)
         {
            return;
         }
         if(§_-7VH§.instance.§_-9bL§.§_-6c2§)
         {
            §_-7VH§.instance.§_-9bL§.showPreloader();
         }
         switch(error.code)
         {
            case §_-AHX§.§_-0tV§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughResourcesError"));
               break;
            case §_-AHX§.§_-3hu§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("accessDeny"));
               break;
            case §_-AHX§.§_-xw§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("roomIsFull"),function(param1:§_-2-c§):void
               {
                  Context.§_-CLP§.visitCityHouse();
               });
               break;
            case §_-AHX§.§_-54m§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("serverUpdating"));
               break;
            case §_-AHX§.§_-9wo§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("userBanned"));
               break;
            case §_-AHX§.§_-5H2§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongApiVersion"),function(param1:§_-2-c§):void
               {
                  if(ExternalInterface.available)
                  {
                     ExternalInterface.call("window.location.reload(true)");
                  }
               });
               break;
            case §_-AHX§.§_-sQ§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongIp"));
               break;
            case §_-AHX§.§_-6PZ§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("userOffline"));
               break;
            case §_-AHX§.§_-3vV§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("userNotFound"));
               break;
            case §_-AHX§.§_-Ayb§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("roomIsFull"),function(param1:§_-2-c§):void
               {
                  if(Context.cityPlayer.locationInfo.zone == §_-7tX§.§_-5ii§)
                  {
                     Context.§_-CLP§.§_-CBJ§(parseInt(Context.cityPlayer.locationInfo.group));
                  }
                  else
                  {
                     Context.§_-CLP§.visitCityHouse();
                  }
               });
               break;
            case §_-AHX§.§_-75F§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notVip"));
               break;
            case §_-AHX§.§_-3nd§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughLevel"));
               break;
            case §_-AHX§.§_-5Ud§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughRelationStatuss"));
               break;
            case §_-AHX§.§_-8j5§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongNameLength"));
               break;
            case §_-AHX§.§_-4D2§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("badWordsInName"));
               break;
            case §_-AHX§.§_-2Hf§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("badWordsInDesignation"));
               break;
            case §_-AHX§.§_-4Ru§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("maxItemCount"));
               break;
            case §_-AHX§.§_-0PX§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("tooEarlyNYGiftOpenErrorMessage"));
               break;
            case §_-AHX§.§_-9D2§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongPeriodErrorMessage"));
               break;
            case §_-AHX§.§_-7q-§:
               dressCode = error.§_-2z4§ != null && Boolean(error.§_-2z4§.hasOwnProperty(§_-69X§.§_-CVt§)) ? error.§_-2z4§[§_-69X§.§_-CVt§] : null;
               §_-69X§.§_-2z8§(dressCode);
               break;
            case §_-AHX§.§_-1jJ§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("locationAccessDeniedMessage"),function(param1:§_-2-c§):void
               {
                  if(Context.player != null)
                  {
                     Context.§_-CLP§.visitCityHouse();
                  }
               });
               break;
            case §_-AHX§.§_-Eg§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("eventNotAvailableNotFriend"),function(param1:§_-2-c§):void
               {
                  if(Context.player != null)
                  {
                     Context.§_-CLP§.visitCityHouse();
                  }
               });
               break;
            case §_-AHX§.§_-8eB§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughLevel"),function(param1:§_-2-c§):void
               {
                  if(Context.player != null)
                  {
                     Context.§_-CLP§.visitCityHouse();
                  }
               });
               break;
            case §_-AHX§.§_-8dn§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notEnoughReputation"));
               break;
            case §_-AHX§.§_-2pL§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("captchaFailed"));
               if(Context.player != null)
               {
                  Context.§_-CLP§.visitCityHouse();
               }
               break;
            case §_-AHX§.§_-5Ys§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("tooMuchGifts",{"maxCount":§_-A2B§.§_-6vT§}));
               break;
            case §_-AHX§.§_-5An§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("eventOnCooldown"));
               break;
            case §_-AHX§.§_-B9c§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongText"));
               break;
            case §_-AHX§.§_-BBd§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("actionError"),Context.§_-5o8§.message("blockTransfer"));
               break;
            case §_-AHX§.§_-1kJ§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("actionError"),Context.§_-5o8§.message("blockGifts"));
               break;
            case §_-AHX§.§_-6iF§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("actionError"),Context.§_-5o8§.message("blockTrade"));
               break;
            case §_-AHX§.§_-6Qm§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("actionError"),Context.§_-5o8§.message("maintenanceError"));
               break;
            case §_-AHX§.§_-0Lt§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("actionError"),Context.§_-5o8§.message("vipGiftRejected"));
               break;
            case §_-AHX§.§_-7gq§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("actionError"),Context.§_-5o8§.message("buyVipBlocked"));
               break;
            case §_-AHX§.§_-2-S§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("giftGiveSuspiciousTitle"),Context.§_-5o8§.message("giftGiveSuspiciousMessage"));
               break;
            case §_-AHX§.§_-1DT§:
               giftLimitCount = error.§_-2z4§ != null && Boolean(error.§_-2z4§.hasOwnProperty(§_-7yM§.§_-Brf§)) ? error.§_-2z4§[§_-7yM§.§_-Brf§] : "";
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("giftOpenLimitTitle"),Context.§_-5o8§.message("giftOpenLimitMessage",{"count":giftLimitCount}));
               break;
            case §_-AHX§.§_-7D5§:
               itemId = error.§_-2z4§ != null && Boolean(error.§_-2z4§.hasOwnProperty(§_-7yM§.§_-4I1§)) ? error.§_-2z4§[§_-7yM§.§_-4I1§] : null;
               this.§_-0Fh§(itemId);
               break;
            case §_-AHX§.§_-1Ze§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("wrongLocationError"));
               break;
            case §_-AHX§.§_-2sN§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("reloadNeeded"),function(param1:§_-2-c§):void
               {
                  if(ExternalInterface.available)
                  {
                     ExternalInterface.call("window.location.reload(true)");
                  }
                  if(Context.instance.§_-AIA§.isMobile)
                  {
                     Context.instance.§_-Bao§.logout();
                  }
               });
               break;
            case §_-AHX§.§_-9IW§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("wrongSocialKeyTitle"),Context.§_-5o8§.message("wrongSocialKeyDescription"));
               break;
            case §_-AHX§.§_-AMq§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("invalidPassMessage"));
               break;
            case §_-AHX§.§_-7KH§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("notAvailableForUser"));
               break;
            case §_-AHX§.§_-1xs§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("badWordsWarning"));
               break;
            default:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("unknownError"));
         }
      }
      
      private function §_-0Fh§(param1:String) : void
      {
         if(param1 == null)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("tooFrequentlyRequests"));
            return;
         }
         if(§_-6P1§.§_-2I2§.indexOf(param1) >= 0)
         {
            Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("fireworkManyRequestTitle"),Context.§_-5o8§.message("fireworkManyRequestDesc"));
         }
      }
   }
}

