package §_-5MD§
{
   import §_-22f§.§_-2zx§;
   import §_-2U3§.ResourceManager;
   import §_-38A§.§_-9TB§;
   import §_-5g6§.§_-42q§;
   import §_-AaA§.§_-Bjj§;
   import §_-AdD§.Avatar;
   import §_-GM§.Context;
   import §_-bm§.§_-3Fc§;
   import flash.display.DisplayObject;
   import flash.display.MovieClip;

   public class §_-BRp§ extends §_-C9k§ implements §_-8Oi§
   {
      protected var _view:MovieClip = null;

      protected var §_-0-a§:String = null;

      protected var §_-66m§:String = null;

      private var §_-1v7§:§_-9TB§ = null;

      public function §_-BRp§()
      {
         super();
         this.setLayer();
         mouseCursor = this.getMouseCursor();
         addEventListener(§_-2zx§.ROLL_OVER,this.onObjectRollOver);
         addEventListener(§_-2zx§.ROLL_OUT,this.onObjectRollOut);
      }

      protected function setLayer() : void
      {
         layerId = §_-42q§.§_-6rj§;
      }

      protected function getMouseCursor() : String
      {
         return §_-Bjj§.HAND;
      }

      override public function projectOnMap(param1:String, param2:Object) : void
      {
      }

      private function onObjectRollOut(param1:§_-2zx§) : void
      {
         try
         {
            if(this._view != null)
            {
               this._view.gotoAndPlay("out");
            }
         }
         catch(e:Error)
         {
         }
      }

      private function onObjectRollOver(param1:§_-2zx§) : void
      {
         try
         {
            if(this._view != null)
            {
               this._view.gotoAndPlay("over");
            }
         }
         catch(e:Error)
         {
         }
      }

      override protected function render() : void
      {
         container.removeAllChildren(true,true);
         if(skinName != null)
         {
            this._view = ResourceManager.createMovieClip(skinName);
            if(this._view != null)
            {
               container.addChild(this._view);
            }
         }
         this.§_-1v7§ = this.§_-4ki§();
      }

      public function get locationId() : String
      {
         return this.§_-0-a§;
      }

      public function set locationId(param1:String) : void
      {
         this.§_-0-a§ = param1;
      }

      public function get roomId() : String
      {
         return this.§_-66m§;
      }

      public function set roomId(param1:String) : void
      {
         this.§_-66m§ = param1;
      }

      public function startInteraction(param1:Avatar) : void
      {
         if(Context.cityPlayer.isTutorial)
         {
            return;
         }
         world.dispatchEvent(new §_-3Fc§(§_-3Fc§.§_-1xz§,this.§_-0-a§,this.§_-66m§));
      }

      public function getInteractPoint(param1:Avatar, param2:String, param3:§_-9TB§ = null) : §_-9TB§
      {
         if(this.§_-1v7§ != null)
         {
            return this.§_-1v7§;
         }
         return new §_-9TB§(wx,wy,wz);
      }

      protected function §_-4ki§() : §_-9TB§
      {
         var _loc3_:DisplayObject = null;
         var _loc4_:§_-9TB§ = null;
         if(this._view == null || world == null)
         {
            return null;
         }
         var _loc1_:§_-9TB§ = new §_-9TB§(wx,wy,wz);
         var _loc2_:int = this._view.numChildren - 1;
         while(_loc2_ >= 0)
         {
            _loc3_ = this._view.getChildAt(_loc2_);
            if(!(_loc3_ == null || _loc3_.name == null))
            {
               if(!(_loc3_.name != "standPlace" && _loc3_.name.match(/standPlace(\d+)/) == null))
               {
                  _loc4_ = world.view.screenToWorld(_loc3_.x,_loc3_.y,0);
                  return new §_-9TB§(_loc1_.x + _loc4_.x,_loc1_.y + _loc4_.y,_loc1_.z + _loc4_.z);
               }
            }
            _loc2_--;
         }
         return null;
      }

      public function finishInteraction(param1:Avatar) : void
      {
      }

      public function readyInteract() : Boolean
      {
         return true;
      }
   }
}
