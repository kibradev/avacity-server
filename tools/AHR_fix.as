package §_-5MD§
{
   import §_-2U3§.ResourceManager;
   import §_-5g6§.§_-42q§;
   import §_-5g6§.§_-5PC§;
   import flash.display.MovieClip;

   public class §_-AHR§ extends §_-5PC§
   {
      private var §_-1RA§:String = null;

      protected var _view:MovieClip = null;

      public function §_-AHR§(param1:String = null)
      {
         if(param1 == null)
         {
            param1 = §_-42q§.§_-Pt§;
         }
         super(param1);
      }

      override public function initObject() : void
      {
         this.render();
      }

      protected function render() : void
      {
         if(this.skinName != null)
         {
            container.removeAllChildren(true,true);
            this._view = ResourceManager.createMovieClip(this.skinName);
            if(this._view != null)
            {
               container.addChild(this._view);
            }
         }
      }

      public function §_-02e§(param1:int) : void
      {
         if(this._view != null)
         {
            this._view.gotoAndStop(param1);
         }
      }

      public function get skinName() : String
      {
         return this.§_-1RA§;
      }

      public function set skinName(param1:String) : void
      {
         this.§_-1RA§ = param1;
      }
   }
}
