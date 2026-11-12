package §_-3VF§
{
   import §_-0rs§.§_-6mU§;
   import §_-1ks§.§_-Eb§;
   import §_-6-L§.§_-49j§;
   import §_-8Cv§.§_-3Wc§;
   import §_-8Hp§.§_-5KD§;
   import §_-9Bv§.§_-8fL§;
   import §_-A2M§.§_-4Ba§;
   import §_-AFi§.§_-3l5§;
   import §_-AFi§.§_-4S-§;
   import §_-AFi§.§_-4jt§;
   import §_-AFi§.§_-9QY§;
   import §_-AFi§.§_-ByM§;
   import §_-C6z§.§_-5qw§;
   import §_-GM§.Context;
   import §_-kr§.§_-2NT§;
   import §_-uR§.§_-53f§;
   
   public class §_-0nG§ extends §_-53f§
   {
      private static var _instance:§_-0nG§ = null;
      
      private var _modules:Object = {};
      
      private var §_-3nY§:§_-8YV§ = null;
      
      private var §_-AxY§:§_-B45§ = null;
      
      private var §_-Ba7§:§_-9Hx§ = null;
      
      private var §_-1Z§:§_-4Ba§ = new §_-4Ba§();
      
      public function §_-0nG§()
      {
         super();
         §_-5KD§.instance.addEventListener(§_-3Wc§.§_-AIq§,this.§_-BKV§);
         §_-5KD§.instance.addEventListener(§_-3Wc§.§_-9cv§,this.§_-4AO§);
      }
      
      public static function get instance() : §_-0nG§
      {
         if(_instance == null)
         {
            _instance = new §_-0nG§();
         }
         return _instance;
      }
      
      public static function §_-2aA§(param1:§_-6G§) : §_-4jt§
      {
         if(param1 is §_-4jt§)
         {
            return param1 as §_-4jt§;
         }
         if(param1 is §_-6mU§)
         {
            return (param1 as §_-6mU§).getComponent(§_-5qw§) as §_-4jt§;
         }
         return null;
      }
      
      private function §_-4AO§(param1:§_-3Wc§) : void
      {
         var _loc2_:§_-6G§ = null;
         this.§_-1Z§.resolve();
         for each(_loc2_ in this._modules)
         {
            if(_loc2_.isActive())
            {
               _loc2_.onCampaignsUpdated(param1);
            }
         }
      }
      
      private function §_-BKV§(param1:§_-3Wc§) : void
      {
         Context.§_-A3p§.§_-AP9§();
      }
      
      public function get §_-2AP§() : §_-8YV§
      {
         if(this.§_-3nY§ == null)
         {
            this.§_-3nY§ = new §_-8YV§();
         }
         return this.§_-3nY§;
      }
      
      public function get §_-6hF§() : §_-B45§
      {
         if(this.§_-AxY§ == null)
         {
            this.§_-AxY§ = new §_-B45§();
         }
         return this.§_-AxY§;
      }
      
      public function get gameHelper() : §_-9Hx§
      {
         if(this.§_-Ba7§ == null)
         {
            this.§_-Ba7§ = new §_-9Hx§();
         }
         return this.§_-Ba7§;
      }
      
      public function §_-2jQ§(param1:§_-8fL§) : void
      {
         var _loc2_:§_-8fL§ = null;
         var _loc3_:§_-6G§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.getList("module"))
         {
            _loc3_ = §_-BiA§.§_-2jN§(_loc2_.getString("id"));
            if(_loc3_ != null)
            {
               _loc3_.configure(_loc2_.§_-8QD§());
               this.§_-5as§(_loc3_);
            }
         }
      }
      
      public function init() : void
      {
         var _loc1_:§_-6G§ = null;
         for each(_loc1_ in this._modules)
         {
            _loc1_.init();
         }
      }
      
      public function §_-5as§(param1:§_-6G§) : void
      {
         if(param1.id == null)
         {
            throw new Error("Module id is undefined");
         }
         this._modules[param1.id] = param1;
         this.§_-2AP§.§_-7tA§(param1);
         this.gameHelper.§_-7tA§(param1);
         if(param1 is §_-3l5§)
         {
            this.§_-6hF§.§_-7tA§(param1 as §_-3l5§);
         }
      }
      
      public function get §_-I2§() : Boolean
      {
         var _loc1_:§_-6G§ = null;
         for each(_loc1_ in §_-0nG§.instance.§_-2bV§())
         {
            if(_loc1_ is §_-9QY§)
            {
               return (_loc1_ as §_-9QY§).§_-2jp§();
            }
         }
         return false;
      }
      
      public function getModule(param1:String) : §_-6G§
      {
         return !!this._modules.hasOwnProperty(param1) ? this._modules[param1] : null;
      }
      
      public function §_-2bV§() : Array
      {
         return §_-49j§.§_-FR§(this._modules);
      }
      
      public function §_-3Zk§(param1:String) : void
      {
         var _loc2_:§_-6G§ = this.getModule(param1);
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.destroy();
         delete this._modules[param1];
      }
      
      public function get loadingContent() : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         task = new §_-4Ba§();
         this.§_-1Z§.then(function():void
         {
            var _loc2_:§_-6G§ = null;
            var _loc1_:Array = [];
            for each(_loc2_ in _modules)
            {
               if(_loc2_.isActive())
               {
                  §_-49j§.merge(_loc1_,_loc2_.loadingContent);
               }
            }
            task.resolve(_loc1_);
         });
         return task;
      }
      
      public function §_-6nV§(param1:String) : void
      {
         var _loc3_:§_-6G§ = null;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         var _loc2_:Array = param1.split(",");
         for each(_loc3_ in this._modules)
         {
            if(_loc3_ is §_-ByM§ && _loc2_.indexOf(_loc3_.id) >= 0)
            {
               (_loc3_ as §_-ByM§).§_-7QB§ = true;
            }
         }
      }
      
      public function §_-5q1§(param1:String) : Boolean
      {
         var _loc2_:§_-6G§ = null;
         for each(_loc2_ in this._modules)
         {
            if(_loc2_ is §_-4S-§ && (_loc2_ as §_-4S-§).§_-7LT§(param1))
            {
               return (_loc2_ as §_-4S-§).§_-5R4§();
            }
         }
         return true;
      }
      
      public function §_-6Li§() : Array
      {
         var _loc2_:§_-6G§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this._modules)
         {
            if(_loc2_ is §_-4S-§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function constructPanels(param1:§_-Eb§) : void
      {
         var _loc2_:§_-6G§ = null;
         var _loc3_:§_-1hq§ = null;
         for each(_loc2_ in §_-0nG§.instance.§_-2bV§())
         {
            if(_loc2_.isActive())
            {
               _loc3_ = _loc2_.uiConstructor;
               if(_loc3_ != null)
               {
                  this.§_-3jA§(_loc2_,param1);
               }
            }
         }
      }
      
      private function §_-3jA§(param1:§_-6G§, param2:§_-Eb§) : void
      {
         var task:§_-4Ba§ = null;
         var componentModule:§_-6mU§ = null;
         var module:§_-6G§ = param1;
         var screen:§_-Eb§ = param2;
         if(module is §_-6mU§)
         {
            componentModule = module as §_-6mU§;
            task = componentModule.§_-mP§;
         }
         else
         {
            task = §_-2NT§.§_-8wu§(module.loadingContent);
         }
         task.then(function():void
         {
            module.uiConstructor.constructPanels(screen);
         });
      }
      
      public function §_-5WT§(param1:Class) : Array
      {
         var _loc3_:§_-6G§ = null;
         var _loc4_:* = undefined;
         var _loc2_:Array = [];
         for each(_loc3_ in this._modules)
         {
            if(_loc3_ is §_-6mU§ && _loc3_.isActive())
            {
               _loc4_ = (_loc3_ as §_-6mU§).getComponent(param1);
               if(_loc4_ != null)
               {
                  _loc2_.push(_loc4_);
               }
            }
         }
         return _loc2_;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         §_-5KD§.instance.removeEventListener(§_-3Wc§.§_-AIq§,this.§_-BKV§);
         super.destroy();
      }
   }
}

