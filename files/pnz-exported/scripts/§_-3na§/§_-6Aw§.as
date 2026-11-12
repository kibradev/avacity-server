package §_-3na§
{
   import §_-B9N§.§_-12e§;
   import §_-B9N§.§_-1se§;
   import §_-B9N§.§_-79O§;
   import flash.events.Event;
   
   public class §_-6Aw§ extends Event
   {
      public static const §_-915§:String = "banRequestAdded";
      
      public static const §_-9wo§:String = "userBanned";
      
      public static const §_-1nx§:String = "userUnbanned";
      
      public static const §_-9Z3§:String = "userChatBanned";
      
      public static const §_-5eh§:String = "userChatUnbanned";
      
      public static const §_-CA-§:String = "currentUserChatBanned";
      
      public static const §_-CWd§:String = "currentUserChatUnbanned";
      
      public static const §_-0h6§:String = "checkedUserBan";
      
      public static const §_-3XW§:String = "checkedChatUserBan";
      
      public static const §_-BVi§:String = "updatedUnbanCondition";
      
      public static const §_-7gs§:String = "approvedBanRequest";
      
      public static const §_-E8§:String = "canceledBanRequest";
      
      public static const §_-5Mg§:String = "banRequestListReceived";
      
      public static const §_-8Ic§:String = "approvedBanReview";
      
      public static const §_-0L5§:String = "canceledBanReview";
      
      public static const §_-A4y§:String = "approvedChatBanReview";
      
      public static const §_-7oc§:String = "canceledChatBanReview";
      
      public static const §_-9uQ§:String = "banListReceived";
      
      public static const §_-2am§:String = "chatBanListReceived";
      
      public static const §_-1jk§:String = "accessResponse";
      
      public static const §_-te§:String = "banRequest";
      
      public static const §_-0u-§:String = "bannedUser";
      
      public static const §_-0il§:String = "bannedChatUser";
      
      public static const §_-Bs0§:String = "success";
      
      public static const §_-1tE§:String = "userId";
      
      public static const §_-8I2§:String = "banRequestList";
      
      public static const §_-AR2§:String = "banRequestId";
      
      public static const §_-4L6§:String = "banList";
      
      public static const §_-3dA§:String = "chatBanList";
      
      public static const §_-AFF§:String = "banReviewId";
      
      public static const §_-7Jw§:String = "banReviewId";
      
      public static const §_-C84§:String = "privilege";
      
      private var _data:Object = {};
      
      public function §_-6Aw§(param1:String)
      {
         super(param1);
      }
      
      public function put(param1:String, param2:Object) : §_-6Aw§
      {
         this._data[param1] = param2;
         return this;
      }
      
      public function getParam(param1:String) : *
      {
         return !!this._data.hasOwnProperty(param1) ? this._data[param1] : null;
      }
      
      public function get bannedUser() : §_-79O§
      {
         return this.getParam(§_-0u-§);
      }
      
      public function get bannedChatUser() : §_-12e§
      {
         return this.getParam(§_-0il§);
      }
      
      public function get success() : Boolean
      {
         return this.getParam(§_-Bs0§);
      }
      
      public function get userId() : String
      {
         return this.getParam(§_-1tE§);
      }
      
      public function get banRequest() : §_-1se§
      {
         return this.getParam(§_-te§);
      }
      
      public function get privilege() : String
      {
         return this.getParam(§_-C84§);
      }
   }
}

