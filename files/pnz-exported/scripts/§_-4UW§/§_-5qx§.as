package §_-4UW§
{
   import §_-18o§.§_-ABX§;
   
   public class §_-5qx§
   {
      private var §_-AcP§:int = 0;
      
      private var §_-6Og§:int = 0;
      
      private var §_-Avc§:String = null;
      
      private var §_-24q§:String = null;
      
      private var §_-8zq§:§_-9es§ = null;
      
      public function §_-5qx§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? int(param1["@id"]) : 0;
         this.§_-6Og§ = !!param1.hasOwnProperty("@categoryId") ? int(param1["@categoryId"]) : 0;
         this.§_-Avc§ = !!param1.hasOwnProperty("@title") ? param1["@title"] : "";
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? param1["@description"] : null;
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function get categoryId() : int
      {
         return this.§_-6Og§;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get category() : §_-9es§
      {
         return this.§_-8zq§;
      }
      
      public function set category(param1:§_-9es§) : void
      {
         this.§_-8zq§ = param1;
      }
      
      public function get localizedTitle() : String
      {
         return §_-ABX§.§_-631§(this.§_-Avc§,-1,{"paragraph":(this.category != null ? this.category.paragraph : "0")});
      }
      
      public function get localizedDescription() : String
      {
         if(this.§_-24q§ != null)
         {
            return §_-ABX§.§_-631§(this.§_-24q§,-1,{"paragraph":(this.category != null ? this.category.paragraph : "0")});
         }
         return this.category != null ? this.category.localizedDescription : "";
      }
   }
}

