package §_-1Y4§
{
   import §_-0HU§.§_-2uT§;
   import §_-0Uz§.§_-m3§;
   import §_-6-L§.§_-3hw§;
   import §_-ZS§.§_-3BA§;
   import §_-ZS§.§_-8dP§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-8GB§ extends §_-53f§ implements §_-m3§
   {
      public static const §_-3Rf§:String = "orderBoard";
      
      public static const §_-0tS§:String = "dishwasher";
      
      public static const §_-BYj§:String = "npcMessage_next";
      
      public static const §_-3VU§:String = "StartCooking";
      
      public static const §_-1Lj§:String = "TakeMeal";
      
      public static const §_-2wB§:String = "MealCooked";
      
      public static const §_-AVy§:String = "dishwasherStartWashing";
      
      public static const §_-2VX§:String = "dishwasherDishesWashed";
      
      public static const §_-CXr§:String = "dishwasherFinishWashing";
      
      public static const §_-7lC§:uint = 1;
      
      public static const §_-0Xj§:uint = 2;
      
      private static const §_-45f§:String = "final";
      
      private var _netManager:§_-2uT§ = null;
      
      private var §_-C6t§:Array = null;
      
      private var §_-4s1§:Object = null;
      
      private var §_-5ka§:int = 0;
      
      private var §_-9At§:int = 0;
      
      private var §_-6D-§:int = 0;
      
      private var §_-3OI§:§_-3BA§ = null;
      
      private var §_-AuG§:§_-8dP§ = null;
      
      public function §_-8GB§()
      {
         super();
         this._netManager = new §_-2uT§(this);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:§_-3BA§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XML = §_-3hw§.§_-1s9§(param1,"cookTutorial");
         this.§_-5ka§ = §_-3hw§.getInt(_loc2_,"professionExp");
         this.§_-9At§ = §_-3hw§.getInt(_loc2_,"orderProcessingTime");
         this.§_-6D-§ = §_-3hw§.getInt(_loc2_,"dishesTotalCount");
         this.§_-4s1§ = {};
         for each(_loc3_ in §_-3hw§.§_-3bk§(_loc2_,"processingTimes.restaurantAction"))
         {
            _loc5_ = §_-3hw§.getString(_loc3_,"@type");
            _loc6_ = §_-3hw§.getInt(_loc3_,"@time");
            this.§_-4s1§[_loc5_] = _loc6_;
         }
         this.§_-C6t§ = [];
         for each(_loc4_ in §_-3hw§.§_-3bk§(_loc2_,"steps.step"))
         {
            _loc7_ = new §_-3BA§();
            _loc7_.configure(_loc4_);
            this.§_-C6t§.push(_loc7_);
         }
         this.§_-C6t§.sortOn("priority",Array.NUMERIC);
      }
      
      public function §_-7Cb§() : void
      {
         this.§_-Asb§(0);
      }
      
      public function §_-7xC§(param1:String) : void
      {
         if(param1 == null || this.§_-3OI§ == null)
         {
            return;
         }
         if(this.§_-AuG§.§_-3Cx§(param1))
         {
            this.nextAction();
         }
      }
      
      private function nextAction() : void
      {
         if(this.§_-3OI§ == null || this.§_-3OI§.actions == null || this.§_-3OI§.actions.length <= 0)
         {
            return;
         }
         var _loc1_:§_-8dP§ = this.§_-3OI§.getNextAction(this.§_-AuG§.id);
         if(_loc1_ == null)
         {
            this.§_-1gs§();
         }
         else
         {
            this.§_-3GP§(_loc1_);
         }
      }
      
      public function §_-1gs§() : void
      {
         if(this.§_-3OI§.id == §_-45f§)
         {
            this._netManager.finishTutorial();
         }
         else
         {
            this.§_-Asb§(this.§_-3OI§.priority + 1);
         }
      }
      
      private function §_-Asb§(param1:int) : void
      {
         if(this.§_-C6t§.length <= param1)
         {
            return;
         }
         this.§_-3OI§ = this.§_-C6t§[param1];
         this.§_-3GP§(this.§_-3OI§ != null ? this.§_-3OI§.actions[0] : null);
      }
      
      private function §_-3GP§(param1:§_-8dP§) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-AuG§ = param1;
         dispatchEvent(new §_-8lL§(§_-8lL§.NEXT_ACTION,this.§_-AuG§));
      }
      
      public function §_-61H§(param1:String) : int
      {
         if(this.§_-4s1§.hasOwnProperty(param1))
         {
            return this.§_-4s1§[param1];
         }
         return 0;
      }
      
      public function get professionExp() : int
      {
         return this.§_-5ka§;
      }
      
      public function get orderProcessingTime() : int
      {
         return this.§_-9At§;
      }
      
      public function get dishesTotalCount() : int
      {
         return this.§_-6D-§;
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         if(this._netManager == null)
         {
            this._netManager = new §_-2uT§(this);
         }
         this._netManager.netClient = param1;
      }
      
      public function onFinishTutorial() : void
      {
         dispatchEvent(new §_-8lL§(§_-8lL§.FINISH_TUTORIAL));
      }
   }
}

