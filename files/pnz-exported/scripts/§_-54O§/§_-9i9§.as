package §_-54O§
{
   public class §_-9i9§
   {
      private var _type:String = null;
      
      public function §_-9i9§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this._type = !!param1.hasOwnProperty("@type") ? param1["@type"] : §_-CM6§.§_-2gq§;
      }
      
      public function get type() : String
      {
         return this._type;
      }
   }
}

