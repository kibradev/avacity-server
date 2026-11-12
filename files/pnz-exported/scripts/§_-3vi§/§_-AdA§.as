package §_-3vi§
{
   public class §_-AdA§
   {
      private var §_-AcP§:String;
      
      private var §_-Avc§:String;
      
      private var §_-24q§:String;
      
      private var §_-3od§:int;
      
      public function §_-AdA§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? param1["@id"] : null;
         this.§_-Avc§ = !!param1.hasOwnProperty("@title") ? param1["@title"] : null;
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? param1["@description"] : null;
         this.§_-3od§ = !!param1.hasOwnProperty("@clanLevel") ? int(param1["@clanLevel"]) : int(null);
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get §_-ANP§() : int
      {
         return this.§_-3od§;
      }
   }
}

