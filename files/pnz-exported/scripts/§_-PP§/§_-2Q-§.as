package §_-PP§
{
   import §_-0uA§.§_-3YE§;
   import §_-1Fx§.§_-5n7§;
   import flash.display.DisplayObjectContainer;
   
   public class §_-2Q-§ extends §_-5n7§
   {
      public static const §_-7xW§:String = "hideAll";
      
      public static const §_-9TZ§:String = "allowDialogs";
      
      private static const §_-B1K§:int = 0;
      
      private static const §_-6tt§:int = 1;
      
      private static const §_-8sg§:int = 2;
      
      private var _currentState:int = 0;
      
      private var §_-5Bb§:String = null;
      
      private var _preloader:§_-4fB§ = null;
      
      private var §_-7Pf§:DisplayObjectContainer = null;
      
      private var §super§:DisplayObjectContainer = null;
      
      private var §_-AHa§:DisplayObjectContainer = null;
      
      public function §_-2Q-§(param1:DisplayObjectContainer, param2:DisplayObjectContainer)
      {
         if(param2 == null || param1 == null)
         {
            §_-3YE§.error("CityPreloaderHelper: containers cannot be null");
         }
         this.§_-7Pf§ = param1;
         this.§super§ = param2;
         super();
      }
      
      public function showPreloader(param1:String = "allowDialogs", param2:Boolean = false) : void
      {
         var _loc3_:DisplayObjectContainer = this.§_-57f§(param1);
         if(_loc3_ == null)
         {
            §_-3YE§.error("showPreloader: container for containerType \'" + param1 + "\' is null");
            return;
         }
         this.cleanPreloader();
         this._preloader = new §_-4fB§(param2);
         _loc3_.addChild(this._preloader);
         this.§_-AHa§ = _loc3_;
         this.§_-5Bb§ = param1;
         this._currentState = §_-6tt§;
      }
      
      public function §_-8pD§() : void
      {
         if(this._preloader == null)
         {
            §_-3YE§.§_-7aK§("hidePreloader: preloader is null");
            return;
         }
         if(this._currentState != §_-6tt§)
         {
            §_-3YE§.§_-7aK§("hidePreloader: current state is not active");
            return;
         }
         this._currentState = §_-8sg§;
         this._preloader.§_-BqX§.then(function():void
         {
            cleanPreloader();
         });
      }
      
      public function cleanPreloader() : void
      {
         this._currentState = §_-B1K§;
         if(this._preloader == null)
         {
            return;
         }
         if(Boolean(this.§_-AHa§) && this.§_-AHa§.contains(this._preloader))
         {
            this.§_-AHa§.removeChild(this._preloader);
         }
         this._preloader.destroy();
         this._preloader = null;
         this.§_-AHa§ = null;
         this.§_-5Bb§ = null;
      }
      
      public function §_-5-j§(param1:int) : void
      {
         if(!this.§_-6c2§)
         {
            return;
         }
         this._preloader.updateLabel(param1);
      }
      
      private function §_-57f§(param1:String) : DisplayObjectContainer
      {
         switch(param1)
         {
            case §_-7xW§:
               return this.§super§;
            case §_-9TZ§:
               return this.§_-7Pf§;
            default:
               §_-3YE§.error("getContainerByType: unknown type \'" + param1 + "\'");
               return null;
         }
      }
      
      public function get §_-6c2§() : Boolean
      {
         return this._preloader != null && this._currentState == §_-6tt§;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.cleanPreloader();
         this.§super§ = null;
         this.§_-7Pf§ = null;
         super.destroy();
      }
   }
}

