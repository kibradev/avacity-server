package §_-B9N§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-12e§ implements §_-8d2§
   {
      private static const §_-6Ud§:String = "id";
      
      private static const §_-1tE§:String = "userId";
      
      private static const §_-Eh§:String = "mbt";
      
      private static const §_-5-W§:String = "mid";
      
      private static const §_-CaH§:String = "mbd";
      
      private static const §_-0i2§:String = "notes";
      
      private static const §_-6wX§:String = "categoryId";
      
      private var §_-AcP§:String;
      
      private var _userId:String;
      
      private var §_-3Fz§:Number;
      
      private var §_-ATV§:int;
      
      private var §_-9sx§:String;
      
      private var §_-03q§:String;
      
      private var §_-6Og§:int;
      
      public function §_-12e§()
      {
         super();
      }
      
      public static function §_-5hp§(param1:§_-4Ww§) : §_-12e§
      {
         var _loc2_:§_-12e§ = new §_-12e§();
         _loc2_.fromAGSObject(param1);
         return _loc2_;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function set userId(param1:String) : void
      {
         this._userId = param1;
      }
      
      public function get §_-5vw§() : Number
      {
         return this.§_-3Fz§;
      }
      
      public function set §_-5vw§(param1:Number) : void
      {
         this.§_-3Fz§ = param1;
      }
      
      public function get §_-5f9§() : int
      {
         return this.§_-ATV§;
      }
      
      public function set §_-5f9§(param1:int) : void
      {
         this.§_-ATV§ = param1;
      }
      
      public function get moderatorId() : String
      {
         return this.§_-9sx§;
      }
      
      public function set moderatorId(param1:String) : void
      {
         this.§_-9sx§ = param1;
      }
      
      public function get notes() : String
      {
         return this.§_-03q§;
      }
      
      public function set notes(param1:String) : void
      {
         this.§_-03q§ = param1;
      }
      
      public function get categoryId() : int
      {
         return this.§_-6Og§;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.§_-6Og§ = param1;
      }
      
      public function timeLeft(param1:int = 0) : int
      {
         return this.§_-3Fz§ + this.§_-ATV§ * 60 - param1 - Math.floor(new Date().getTime() / 1000);
      }
      
      public function §_-0RM§(param1:int = 0) : Boolean
      {
         return this.timeLeft(param1) > 0;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.id = param1.getString(§_-6Ud§);
         this.userId = param1.getString(§_-1tE§);
         this.moderatorId = param1.getString(§_-5-W§);
         this.§_-5f9§ = param1.getInt(§_-CaH§);
         this.§_-5vw§ = Math.floor(param1.§_-0uL§(§_-Eh§) / 1000);
         this.notes = param1.getString(§_-0i2§);
         this.categoryId = param1.getInt(§_-6wX§);
      }
   }
}

