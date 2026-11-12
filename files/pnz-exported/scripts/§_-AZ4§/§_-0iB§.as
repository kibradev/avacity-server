package §_-AZ4§
{
   public class §_-0iB§
   {
      public static const §_-4Ah§:uint = 1 << 1;
      
      public static const §_-6yK§:uint = 1 << 2;
      
      public static const §_-AuD§:uint = 1 << 3;
      
      private var §_-130§:Boolean = false;
      
      private var §_-98d§:Boolean = false;
      
      private var §_-6hJ§:Boolean = false;
      
      public function §_-0iB§(param1:uint = 0)
      {
         super();
         if(0 != (param1 & §_-4Ah§))
         {
            this.§_-3AJ§ = true;
         }
         if(0 != (param1 & §_-6yK§))
         {
            this.§_-BcA§ = true;
         }
         if(0 != (param1 & §_-AuD§))
         {
            this.§_-6sD§ = true;
         }
      }
      
      public function §_-3zx§() : uint
      {
         var _loc1_:uint = 0;
         if(this.§_-3AJ§)
         {
            _loc1_ |= §_-4Ah§;
         }
         if(this.§_-BcA§)
         {
            _loc1_ |= §_-6yK§;
         }
         if(this.§_-6sD§)
         {
            _loc1_ |= §_-AuD§;
         }
         return _loc1_;
      }
      
      public function get §_-3AJ§() : Boolean
      {
         return this.§_-130§;
      }
      
      public function set §_-3AJ§(param1:Boolean) : void
      {
         this.§_-130§ = param1;
      }
      
      public function get §_-BcA§() : Boolean
      {
         return this.§_-98d§;
      }
      
      public function set §_-BcA§(param1:Boolean) : void
      {
         this.§_-98d§ = param1;
      }
      
      public function get §_-6sD§() : Boolean
      {
         return this.§_-6hJ§;
      }
      
      public function set §_-6sD§(param1:Boolean) : void
      {
         this.§_-6hJ§ = param1;
      }
   }
}

