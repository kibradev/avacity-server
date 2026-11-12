package §_-54O§
{
   import §_-0Q-§.§_-19y§;
   import §_-0Q-§.§_-9y2§;
   import §_-1l5§.§_-4m-§;
   import §_-60f§.§_-547§;
   import §_-7Gj§.§_-3gi§;
   import §_-AKx§.§_-GN§;
   
   public class §_-ArM§ extends §_-9i9§
   {
      private var §_-C6t§:Object = {};
      
      private var §_-AEo§:String = null;
      
      public function §_-ArM§()
      {
         super();
      }
      
      override public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-547§ = null;
         super.configure(param1);
         this.§_-AEo§ = !!param1.hasOwnProperty("@initStep") ? param1["@initStep"] : null;
         if(param1.hasOwnProperty("step"))
         {
            for each(_loc2_ in param1.elements("step"))
            {
               _loc3_ = new §_-547§();
               _loc3_.configure(_loc2_);
               this.§_-C6t§[_loc3_.stepId] = _loc3_;
            }
         }
      }
      
      public function §_-3I2§(param1:String) : §_-547§
      {
         return !!this.§_-C6t§.hasOwnProperty(param1) ? this.§_-C6t§[param1] : null;
      }
      
      public function createStepDialog(param1:§_-4m-§, param2:Boolean = false) : §_-GN§
      {
         if(param2 && this.§_-AEo§ != null && param1.nextStep != null && !(param1.nextStep is §_-3gi§))
         {
            return new §_-9y2§(param1,int(this.§_-AEo§));
         }
         if(param1.nextStep == null || param1.nextStep is §_-3gi§ || this.§_-3I2§(String(param1.nextStep.order)) == null)
         {
            return null;
         }
         return new §_-9y2§(param1,param1.nextStep.order);
      }
      
      public function createAwardDialog(param1:§_-4m-§) : §_-GN§
      {
         var _loc2_:int = param1.descriptor.§_-5w9§ != null ? param1.descriptor.§_-5w9§.order : 0;
         var _loc3_:§_-547§ = this.§_-3I2§(String(_loc2_));
         if(_loc3_ != null)
         {
            return new §_-9y2§(param1,param1.descriptor.§_-5w9§.order);
         }
         return new §_-19y§(param1);
      }
   }
}

