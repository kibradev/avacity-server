package §_-7Zn§
{
   import §_-0sG§.§_-1fy§;
   import §_-5MD§.§_-C9k§;
   
   public class §_-25j§ extends §_-1fy§
   {
      private var §_-31e§:int;
      
      private var §_-9WU§:int;
      
      public function §_-25j§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         var _loc1_:§_-DI§ = new §_-DI§();
         _loc1_.item = this;
         return _loc1_;
      }
      
      public function get cols() : int
      {
         return this.§_-31e§;
      }
      
      public function get rows() : int
      {
         return this.§_-9WU§;
      }
      
      public function set cols(param1:int) : void
      {
         this.§_-31e§ = param1;
      }
      
      public function set rows(param1:int) : void
      {
         this.§_-9WU§ = param1;
      }
   }
}

