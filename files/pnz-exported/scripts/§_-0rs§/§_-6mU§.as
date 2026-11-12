package §_-0rs§
{
   import §_-0uA§.§_-3YE§;
   import §_-3VF§.§_-0AL§;
   import §_-3VF§.§_-6G§;
   import §_-8Cv§.§_-3Wc§;
   import §_-A2M§.§_-4Ba§;
   import §_-C6z§.§_-BBn§;
   import §_-C6z§.§_-Fk§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import flash.utils.getQualifiedClassName;
   
   public class §_-6mU§ extends §_-6G§
   {
      private static const §_-9YE§:int = 15;
      
      private var _components:Array = [];
      
      private var §_-2IM§:§_-4Ba§ = new §_-4Ba§();
      
      public function §_-6mU§(param1:String)
      {
         super(param1);
         this.addComponents();
         this.initComponents();
      }
      
      public function get isTestMode() : Boolean
      {
         return §_-BwS§ != null && §_-BwS§.isTestMode;
      }
      
      private function initComponents() : void
      {
         var _loc1_:§_-Fk§ = null;
         for each(_loc1_ in this._components)
         {
            _loc1_.init();
         }
      }
      
      public function showParticipateDialog() : void
      {
      }
      
      protected function onComponentsLoaded() : void
      {
      }
      
      override protected function run() : void
      {
         var tasks:Array;
         var timer:Timer = null;
         var watchdog:Function = null;
         var component:§_-Fk§ = null;
         super.run();
         §_-3YE§.info("[^_^] Starting module \'" + id + "\' [^_^]");
         timer = new Timer(§_-9YE§ * 1000,1);
         watchdog = function(... rest):void
         {
            var _loc3_:§_-Fk§ = null;
            var _loc2_:Array = [];
            for each(_loc3_ in _components)
            {
               if(_loc3_ is §_-BBn§)
               {
                  if((_loc3_ as §_-BBn§).§_-1h1§.status != §_-4Ba§.§_-3F5§)
                  {
                     _loc2_.push(getQualifiedClassName(_loc3_));
                  }
               }
            }
            §_-3YE§.error("[o_O] Cannot start module \'" + id + "\'. [O_o] Stuck components: \n\t" + _loc2_.join("\n\t"));
         };
         timer.addEventListener(TimerEvent.TIMER,watchdog);
         timer.start();
         tasks = [];
         for each(component in this._components)
         {
            if(component is §_-BBn§)
            {
               tasks.push((component as §_-BBn§).§_-1h1§.then(function():void
               {
                  timer.reset();
                  timer.start();
               }));
            }
            component.run();
         }
         §_-4Ba§.all(tasks).then(this.onComponentsLoaded).then(function():void
         {
            timer.removeEventListener(TimerEvent.TIMER,watchdog);
            timer.stop();
            §_-3YE§.info("[^_^] Module \'" + id + "\' successfully started [^_^]");
         }).error(watchdog).next(this.§_-2IM§);
      }
      
      protected function addComponents() : void
      {
      }
      
      protected function §_-BF3§(param1:§_-Fk§) : *
      {
         param1.§_-6P5§(this);
         this._components.push(param1);
         return param1;
      }
      
      public function getComponent(param1:Class) : *
      {
         var _loc2_:§_-Fk§ = null;
         for each(_loc2_ in this._components)
         {
            if(_loc2_ is param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-4YZ§(param1:Class) : Array
      {
         var _loc3_:§_-Fk§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._components)
         {
            if(_loc3_ is param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      override public function onCampaignsUpdated(param1:§_-3Wc§) : void
      {
         var _loc2_:§_-Fk§ = null;
         for each(_loc2_ in this._components)
         {
            _loc2_.onCampaignsUpdated(param1);
         }
         super.onCampaignsUpdated(param1);
      }
      
      override public function destroy() : void
      {
         var _loc1_:§_-Fk§ = null;
         for each(_loc1_ in this._components)
         {
            _loc1_.destroy();
         }
         super.destroy();
      }
      
      public function set modulePropertyRegistry(param1:§_-0AL§) : void
      {
         §_-BwS§ = param1;
      }
      
      public function get modulePropertyRegistry() : §_-0AL§
      {
         return §_-BwS§;
      }
      
      public function get §_-mP§() : §_-4Ba§
      {
         return this.§_-2IM§;
      }
   }
}

