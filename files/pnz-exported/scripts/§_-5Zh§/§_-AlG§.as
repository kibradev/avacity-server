package §_-5Zh§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-AlG§ implements §_-0Yu§
   {
      public static const §_-4b9§:int = 0;
      
      public static const §_-9UK§:int = 1;
      
      public static const §_-2La§:String = "rid";
      
      public static const §_-1tE§:String = "uid";
      
      public static const §_-8hi§:String = "cid";
      
      public static const §_-rR§:String = "crd";
      
      public static const §_-2ri§:String = "src";
      
      private var §_-AcP§:int;
      
      private var _userId:int;
      
      private var _clanId:int;
      
      private var §_-A9-§:int;
      
      private var _source:int;
      
      public function §_-AlG§()
      {
         super();
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function set userId(param1:int) : void
      {
         this._userId = param1;
      }
      
      public function get clanId() : int
      {
         return this._clanId;
      }
      
      public function set clanId(param1:int) : void
      {
         this._clanId = param1;
      }
      
      public function get §_-7e-§() : int
      {
         return this.§_-A9-§;
      }
      
      public function set §_-7e-§(param1:int) : void
      {
         this.§_-A9-§ = param1;
      }
      
      public function get source() : int
      {
         return this._source;
      }
      
      public function set source(param1:int) : void
      {
         this._source = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-2La§,this.§_-AcP§);
         param1.put(§_-1tE§,this._userId);
         param1.put(§_-8hi§,this._clanId);
         param1.put(§_-rR§,this.§_-A9-§);
         param1.put(§_-2ri§,this._source);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-AcP§ = param1.getInt(§_-2La§);
         this._userId = param1.getInt(§_-1tE§);
         this._clanId = param1.getInt(§_-8hi§);
         this.§_-A9-§ = param1.getInt(§_-rR§);
         this._source = param1.getInt(§_-2ri§);
      }
   }
}

