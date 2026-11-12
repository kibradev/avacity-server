package §_-BiZ§
{
   import §_-1ks§.§_-9nE§;
   import §_-6BB§.§_-2qC§;
   import §_-6BB§.§_-8BS§;
   import §_-AaA§.§_-5Kl§;
   import §_-BRr§.§_-0IL§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-11h§ extends §_-9nE§
   {
      public static const §_-7GJ§:Array = [§_-2qC§.PERMISSION_FRIENDS];
      
      private var _translation:Object = {
         "ru":{
            "installApplication":"Пожалуйста, установите приложение.",
            "installApplicationButtonTitle":"Установить приложение"
         },
         "en":{
            "installApplication":"Please, install application.",
            "installApplicationButtonTitle":"Install application"
         }
      };
      
      private var _messageLabel:TextField;
      
      private var _installButton:§_-0IL§ = null;
      
      public function §_-11h§()
      {
         super();
      }
      
      override public function init() : void
      {
         this._messageLabel = §_-5Kl§.createTextField(Config.§_-50z§ / 2,300,"",§_-5Kl§.§_-5zO§);
         this._messageLabel.filters = [];
         this._messageLabel.autoSize = TextFieldAutoSize.CENTER;
         addChild(this._messageLabel);
         this.installCheck();
      }
      
      private function installCheck() : void
      {
         var defaultPermissions:Array = null;
         defaultPermissions = §_-7GJ§;
         if(Context.§_-2BT§.adapter.socialNetwork == §_-8BS§.§_-BOa§)
         {
            defaultPermissions = [];
         }
         Context.§_-2BT§.isInstalled(defaultPermissions,function(param1:Boolean):void
         {
            if(param1)
            {
               Application.instance.initLoading();
            }
            else
            {
               Context.§_-2BT§.installApp(installCheck,null,defaultPermissions);
               _messageLabel.text = _translation["ru"]["installApplication"];
               if(_installButton == null)
               {
                  _installButton = new §_-0IL§(_translation["ru"]["installApplicationButtonTitle"],300,330);
                  _installButton.addEventListener(MouseEvent.CLICK,onInstallClick);
                  addChild(_installButton);
                  _installButton.x = Config.§_-50z§ / 2 - _installButton.width / 2;
               }
            }
         });
      }
      
      private function onInstallClick(param1:MouseEvent) : void
      {
         this.installCheck();
      }
      
      override public function destroy() : void
      {
         removeChild(this._messageLabel);
         this._messageLabel = null;
         this._installButton = null;
         super.destroy();
      }
   }
}

