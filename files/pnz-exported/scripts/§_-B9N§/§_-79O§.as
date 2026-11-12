package §_-B9N§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-79O§ implements §_-8d2§
   {
      private static const §_-6Ud§:String = "id";
      
      private static const §_-1tE§:String = "userId";
      
      private static const §_-Eh§:String = "banTime";
      
      private static const §_-2Ne§:String = "leftTime";
      
      private static const §_-5-W§:String = "moderatorId";
      
      private static const §_-CaH§:String = "duration";
      
      private static const §_-DZ§:String = "reasonId";
      
      private static const §_-A4p§:String = "unbanType";
      
      private static const §_-0i2§:String = "notes";
      
      public var id:int;
      
      public var userId:int;
      
      public var banTime:Number;
      
      public var leftTime:Number;
      
      public var moderatorId:int;
      
      public var duration:int;
      
      public var reasonId:int;
      
      public var unbanType:String;
      
      public var notes:String;
      
      public function §_-79O§()
      {
         super();
      }
      
      public static function §_-5hp§(param1:§_-4Ww§) : §_-79O§
      {
         var _loc2_:§_-79O§ = new §_-79O§();
         _loc2_.fromAGSObject(param1);
         return _loc2_;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         throw new Error("Not implemented");
      }
      
      public function get §_-20D§() : String
      {
         var _loc1_:int = this.leftTime / 3600000;
         var _loc2_:int = this.leftTime % 3600000 / 60000;
         var _loc3_:* = _loc1_ + ":";
         if(_loc2_ < 10)
         {
            _loc3_ += "0";
         }
         return _loc3_ + _loc2_;
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.id = param1.getInt(§_-6Ud§);
         this.userId = param1.getInt(§_-1tE§);
         this.banTime = param1.§_-0uL§(§_-Eh§);
         this.leftTime = param1.§_-0uL§(§_-2Ne§);
         this.moderatorId = param1.getInt(§_-5-W§);
         this.duration = param1.getInt(§_-CaH§);
         this.reasonId = param1.getInt(§_-DZ§);
         this.unbanType = param1.getString(§_-A4p§);
         this.notes = param1.getString(§_-0i2§);
      }
   }
}

