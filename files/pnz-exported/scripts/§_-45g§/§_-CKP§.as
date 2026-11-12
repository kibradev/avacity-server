package §_-45g§
{
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-1nw§;
   import §_-5qq§.§_-pt§;
   import flash.events.Event;
   
   public class §_-CKP§ extends Event
   {
      public static const §_-Xb§:String = "createClan";
      
      public static const DISMISS_CLAN:String = "dismissClan";
      
      public static const §_-0Zl§:String = "getClanInfo";
      
      public static const §_-4j5§:String = "getClanInfoForPlayer";
      
      public static const §_-3Rr§:String = "getClanJoinRequests";
      
      public static const §_-5nl§:String = "getNews";
      
      public static const §_-04E§:String = "addMember";
      
      public static const §_-40G§:String = "updateMember";
      
      public static const §_-5zj§:String = "updateMembers";
      
      public static const §_-2xo§:String = "updateBannedUsers";
      
      public static const §_-6so§:String = "updateClan";
      
      public static const §_-VX§:String = "removeClan";
      
      public static const §_-MB§:String = "getRating";
      
      public static const §_-AAc§:String = "showClanInfo";
      
      public static const §_-Bu8§:String = "verifyPinCode";
      
      public static const CHANGE_PIN_CODE:String = "changePinCode";
      
      public static const §_-9Yh§:String = "changePrivacyStatus";
      
      public static const §_-2R6§:String = "clanInventoryUpdated";
      
      public static const §_-zJ§:String = "clanLocationLockClick";
      
      public static const §_-607§:String = "clanClothesBought";
      
      public static const §_-1os§:String = "clanAppearanceBought";
      
      public static const §_-7NN§:String = "clanRequestNotification";
      
      public static const §_-3lm§:String = "clanParamChanged";
      
      public static const §_-07y§:String = "clanModel";
      
      public static const §_-8sB§:String = "joinRequests";
      
      public static const §_-4W7§:String = "clanMember";
      
      public static const §_-2Qe§:String = "clanRatingList";
      
      public static const §_-Bs0§:String = "success";
      
      public static const §_-7EW§:String = "error";
      
      public static const §_-9IR§:String = "clanMemberModels";
      
      public static const §_-CJc§:String = "clanInventory";
      
      private var §_-8Fk§:Object = {};
      
      public function §_-CKP§(param1:String, param2:* = null)
      {
         super(param1,false,false);
      }
      
      public function §_-5aN§(param1:String, param2:*) : void
      {
         this.§_-8Fk§[param1] = param2;
      }
      
      public function get clanModel() : §_-19w§
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-07y§) ? this.§_-8Fk§[§_-07y§] as §_-19w§ : null;
      }
      
      public function get §_-7PX§() : Array
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-8sB§) ? this.§_-8Fk§[§_-8sB§] as Array : null;
      }
      
      public function get clanMember() : §_-1nw§
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-4W7§) ? this.§_-8Fk§[§_-4W7§] as §_-1nw§ : null;
      }
      
      public function get clanMemberModels() : Object
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-9IR§) ? this.§_-8Fk§[§_-9IR§] as Object : null;
      }
      
      public function get clanRatingList() : Array
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-2Qe§) ? this.§_-8Fk§[§_-2Qe§] as Array : null;
      }
      
      public function get success() : Boolean
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-Bs0§) ? Boolean(this.§_-8Fk§[§_-Bs0§]) : false;
      }
      
      public function get errorCode() : int
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-7EW§) ? int(this.§_-8Fk§[§_-7EW§]) : 0;
      }
      
      public function get clanInventory() : §_-pt§
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-CJc§) ? this.§_-8Fk§[§_-CJc§] as §_-pt§ : null;
      }
   }
}

