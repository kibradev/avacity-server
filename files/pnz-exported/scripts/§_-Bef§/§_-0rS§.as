package §_-Bef§
{
   import §_-2U3§.ResourceManager;
   import §_-7ps§.§_-AND§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-Btg§.§_-7l7§;
   import §_-Btg§.§_-8jl§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   
   public class §_-0rS§ extends §_-9rp§
   {
      private static const §_-Bc§:int = 80;
      
      private static const §_-7xs§:int = 90;
      
      private var _player:§_-5ab§ = null;
      
      public function §_-0rS§(param1:§_-AND§, param2:§_-5ab§)
      {
         this._player = param2;
         super(param1);
      }
      
      override protected function onFinishClick(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         §_-4OH§.confirm(Context.§_-5o8§.message("finishTutorialTitle"),Context.§_-5o8§.message("finishTutorialConfirm"),function(param1:§_-2-c§):void
         {
            if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
            {
               §_-8jl§.§_-Do§.finishTutorial();
            }
         });
      }
      
      override protected function get title() : String
      {
         if(this._player == null || this._player.avatarAppearance == null)
         {
            return "";
         }
         return §_-Bbc§.getGenderTitle(this._player.avatarAppearance.gender);
      }
      
      override protected function onContinueClick(param1:MouseEvent) : void
      {
         if(§_-Bbc§.onContinue == §_-7l7§.§_-BL§)
         {
            §_-8jl§.§_-Do§.finishStep();
         }
         else
         {
            §_-8jl§.§_-Do§.§_-1pa§(§_-Bbc§.onContinue);
         }
      }
      
      override protected function render() : void
      {
         var _loc1_:MovieClip = null;
         super.render();
         if(this._player == null || this._player.avatarAppearance == null)
         {
            return;
         }
         _loc1_ = ResourceManager.createMovieClip("TutorialNpcTip@ui");
         _loc1_.gotoAndStop(this._player.avatarAppearance.gender == §_-3uA§.§_-908§ ? "boy" : "girl");
         _loc1_.x = -§_-Bc§;
         _loc1_.y = §_-8RM§.height - _loc1_.height - 5;
         addChild(_loc1_);
      }
      
      override protected function createBackground() : Sprite
      {
         §_-BPI§ = Math.max(§_-BPI§,§_-7xs§);
         var _loc1_:Sprite = new Sprite();
         var _loc2_:Graphics = _loc1_.graphics;
         _loc2_.lineStyle(4,12045103);
         _loc2_.drawRoundRect(2 - §_-Bc§,2,§_-01V§ - 4 + §_-Bc§,§_-BPI§ - 4,16);
         _loc2_.beginFill(16383202,0.9);
         _loc2_.lineStyle(2,16777215);
         _loc2_.drawRoundRect(5 - §_-Bc§,5,§_-01V§ - 10 + §_-Bc§,§_-BPI§ - 10,11);
         _loc2_.endFill();
         return _loc1_;
      }
   }
}

