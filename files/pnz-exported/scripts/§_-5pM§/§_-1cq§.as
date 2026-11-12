package §_-5pM§
{
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-2UU§;
   import §_-3eZ§.§_-CJZ§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-GN§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-Fs§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.text.TextField;
   
   public class §_-1cq§ extends §_-GN§
   {
      private static const WIDTH:int = 540;
      
      private static const §_-621§:int = 407;
      
      public function §_-1cq§()
      {
         super(WIDTH,§_-621§,Context.§_-5o8§.message("cookTutorialStartDialogTitle"));
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc3_:Sprite = null;
         var _loc5_:§_-2UU§ = null;
         super.init();
         _loc1_ = ResourceManager.createMovieClip("CookTutorialStartDialogBubble@ui");
         _loc1_.x = clientWidth / 2 - 80;
         _loc1_.y = 50;
         addContent(_loc1_);
         var _loc2_:TextField = §_-5Kl§.createTextField(35,15,Context.§_-5o8§.message("cookTutorialStartDialogDescription"),§_-5Kl§.§_-BGn§,{
            "size":16,
            "color":8396345,
            "wordWrap":true,
            "multiline":true,
            "width":270
         });
         _loc1_.addChild(_loc2_);
         _loc3_ = new Sprite();
         var _loc4_:§_-CJZ§ = new §_-CJZ§(Context.§_-5o8§.message("startLabel"));
         _loc4_.modalResult = §_-0jI§.§_-9qy§;
         _loc3_.addChild(_loc4_);
         _loc5_ = new §_-2UU§(Context.§_-5o8§.message("leaveLabel"));
         _loc5_.modalResult = §_-0jI§.CLOSE;
         _loc5_.x = _loc4_.x + _loc4_.clientWidth + 25;
         _loc3_.addChild(_loc5_);
         _loc3_.x = _loc1_.x + _loc1_.width / 2 - _loc3_.width / 2 + 10;
         _loc3_.y = _loc1_.y + _loc1_.height + 25;
         addContent(_loc3_);
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-8Sw§();
      }
   }
}

