package §_-8i3§
{
   import §_-18o§.§_-A8q§;
   import §_-4cY§.§_-Akc§;
   import §_-8I6§.§_-4Nn§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-XJ§ implements §_-0Yu§
   {
      public static const §_-1mS§:uint = 3;
      
      public static const §_-95F§:String = "lcktp";
      
      public static const §_-8To§:String = "lt";
      
      public static const §_-AiR§:String = "l";
      
      public static const §_-1lk§:String = "kc";
      
      public static const §_-3vz§:String = "lft";
      
      public static const §_-4zy§:String = "r";
      
      public static const §_-6mG§:Array = [{
         "silver":0,
         "gold":0,
         "time":1800
      },{
         "silver":1500,
         "gold":0,
         "time":7200
      },{
         "silver":0,
         "gold":10,
         "time":43200
      }];
      
      private var §_-CBo§:Array = [];
      
      private var §_-3dP§:Number = 0;
      
      private var §_-2HB§:Boolean = true;
      
      public function §_-XJ§()
      {
         super();
      }
      
      public function addRoom(param1:§_-2E0§) : void
      {
         if(this.hasRoom(param1.id))
         {
            return;
         }
         this.§_-CBo§.push(param1);
      }
      
      public function get roomList() : Array
      {
         return this.§_-CBo§;
      }
      
      public function get livingroom() : §_-2E0§
      {
         return this.getRoom(§_-4Nn§.§_-548§);
      }
      
      public function getRoom(param1:String) : §_-2E0§
      {
         var _loc2_:§_-2E0§ = null;
         for each(_loc2_ in this.§_-CBo§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function hasRoom(param1:String) : Boolean
      {
         return this.getRoom(param1) != null;
      }
      
      public function get locked() : Boolean
      {
         return new Date().getTime() / 1000 < this.lockTime;
      }
      
      public function lock(param1:Number) : void
      {
         this.lockTime = new Date().getTime() / 1000 + param1;
      }
      
      public function unlock() : void
      {
         this.lockTime = 0;
      }
      
      public function get lockTime() : Number
      {
         return this.§_-3dP§;
      }
      
      public function set lockTime(param1:Number) : void
      {
         this.§_-3dP§ = param1;
      }
      
      public function get initial() : Boolean
      {
         return this.§_-2HB§;
      }
      
      public function set initial(param1:Boolean) : void
      {
         this.§_-2HB§ = param1;
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-3dP§ = param1.§_-1hz§(§_-8To§,0);
         this.§_-CBo§ = param1.§_-Bc6§(§_-4zy§,§_-2E0§);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-8To§,this.§_-3dP§);
         param1.§_-3f6§(§_-4zy§,this.§_-CBo§);
      }
      
      public function clone() : §_-XJ§
      {
         return §_-A8q§.§_-7t§(this);
      }
      
      public function getFurnitureCount(param1:String) : int
      {
         var _loc3_:§_-2E0§ = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-CBo§)
         {
            _loc2_ += _loc3_.getFurnitureCount(param1);
         }
         return _loc2_;
      }
      
      public function getFurnitureCountByCategoryId(param1:String) : int
      {
         var _loc3_:§_-2E0§ = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.§_-CBo§)
         {
            _loc2_ += _loc3_.getFurnitureCountByCategoryId(param1);
         }
         return _loc2_;
      }
      
      public function readOnlyLink() : §_-XJ§
      {
         return new §_-7vB§(this);
      }
      
      public function §_-3PB§(param1:int) : §_-Akc§
      {
         var _loc2_:§_-2E0§ = null;
         var _loc3_:§_-Akc§ = null;
         for each(_loc2_ in this.roomList)
         {
            _loc3_ = _loc2_.getFurniture(param1);
            if(_loc3_ != null)
            {
               return _loc3_;
            }
         }
         return null;
      }
   }
}

