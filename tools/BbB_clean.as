package §_-6lP§
{
   import §_-1t9§.§_-4Wb§;
   import §_-3YK§.§_-6uB§;
   import §_-3eZ§.BaseButton;
   import §_-6JL§.§_-B9P§;
   import §_-9xx§.§_-3sA§;
   import §_-AKx§.§_-01I§;
   import §_-AaA§.§_-5Kl§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.text.TextField;

   public class §_-BbB§ extends §_-01I§
   {
      public function §_-BbB§()
      {
         super(665,380,Context.§_-5o8§.message("createAvatarTitle"),false);
      }

      override public function init() : void
      {
         var _loc1_:TextField = null;
         var _loc2_:§_-6uB§ = null;
         var _loc3_:§_-6uB§ = null;
         var _loc4_:BaseButton = null;
         var _loc5_:BaseButton = null;
         super.init();
         _loc1_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("chooseAvatarSex"),§_-5Kl§.§_-5zO§,{"size":23});
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         addContent(_loc1_);
         _loc2_ = new §_-6uB§(§_-3uA§.§_-908§);
         _loc2_.x = clientWidth / 2 - _loc2_.width / 2 - 30;
         _loc2_.y = _loc1_.y + 310;
         addContent(_loc2_);
         _loc2_.addEventListener(MouseEvent.CLICK,this.§_-3Xq§);
         _loc3_ = new §_-6uB§(§_-3uA§.§_-BO7§);
         _loc3_.x = clientWidth / 2 + _loc3_.width / 2 + 30;
         _loc3_.y = _loc1_.y + 310;
         addContent(_loc3_);
         _loc3_.addEventListener(MouseEvent.CLICK,this.§_-7t6§);
         _loc4_ = new BaseButton(Context.§_-5o8§.message("avatarSexMale"));
         _loc4_.x = _loc2_.x - _loc4_.clientWidth / 2;
         _loc4_.y = _loc2_.y + 15;
         addContent(_loc4_);
         _loc4_.addEventListener(MouseEvent.CLICK,this.§_-3Xq§);
         _loc5_ = new BaseButton(Context.§_-5o8§.message("avatarSexFemale"));
         _loc5_.x = _loc3_.x - _loc5_.clientWidth / 2;
         _loc5_.y = _loc3_.y + 15;
         addContent(_loc5_);
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-7t6§);
      }

      private function §_-7t6§(param1:MouseEvent) : void
      {
         Context.player.userInfo.gender = §_-4Wb§.§_-BYe§;
         Context.player.avatarAppearance.gender = §_-3uA§.§_-BO7§;
         dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
         this.showDialog();
         close();
      }

      private function §_-3Xq§(param1:MouseEvent) : void
      {
         Context.player.userInfo.gender = §_-4Wb§.§_-dv§;
         Context.player.avatarAppearance.gender = §_-3uA§.§_-908§;
         dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
         this.showDialog();
         close();
      }

      protected function showDialog() : void
      {
         new §_-3sA§(Context.player.cloneFast()).showModal();
      }
   }
}
