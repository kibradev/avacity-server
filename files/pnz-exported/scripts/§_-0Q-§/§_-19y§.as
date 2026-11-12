package §_-0Q-§
{
   import §_-1l5§.§_-4m-§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.BaseButton;
   import §_-5PB§.§_-5hC§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-4I7§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-BeP§;
   import §_-Bi2§.§_-Fs§;
   import §_-GM§.Context;
   import com.greensock.TweenLite;
   import com.greensock.easing.Back;
   import flash.display.MovieClip;
   import flash.text.TextField;
   import flash.text.TextFormatAlign;
   import penzville.Config;
   
   public class §_-19y§ extends §_-4I7§
   {
      private var _offer:§_-4m-§ = null;
      
      public function §_-19y§(param1:§_-4m-§)
      {
         super(420,360,null,false);
         this._offer = param1;
      }
      
      override public function showModal(param1:Function = null, param2:Boolean = true) : void
      {
         var _loc3_:Number = NaN;
         super.showModal(param1,param2);
         _loc3_ = y;
         y = Config.§_-6Z0§;
         alpha = 0;
         TweenLite.to(this,0.5,{
            "alpha":1,
            "y":_loc3_,
            "ease":Back.easeOut
         });
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-BeP§();
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc2_:int = 0;
         var _loc3_:TextField = null;
         var _loc4_:§_-1Di§ = null;
         var _loc5_:TextField = null;
         var _loc7_:BaseButton = null;
         super.init();
         _loc1_ = ResourceManager.createMovieClip("DailyGiftDialogHeader@ui");
         _loc1_.x = (clientWidth + _skin.clientBounds.left + _skin.clientBounds.right) / 2;
         addContentOverlay(_loc1_);
         _loc2_ = 0;
         _loc3_ = §_-5Kl§.createTextField(0,0,this._offer.descriptor.§_-5w9§.localizedTitle,§_-5Kl§.§_-8sp§,{
            "color":16373532,
            "size":26
         });
         _loc3_.x = clientWidth / 2 - _loc3_.width / 2;
         _loc3_.y = _loc2_;
         addContent(_loc3_);
         _loc2_ += _loc3_.height + 10;
         _loc4_ = new §_-1Di§(this._offer);
         _loc4_.x = clientWidth / 2 - _loc4_.width / 2;
         _loc4_.y = _loc2_;
         addContent(_loc4_);
         _loc2_ += _loc4_.height + 5;
         _loc5_ = §_-5Kl§.createTextField(0,_loc2_,this._offer.descriptor.§_-5w9§.localizedDescription,§_-5Kl§.§_-1Zt§,{
            "size":15,
            "width":clientWidth - 20,
            "align":TextFormatAlign.CENTER,
            "wordWrap":true,
            "multiline":true
         });
         _loc5_.x = clientWidth / 2 - _loc5_.width / 2;
         addContent(_loc5_);
         clientHeight = _loc5_.y + _loc5_.height + 30;
         var _loc6_:String = Context.§_-5o8§.message("dayliGiftGetButtonTitle");
         _loc7_ = new BaseButton(_loc6_);
         _loc7_.x = (clientWidth + _skin.clientBounds.left + _skin.clientBounds.right) / 2 - _loc7_.clientWidth / 2;
         _loc7_.y = _skin.clientBounds.top + clientHeight + _skin.clientBounds.bottom - _loc7_.clientHeight / 2;
         addContentOverlay(_loc7_);
         _loc7_.modalResult = §_-0jI§.§_-9qy§;
         if(this._offer.descriptor.statDescriptor != null)
         {
            this._offer.descriptor.statDescriptor.eventComplete(§_-5hC§.§_-8D2§);
         }
      }
   }
}

