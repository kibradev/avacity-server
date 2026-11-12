package §_-ByP§
{
   import §_-0CA§.§_-8fk§;
   import §_-18o§.§_-5LJ§;
   import §_-18o§.§_-8-S§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   import §_-GM§.Context;
   
   public class §_-0CV§ implements §_-8d2§
   {
      private var §_-AcP§:int = 0;
      
      private var _type:int = 0;
      
      private var _status:int = 0;
      
      private var §_-88l§:Date = null;
      
      private var §_-7To§:Date = null;
      
      private var §_-1Fm§:String = null;
      
      private var §_-4SM§:Array = null;
      
      private var _visible:Boolean = true;
      
      public function §_-0CV§()
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
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get status() : int
      {
         return this._status;
      }
      
      public function set status(param1:int) : void
      {
         this._status = param1;
      }
      
      public function get §_-BmL§() : Date
      {
         return this.§_-88l§;
      }
      
      public function set §_-BmL§(param1:Date) : void
      {
         this.§_-88l§ = param1;
      }
      
      public function get endDate() : Date
      {
         return this.§_-7To§;
      }
      
      public function set endDate(param1:Date) : void
      {
         this.§_-7To§ = param1;
      }
      
      public function get clientEndDate() : int
      {
         return this.§_-7To§.getTime() / 1000 - Context.player.timeDelta;
      }
      
      public function get imageUrl() : String
      {
         return this.§_-1Fm§;
      }
      
      public function set imageUrl(param1:String) : void
      {
         this.§_-1Fm§ = param1;
      }
      
      public function get campaignItemList() : Array
      {
         return this.§_-4SM§;
      }
      
      public function set campaignItemList(param1:Array) : void
      {
         this.§_-4SM§ = param1;
      }
      
      public function get visible() : Boolean
      {
         return this._visible;
      }
      
      public function getItem(param1:String) : §_-A7b§
      {
         var _loc2_:§_-A7b§ = null;
         var _loc3_:Array = null;
         for each(_loc2_ in this.§_-4SM§)
         {
            _loc3_ = _loc2_.typeId.split(":");
            if(_loc3_[0] == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getItemSection(param1:String) : int
      {
         var _loc2_:§_-A7b§ = this.getItem(param1);
         if(_loc2_ == null)
         {
            throw new Error("Campaign id: " + this.§_-AcP§ + " does not contains item with typeId: " + param1);
         }
         return _loc2_.section;
      }
      
      public function getAppearanceItem(param1:String) : §_-A7b§
      {
         var _loc2_:§_-A7b§ = null;
         for each(_loc2_ in this.§_-4SM§)
         {
            if(_loc2_.typeId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-068§(param1:String, param2:String = "", param3:String = ":", param4:int = 2, param5:int = 1) : String
      {
         var _loc6_:§_-A7b§ = this.getItem(param1);
         if(_loc6_ == null)
         {
            return param2;
         }
         var _loc7_:Array = §_-5LJ§.§_-60E§(_loc6_.typeId,param4,param3);
         if(_loc7_.length <= param5)
         {
            return param2;
         }
         return _loc7_[param5];
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-CZf§("id",this.§_-AcP§);
         param1.§_-CZf§("tp",this._type);
         param1.§_-CZf§("st",this._status);
         param1.§_-6ey§("sd",this.§_-88l§);
         param1.§_-6ey§("ed",this.§_-7To§);
         param1.putString("iu",this.§_-1Fm§);
         param1.§_-3f6§("cil",this.§_-4SM§);
         param1.§_-CZf§("v",this._visible ? 1 : 0);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-AcP§ = param1.getInt("id");
         this._type = param1.getInt("tp");
         this._status = param1.getInt("st");
         this.§_-88l§ = param1.getDate("sd");
         this.§_-7To§ = param1.getDate("ed");
         this.§_-1Fm§ = param1.getString("iu");
         this.§_-4SM§ = param1.§_-Bc6§("cil",§_-A7b§);
         this._visible = param1.getInt("v",1) == 1;
      }
      
      public function hasItems() : Boolean
      {
         return !(this.§_-4SM§ == null || this.§_-4SM§.length == 0);
      }
      
      public function get §_-8Sk§() : Boolean
      {
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         if(this._status == §_-8fk§.§_-1QP§)
         {
            _loc1_ = this.§_-7To§.getTime() / 1000 - Context.player.timeDelta;
            _loc2_ = §_-8-S§.§_-9zq§();
            return _loc2_ < _loc1_;
         }
         return true;
      }
   }
}

