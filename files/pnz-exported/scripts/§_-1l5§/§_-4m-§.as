package §_-1l5§
{
   import §_-6-L§.§_-6aF§;
   import §_-7Gj§.§_-24r§;
   import §_-9PR§.§_-Bwy§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-4m-§ implements §_-8d2§
   {
      private var §_-AcP§:String = null;
      
      private var §_-4-R§:Array = [];
      
      private var §_-8Fk§:String = null;
      
      public function §_-4m-§()
      {
         super();
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get steps() : Array
      {
         return this.§_-4-R§;
      }
      
      public function set steps(param1:Array) : void
      {
         this.§_-4-R§ = param1;
      }
      
      public function get tag() : String
      {
         return this.§_-8Fk§;
      }
      
      public function set tag(param1:String) : void
      {
         this.§_-8Fk§ = param1;
      }
      
      public function get descriptor() : §_-9Yj§
      {
         return §_-Bwy§.instance.§_-3sJ§(this.§_-AcP§);
      }
      
      public function get nextStep() : §_-24r§
      {
         var _loc2_:§_-24r§ = null;
         var _loc1_:Array = §_-6aF§.toArray(this.descriptor.steps);
         _loc1_.sortOn("order",Array.NUMERIC);
         for each(_loc2_ in _loc1_)
         {
            if(this.§_-4-R§.indexOf(String(_loc2_.order)) < 0)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-qR§(param1:int) : Boolean
      {
         return this.§_-4-R§.indexOf(String(param1)) >= 0;
      }
      
      public function validate() : void
      {
         var _loc1_:§_-24r§ = null;
         for each(_loc1_ in this.descriptor.steps)
         {
            if(this.§_-4-R§.indexOf(String(_loc1_.order)) < 0)
            {
               _loc1_.validate(this.§_-CD7§);
            }
         }
      }
      
      private function §_-CD7§(param1:int, param2:Boolean) : void
      {
         if(!param2 || this.§_-4-R§.indexOf(String(param1)) >= 0)
         {
            return;
         }
         §_-Bwy§.instance.§_-3hI§(this.§_-AcP§,param1);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put("id",this.§_-AcP§);
         param1.put("dnStps",this.§_-4-R§.join(","));
         param1.put("tag",this.§_-8Fk§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-AcP§ = param1.getString("id");
         this.§_-4-R§ = param1.getString("dnStps").split(",");
         this.§_-8Fk§ = param1.getString("tag");
      }
   }
}

