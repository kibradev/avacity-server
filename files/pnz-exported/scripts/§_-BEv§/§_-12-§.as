package §_-BEv§
{
   import §_-0Uz§.§_-6v4§;
   import §_-1tr§.§_-69V§;
   import §_-1tr§.§_-9bf§;
   import §_-2qd§.§_-9ai§;
   import §_-318§.§_-0sx§;
   import §_-3u-§.§_-0aU§;
   import §_-3u-§.§_-8ea§;
   import §_-3u-§.§_-8f3§;
   import §_-8Hp§.§_-5KD§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-12-§ extends §_-6v4§
   {
      public static const §_-BX-§:String = "ctmr";
      
      public static const §_-6vu§:String = §_-BX-§ + ".init";
      
      public static const §_-2AG§:String = §_-BX-§ + ".get";
      
      public static const §_-Kg§:String = §_-BX-§ + ".adrt";
      
      public static const §_-4YE§:String = §_-BX-§ + ".gwn";
      
      public static const §_-1ud§:String = §_-BX-§ + ".cichngd";
      
      public static const §_-5-e§:String = "cpt";
      
      public static const §_-D4§:String = "ctp";
      
      public static const §_-7zy§:String = "tu";
      
      public static const §_-iW§:String = "crt";
      
      public static const §_-0GI§:String = "cmptinf";
      
      private static const MODULE_ID:String = "competitions";
      
      private var §_-Af3§:Object = {};
      
      private var §_-4Si§:Object = {};
      
      private var _inited:Boolean = false;
      
      private var §_-5-1§:Object = {};
      
      public function §_-12-§()
      {
         super();
         §_-1-t§(§_-6vu§,this.onInit);
         §_-1-t§(§_-Kg§,this.§_-0a9§);
         §_-1-t§(§_-2AG§,this.§_-EV§);
         §_-1-t§(§_-4YE§,this.§_-AvG§);
         §_-1-t§(§_-1ud§,this.§_-87k§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-69V§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("competition"))
         {
            _loc3_ = new §_-69V§();
            _loc3_.configure(_loc2_);
            this.§_-Af3§[_loc3_.type] = _loc3_;
         }
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
      
      public function init() : void
      {
         §_-6gl§.sendExtMessage(§_-2AG§);
      }
      
      public function §_-6ck§(param1:String) : §_-69V§
      {
         return !!this.§_-Af3§.hasOwnProperty(param1) ? this.§_-Af3§[param1] : null;
      }
      
      public function §_-CeB§(param1:int) : §_-69V§
      {
         var _loc2_:String = §_-9bf§.§_-114§(param1);
         return !!this.§_-Af3§.hasOwnProperty(_loc2_) ? this.§_-Af3§[_loc2_] : null;
      }
      
      public function §_-AJQ§(param1:String) : Array
      {
         return !!this.§_-4Si§.hasOwnProperty(param1) ? this.§_-4Si§[param1] : [];
      }
      
      public function §_-nW§(param1:int) : void
      {
         var _loc3_:§_-4Ww§ = null;
         var _loc2_:String = §_-9bf§.§_-114§(param1);
         if(this.§_-5-1§.hasOwnProperty(_loc2_))
         {
            dispatchEvent(new §_-0sx§(§_-0sx§.§_-4Tz§,this.§_-5-1§[_loc2_]));
            dispatchEvent(new §_-0sx§(§_-0sx§.§_-15P§,this.§_-5-1§[_loc2_]));
            return;
         }
         if(§_-6gl§ != null)
         {
            _loc3_ = new §_-4Ww§();
            _loc3_.put(§_-D4§,param1);
            §_-6gl§.sendExtMessage(§_-4YE§,_loc3_);
         }
      }
      
      public function get isActive() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(MODULE_ID) != null;
      }
      
      private function onInit(param1:§_-9ai§) : void
      {
         var _loc3_:String = null;
         var _loc4_:§_-0aU§ = null;
         var _loc2_:Object = param1.data.getMap(§_-5-e§,§_-0aU§);
         for(_loc3_ in this.§_-Af3§)
         {
            _loc4_ = !!_loc2_.hasOwnProperty(_loc3_) ? _loc2_[_loc3_] : null;
            if(_loc4_ != null)
            {
               (this.§_-Af3§[_loc3_] as §_-69V§).id = _loc4_.id;
               (this.§_-Af3§[_loc3_] as §_-69V§).endDate = _loc4_.endDate;
            }
         }
      }
      
      private function §_-0a9§(param1:§_-9ai§) : void
      {
         var _loc2_:int = param1.data.getInt(§_-D4§);
         var _loc3_:int = param1.data.getInt(§_-iW§);
         Context.cityPlayer.cityInfo.§_-9RH§.§_-8Pd§(_loc2_,_loc3_);
      }
      
      private function §_-EV§(param1:§_-9ai§) : void
      {
         var _loc2_:Object = param1.data.has(§_-7zy§) ? param1.data.getMap(§_-7zy§,String) : {};
         if(_loc2_ != null)
         {
            this.§_-4Si§ = _loc2_;
         }
         this._inited = true;
      }
      
      private function §_-AvG§(param1:§_-9ai§) : void
      {
         var _loc2_:Array = param1.data.§_-Bc6§(§_-7zy§,§_-8f3§);
         var _loc3_:int = param1.data.getInt(§_-D4§);
         if(_loc2_ == null || _loc2_.length <= 0)
         {
            return;
         }
         var _loc4_:String = §_-9bf§.§_-114§(_loc3_);
         if(_loc4_ == null)
         {
            return;
         }
         if(_loc4_ == §_-9bf§.§_-BWv§)
         {
            dispatchEvent(new §_-0sx§(§_-0sx§.§_-4Tz§,_loc2_));
            this.§_-5-1§[_loc4_] = _loc2_;
         }
         if(_loc4_ == §_-9bf§.§_-1ZK§)
         {
            dispatchEvent(new §_-0sx§(§_-0sx§.§_-15P§,_loc2_));
            this.§_-5-1§[_loc4_] = _loc2_;
         }
      }
      
      private function §_-87k§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-8ea§ = param1.data.§_-2jV§(§_-0GI§,§_-8ea§);
         var _loc3_:int = param1.data.getInt(§_-D4§);
         if(_loc2_ == null || _loc3_ <= 0)
         {
            return;
         }
         Context.cityPlayer.cityInfo.§_-9RH§.§_-3jl§ = _loc2_;
         var _loc4_:§_-0sx§ = new §_-0sx§(§_-0sx§.§_-4Is§,_loc3_);
         dispatchEvent(_loc4_);
      }
   }
}

