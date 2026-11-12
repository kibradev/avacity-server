package §_-Btg§
{
   import §_-0Uz§.§_-m3§;
   import §_-1Q2§.§_-5fo§;
   import §_-1x4§.FacebookAdapter;
   import §_-CVq§.§_-40d§;
   import §_-GM§.Context;
   import §_-sv§.§_-2gJ§;
   import §_-sv§.§_-8cU§;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   
   public class §_-7l7§ extends §_-53f§ implements §_-m3§
   {
      public static const §_-BL§:String = "finishStep";
      
      public static const §_-0yK§:String = "default";
      
      public static const §_-B8L§:String = "none";
      
      protected var _action:String = "default";
      
      protected var §_-1rl§:String = "";
      
      protected var §_-7kL§:Array = [];
      
      protected var _netManager:§_-8cU§ = null;
      
      public function §_-7l7§()
      {
         super();
         this._netManager = new §_-8cU§();
         this._netManager.addEventListener(§_-2gJ§.§_-A8d§,this.onNextStep);
         this._netManager.addEventListener(§_-2gJ§.FINISH_TUTORIAL,this.onFinishTutorial);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function start() : void
      {
         this.startStep(this.getStartStep());
      }
      
      public function startStep(param1:String, param2:String = null) : void
      {
         this.§_-1rl§ = param1;
         if(this.§_-1rl§ != null)
         {
            this.action = param2 != null ? param2 : §_-0yK§;
            dispatchEvent(new §_-40d§(§_-40d§.START_STEP,this.§_-1rl§));
         }
      }
      
      public function finishStep() : void
      {
         this.action = §_-B8L§;
         var _loc1_:uint = this.§_-7kL§.indexOf(this.§_-1rl§) + 1;
         var _loc2_:String = !!this.§_-7kL§.hasOwnProperty(String(_loc1_)) ? this.§_-7kL§[_loc1_] : null;
         if(_loc2_ == null || !this.isTutorial())
         {
            this.finishTutorial();
         }
         else
         {
            this._netManager.nextStep();
         }
      }
      
      public function finishTutorial() : void
      {
         this._finishTutorial();
         dispatchEvent(new §_-40d§(§_-40d§.FINISH_STEP,this.§_-1rl§));
         this._netManager.finishTutorial();
      }
      
      public function isTutorial() : Boolean
      {
         return false;
      }
      
      protected function _finishTutorial() : void
      {
         this.action = §_-B8L§;
      }
      
      protected function getStartStep() : String
      {
         return "";
      }
      
      public function get step() : String
      {
         return this.§_-1rl§;
      }
      
      public function set action(param1:String) : void
      {
         this._action = param1;
      }
      
      public function get action() : String
      {
         return this._action;
      }
      
      protected function onNextStep(param1:§_-2gJ§) : void
      {
         this.action = §_-B8L§;
         dispatchEvent(new §_-40d§(§_-40d§.FINISH_STEP,this.§_-1rl§));
         if(param1.step == null || !this.isTutorial())
         {
            this._finishTutorial();
         }
         else
         {
            this.startStep(param1.step);
         }
      }
      
      protected function onFinishTutorial(param1:§_-2gJ§) : void
      {
         this.action = §_-B8L§;
         dispatchEvent(new §_-40d§(§_-40d§.FINISH_TUTORIAL));
         §_-5fo§.instance.finishTutorial();
         if(Context.§_-2BT§.adapter is FacebookAdapter)
         {
            (Context.§_-2BT§.adapter as FacebookAdapter).§_-1nm§();
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-2gJ§.§_-A8d§,this.onNextStep);
            this._netManager.removeEventListener(§_-2gJ§.FINISH_TUTORIAL,this.onFinishTutorial);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

