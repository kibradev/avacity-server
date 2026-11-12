package §_-2Y7§
{
   import §_-1Fx§.§_-5n7§;
   import §_-1Fx§.§_-6IC§;
   import §_-1sb§.§_-2xb§;
   import §_-1t9§.§_-5tp§;
   import §_-1t9§.§_-96c§;
   import §_-2U3§.ResourceManager;
   import §_-39l§.§_-5t6§;
   import §_-3eZ§.§_-2UU§;
   import §_-3eZ§.§_-7Oo§;
   import §_-5Zh§.§_-19w§;
   import §_-6BB§.§_-8BS§;
   import §_-AKx§.§_-3yT§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-5bz§;
   import §_-Bi2§.§_-Fs§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.display.BitmapData;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import penzville.Config;
   
   public class §_-BDS§ extends §_-3yT§
   {
      private var §_-7tz§:§_-7Oo§ = null;
      
      private var §_-83Z§:§_-2UU§ = null;
      
      private var _clanModel:§_-19w§ = null;
      
      private var _socialMedia:§_-96c§;
      
      public function §_-BDS§(param1:§_-19w§)
      {
         super(465,300,Context.§_-5o8§.message("congratulation"));
         this._clanModel = param1;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-5bz§();
      }
      
      override public function init() : void
      {
         var _loc1_:MovieClip = null;
         var _loc3_:TextField = null;
         var _loc4_:TextField = null;
         var _loc5_:§_-5n7§ = null;
         _loc1_ = new MovieClip();
         var _loc2_:MovieClip = §_-5t6§.instance.§_-C0o§(this._clanModel.icon);
         _loc1_.addChild(_loc2_);
         _loc3_ = §_-5Kl§.createTextField(0,0,this._clanModel.taggedTitle,§_-5Kl§.§_-8oH§);
         _loc3_.x = _loc1_.width / 2 - _loc3_.width / 2;
         _loc3_.y = 10;
         _loc1_.addChild(_loc3_);
         _loc4_ = §_-5Kl§.createTextField(0,0,this.clanPublishDescriptionText,§_-5Kl§.§_-6GB§);
         _loc4_.width = 200;
         _loc4_.x = _loc1_.width / 2 - _loc4_.width / 2;
         _loc4_.y = 190;
         _loc1_.addChild(_loc4_);
         _loc1_.x = clientWidth / 2 + _skin.clientBounds.x - _loc1_.width / 2;
         _loc1_.y = 50;
         addChild(_loc1_);
         _loc5_ = new §_-5n7§();
         var _loc6_:int = 0;
         this.§_-7tz§ = new §_-7Oo§(Context.§_-5o8§.message("walkToButtonTitle"),115);
         this.§_-7tz§.addEventListener(MouseEvent.CLICK,this.§_-1Tr§);
         _loc5_.addChild(this.§_-7tz§);
         _loc6_ += this.§_-7tz§.width + 15;
         if(Context.§_-2BT§.isAllowSocialMedia(§_-96c§.§_-Anq§))
         {
            this.§_-83Z§ = new §_-2UU§(Context.§_-5o8§.message("publish2ButtonTitle"),115,30,ResourceManager.createMovieClip("ClanPublishButtonIcon@ui"));
            this.§_-83Z§.addEventListener(MouseEvent.CLICK,this.§_-Dd§);
            this.§_-83Z§.disabled = true;
            this.§_-83Z§.x = _loc6_;
            _loc5_.addChild(this.§_-83Z§);
            this.§_-07s§();
         }
         _loc5_.x = clientWidth / 2 - _loc5_.width / 2;
         _loc5_.y = clientHeight - _loc5_.height - 8;
         addContent(_loc5_);
      }
      
      private function §_-1Tr§(param1:MouseEvent) : void
      {
         var _loc2_:ClanMainDialog = null;
         if(this._clanModel != null)
         {
            _loc2_ = new ClanMainDialog();
            _loc2_.showModal(null,true);
            close();
         }
      }
      
      private function §_-Dd§(param1:MouseEvent) : void
      {
         if(Config.§_-0nZ§)
         {
            Context.§_-CLP§.§_-0KB§();
         }
         this.§_-83Z§.disabled = true;
         Context.§_-2BT§.publishSocialMedia(this._socialMedia,this.onPublishSocialMedia);
      }
      
      private function onPublishSocialMedia() : void
      {
         Context.§_-1nD§.§_-7ED§(this.statisticsType,this.statisticsItemId,this.statisticsPostId);
         close();
      }
      
      private function onPreparePhoto(param1:§_-96c§) : void
      {
         this._socialMedia = param1;
         if(this.§_-83Z§ != null)
         {
            this.§_-83Z§.disabled = false;
         }
      }
      
      private function §_-07s§() : void
      {
         this._socialMedia = new §_-96c§();
         this.fillSocialMedia(this._socialMedia);
         Context.§_-2BT§.prepareSocialMedia(this._socialMedia,this.onPreparePhoto);
      }
      
      private function fillSocialMedia(param1:§_-96c§) : void
      {
         var _loc2_:§_-5tp§ = null;
         param1.type = this.socialMediaType;
         param1.photo = new §_-6IC§(this.publishBitmap);
         param1.§_-Bjy§ = Context.player.userInfo.socialId;
         param1.targetAlbumId = Context.player.userInfo.socialId;
         param1.description = this.socialMediaDescription;
         param1.confirm = Context.§_-5o8§.message("publishConfirm");
         param1.title = Context.§_-5o8§.message("clanSuccessCreatePublishTitle",{"clubName":this._clanModel.title});
         param1.photoUrl = Config.§_-CD3§ + this._clanModel.id + ".png";
         if(Context.§_-2BT§.adapter.socialNetwork != §_-8BS§.§_-BOa§)
         {
            _loc2_ = new §_-5tp§();
            _loc2_.§_-3ow§(Context.§_-2BT§.adapter.getAppLink(Context.§_-2BT§.adapter.appId) + "?type=" + this.statisticsType + "&userId=" + Context.player.id,Context.§_-5o8§.message("visitEventButton"));
            param1.links = _loc2_;
         }
      }
      
      private function get publishBitmap() : BitmapData
      {
         var _loc1_:MovieClip = §_-5t6§.instance.§_-C0o§(this._clanModel.icon);
         var _loc2_:BitmapData = new BitmapData(_loc1_.width,_loc1_.height);
         _loc2_.draw(_loc1_);
         return _loc2_;
      }
      
      private function get statisticsType() : String
      {
         return "clanCreate";
      }
      
      private function get statisticsItemId() : String
      {
         return this._clanModel.id.toString();
      }
      
      private function get statisticsPostId() : String
      {
         return "clanPost";
      }
      
      protected function get socialMediaDescription() : String
      {
         return Context.§_-5o8§.gender("clanSuccessCreatePublishDescription",Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§,{"link":Context.§_-2BT§.getAppLink()});
      }
      
      protected function get clanPublishDescriptionText() : String
      {
         return Context.§_-5o8§.message("clanSuccessCreateDescription");
      }
      
      private function get socialMediaType() : String
      {
         var _loc1_:String = null;
         if(Context.§_-2BT§.isAllowSocialMedia(§_-96c§.§_-Anq§))
         {
            _loc1_ = §_-96c§.§_-Anq§;
         }
         return _loc1_;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-7tz§ != null)
         {
            this.§_-7tz§.removeEventListener(MouseEvent.CLICK,this.§_-1Tr§);
            this.§_-7tz§ = null;
         }
         if(this.§_-83Z§ != null)
         {
            this.§_-83Z§.removeEventListener(MouseEvent.CLICK,this.§_-Dd§);
            this.§_-83Z§ = null;
         }
         super.destroy();
      }
   }
}

