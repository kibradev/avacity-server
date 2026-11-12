package §_-7ps§
{
   public class §_-5aL§
   {
      private var §_-AcP§:String = null;
      
      private var §_-B9D§:String = null;
      
      private var §_-B33§:Vector.<§_-9EB§> = new Vector.<§_-9EB§>();
      
      public function §_-5aL§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         this.§_-AcP§ = param1["@id"];
         this.§_-B9D§ = !!param1.hasOwnProperty("@questId") ? param1["@questId"] : null;
         var _loc2_:§_-9EB§ = null;
         for each(_loc3_ in param1.elements("action"))
         {
            _loc2_ = new §_-9EB§();
            _loc2_.configure(_loc3_);
            this.§_-B33§.push(_loc2_);
         }
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get questId() : String
      {
         return this.§_-B9D§;
      }
      
      public function get §_-5Ke§() : Vector.<§_-9EB§>
      {
         return this.§_-B33§;
      }
      
      public function getAction(param1:String) : §_-9EB§
      {
         var _loc2_:§_-9EB§ = null;
         for each(_loc2_ in this.§_-B33§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function getNextAction(param1:String) : §_-9EB§
      {
         var _loc2_:§_-9EB§ = null;
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-B33§.length)
         {
            _loc2_ = this.§_-B33§[_loc3_];
            if(_loc2_.id == param1)
            {
               if(this.§_-B33§.length > _loc3_ + 1)
               {
                  return this.§_-B33§[_loc3_ + 1];
               }
               return null;
            }
            _loc3_++;
         }
         return null;
      }
   }
}

