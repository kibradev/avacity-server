package §_-BIp§
{
   import §_-1Fx§.§_-5n7§;
   import §_-39l§.§_-87g§;
   import §_-5Zh§.§_-19w§;
   import §_-6-L§.DisplayUtils;
   import §_-8xR§.§_-0Ma§;
   import flash.display.MovieClip;
   
   public class §_-77v§ extends §_-0Ma§
   {
      private var _clanModel:§_-19w§ = null;
      
      protected var §_-ByX§:§_-5n7§ = null;
      
      protected var §_-6po§:MovieClip = null;
      
      public function §_-77v§(param1:§_-19w§)
      {
         this._clanModel = param1;
         super();
      }
      
      override protected function init() : void
      {
         super.init();
         this.§_-AAR§();
      }
      
      protected function §_-AAR§() : void
      {
         this.§_-6po§ = §_-87g§.§_-3kg§(this._clanModel);
         addChild(this.§_-6po§);
         this.§_-3rU§(false);
      }
      
      protected function §_-3rU§(param1:Boolean) : void
      {
         if(param1)
         {
            this.§_-6po§.x = 50 - this.§_-6po§.width / 2;
            this.§_-6po§.y = -10;
            DisplayUtils.§_-6zB§(this.§_-6po§);
         }
         else
         {
            this.§_-6po§.scaleX = 1.7;
            this.§_-6po§.scaleY = 1.7;
            this.§_-6po§.x = 5;
            this.§_-6po§.y = -1;
         }
      }
      
      public function get clanModel() : §_-19w§
      {
         return this._clanModel;
      }
   }
}

