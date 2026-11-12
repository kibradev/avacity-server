package §_-Btg§
{
   import §_-1x4§.FacebookAdapter;
   import §_-7ps§.§_-5aL§;
   import §_-7ps§.§_-9EB§;
   import §_-9VF§.§_-48g§;
   import §_-C-a§.§_-3uA§;
   import §_-CVq§.§_-40d§;
   import §_-GM§.Context;
   import §_-sv§.§_-2gJ§;
   
   public class §_-1s0§ extends §_-7l7§
   {
      public static const §_-5lA§:String = "wtrfll1";
      
      public static const §_-ARO§:String = "wtrfll3";
      
      public static const §_-1Pe§:String = "clothes";
      
      public static const §_-3Gu§:String = "welcomeFriend";
      
      public static const §_-z0§:String = "placeWtrfl";
      
      public static const §_-1TS§:String = "wearClothes";
      
      public static const §_-61X§:String = "inviteToCafe";
      
      public static const §_-8C6§:String = "inviteToClub";
      
      public static const §_-3xe§:String = "waitTime";
      
      public static const §_-1FU§:String = "findHouse";
      
      public static const §_-8Z0§:String = "createEvent";
      
      public static const §_-84i§:String = "inviteFriends";
      
      public static const §_-6Vx§:String = "editLayout";
      
      public static const §_-B5A§:String = "selectItem";
      
      public static const §_-9EC§:String = "placeItem";
      
      public static const §_-8rA§:String = "toLocation";
      
      public static const §_-BqE§:String = "createItem";
      
      public static const §_-6RS§:String = "createEvent";
      
      public static const §_-6x0§:String = "message";
      
      public static const §_-D8§:String = "selectDoor";
      
      private static const §_-3et§:Array = ["boyJacket1","boySMR14TShirt1","boyDecor7","boyPants7","boyCtlSh1"];
      
      private static const §_-6jh§:Array = ["girlRstrpJckt","grlPnkRsShs","girlPants10","gTShrtUsa3"];
      
      private static var _instance:§_-1s0§ = null;
      
      private var §_-2et§:Boolean = true;
      
      private var §_-384§:Boolean = true;
      
      public function §_-1s0§()
      {
         super();
         §_-7kL§ = Context.§_-YR§.§_-4RY§;
         §_-1rl§ = this.getStartStep();
      }
      
      public static function get instance() : §_-1s0§
      {
         if(_instance == null)
         {
            _instance = new §_-1s0§();
         }
         return _instance;
      }
      
      public static function §_-Ba9§(param1:int) : Array
      {
         return param1 == §_-3uA§.§_-908§ ? §_-3et§ : §_-6jh§;
      }
      
      override public function startStep(param1:String, param2:String = null) : void
      {
         if(this.§_-2et§)
         {
            this.§_-2et§ = false;
            param2 = param1 != §_-3Gu§ && param2 == null ? "defaultMessage" : param2;
            if(Context.§_-2BT§.adapter is FacebookAdapter && param1 == §_-3Gu§)
            {
               (Context.§_-2BT§.adapter as FacebookAdapter).§_-9Ld§();
            }
         }
         super.startStep(param1,param2);
      }
      
      override protected function getStartStep() : String
      {
         return this.player.cityInfo.§_-3Jn§ != null ? this.player.cityInfo.§_-3Jn§ : this.§_-3pg§();
      }
      
      override public function set action(param1:String) : void
      {
         super.action = param1;
         var _loc2_:§_-9EB§ = Context.§_-YR§.getStep(§_-1rl§).getAction(_action);
         if(_loc2_ == null && this.§_-384§ && §_-1rl§ != §_-3Gu§)
         {
            this.§_-384§ = false;
            super.action = §_-0yK§;
            _loc2_ = Context.§_-YR§.getStep(§_-1rl§).getAction(_action);
         }
         if(_loc2_ != null)
         {
            §_-8jl§.instance.§_-1Yk§(_loc2_.§_-19L§,false);
         }
         else
         {
            §_-8jl§.instance.§_-BQ3§();
         }
      }
      
      override protected function onNextStep(param1:§_-2gJ§) : void
      {
         this.player.cityInfo.§_-3Jn§ = param1.step;
         super.onNextStep(param1);
      }
      
      override protected function onFinishTutorial(param1:§_-2gJ§) : void
      {
         this.player.cityInfo.§_-3Jn§ = null;
         super.onFinishTutorial(param1);
      }
      
      public function §_-1pa§(param1:String = null) : void
      {
         var _loc2_:§_-5aL§ = Context.§_-YR§.getStep(§_-1rl§);
         var _loc3_:§_-9EB§ = param1 == null ? _loc2_.getNextAction(_action) : _loc2_.getAction(param1);
         if(_loc3_ != null)
         {
            this.action = _loc3_.id;
            dispatchEvent(new §_-40d§(§_-40d§.NEXT_ACTION));
         }
      }
      
      override public function isTutorial() : Boolean
      {
         return this.player != null && this.player.isTutorial;
      }
      
      protected function get player() : §_-48g§
      {
         return Context.cityPlayer;
      }
      
      private function §_-3pg§() : String
      {
         return §_-7kL§[0];
      }
   }
}

