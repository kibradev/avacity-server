package §_-5Zh§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-B7c§ implements §_-0Yu§
   {
      public static const §_-5im§:String = "cid";
      
      public static const §_-2Jt§:String = "act";
      
      private var _clanId:int;
      
      private var §_-7HR§:int;
      
      public function §_-B7c§()
      {
         super();
      }
      
      public function get activityRating() : int
      {
         return this.§_-7HR§;
      }
      
      public function set activityRating(param1:int) : void
      {
         this.§_-7HR§ = param1;
      }
      
      public function get clanId() : int
      {
         return this._clanId;
      }
      
      public function set clanId(param1:int) : void
      {
         this._clanId = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-5im§,this._clanId);
         param1.put(§_-2Jt§,this.§_-7HR§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this._clanId = param1.getInt(§_-5im§);
         this.§_-7HR§ = param1.getInt(§_-2Jt§);
      }
   }
}

