package §_-0sG§
{
   import §_-4lI§.§_-5JW§;
   import §_-5MD§.§_-2wv§;
   import §_-5g6§.§_-1ib§;
   import §_-8Q7§.§_-199§;
   
   public class §_-4vz§ extends §_-199§
   {
      private var §_-4sY§:§_-5JW§ = null;
      
      public function §_-4vz§()
      {
         super();
         wx = 0;
         wy = 0;
         wz = 0;
         _width = width;
         §_-Bkh§ = length;
         _height = 0;
         this.§_-4sY§ = null;
      }
      
      override protected function addedToMap() : void
      {
         if(this.§_-4sY§ == null)
         {
            _width = worldMap.width;
            §_-Bkh§ = worldMap.length;
            this.§_-4sY§ = new §_-5JW§(worldMap.width,worldMap.length,1);
         }
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-2wv§ = new §_-2wv§();
         _loc3_.§_-49T§ = this;
         _loc3_.grid = this.§_-4sY§;
         param1.addObject(_loc3_);
      }
      
      override public function serializeToXML(param1:XML) : void
      {
         var _loc4_:XML = null;
         var _loc5_:Array = null;
         var _loc6_:int = 0;
         super.serializeToXML(param1);
         param1["@cols"] = this.§_-4sY§.cols;
         param1["@rows"] = this.§_-4sY§.rows;
         var _loc2_:XML = <grid/>;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-4sY§.rows)
         {
            _loc4_ = <row/>;
            _loc5_ = [];
            _loc6_ = 0;
            while(_loc6_ < this.§_-4sY§.cols)
            {
               _loc5_.push(this.§_-4sY§.getInt(_loc6_,_loc3_));
               _loc6_++;
            }
            _loc4_["@values"] = _loc5_.join(",");
            _loc2_.appendChild(_loc4_);
            _loc3_++;
         }
         param1.appendChild(_loc2_);
      }
      
      override public function unserializeFromXML(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         super.§_-CdM§(param1);
         width = parseInt(param1["@cols"]);
         length = parseInt(param1["@rows"]);
         this.§_-4sY§ = new §_-5JW§(width,length,0);
         var _loc2_:int = 0;
         for each(_loc3_ in param1["grid"][0].elements("row"))
         {
            _loc4_ = String(_loc3_["@values"]).split(",");
            _loc5_ = 0;
            while(_loc5_ < _loc4_.length)
            {
               if(_loc5_ >= width)
               {
                  break;
               }
               this.§_-4sY§.setInt(_loc5_,_loc2_,_loc4_[_loc5_] == "1" ? 1 : 0);
               _loc5_++;
            }
            _loc2_++;
            if(_loc2_ >= length)
            {
               break;
            }
         }
      }
      
      public function get grid() : §_-5JW§
      {
         return this.§_-4sY§;
      }
   }
}

