package §_-54O§
{
   public class §_-1CJ§ extends §_-9i9§
   {
      private var §_-5jX§:int = 1;
      
      public function §_-1CJ§()
      {
         super();
      }
      
      override public function configure(param1:XML) : void
      {
         super.configure(param1);
         this.§_-5jX§ = !!param1.hasOwnProperty("@defaultStep") ? int(param1["@defaultStep"]) : 1;
      }
      
      public function get §_-8lE§() : int
      {
         return this.§_-5jX§;
      }
   }
}

