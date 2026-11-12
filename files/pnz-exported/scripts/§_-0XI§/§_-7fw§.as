package §_-0XI§
{
   import §_-2U3§.ResourceManager;
   import §_-99s§.§_-7Tj§;
   import flash.display.MovieClip;
   
   public class §_-7fw§ extends §_-7Tj§
   {
      private var §_-8Vk§:String = null;
      
      private var §_-38T§:String = null;
      
      private var §_-4pH§:Boolean = false;
      
      public function §_-7fw§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-8Vk§ = !!param1.hasOwnProperty("@assetName") ? String(param1["@assetName"]) : "";
         this.§_-38T§ = !!param1.hasOwnProperty("@buttonAssetName") ? String(param1["@buttonAssetName"]) : "";
         this.§_-4pH§ = !!param1.hasOwnProperty("@animated") ? Boolean(param1["@animated"]) : false;
      }
      
      override public function createIcon() : MovieClip
      {
         if(!ResourceManager.hasDefinition(iconClass))
         {
            return new MovieClip();
         }
         var _loc1_:MovieClip = ResourceManager.createMovieClip(iconClass);
         _loc1_.gotoAndStop(1);
         return _loc1_;
      }
      
      public function get assetName() : String
      {
         return this.§_-8Vk§;
      }
      
      public function get §_-0fJ§() : String
      {
         return this.§_-38T§;
      }
      
      public function get §_-9Vl§() : Boolean
      {
         return this.§_-4pH§;
      }
   }
}

