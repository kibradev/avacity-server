package §_-5eM§
{
   import §_-18o§.§_-ABX§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-5jU§ implements §_-8d2§
   {
      public static const §_-JN§:String = "id";
      
      private static const §_-2Es§:String = "t";
      
      private static const §_-5Od§:String = "c";
      
      private static const §_-3K§:String = "tc";
      
      private static const §_-lS§:String = "l";
      
      private static const §_-FC§:String = "p";
      
      private static const §_-CWD§:String = "a";
      
      private var §_-6Og§:String = null;
      
      private var §_-5xz§:§_-5jU§ = null;
      
      private var §_-B2y§:Object = {};
      
      private var §_-5yg§:Object = {};
      
      private var §_-5ZK§:String = null;
      
      private var §_-8Ma§:Object = {};
      
      private var _label:String = null;
      
      private var _priority:int = 0;
      
      public var §_-BlF§:§_-4Z7§ = null;
      
      private var §_-ASf§:Object = null;
      
      public function §_-5jU§()
      {
         super();
      }
      
      public function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-5jU§ = null;
         var _loc4_:XML = null;
         var _loc5_:§_-5d-§ = null;
         var _loc6_:XML = null;
         var _loc7_:String = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-6Og§ = param1["@id"];
         if(param1.hasOwnProperty("@typeClass"))
         {
            this.§_-5ZK§ = param1["@typeClass"];
         }
         if(param1.hasOwnProperty("@label"))
         {
            this._label = param1["@label"];
         }
         if(param1.hasOwnProperty("@priority"))
         {
            this._priority = parseInt(param1["@priority"]);
         }
         this.§_-8Ma§ = {};
         for each(_loc2_ in param1.attributes())
         {
            _loc7_ = _loc2_.localName();
            this.§_-8Ma§[_loc7_] = String(param1["@" + _loc7_]);
         }
         _loc3_ = null;
         for each(_loc4_ in param1.elements("category"))
         {
            _loc3_ = new §_-5jU§();
            _loc3_.categoryId = _loc4_["@id"];
            this.§_-184§(_loc3_);
            _loc3_.loadXML(_loc4_);
         }
         _loc5_ = null;
         for each(_loc6_ in param1.elements("item"))
         {
            _loc5_ = this.§_-BlF§.§_-2F4§(this.§_-1gW§);
            _loc5_.typeId = _loc6_["@id"];
            _loc5_.loadXML(_loc6_);
            this.§_-AVx§(_loc5_);
         }
         this.§_-ASf§ = null;
      }
      
      public function §_-184§(param1:§_-5jU§) : void
      {
         if(param1.categoryId == null)
         {
            throw new Error("Category id is not defined");
         }
         if(param1.parent != null)
         {
            throw new Error("Category already have parent");
         }
         this.§_-B2y§[param1.categoryId] = param1;
         param1.parent = this;
         param1.§_-BlF§ = this.§_-BlF§;
         this.§_-ASf§ = null;
      }
      
      public function §_-CYX§() : void
      {
         var _loc1_:§_-5jU§ = null;
         this.§_-ASf§ = null;
         for each(_loc1_ in this.§_-B2y§)
         {
            _loc1_.§_-CYX§();
         }
      }
      
      public function getCategory(param1:String) : §_-5jU§
      {
         return this.§_-B2y§[param1];
      }
      
      public function get categories() : Object
      {
         return this.§_-B2y§;
      }
      
      public function get types() : Object
      {
         return this.§_-5yg§;
      }
      
      public function §_-AVx§(param1:§_-5d-§) : void
      {
         if(param1.typeId == null)
         {
            throw new Error("Type id is not defined");
         }
         this.§_-5yg§[param1.typeId] = param1;
         param1.category = this;
         param1.§_-BlF§ = this.§_-BlF§;
         this.§_-ASf§ = null;
      }
      
      public function §_-B6p§(param1:String) : §_-5d-§
      {
         return !!this.§_-5yg§.hasOwnProperty(param1) ? this.§_-5yg§[param1] : null;
      }
      
      public function get allChildTypes() : Object
      {
         var _loc2_:§_-5jU§ = null;
         if(this.§_-ASf§ != null)
         {
            return this.§_-ASf§;
         }
         this.§_-ASf§ = {};
         var _loc1_:§_-5d-§ = null;
         for each(_loc1_ in this.§_-5yg§)
         {
            this.§_-ASf§[_loc1_.typeId] = _loc1_;
         }
         for each(_loc2_ in this.§_-B2y§)
         {
            for each(_loc1_ in _loc2_.allChildTypes)
            {
               this.§_-ASf§[_loc1_.typeId] = _loc1_;
            }
         }
         return this.§_-ASf§;
      }
      
      public function findTypeById(param1:String) : §_-5d-§
      {
         if(this.allChildTypes.hasOwnProperty(param1))
         {
            return this.allChildTypes[param1];
         }
         return null;
      }
      
      public function findCategoryById(param1:String) : §_-5jU§
      {
         var _loc3_:§_-5jU§ = null;
         if(this.§_-B2y§.hasOwnProperty(param1))
         {
            return this.§_-B2y§[param1];
         }
         var _loc2_:§_-5jU§ = null;
         for each(_loc3_ in this.§_-B2y§)
         {
            _loc2_ = _loc3_.findCategoryById(param1);
            if(_loc2_ != null)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function findParentById(param1:String) : §_-5jU§
      {
         if(this.categoryId == param1)
         {
            return this;
         }
         return this.parent != null ? this.parent.findParentById(param1) : null;
      }
      
      public function get categoryId() : String
      {
         return this.§_-6Og§;
      }
      
      public function set categoryId(param1:String) : void
      {
         this.§_-6Og§ = param1;
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function set label(param1:String) : void
      {
         this._label = param1;
      }
      
      public function get priority() : int
      {
         return this._priority;
      }
      
      public function set priority(param1:int) : void
      {
         this._priority = param1;
      }
      
      public function get parent() : §_-5jU§
      {
         return this.§_-5xz§;
      }
      
      public function set parent(param1:§_-5jU§) : void
      {
         this.§_-5xz§ = param1;
      }
      
      public function get localizedLabel() : String
      {
         return §_-ABX§.§_-631§(this.label);
      }
      
      public function get §_-1gW§() : String
      {
         if(this.§_-5ZK§ != null)
         {
            return this.§_-5ZK§;
         }
         if(this.§_-5xz§ != null)
         {
            return this.§_-5xz§.§_-1gW§;
         }
         return null;
      }
      
      public function getAttribute(param1:String) : *
      {
         if(this.§_-8Ma§ == null || !this.§_-8Ma§.hasOwnProperty(param1))
         {
            if(this.§_-5xz§ != null)
            {
               return this.§_-5xz§.getAttribute(param1);
            }
            return null;
         }
         return this.§_-8Ma§[param1];
      }
      
      public function §_-1Jj§(param1:String, param2:*) : void
      {
         if(this.§_-8Ma§ == null)
         {
            this.§_-8Ma§ = {};
         }
         this.§_-8Ma§[param1] = param2;
      }
      
      public function §_-5wx§(param1:String) : Boolean
      {
         if(this.§_-8Ma§ == null || !this.§_-8Ma§.hasOwnProperty(param1))
         {
            if(this.§_-5xz§ != null)
            {
               return this.§_-5xz§.§_-5wx§(param1);
            }
            return false;
         }
         return true;
      }
      
      public function get attributes() : Object
      {
         return this.§_-8Ma§;
      }
      
      public function set attributes(param1:Object) : void
      {
         this.§_-8Ma§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-6Og§ = param1.getString(§_-JN§);
         this._label = param1.getString(§_-lS§,null);
         this.§_-5ZK§ = param1.getString(§_-3K§,null);
         this._priority = param1.getInt(§_-FC§,0);
         var _loc2_:§_-4Ww§ = param1.§_-ANw§(§_-CWD§);
         this.§_-8Ma§ = _loc2_ != null ? _loc2_.toObject() : {};
         this.§_-B2y§ = {};
         this.§_-Cb6§(param1);
         this.§_-5yg§ = {};
         this.§_-YH§(param1);
      }
      
      public function §_-Cb6§(param1:§_-4Ww§) : void
      {
         var _loc3_:String = null;
         var _loc4_:§_-5jU§ = null;
         var _loc2_:§_-4Ww§ = param1.§_-ANw§(§_-5Od§);
         for each(_loc3_ in _loc2_.keys)
         {
            _loc4_ = new §_-5jU§();
            _loc4_.categoryId = _loc3_;
            this.§_-184§(_loc4_);
            _loc4_.fromAGSObject(_loc2_.§_-ANw§(_loc3_));
         }
      }
      
      public function §_-YH§(param1:§_-4Ww§) : void
      {
         var _loc3_:String = null;
         var _loc4_:§_-4Ww§ = null;
         var _loc5_:§_-5d-§ = null;
         var _loc2_:§_-4Ww§ = param1.§_-ANw§(§_-2Es§);
         for each(_loc3_ in _loc2_.keys)
         {
            _loc4_ = _loc2_.§_-ANw§(_loc3_);
            _loc5_ = this.§_-BlF§.§_-2F4§(this.§_-1gW§);
            if(_loc5_ != null)
            {
               _loc5_.fromAGSObject(_loc4_);
               this.§_-AVx§(_loc5_);
            }
         }
      }
   }
}

