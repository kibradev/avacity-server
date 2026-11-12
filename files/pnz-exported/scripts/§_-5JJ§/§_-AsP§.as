package §_-5JJ§
{
   import §_-1Fx§.§_-5n7§;
   import §_-1ks§.§_-9nE§;
   import §_-5G6§.§_-ADg§;
   import §_-6JL§.§_-B9P§;
   import §_-786§.§_-CRy§;
   import §_-A2M§.§_-4Ba§;
   import §_-GM§.Context;
   import §_-kr§.§_-Ud§;
   
   public class §_-AsP§ extends §_-9nE§
   {
      public static const §_-8r2§:Object = {
         "ru":"Ошибка загрузки! Обновите страницу приложения!",
         "pl":"Ошибка загрузки! Обновите страницу приложения!",
         "en":"Loading error! Refresh the application page!",
         "tr":"Loading error! Refresh the application page!"
      };
      
      public static const §_-6SS§:Object = {
         "ru":"Ошибка загрузки! Возможно, файл конфигурации поврежден!",
         "pl":"Ошибка загрузки! Возможно, файл конфигурации поврежден!",
         "en":"Loading error! Perhaps the configuration file is corrupted!",
         "tr":"Loading error! Perhaps the configuration file is corrupted!"
      };
      
      protected var §_-34M§:§_-5n7§ = null;
      
      protected var §_-9yg§:Array = null;
      
      private var §_-XD§:§_-Ud§ = null;
      
      private var §_-vO§:§_-4Ba§ = null;
      
      public function §_-AsP§(param1:Array)
      {
         super();
         Context.§_-29d§.§_-9pe§();
         this.§_-9yg§ = param1;
      }
      
      override public function init() : void
      {
         this.§_-34M§ = new §_-5n7§();
         addChild(this.§_-34M§);
         Context.§_-CLP§.addEventListener(§_-B9P§.RESIZE,this.onResize);
      }
      
      public function load() : §_-4Ba§
      {
         if(this.§_-vO§ == null)
         {
            this.§_-vO§ = new §_-4Ba§();
            this.loadPreloaderData();
         }
         return this.§_-vO§;
      }
      
      protected function loadPreloaderData() : void
      {
      }
      
      protected function resize() : void
      {
      }
      
      protected function §_-8Et§() : void
      {
         this.§_-XD§ = new §_-Ud§(this.§_-9yg§);
         this.§_-XD§.addEventListener(§_-CRy§.§_-Sf§,this.onContentLoaded);
         this.§_-XD§.addEventListener(§_-CRy§.§_-BhX§,this.onContentProgress);
         this.§_-XD§.addEventListener(§_-CRy§.§_-2qp§,this.onContentError);
         this.§_-XD§.addEventListener(§_-CRy§.§_-AsY§,this.onConfigValidateError);
         this.§_-XD§.load();
      }
      
      protected function onContentProgress(param1:§_-CRy§) : void
      {
      }
      
      protected function onContentLoaded(param1:§_-CRy§) : void
      {
         this.§_-XD§.removeEventListener(§_-CRy§.§_-Sf§,this.onContentLoaded);
         this.§_-XD§.removeEventListener(§_-CRy§.§_-BhX§,this.onContentProgress);
         this.§_-XD§.removeEventListener(§_-CRy§.§_-2qp§,this.onContentError);
         this.§_-XD§.removeEventListener(§_-CRy§.§_-AsY§,this.onConfigValidateError);
         this.§_-XD§ = null;
      }
      
      protected function onConfigValidateError(param1:§_-CRy§) : void
      {
         §_-ADg§.§_-9CD§(Context.§_-2BT§.adapter.userId,"Validate config pack error");
      }
      
      protected function onContentError(param1:§_-CRy§) : void
      {
         §_-ADg§.§_-9CD§(Context.§_-2BT§.adapter.userId,"Loading city screen error");
      }
      
      protected function §_-CcW§() : void
      {
         this.§_-vO§.resolve();
      }
      
      private function onResize(param1:§_-B9P§) : void
      {
         this.resize();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-XD§ != null)
         {
            this.§_-XD§.removeEventListener(§_-CRy§.§_-Sf§,this.onContentLoaded);
            this.§_-XD§.removeEventListener(§_-CRy§.§_-BhX§,this.onContentProgress);
            this.§_-XD§.removeEventListener(§_-CRy§.§_-2qp§,this.onContentError);
            this.§_-XD§.removeEventListener(§_-CRy§.§_-AsY§,this.onConfigValidateError);
            this.§_-XD§ = null;
         }
         Context.§_-CLP§.removeEventListener(§_-B9P§.RESIZE,this.onResize);
         super.destroy();
      }
   }
}

