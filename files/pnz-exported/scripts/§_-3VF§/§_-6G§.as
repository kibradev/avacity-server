package §_-3VF§
{
   import §_-0TK§.§_-1Oz§;
   import §_-5VL§.§_-43§;
   import §_-5eM§.§_-5d-§;
   import §_-5eM§.§_-5jU§;
   import §_-8Cv§.§_-3Wc§;
   import §_-8Hp§.§_-5KD§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import adept.config.Configuration;
   
   public class §_-6G§ extends §_-53f§
   {
      protected var _loaded:Boolean = false;
      
      protected var _inited:Boolean = false;
      
      protected var §_-BwS§:§_-0AL§ = null;
      
      private var §_-AcP§:String = null;
      
      private var §_-9yg§:Array = [];
      
      public function §_-6G§(param1:String)
      {
         super();
         this.§_-AcP§ = param1;
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:String) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get loadingContent() : Array
      {
         return this.§_-9yg§;
      }
      
      public function get uiConstructor() : §_-1hq§
      {
         return null;
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
      
      public function set inited(param1:Boolean) : void
      {
         this._inited = param1;
      }
      
      public function configure(param1:Configuration) : void
      {
         this.§_-AcP§ = param1.getString("id");
         this.§_-9yg§ = param1.getString("loadingContent") != null ? param1.getString("loadingContent").split(",") : [];
      }
      
      public function init() : void
      {
      }
      
      public function isActive() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(this.id) != null;
      }
      
      protected function §_-1qY§(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:§_-5jU§ = null;
         var _loc5_:XML = null;
         var _loc6_:§_-5d-§ = null;
         var _loc2_:XML = param1["inventory"][0];
         for each(_loc3_ in _loc2_.elements("category"))
         {
            _loc4_ = Context.§_-70S§.§_-0ZU§().findCategoryById(_loc3_["@id"]);
            if(_loc4_ != null)
            {
               for each(_loc5_ in _loc3_.elements("item"))
               {
                  _loc6_ = Context.§_-70S§.§_-2F4§(_loc4_.§_-1gW§);
                  _loc6_.typeId = _loc5_["@id"];
                  _loc6_.loadXML(_loc5_);
                  _loc4_.§_-AVx§(_loc6_);
               }
            }
         }
      }
      
      protected function §_-ACh§(param1:Configuration) : Array
      {
         var _loc4_:Configuration = null;
         var _loc5_:§_-5jU§ = null;
         var _loc6_:Configuration = null;
         var _loc7_:§_-5d-§ = null;
         var _loc2_:Array = [];
         var _loc3_:Configuration = param1.getConfiguration("inventory");
         for each(_loc4_ in _loc3_.getList("category"))
         {
            _loc5_ = Context.§_-70S§.§_-0ZU§().findCategoryById(_loc4_.getString("id"));
            if(_loc5_ != null)
            {
               for each(_loc6_ in _loc4_.getList("item"))
               {
                  _loc7_ = Context.§_-70S§.§_-2F4§(_loc5_.§_-1gW§);
                  _loc7_.typeId = _loc6_.getString("id");
                  _loc7_.loadConfig(_loc6_);
                  _loc5_.§_-AVx§(_loc7_);
                  _loc2_.push(_loc7_.typeId);
               }
            }
         }
         Context.§_-70S§.§_-0ZU§().§_-CYX§();
         return _loc2_;
      }
      
      protected function §_-28q§(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:§_-1Oz§ = null;
         var _loc2_:XML = param1["craft"][0];
         for each(_loc3_ in _loc2_.elements("craftedItem"))
         {
            _loc4_ = new §_-1Oz§();
            _loc4_.configure(_loc3_);
            Context.craftManager.§_-2zX§(_loc4_);
         }
      }
      
      protected function §_-8QW§(param1:XML) : void
      {
         var _loc2_:§_-43§ = new §_-43§();
         _loc2_.fromXML(param1["cityEventLocation"][0]);
         Context.§_-BFW§.§_-AYR§.§_-ARa§(_loc2_);
      }
      
      protected function onNewCampaigns(param1:§_-3Wc§) : void
      {
      }
      
      protected function run() : void
      {
      }
      
      public function onCampaignsUpdated(param1:§_-3Wc§) : void
      {
         this._loaded = true;
         this.onNewCampaigns(param1);
         this.run();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         super.destroy();
      }
   }
}

