package §_-3vi§
{
   public class §_-3pa§
   {
      private var §_-AcP§:int;
      
      private var §_-9ug§:int;
      
      private var §_-8nZ§:int;
      
      private var §_-9Ym§:int;
      
      private var _color:int;
      
      private var §_-1Xv§:§_-40D§;
      
      private var §_-6Ry§:Array;
      
      public function §_-3pa§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:§_-3l-§ = null;
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? int(param1["@id"]) : 0;
         this.§_-9ug§ = !!param1.hasOwnProperty("@masterCount") ? int(param1["@masterCount"]) : 0;
         this.§_-8nZ§ = !!param1.hasOwnProperty("@memberCount") ? int(param1["@memberCount"]) : 0;
         this.§_-9Ym§ = !!param1.hasOwnProperty("@experience") ? int(param1["@experience"]) : 0;
         this._color = !!param1.hasOwnProperty("@color") ? int(param1["@color"]) : int(null);
         this.§_-1Xv§ = new §_-40D§();
         var _loc2_:XML = param1["upgradeConditions"][0];
         if(_loc2_ != null)
         {
            this.§_-1Xv§.configure(_loc2_);
         }
         this.§_-6Ry§ = [];
         if(param1.hasOwnProperty("awards"))
         {
            for each(_loc3_ in (param1.elements("awards")[0] as XML).elements("award"))
            {
               _loc4_ = new §_-3l-§();
               _loc4_.configure(_loc3_);
               this.§_-6Ry§.push(_loc4_);
            }
         }
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function get §_-3wi§() : int
      {
         return this.§_-9ug§;
      }
      
      public function get §_-2oA§() : int
      {
         return this.§_-8nZ§;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get §_-84-§() : Array
      {
         return this.§_-6Ry§;
      }
      
      public function get experience() : int
      {
         return this.§_-9Ym§;
      }
      
      public function get §_-AYn§() : §_-40D§
      {
         return this.§_-1Xv§;
      }
      
      public function §_-6x8§(param1:String) : int
      {
         var _loc2_:§_-3l-§ = null;
         for each(_loc2_ in this.§_-6Ry§)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_.price;
            }
         }
         return 0;
      }
      
      public function §_-BKW§(param1:String) : int
      {
         var _loc2_:§_-3l-§ = null;
         for each(_loc2_ in this.§_-6Ry§)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_.§_-AuO§;
            }
         }
         return 0;
      }
      
      public function §_-1nc§(param1:String) : §_-3l-§
      {
         var _loc2_:§_-3l-§ = null;
         for each(_loc2_ in this.§_-6Ry§)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

