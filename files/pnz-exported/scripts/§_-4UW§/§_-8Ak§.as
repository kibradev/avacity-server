package §_-4UW§
{
   import §_-18o§.§_-ABX§;
   
   public class §_-8Ak§
   {
      private var §_-AcP§:int = 0;
      
      private var §_-6Og§:int = 0;
      
      private var §_-Avc§:String = null;
      
      private var §_-Ada§:int = 0;
      
      private var §_-AKb§:Boolean = false;
      
      private var §_-109§:Boolean = false;
      
      private var §_-9UB§:Boolean = false;
      
      private var §_-8S9§:Boolean = false;
      
      private var §_-8Y1§:Boolean = false;
      
      private var §_-8zq§:§_-9es§ = null;
      
      public function §_-8Ak§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-AcP§ = !!param1.hasOwnProperty("@id") ? int(param1["@id"]) : 0;
         this.§_-6Og§ = !!param1.hasOwnProperty("@categoryId") ? int(param1["@categoryId"]) : 0;
         this.§_-Avc§ = !!param1.hasOwnProperty("@title") ? param1["@title"] : "";
         this.§_-Ada§ = !!param1.hasOwnProperty("@banDuration") ? int(param1["@banDuration"]) : 0;
         this.§_-AKb§ = Boolean(param1.hasOwnProperty("@banChat")) && param1["@banChat"] == 1;
         this.§_-109§ = Boolean(param1.hasOwnProperty("@banLobby")) && param1["@banLobby"] == 1;
         this.§_-9UB§ = Boolean(param1.hasOwnProperty("@fastChatBan")) && param1["@fastChatBan"] == 1;
         this.§_-8S9§ = Boolean(param1.hasOwnProperty("@fastEventBan")) && param1["@fastEventBan"] == 1;
         this.§_-8Y1§ = Boolean(param1.hasOwnProperty("@fastNameBan")) && param1["@fastNameBan"] == 1;
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
      
      public function get §_-CV5§() : int
      {
         return this.§_-Ada§;
      }
      
      public function get §_-4Xw§() : Boolean
      {
         return this.§_-AKb§;
      }
      
      public function get §_-5Er§() : Boolean
      {
         return this.§_-109§;
      }
      
      public function get §_-Ah1§() : Boolean
      {
         return this.§_-9UB§;
      }
      
      public function get §_-4vo§() : Boolean
      {
         return this.§_-8S9§;
      }
      
      public function get §_-fi§() : Boolean
      {
         return this.§_-8Y1§;
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
         return this.category != null ? this.category.localizedDescription : "";
      }
   }
}

