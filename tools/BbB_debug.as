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
   import flash.text.TextFormat;

   public class §_-BbB§ extends §_-01I§
   {
      private var §_-dbgField§:TextField = null;

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
         this.§_-BOOM§("BbB:init:enter");
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
         this.§_-BOOM§("BbB:init:exit");
      }

      private function §_-BOOM§(param1:String, param2:* = null) : void
      {
         try
         {
            if(this.§_-dbgField§ == null)
            {
               this.§_-dbgField§ = new TextField();
               this.§_-dbgField§.x = 10;
               this.§_-dbgField§.y = 40;
               this.§_-dbgField§.width = 645;
               this.§_-dbgField§.height = 320;
               this.§_-dbgField§.multiline = true;
               this.§_-dbgField§.wordWrap = true;
               this.§_-dbgField§.background = true;
               this.§_-dbgField§.backgroundColor = 16777215;
               this.§_-dbgField§.border = true;
               this.§_-dbgField§.borderColor = 16711680;
               this.§_-dbgField§.textColor = 16711680;
               var fmt:TextFormat = new TextFormat();
               fmt.size = 13;
               fmt.bold = true;
               this.§_-dbgField§.defaultTextFormat = fmt;
            }
            if(this.§_-dbgField§.parent == null)
            {
               addContent(this.§_-dbgField§);
            }
            var line:String = param2 == null ? param1 : param1 + ": " + param2;
            this.§_-dbgField§.appendText(line + "\n");
         }
         catch(e:*)
         {
         }
      }

      private function §_-7t6§(param1:MouseEvent) : void
      {
         try
         {
            this.§_-BOOM§("female:start");
            Context.player.userInfo.gender = §_-4Wb§.§_-BYe§;
            this.§_-BOOM§("female:userInfoGender:ok");
            Context.player.avatarAppearance.gender = §_-3uA§.§_-BO7§;
            this.§_-BOOM§("female:appearanceGender:ok");
            dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
            this.§_-BOOM§("female:dispatched:ok");
            this.showDialog();
            this.§_-BOOM§("female:showDialogReturned:ok");
            close();
         }
         catch(e:*)
         {
            this.§_-BOOM§("female:CAUGHT",e);
         }
      }

      private function §_-3Xq§(param1:MouseEvent) : void
      {
         try
         {
            this.§_-BOOM§("male:start");
            Context.player.userInfo.gender = §_-4Wb§.§_-dv§;
            this.§_-BOOM§("male:userInfoGender:ok");
            Context.player.avatarAppearance.gender = §_-3uA§.§_-908§;
            this.§_-BOOM§("male:appearanceGender:ok");
            dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
            this.§_-BOOM§("male:dispatched:ok");
            this.showDialog();
            this.§_-BOOM§("male:showDialogReturned:ok");
            close();
         }
         catch(e:*)
         {
            this.§_-BOOM§("male:CAUGHT",e);
         }
      }

      protected function showDialog() : void
      {
         try
         {
            this.§_-BOOM§("showDialog:enter");
            new §_-3sA§(Context.cityPlayer.cloneFast()).showModal();
            this.§_-BOOM§("showDialog:exit:ok");
         }
         catch(e:*)
         {
            this.§_-BOOM§("showDialog:CAUGHT",e);
            throw e;
         }
      }
   }
}
