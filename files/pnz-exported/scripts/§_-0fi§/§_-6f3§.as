package §_-0fi§
{
   import §_-18o§.§_-ABX§;
   import §_-2U3§.ResourceManager;
   import §_-38A§.§_-9TB§;
   import §_-3DP§.§_-25V§;
   import §_-4cY§.§_-4bg§;
   import §_-4cY§.§_-8Hh§;
   import §_-6-L§.§_-6aF§;
   import §_-7xl§.§_-7VJ§;
   import §_-8ka§.§_-4TN§;
   import §_-90R§.§_-aZ§;
   import §_-99s§.§_-7Tj§;
   import §_-GM§.Context;
   import §_-GM§.§_-5qn§;
   import flash.display.MovieClip;
   import penzville.Config;
   
   public class §_-6f3§ extends §_-7Tj§
   {
      protected var §_-2ZP§:int = 9999;
      
      protected var §_-Ak0§:Array = [];
      
      protected var §_-0cY§:§_-9TB§ = new §_-9TB§();
      
      protected var §_-0Iq§:Object = {};
      
      protected var §_-67f§:Number = 0;
      
      protected var §_-3tg§:Number = 0;
      
      protected var §_-5Z6§:Object = {};
      
      protected var §_-13F§:Array = [];
      
      protected var §_-35X§:int = 0;
      
      protected var §_-8Za§:Object = {};
      
      protected var _level:int = 0;
      
      protected var §_-24q§:String = "";
      
      protected var §_-6gt§:String = null;
      
      protected var §_-5Hd§:String = null;
      
      protected var §_-7Ap§:String = null;
      
      protected var §_-9l8§:§_-9TB§ = null;
      
      protected var §_-4El§:Array = [];
      
      private var §_-XT§:String = null;
      
      private var §_-CTn§:Boolean = false;
      
      private var §_-5qQ§:Boolean = true;
      
      public function §_-6f3§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-2ZP§ = !!param1.hasOwnProperty("@buyCount") ? int(param1["@buyCount"]) : 9999;
         this.§_-Ak0§ = !!param1.hasOwnProperty("@rooms") ? String(param1["@rooms"]).split(",") : [];
         this.§_-13F§ = !!param1.hasOwnProperty("@tags") ? String(param1["@tags"]).split(",") : [];
         this.§_-35X§ = !!param1.hasOwnProperty("@rating") ? int(param1["@rating"]) : 0;
         this._level = !!param1.hasOwnProperty("@level") ? int(param1["@level"]) : 0;
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? String(param1["@description"]) : "";
         this.§_-6gt§ = !!param1.hasOwnProperty("@loadType") ? param1["@loadType"] : null;
         this.§_-5Hd§ = !!param1.hasOwnProperty("@fileVersion") ? param1["@fileVersion"] : null;
         this.§_-7Ap§ = !!param1.hasOwnProperty("@fileName") ? param1["@fileName"] : null;
         this.§_-XT§ = !!param1.hasOwnProperty("@library") ? param1["@library"] : null;
         this.§_-CTn§ = !!param1.hasOwnProperty("@allowAnimation") ? Boolean(param1["@allowAnimation"]) : false;
         this.§_-5qQ§ = !param1.hasOwnProperty("@canExchange") || int(param1["@canExchange"]) == 1;
         if(param1.hasOwnProperty("dimension"))
         {
            this.initDimentions(param1["dimension"][0]);
         }
         if(param1.hasOwnProperty("placement"))
         {
            this.§_-7Qt§(param1["placement"][0]);
         }
         this.§_-0Iq§ = {};
         if(param1.hasOwnProperty("direction"))
         {
            this.§_-eq§(String(param1["direction"][0]["@names"]));
         }
         if(param1.hasOwnProperty("defaultPosition"))
         {
            this.§_-9l8§ = new §_-9TB§();
            this.§_-9l8§.x = param1["defaultPosition"][0]["@x"];
            this.§_-9l8§.y = param1["defaultPosition"][0]["@y"];
            this.§_-9l8§.z = param1["defaultPosition"][0]["@z"];
         }
         if(param1.hasOwnProperty("countLimit"))
         {
            this.§_-70j§(param1["countLimit"]);
         }
         if(param1.hasOwnProperty("components"))
         {
            this.initComponents(new XML(param1["components"]));
         }
      }
      
      private function §_-70j§(param1:XMLList) : void
      {
         var _loc2_:XML = null;
         this.§_-8Za§ = {};
         for each(_loc2_ in param1)
         {
            this.§_-8Za§[parseInt(_loc2_["@count"])] = parseInt(_loc2_["@playerLevel"]);
         }
      }
      
      protected function initDimentions(param1:XML) : void
      {
         var _loc2_:Number = !!param1.hasOwnProperty("@width") ? Number(param1["@width"]) : 0;
         var _loc3_:Number = !!param1.hasOwnProperty("@height") ? Number(param1["@height"]) : 0;
         var _loc4_:Number = !!param1.hasOwnProperty("@length") ? Number(param1["@length"]) : 0;
         this.§_-0cY§ = new §_-9TB§(_loc2_,_loc4_,_loc3_);
         this.§_-67f§ = !!param1.hasOwnProperty("@defaultZ") ? Number(param1["@defaultZ"]) : 0;
         this.§_-3tg§ = !!param1.hasOwnProperty("@sitZ") ? Number(param1["@sitZ"]) : _loc3_;
      }
      
      protected function §_-7Qt§(param1:XML) : void
      {
         var _loc2_:String = null;
         for each(_loc2_ in §_-4bg§.§_-4T7§)
         {
            if(Boolean(param1.hasOwnProperty("@" + _loc2_)) && int(param1["@" + _loc2_]) == 1)
            {
               this.§_-5Z6§[_loc2_] = true;
            }
         }
      }
      
      protected function §_-eq§(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc2_:Array = param1.toLocaleUpperCase().split(",");
         for each(_loc3_ in §_-aZ§.§_-8DB§)
         {
            this.§_-0Iq§[_loc3_] = _loc2_.indexOf(§_-aZ§.§_-9bG§(_loc3_)) >= 0;
         }
      }
      
      private function initComponents(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-4TN§ = null;
         this.§_-4El§ = [];
         for each(_loc2_ in param1.children())
         {
            _loc3_ = §_-25V§.instance.§_-6qA§(_loc2_.name());
            _loc3_.configure(_loc2_);
            this.§_-4El§.push(_loc3_);
         }
      }
      
      public function get componentsList() : Array
      {
         return this.§_-4El§;
      }
      
      public function §_-6qA§(param1:Class) : §_-4TN§
      {
         var _loc2_:§_-4TN§ = null;
         for each(_loc2_ in this.§_-4El§)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get localizedDescription() : String
      {
         return §_-ABX§.§_-631§(this.description);
      }
      
      public function get buyCount() : int
      {
         return this.§_-2ZP§;
      }
      
      public function get tags() : Array
      {
         return this.§_-13F§;
      }
      
      public function hasTag(param1:String) : Boolean
      {
         return this.§_-13F§.indexOf(param1) >= 0;
      }
      
      public function get dimension() : §_-9TB§
      {
         return this.§_-0cY§;
      }
      
      public function get defaultZ() : Number
      {
         return this.§_-67f§;
      }
      
      public function get sitZ() : Number
      {
         return this.§_-3tg§;
      }
      
      public function get directions() : Object
      {
         return this.§_-0Iq§;
      }
      
      public function get defaultPosition() : §_-9TB§
      {
         return this.§_-9l8§;
      }
      
      public function get level() : uint
      {
         return this._level;
      }
      
      override public function get sortType() : String
      {
         return this._level + "_" + typeId;
      }
      
      public function get rating() : int
      {
         return this.§_-35X§ > 0 ? this.§_-35X§ : int(Math.ceil(silver / 100) + Math.floor(gold * 1.7));
      }
      
      public function checkPlacement(param1:String) : Boolean
      {
         return Boolean(this.§_-5Z6§.hasOwnProperty(param1)) && Boolean(this.§_-5Z6§[param1]);
      }
      
      public function get §_-CAz§() : String
      {
         return _name;
      }
      
      public function get allowAnimation() : Boolean
      {
         return this.§_-CTn§;
      }
      
      public function get §_-Cz§() : Boolean
      {
         return this.§_-5qQ§;
      }
      
      override public function createIcon() : MovieClip
      {
         if(§_-8W7§ == null)
         {
            return new MovieClip();
         }
         return ResourceManager.hasDefinition(§_-8W7§) ? ResourceManager.createMovieClip(§_-8W7§) : new MovieClip();
      }
      
      public function createView(param1:int = 0) : MovieClip
      {
         var _loc2_:String = this.§_-CAz§ + (category.findParentById(§_-8Hh§.§_-C0J§) != null ? "" : §_-aZ§.§_-9bG§(param1 == 0 ? §_-aZ§.SW : param1));
         return this.viewLibrary.hasDefinition(_loc2_) ? this.viewLibrary.createMovieClip(_loc2_) : null;
      }
      
      public function §_-Avj§() : Boolean
      {
         if(this.isFileLoading)
         {
            return §_-5qn§.furnitureList.hasOwnProperty(typeId);
         }
         return category.getAttribute("library") == null || ResourceManager.§_-7Bo§(category.getAttribute("library"));
      }
      
      private function get §_-126§() : String
      {
         if(this.§_-XT§ != null)
         {
            return this.§_-XT§;
         }
         return category != null && category.getAttribute("library") != null ? category.getAttribute("library") : "house";
      }
      
      public function get viewLibrary() : §_-7VJ§
      {
         if(category.getAttribute("library") == null)
         {
            return ResourceManager.getADF("house");
         }
         if(!this.isFileLoading)
         {
            return ResourceManager.getADF(category.getAttribute("library"));
         }
         return !!§_-5qn§.furnitureList.hasOwnProperty(typeId) ? §_-5qn§.furnitureList[typeId] : null;
      }
      
      public function §_-CIv§(param1:int) : int
      {
         var _loc3_:* = undefined;
         if(§_-6aF§.§_-vN§(this.§_-8Za§) == 0)
         {
            return 0;
         }
         var _loc2_:int = -1;
         for(_loc3_ in this.§_-8Za§)
         {
            if(int(_loc3_) > param1 && (_loc2_ == -1 || this.§_-8Za§[int(_loc3_)] < _loc2_))
            {
               _loc2_ = int(this.§_-8Za§[int(_loc3_)]);
            }
         }
         return _loc2_;
      }
      
      override protected function isFamilyTrophyDiscountItem() : Boolean
      {
         return Context.§_-0Vr§.§_-AUZ§() && canGift && this.buyCount > 0;
      }
      
      public function get isFileLoading() : Boolean
      {
         return this.§_-6gt§ == "file";
      }
      
      public function get filePath() : String
      {
         return this.§_-126§ + "/" + this.fileName + "." + Config.resourceFormat + (this.§_-5Hd§ != null ? "?" + this.§_-5Hd§ : "");
      }
      
      private function get fileName() : String
      {
         return this.§_-7Ap§ != null ? this.§_-7Ap§ : _name;
      }
   }
}

