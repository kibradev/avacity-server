package §_-7ps§
{
   public class §_-9EB§
   {
      private var §_-AcP§:String = null;
      
      private var §_-7w7§:Vector.<§_-AND§> = new Vector.<§_-AND§>();
      
      public function §_-9EB§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         this.§_-AcP§ = param1["@id"];
         var _loc2_:§_-AND§ = null;
         for each(_loc3_ in param1.elements("helper"))
         {
            _loc2_ = new §_-AND§();
            _loc2_.configure(_loc3_);
            this.§_-7w7§.push(_loc2_);
         }
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get §_-19L§() : Vector.<§_-AND§>
      {
         return this.§_-7w7§;
      }
   }
}

