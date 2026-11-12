package §_-5wm§
{
   import §_-5eM§.§_-5d-§;
   import §_-6-L§.§_-6aF§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class InventoryItem implements §_-0Yu§
   {
      public static const §_-6fh§:String = "bt";
      
      private static const §_-3da§:String = "tid";
      
      private static const §_-5TP§:String = "c";
      
      private static const §_-0fY§:String = "iid";
      
      private static const §_-5Im§:String = "atr";
      
      public static const §_-15Q§:String = "";
      
      public static const §_-4ss§:String = "q";
      
      private var _typeId:String;
      
      private var §_-2xt§:int = 1;
      
      private var §_-5xz§:§_-5YM§;
      
      private var §_-QI§:String = "";
      
      private var §_-8Ma§:Object = null;
      
      public function InventoryItem()
      {
         super();
      }
      
      public static function §_-Ol§(param1:String, param2:String = null) : String
      {
         if(param2 == null)
         {
            param2 = §_-15Q§;
         }
         return param1 + "_" + param2;
      }
      
      public function get type() : §_-5d-§
      {
         return Context.§_-70S§.§_-0ZU§().findTypeById(this._typeId);
      }
      
      public function get count() : int
      {
         return this.§_-2xt§;
      }
      
      public function get attributes() : Object
      {
         return this.§_-8Ma§;
      }
      
      public function set count(param1:int) : void
      {
         if(param1 < 0)
         {
            throw new Error("Count cannot be negative. Current: " + this.§_-2xt§ + ", new: " + param1);
         }
         this.§_-2xt§ = param1;
         if(param1 == 0 && this.§_-5xz§ != null)
         {
            this.§_-5xz§.removeItem(this);
         }
      }
      
      public function get itemKey() : String
      {
         return §_-Ol§(this._typeId,this.§_-QI§);
      }
      
      public function get parent() : §_-5YM§
      {
         return this.§_-5xz§;
      }
      
      public function set parent(param1:§_-5YM§) : void
      {
         this.§_-5xz§ = param1;
      }
      
      public function get typeId() : String
      {
         return this._typeId;
      }
      
      public function set typeId(param1:String) : void
      {
         this._typeId = param1;
      }
      
      public function get instanceId() : String
      {
         if(this.§_-QI§ == null)
         {
            return §_-15Q§;
         }
         return this.§_-QI§;
      }
      
      public function set instanceId(param1:String) : void
      {
         this.§_-QI§ = param1;
      }
      
      public function getAttribute(param1:String, param2:* = null) : *
      {
         if(this.§_-8Ma§ == null)
         {
            return param2;
         }
         return !!this.§_-8Ma§.hasOwnProperty(param1) ? this.§_-8Ma§[param1] : param2;
      }
      
      public function §_-1Jj§(param1:String, param2:*) : void
      {
         if(this.§_-8Ma§ == null)
         {
            this.§_-8Ma§ = {};
         }
         this.§_-8Ma§[param1] = param2;
      }
      
      public function §_-0jP§(param1:String) : void
      {
         delete this.§_-8Ma§[param1];
         if(§_-6aF§.§_-vN§(this.§_-8Ma§) == 0)
         {
            this.§_-8Ma§ = null;
         }
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-3da§,this._typeId);
         param1.put(§_-5TP§,this.§_-2xt§);
         param1.put(§_-0fY§,this.§_-QI§);
         param1.§_-5CI§(§_-5Im§,this.§_-8Ma§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         var _loc2_:§_-4Ww§ = null;
         var _loc3_:String = null;
         this._typeId = param1.getString(§_-3da§);
         this.§_-2xt§ = param1.getInt(§_-5TP§);
         this.§_-QI§ = param1.getString(§_-0fY§,§_-15Q§);
         this.§_-8Ma§ = null;
         if(param1.has(§_-5Im§))
         {
            _loc2_ = param1.§_-ANw§(§_-5Im§);
            if(_loc2_ != null)
            {
               this.§_-8Ma§ = {};
               for each(_loc3_ in _loc2_.keys)
               {
                  this.§_-8Ma§[_loc3_] = _loc2_.§_-4AA§(_loc3_);
               }
            }
         }
      }
   }
}

