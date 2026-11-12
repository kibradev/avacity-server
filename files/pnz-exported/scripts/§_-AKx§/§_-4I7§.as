package §_-AKx§
{
   import §_-0uA§.§_-3YE§;
   import §_-1t9§.§_-96c§;
   import §_-6BB§.§_-1KD§;
   import §_-Bi2§.§_-0sd§;
   import §_-Bi2§.§_-Fs§;
   import §_-GM§.Context;
   import flash.display.BitmapData;
   import penzville.Config;
   
   public class §_-4I7§ extends §_-GN§
   {
      private var _socialMedia:§_-96c§ = null;
      
      public function §_-4I7§(param1:int = 400, param2:int = 300, param3:String = null, param4:Boolean = true, param5:Boolean = true, param6:Boolean = true)
      {
         super(param1,param2,param3,param4,param5,param6);
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-0sd§();
      }
      
      protected function get allowPublish() : Boolean
      {
         return Context.§_-2BT§.isAllowSocialMedia(this.socialMediaType);
      }
      
      protected function get socialMediaType() : String
      {
         return §_-96c§.§_-Anq§;
      }
      
      protected function get socialMedia() : §_-96c§
      {
         return this._socialMedia;
      }
      
      protected function §_-07s§() : void
      {
         this._socialMedia = new §_-96c§();
         this.fillSocialMedia(this._socialMedia);
         Context.§_-2BT§.prepareSocialMedia(this._socialMedia,this.onPreparePhoto);
      }
      
      protected function fillSocialMedia(param1:§_-96c§) : void
      {
      }
      
      protected function get publishBitmap() : BitmapData
      {
         return null;
      }
      
      protected function onPreparePhoto(param1:§_-96c§) : void
      {
         this._socialMedia = param1;
      }
      
      protected function publish() : void
      {
         if(Config.§_-0nZ§)
         {
            Context.§_-CLP§.§_-0KB§();
         }
         Context.§_-2BT§.publishSocialMedia(this._socialMedia,this.onPublishSocialMedia,this.onErrorPublishSocialMedia);
      }
      
      protected function onPublishSocialMedia() : void
      {
         Context.§_-1nD§.§_-7ED§(this.statisticsType,this.statisticsItemId,this.statisticsPostId);
         close();
      }
      
      protected function onErrorPublishSocialMedia(param1:§_-1KD§) : void
      {
         if(param1 != null)
         {
            §_-3YE§.error("method onErrorPublishSocialMedia: error=: " + param1);
         }
         close();
      }
      
      protected function get statisticsType() : String
      {
         return null;
      }
      
      protected function get statisticsItemId() : String
      {
         return null;
      }
      
      protected function get statisticsPostId() : String
      {
         return null;
      }
   }
}

