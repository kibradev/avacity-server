package §_-4UW§
{
   import §_-18o§.§_-ABX§;
   
   public class §_-9es§
   {
      private var §_-AcP§:int = 0;
      
      private var §_-5ru§:String = null;
      
      private var §_-24q§:String = null;
      
      public function §_-9es§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? int(param1["@id"]) : 0;
         this.§_-5ru§ = !!param1.hasOwnProperty("@paragraph") ? param1["@paragraph"] : null;
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? param1["@description"] : "";
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function get paragraph() : String
      {
         return this.§_-5ru§;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get localizedDescription() : String
      {
         return §_-ABX§.§_-631§(this.§_-24q§,-1,{"paragraph":this.§_-5ru§});
      }
   }
}

