package §_-1vM§
{
   import §_-0fi§.§_-6f3§;
   import §_-2U3§.ResourceManager;
   import §_-3AW§.§_-7k§;
   import §_-BeZ§.§_-4Ww§;
   import §_-kr§.§_-2NT§;
   import flash.display.MovieClip;
   
   public class §_-5Nf§ extends §_-6f3§
   {
      private static const §_-6wF§:String = "ptp";
      
      private var §_-AAk§:String;
      
      public function §_-5Nf§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-AAk§ = !!param1.hasOwnProperty("@petType") ? String(param1["@petType"]) : "";
      }
      
      public function get petType() : String
      {
         return this.§_-AAk§;
      }
      
      override public function get filePath() : String
      {
         return super.filePath;
      }
      
      override public function createIcon() : MovieClip
      {
         var iconLibrary:String;
         var icon:§_-7k§ = null;
         if(§_-8W7§ == null || §_-8W7§.indexOf("@") < 0)
         {
            return new MovieClip();
         }
         iconLibrary = §_-8W7§.split("@")[1];
         if(!ResourceManager.§_-7Bo§(iconLibrary))
         {
            icon = new §_-7k§();
            §_-2NT§.§_-5vY§(iconLibrary).then(function():void
            {
               if(ResourceManager.hasDefinition(iconClass))
               {
                  icon.addChild(ResourceManager.createMovieClip(iconClass));
               }
            });
            return icon;
         }
         return ResourceManager.hasDefinition(iconClass) ? ResourceManager.createMovieClip(iconClass) : new MovieClip();
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-AAk§ = param1.getString(§_-6wF§);
      }
   }
}

