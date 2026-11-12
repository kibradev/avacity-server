package §_-BJ1§
{
   import §_-7tj§.§_-HK§;
   import §_-9VF§.§_-48g§;
   import §_-9zI§.§_-Bu9§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-AaI§.§_-2CK§;
   import §_-GM§.Context;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class §_-0r6§
   {
      public static const CHAT_BAN:String = "CHAT_BAN";
      
      public static const EVENT_BAN:String = "EVENT_BAN";
      
      public static const LOBBY_BAN:String = "LOBBY_BAN";
      
      public static const CHAT_COMPLAINT:String = "CHAT_COMPLAINT";
      
      public static const NAME_COMPLAINT:String = "NAME_COMPLAINT";
      
      public static const EVENT_COMPLAINT:String = "EVENT_COMPLAINT";
      
      public static const MESSAGE_TO_USER:String = "MESSAGE_TO_USER";
      
      public static const EXIT_APARTMENTS_BAN:String = "EXIT_APARTMENTS_BAN";
      
      public static const VIEW_ALL_EVENTS:String = "VIEW_ALL_EVENTS";
      
      public static const ABILITY_HIDE_LETTER:String = "ABILITY_HIDE_LETTER";
      
      public static const AVATAR_BAN:String = "AVATAR_BAN";
      
      public static const SHIFT_CLICK:String = "SHIFT_CLICK";
      
      public static const PRIVATE_LIST:String = "PRIVATE_LIST";
      
      public static const FREE_RENAME_ITSELF:String = "FREE_RENAME_ITSELF";
      
      public static const RENAME_AVATAR:String = "RENAME_AVATAR";
      
      public static const USER_ACTIONS_HISTORY:String = "USER_ACTIONS_HISTORY";
      
      public static const MONTH_BAN:String = "MONTH_BAN";
      
      public static const VISIT_TO_LOCK_APARTMENTS:String = "VISIT_TO_LOCK_APARTMENTS";
      
      public static const FIND_ITSELF_BAN:String = "FIND_ITSELF_BAN";
      
      public static const SWITCH_FIREPLACE:String = "SWITCH_FIREPLACE";
      
      public static const CREATE_MODERATOR_EVENT:String = "CREATE_MODERATOR_EVENT";
      
      public static const GO_TO_PROFILE:String = "GO_TO_PROFILE";
      
      public static const ENTER_AS_OTHER_PLAYER:String = "ENTER_AS_OTHER_PLAYER";
      
      public static const FREE_PASS_QUESTS:String = "FREE_PASS_QUESTS";
      
      public static const GET_OFFER:String = "GET_OFFER";
      
      public static const LOOK_SOMETHING:String = "LOOK_SOMETHING";
      
      public static const SKIP_WORK_SESSION:String = "SKIP_WORK_SESSION";
      
      public static const OPEN_GIFTS:String = "OPEN_GIFTS";
      
      public static const EDIT_CLOTHES_POST:String = "EDIT_CLOTHES_POST";
      
      public static const EDIT_FURNITURE_POST:String = "EDIT_FURNITURE_POST";
      
      public static const CHECK_SOCIAL_API:String = "CHECK_SOCIAL_API";
      
      public static const RELATION_TEST_PANEL:String = "RELATION_TEST_PANEL";
      
      public static const BUY_CURRENCY:String = "BUY_CURRENCY";
      
      public static const GIFT_ITEMS:String = "GIFT_ITEMS";
      
      public static const TRADE_ITEMS:String = "TRADE_ITEMS";
      
      public static const PLAY_HOCKEY:String = "PLAY_HOCKEY";
      
      public static const SNOW_SLOPE:String = "SNOW_SLOPE";
      
      public static const SKATE:String = "SKATE";
      
      public static const GLAD_EMOTIONS:String = "GLAD_EMOTIONS";
      
      public static const DANCE:String = "DANCE";
      
      public static const POSITIVE_INTERACTIONS:String = "POSITIVE_INTERACTIONS";
      
      public static const KISS:String = "KISS";
      
      public static const RELATIONS:String = "RELATIONS";
      
      public static const CREATE_EVENT:String = "CREATE_EVENT";
      
      public static const AVA_DANCERS:String = "AVA_DANCERS";
      
      public static const GAME_PVP_MODE:String = "GAME_PVP_MODE";
      
      private var §_-B1y§:Array = [];
      
      public function §_-0r6§()
      {
         super();
         Context.§_-9do§.addEventListener(§_-2CK§.§_-1jk§,this.§_-23U§);
      }
      
      private function §_-23U§(param1:§_-2CK§) : void
      {
         var _loc5_:§_-Bu9§ = null;
         var _loc2_:String = param1.privilege;
         var _loc3_:Boolean = param1.success;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc4_:Array = [];
         for each(_loc5_ in this.§_-B1y§)
         {
            if(_loc5_.privilege != _loc2_)
            {
               _loc4_.push(_loc5_);
            }
            else if(_loc3_ && _loc5_.successCallback != null)
            {
               _loc5_.successCallback();
            }
            else if(!_loc3_ && _loc5_.errorCallback != null)
            {
               _loc5_.errorCallback();
            }
         }
         this.§_-B1y§ = _loc4_;
      }
      
      public function §_-7IX§(param1:String) : Boolean
      {
         var _loc2_:int = Context.player.userInfo.role;
         var _loc3_:int = Context.player.level;
         var _loc4_:§_-HK§ = Context.§_-2ap§.getComponent(§_-HK§);
         if(_loc4_ != null)
         {
            return _loc4_.§_-3eK§(_loc2_,param1,_loc3_);
         }
         return false;
      }
      
      public function §_-254§(param1:§_-48g§, param2:String) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         var _loc3_:§_-HK§ = Context.§_-2ap§.getComponent(§_-HK§);
         if(_loc3_ == null)
         {
            return false;
         }
         return _loc3_.§_-3eK§(param1.userInfo.role,param2,param1.level);
      }
      
      public function §_-7yj§(param1:String, param2:Function, param3:Function = null) : void
      {
         var _loc5_:§_-Bu9§ = null;
         if(!this.§_-7IX§(param1))
         {
            if(param3 != null)
            {
               param3();
            }
            return;
         }
         var _loc4_:§_-Bu9§ = new §_-Bu9§(param1,param2,param3);
         for each(_loc5_ in this.§_-B1y§)
         {
            if(_loc5_.privilege == param1)
            {
               return;
            }
         }
         this.§_-B1y§.push(_loc4_);
         Context.§_-9do§.§_-0JP§(_loc4_);
      }
      
      public function §_-1Js§() : void
      {
         §_-4OH§.confirm(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("unauthorizedAuthDescription"),function(param1:§_-2-c§):void
         {
            var _loc2_:String = null;
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               _loc2_ = Context.§_-2BT§.adapter.authUrl;
               if(_loc2_ != null && _loc2_ != "")
               {
                  navigateToURL(new URLRequest(_loc2_),"_top");
               }
            }
         });
      }
   }
}

