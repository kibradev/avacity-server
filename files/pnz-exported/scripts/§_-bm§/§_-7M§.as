package §_-bm§
{
   import §_-03E§.§_-4WA§;
   import §_-5VL§.§_-0H9§;
   import §_-7Mq§.§_-3rG§;
   import §_-90R§.§_-aZ§;
   import §_-9VF§.§_-5ab§;
   import flash.events.Event;
   import flash.geom.Point;
   
   public class §_-7M§ extends Event
   {
      public static const §_-31c§:String = "roomId";
      
      public static const §_-3Ys§:String = "memberId";
      
      public static const §_-2kw§:String = "targetMemberId";
      
      public static const §_-1SZ§:String = "member";
      
      public static const §_-BRs§:String = "members";
      
      public static const §_-6Z-§:String = "sorucePoint";
      
      public static const §_-8oq§:String = "destPoint";
      
      public static const §_-5a§:String = "state";
      
      public static const §_-0E9§:String = "direction";
      
      public static const §_-Ahh§:String = "actionTag";
      
      public static const §_-6Ps§:String = "command";
      
      public static const §_-24l§:String = "tags";
      
      public static const §_-0LW§:String = "roomEvent";
      
      public static const §_-CDg§:String = "getRoomInfo";
      
      public static const §_-CEW§:String = "roomLoaded";
      
      public static const §_-8RF§:String = "refreshRoom";
      
      public static const §_-C5n§:String = "roomRefreshed";
      
      public static const §_-6eT§:String = "refreshAvatar";
      
      public static const §_-§:String = "refreshAvatarClothes";
      
      public static const §_-Xx§:String = "refreshAvatarDrone";
      
      public static const §_-1Sw§:String = "joinRoom";
      
      public static const §_-1cS§:String = "leaveRoom";
      
      public static const MOVE:String = "move";
      
      public static const §_-CMv§:String = "userInteract";
      
      public static const §_-63o§:String = "updateState";
      
      public static const §_-562§:String = "singleAction";
      
      public static const §_-1Gl§:String = "getVisitors";
      
      public static const §_-Bpf§:String = "useSkates";
      
      public static const §_-4wx§:String = "useHockeyEquipment";
      
      public static const §_-1qt§:String = "useSnowboard";
      
      public static const §_-1mb§:String = "hockeyEquipmentTimerExpired";
      
      public static const §_-NG§:String = "groupDanceStart";
      
      public static const §_-2Cm§:String = "dtp";
      
      public static const §_-9Pb§:int = 1;
      
      public static const §_-7dx§:int = 2;
      
      protected var §_-8Fk§:Object = null;
      
      public function §_-7M§(param1:String, param2:Object = null)
      {
         super(param1,false,false);
         this.§_-8Fk§ = param2;
      }
      
      public function get tag() : Object
      {
         return this.§_-8Fk§;
      }
      
      public function get members() : Array
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-BRs§) ? this.§_-8Fk§[§_-BRs§] as Array : [];
      }
      
      public function get member() : §_-5ab§
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-1SZ§) ? this.§_-8Fk§[§_-1SZ§] as §_-5ab§ : null;
      }
      
      public function get memberId() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-3Ys§) ? this.§_-8Fk§[§_-3Ys§] as String : "";
      }
      
      public function get targetMemberId() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-2kw§) ? this.§_-8Fk§[§_-2kw§] as String : "";
      }
      
      public function get roomId() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-31c§) ? this.§_-8Fk§[§_-31c§] as String : "";
      }
      
      public function get §_-6Je§() : Point
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-6Z-§) ? this.§_-8Fk§[§_-6Z-§] as Point : null;
      }
      
      public function get destPoint() : Point
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-8oq§) ? this.§_-8Fk§[§_-8oq§] as Point : null;
      }
      
      public function get state() : int
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-5a§) ? int(this.§_-8Fk§[§_-5a§]) : §_-0H9§.§_-CUz§;
      }
      
      public function get direction() : int
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-0E9§) ? int(this.§_-8Fk§[§_-0E9§]) : §_-aZ§.S;
      }
      
      public function get actionTag() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-Ahh§) ? this.§_-8Fk§[§_-Ahh§] : null;
      }
      
      public function get gameType() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-3rG§.§_-3su§) ? this.§_-8Fk§[§_-3rG§.§_-3su§] : null;
      }
      
      public function get command() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-6Ps§) ? this.§_-8Fk§[§_-6Ps§] : null;
      }
      
      public function get tags() : Object
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-24l§) ? this.§_-8Fk§[§_-24l§] : null;
      }
      
      public function get roomEvent() : §_-4WA§
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-0LW§) ? this.§_-8Fk§[§_-0LW§] : null;
      }
      
      public function get §_-1mE§() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-2Cm§) ? this.§_-8Fk§[§_-2Cm§] as String : null;
      }
   }
}

