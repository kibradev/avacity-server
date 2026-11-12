package §_-5RV§
{
   import §_-AZ4§.§_-5jV§;
   import §_-BeZ§.§_-1e5§;
   import ags.§_-5x-§;
   
   public class §_-9mD§
   {
      private var §_-AcP§:int;
      
      public function §_-9mD§(param1:int)
      {
         super();
         this.§_-AcP§ = param1;
      }
      
      public function execute(param1:§_-5x-§) : void
      {
         throw new Error("Abstract method called");
      }
      
      public function readArray(param1:§_-1e5§) : void
      {
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      protected function §_-aS§(param1:§_-1e5§, param2:int) : void
      {
         if(param1.length != param2)
         {
            throw new §_-5jV§("Invalid response parameters count=" + param1.length + ", expected=" + param2);
         }
      }
   }
}

