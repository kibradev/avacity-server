package §_-3vi§
{
   public class §_-BuY§
   {
      private var _level:int = 0;
      
      private var §_-7eP§:Array;
      
      public function §_-BuY§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-01w§ = null;
         this._level = !!param1.hasOwnProperty("@level") ? int(param1["@level"]) : 0;
         this.§_-7eP§ = [];
         for each(_loc2_ in param1.elements("chest"))
         {
            _loc3_ = new §_-01w§();
            _loc3_.configure(_loc2_);
            this.§_-7eP§.push(_loc3_);
         }
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function get §_-7Y-§() : Array
      {
         return this.§_-7eP§;
      }
   }
}

