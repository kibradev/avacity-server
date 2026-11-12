package §_-45g§
{
   import §_-8tw§.§_-5-F§;
   import flash.events.Event;
   
   public class §_-B97§ extends Event
   {
      public static const §_-zJ§:String = "clanLocationLockClick";
      
      public static const §_-AS9§:String = "clanLocationModelUpdated";
      
      public static const §_-6Z2§:String = "clanLocationGoToRoom";
      
      public static const §_-7tS§:String = "clanLocationGetVisitors";
      
      public static const §_-3BC§:String = "clanLocationKick";
      
      public static const §_-Bc7§:String = "clanLocationFindVisitor";
      
      public static const §_-5xU§:String = "renameRoom";
      
      public static const §_-8hi§:String = "clanId";
      
      public static const §_-6Yg§:String = "clanLocationModel";
      
      public static const §_-LZ§:String = "clanLocationRoomId";
      
      public static const §_-2Lx§:String = "clanLocationVisitors";
      
      public static const §_-6wD§:String = "targetPlayerId";
      
      public static const §_-05J§:String = "roomName";
      
      private var §_-8Fk§:Object = {};
      
      public function §_-B97§(param1:String, param2:* = null)
      {
         super(param1,false,false);
      }
      
      public function §_-5aN§(param1:String, param2:*) : void
      {
         this.§_-8Fk§[param1] = param2;
      }
      
      public function get clanLocationModel() : §_-5-F§
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-6Yg§) ? this.§_-8Fk§[§_-6Yg§] as §_-5-F§ : null;
      }
      
      public function get roomId() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-LZ§) ? this.§_-8Fk§[§_-LZ§] as String : null;
      }
      
      public function get §_-CQ4§() : Object
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-2Lx§) ? this.§_-8Fk§[§_-2Lx§] as Object : {};
      }
      
      public function get targetPlayerId() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-6wD§) ? this.§_-8Fk§[§_-6wD§] as String : "";
      }
      
      public function get roomName() : String
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-05J§) ? this.§_-8Fk§[§_-05J§] as String : "";
      }
      
      public function get clanId() : int
      {
         return !!this.§_-8Fk§.hasOwnProperty(§_-8hi§) ? this.§_-8Fk§[§_-8hi§] as int : 0;
      }
   }
}

