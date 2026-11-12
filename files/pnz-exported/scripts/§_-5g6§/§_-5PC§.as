package §_-5g6§
{
   import §_-1Fx§.§_-5n7§;
   import §_-AeE§.§_-3UZ§;
   import §_-AeE§.§_-Bqm§;
   import flash.display.DisplayObject;
   import flash.geom.Point;
   
   public class §_-5PC§ extends §_-5zA§
   {
      private var _skin:§_-Bqm§;
      
      public function §_-5PC§(param1:String = null, param2:§_-Bqm§ = null)
      {
         super();
         if(param1 != null)
         {
            this.layerId = param1;
         }
         if(param2 != null)
         {
            this.skin = param2;
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._skin != null)
         {
            this._skin.destroy();
            this._skin = null;
         }
         super.destroy();
      }
      
      protected function attachSkin() : void
      {
         if(this._skin == null || _world == null || layerId == null)
         {
            return;
         }
         this._skin.attach(_world.getLayer(layerId),this);
         this.invalidatePosition();
      }
      
      override public function setWorld(param1:§_-1ib§) : void
      {
         super.setWorld(param1);
         this.attachSkin();
      }
      
      override public function set layerId(param1:String) : void
      {
         if(layerId == param1)
         {
            return;
         }
         if(this._skin != null && world != null && layerId != null)
         {
            this._skin.detach();
         }
         super.layerId = param1;
         this.attachSkin();
      }
      
      override public function get objectView() : DisplayObject
      {
         return this.container;
      }
      
      public function validateAll() : void
      {
         this.invalidatePosition();
         this.invalidateVisibility();
         invalidateDirection();
         §_-Wa§();
      }
      
      protected function §_-6wV§() : void
      {
         if(world == null || this._skin == null)
         {
            return;
         }
         var _loc1_:Point = _world.view.worldToScreen(§_-1ZO§,§_-xS§,§_-BE-§);
         _loc1_ = _loc1_.add(§_-4TH§);
         this._skin.moveTo(_loc1_.x,_loc1_.y);
      }
      
      override protected function invalidatePosition() : void
      {
         super.invalidatePosition();
         this.§_-6wV§();
      }
      
      override protected function invalidateVisibility() : void
      {
         if(this._skin != null)
         {
            this._skin.visible = visible;
         }
      }
      
      public function get skin() : §_-Bqm§
      {
         return this._skin;
      }
      
      public function set skin(param1:§_-Bqm§) : void
      {
         if(this._skin != null)
         {
            this._skin.detach();
         }
         this._skin = param1;
         this.attachSkin();
      }
      
      override public function hitTestPoint(param1:Number, param2:Number) : DisplayObject
      {
         return this._skin != null ? this._skin.hitTestPoint(param1,param2) : null;
      }
      
      public function get container() : §_-5n7§
      {
         if(this._skin == null)
         {
            this._skin = new §_-3UZ§();
            this.attachSkin();
         }
         if(this._skin is §_-3UZ§)
         {
            return §_-3UZ§(this._skin).container;
         }
         throw new Error("Invalid skin type. Only ContainerSkin supports container. ");
      }
   }
}

