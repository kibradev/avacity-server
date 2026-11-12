package §_-99s§
{
   import §_-18o§.§_-ABX§;
   import §_-2U3§.ResourceManager;
   import §_-BeZ§.§_-4Ww§;
   import adept.config.Configuration;
   import flash.display.MovieClip;
   
   public class §_-0Us§ extends §_-7Tj§
   {
      private static const §_-B1O§:String = "prb";
      
      private static const §_-ls§:String = "dsc";
      
      private static const §_-8nk§:String = "scl";
      
      private var §_-0oi§:Number = 0;
      
      protected var §_-24q§:String = "";
      
      private var §_-26q§:Boolean = false;
      
      public function §_-0Us§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-0oi§ = !!param1.hasOwnProperty("@probability") ? Number(param1["@probability"]) : 1;
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? String(param1["@description"]) : "";
         this.§_-26q§ = !!param1.hasOwnProperty("@social") ? param1["@social"] == 1 : false;
      }
      
      override public function loadConfig(param1:Configuration) : void
      {
         super.loadConfig(param1);
         this.§_-0oi§ = param1.getNumber("probability");
         this.§_-24q§ = param1.getString("description");
         this.§_-26q§ = param1.getBoolean("description");
      }
      
      public function get probability() : int
      {
         return this.§_-0oi§;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get social() : Boolean
      {
         return this.§_-26q§;
      }
      
      public function get localizedDescription() : String
      {
         return §_-ABX§.§_-631§(this.§_-24q§);
      }
      
      override public function createIcon() : MovieClip
      {
         return ResourceManager.hasDefinition(iconClass) ? ResourceManager.createMovieClip(iconClass) : new MovieClip();
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-0oi§ = param1.§_-1hz§(§_-B1O§,0);
         this.§_-24q§ = param1.getString(§_-ls§);
         this.§_-26q§ = param1.getInt(§_-8nk§,0) == 1;
      }
   }
}

