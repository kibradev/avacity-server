package §_-99s§
{
   import §_-18o§.§_-ABX§;
   import §_-52p§.§_-25R§;
   import §_-52p§.§_-9d9§;
   import §_-5eM§.§_-5d-§;
   import §_-6EA§.§_-Cb1§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Bwh§.§_-AMW§;
   import adept.config.Configuration;
   import flash.display.MovieClip;
   
   public class §_-2rp§ extends §_-5d-§
   {
      public static const §_-0Tq§:String = "energy";
      
      private static const §_-15d§:String = "g";
      
      private static const §_-9hn§:String = "s";
      
      private static const §_-00M§:String = "e";
      
      private static const §_-AIH§:String = "n";
      
      private static const §_-5mo§:String = "i";
      
      private static const §_-2Xy§:String = "p";
      
      protected var §_-aj§:§_-Cb1§ = new §_-Cb1§(0);
      
      protected var §_-79S§:§_-Cb1§ = new §_-Cb1§(0);
      
      protected var §_-1Rh§:§_-Cb1§ = new §_-Cb1§(0);
      
      protected var _name:String = "";
      
      protected var §_-8W7§:String = null;
      
      protected var §_-8dC§:Object = {};
      
      public function §_-2rp§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         super.loadXML(param1);
         this.§_-aj§.value = !!param1.hasOwnProperty("@gold") ? int(param1["@gold"]) : 0;
         this.§_-79S§.value = !!param1.hasOwnProperty("@silver") ? int(param1["@silver"]) : 0;
         this.§_-1Rh§.value = !!param1.hasOwnProperty("@energy") ? int(param1["@energy"]) : 0;
         this._name = !!param1.hasOwnProperty("@name") ? String(param1["@name"]) : "";
         this.§_-8W7§ = !!param1.hasOwnProperty("@icon") ? String(param1["@icon"]) : null;
         this.§_-8dC§ = {};
         if(param1.hasOwnProperty("params"))
         {
            for each(_loc2_ in (param1.elements("params")[0] as XML).elements("param"))
            {
               this.§_-8dC§[_loc2_["@name"]] = _loc2_["@value"];
            }
         }
      }
      
      override public function loadConfig(param1:Configuration) : void
      {
         var _loc3_:Configuration = null;
         super.loadConfig(param1);
         this.§_-aj§.value = param1.getInt("gold");
         this.§_-79S§.value = param1.getInt("silver");
         this.§_-1Rh§.value = param1.getInt("energy");
         this._name = param1.getString("name");
         this.§_-8W7§ = param1.getString("icon");
         this.§_-8dC§ = {};
         var _loc2_:Configuration = param1.getConfiguration("params");
         if(_loc2_ != null)
         {
            for each(_loc3_ in _loc2_.getList("param"))
            {
               if(_loc3_ != null)
               {
                  this.§_-8dC§[_loc3_.getString("name")] = _loc3_.getString("value");
               }
            }
         }
      }
      
      public function get gold() : int
      {
         return this.§_-aj§.value;
      }
      
      public function get silver() : int
      {
         return this.§_-79S§.value;
      }
      
      public function get energy() : int
      {
         return this.§_-1Rh§.value;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get localizedLabel() : String
      {
         return §_-ABX§.§_-631§(label);
      }
      
      public function createIcon() : MovieClip
      {
         return null;
      }
      
      public function get iconClass() : String
      {
         return this.§_-8W7§;
      }
      
      public function get sortType() : String
      {
         return typeId;
      }
      
      public function getPrice(param1:int) : §_-9d9§
      {
         var _loc2_:§_-9d9§ = new §_-9d9§();
         if(param1 == §_-AMW§.§_-85a§ || param1 == §_-AMW§.§_-B7z§)
         {
            _loc2_.gold = this.gold;
         }
         if(param1 == §_-AMW§.§_-85a§ || param1 == §_-AMW§.§_-8X2§)
         {
            _loc2_.silver = this.silver;
         }
         if(param1 == §_-AMW§.§_-85a§ || param1 == §_-AMW§.§_-72B§)
         {
            _loc2_.energy = this.energy;
         }
         return _loc2_;
      }
      
      public function get §_-6GT§() : §_-25R§
      {
         return this.getPrice(§_-AMW§.§_-85a§);
      }
      
      public function getParam(param1:String) : *
      {
         return !!this.§_-8dC§.hasOwnProperty(param1) ? this.§_-8dC§[param1] : null;
      }
      
      public function hasParam(param1:String) : *
      {
         return this.§_-8dC§.hasOwnProperty(param1);
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-aj§ = new §_-Cb1§(param1.getInt(§_-15d§,0));
         this.§_-79S§ = new §_-Cb1§(param1.getInt(§_-9hn§,0));
         this.§_-1Rh§ = new §_-Cb1§(param1.getInt(§_-00M§,0));
         this._name = param1.getString(§_-AIH§,null);
         this.§_-8W7§ = param1.getString(§_-5mo§,null);
         var _loc2_:§_-4Ww§ = param1.§_-ANw§(§_-2Xy§);
         if(_loc2_ != null)
         {
            this.§_-8dC§ = _loc2_.toObject();
         }
      }
   }
}

