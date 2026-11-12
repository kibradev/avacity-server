package §_-8Q7§
{
   import §_-2ZF§.§_-0O-§;
   import §_-2ZF§.§_-A2D§;
   import §_-5g6§.§_-1ib§;
   import §_-5g6§.§_-5zA§;
   import §_-6-L§.§_-6aF§;
   import §_-7xl§.§_-5m-§;
   
   public class §_-199§ extends §_-5m-§ implements §_-1Qg§, §_-6ZZ§
   {
      private static var §_-7S4§:int = 1;
      
      protected var §_-4eT§:§_-5VO§;
      
      protected var §_-1ZO§:Number = 0;
      
      protected var §_-xS§:Number = 0;
      
      protected var §_-BE-§:Number = 0;
      
      protected var _width:int = 1;
      
      protected var §_-Bkh§:int = 1;
      
      protected var _height:int = 0;
      
      protected var §_-99L§:String;
      
      protected var §_-COk§:String = "";
      
      protected var §_-33E§:String;
      
      public function §_-199§()
      {
         super();
         var _loc1_:§_-0O-§ = §_-Bb7§.instance.§_-2LV§(§_-6aF§.getClass(this));
         if(_loc1_ != null)
         {
            this.§_-33E§ = _loc1_.classAlias;
            this.§_-COk§ = _loc1_.classAlias;
         }
         this.§_-99L§ = this.classAlias + §_-7S4§++;
      }
      
      override public function destroy() : void
      {
         super.destroy();
      }
      
      public function get itemId() : String
      {
         return this.§_-99L§;
      }
      
      public function set itemId(param1:String) : void
      {
         this.§_-99L§ = param1;
      }
      
      public function get wx() : Number
      {
         return this.§_-1ZO§;
      }
      
      public function set wx(param1:Number) : void
      {
         this.§_-1ZO§ = param1;
      }
      
      public function get wy() : Number
      {
         return this.§_-xS§;
      }
      
      public function set wy(param1:Number) : void
      {
         this.§_-xS§ = param1;
      }
      
      public function get wz() : Number
      {
         return this.§_-BE-§;
      }
      
      public function set wz(param1:Number) : void
      {
         this.§_-BE-§ = param1;
      }
      
      public function get width() : Number
      {
         return this._width;
      }
      
      public function set width(param1:Number) : void
      {
         this._width = param1;
      }
      
      public function get length() : Number
      {
         return this.§_-Bkh§;
      }
      
      public function set length(param1:Number) : void
      {
         this.§_-Bkh§ = param1;
      }
      
      public function get height() : Number
      {
         return this._height;
      }
      
      public function set height(param1:Number) : void
      {
         this._height = param1;
      }
      
      public function §_-99Q§(param1:Number, param2:Number) : Boolean
      {
         return param1 >= this.§_-1ZO§ && param2 >= this.§_-xS§ && param1 < this.§_-1ZO§ + this._width && param2 < this.§_-xS§ + this.§_-Bkh§;
      }
      
      public function get displayName() : String
      {
         return this.§_-COk§;
      }
      
      public function get worldMap() : §_-5VO§
      {
         return this.§_-4eT§;
      }
      
      public function set worldMap(param1:§_-5VO§) : void
      {
         if(param1 == null)
         {
            if(this.§_-4eT§ != null)
            {
               this.§_-4eT§ = null;
               this.§_-31s§();
            }
            return;
         }
         if(this.§_-4eT§ == null)
         {
            this.§_-4eT§ = param1;
            this.addedToMap();
            return;
         }
         throw new Error("worldMap already set");
      }
      
      protected function addedToMap() : void
      {
      }
      
      protected function §_-31s§() : void
      {
      }
      
      public function apply(param1:§_-1ib§, param2:Object) : void
      {
      }
      
      public function validate(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-5zA§ = null;
         var _loc4_:Array = [];
         for each(_loc3_ in param1.objects)
         {
            if(_loc3_.§_-49T§ == this)
            {
               _loc4_.push(_loc3_);
            }
         }
         for each(_loc3_ in _loc4_)
         {
            param1.removeObject(_loc3_);
         }
         this.apply(param1,param2);
      }
      
      public function get classAlias() : String
      {
         return this.§_-33E§;
      }
      
      public function set classAlias(param1:String) : void
      {
         this.§_-33E§ = param1;
      }
      
      public function get classDescription() : §_-0O-§
      {
         return §_-Bb7§.instance.§_-2LV§(this.§_-33E§);
      }
      
      public function §_-2iR§(param1:String) : *
      {
         if(!this.classDescription.§_-26l§(param1))
         {
            return null;
         }
         return this[param1];
      }
      
      public function §_-0G1§(param1:String) : String
      {
         if(!this.classDescription.§_-26l§(param1))
         {
            return null;
         }
         return this.§_-4r0§(param1).§_-6QL§(this.§_-2iR§(param1));
      }
      
      public function §_-4r0§(param1:String) : §_-A2D§
      {
         if(!this.classDescription.§_-26l§(param1))
         {
            return null;
         }
         return this.classDescription.§_-2iR§(param1);
      }
      
      public function setProperty(param1:String, param2:*) : void
      {
         if(!this.classDescription.§_-26l§(param1))
         {
            return;
         }
         if(hasOwnProperty(param1))
         {
            this[param1] = param2;
            return;
         }
         throw new Error("Undefiend property: " + param1);
      }
      
      public function §_-Bsr§(param1:String, param2:String) : void
      {
         if(!this.classDescription.§_-26l§(param1))
         {
            return;
         }
         this.setProperty(param1,this.§_-4r0§(param1).§_-5I9§(param2));
      }
      
      protected function §_-3nN§(param1:XML) : void
      {
         var _loc2_:String = null;
         var _loc3_:* = undefined;
         if(this.classDescription == null)
         {
            return;
         }
         for each(_loc2_ in this.classDescription.§_-1t1§())
         {
            _loc3_ = this.§_-2iR§(_loc2_);
            if(_loc3_ != null)
            {
               param1["@" + _loc2_] = this.§_-0G1§(_loc2_);
            }
         }
      }
      
      public function serializeToXML(param1:XML) : void
      {
         this.§_-3nN§(param1);
      }
      
      protected function §_-CdM§(param1:XML) : void
      {
         var _loc2_:String = null;
         if(this.classDescription == null)
         {
            return;
         }
         for each(_loc2_ in this.classDescription.§_-1t1§())
         {
            if(param1.hasOwnProperty("@" + _loc2_))
            {
               this.§_-Bsr§(_loc2_,param1["@" + _loc2_]);
            }
         }
      }
      
      public function unserializeFromXML(param1:XML) : void
      {
         this.§_-CdM§(param1);
      }
   }
}

