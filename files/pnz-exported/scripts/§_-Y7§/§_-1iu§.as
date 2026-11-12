package §_-Y7§
{
   import §_-6-L§.§_-3hw§;
   import §_-7eL§.§_-xE§;
   import §_-91S§.§_-1a6§;
   import §_-91S§.§_-4DP§;
   import §_-CBS§.§_-4F3§;
   import §_-GM§.Context;
   
   public class §_-1iu§
   {
      private var §_-BqJ§:Array = null;
      
      public function §_-1iu§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-6CD§ = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-BqJ§ = [];
         for each(_loc2_ in §_-3hw§.§_-3bk§(param1,"permissions.rule"))
         {
            _loc3_ = new §_-6CD§();
            _loc3_.fromXML(_loc2_);
            this.§_-BqJ§.push(_loc3_);
         }
      }
      
      public function check(param1:§_-xE§, param2:String, param3:int = -1) : §_-4F3§
      {
         var _loc6_:§_-4DP§ = null;
         var _loc7_:String = null;
         var _loc4_:§_-6CD§ = this.§_-3qo§(param2);
         if(param1 == null)
         {
            return new §_-4F3§(false,"noActivePet");
         }
         if(_loc4_.§_-xa§ && param1.ownerId != Context.cityPlayer.id)
         {
            _loc6_ = Context.§_-AI9§.§_-14E§(§_-1a6§.§_-BVw§,param2);
            if(!_loc6_.check(param1.ownerId))
            {
               _loc7_ = _loc4_.§_-4Dp§ != null ? _loc4_.§_-4Dp§ : _loc6_.§_-nc§;
               return new §_-4F3§(false,_loc7_);
            }
         }
         var _loc5_:§_-4F3§ = _loc4_.§_-4hY§(param1,param3);
         if(_loc5_.result)
         {
            return new §_-4F3§(false,_loc5_.message);
         }
         return _loc4_.§_-90x§(param1,param3);
      }
      
      public function §_-3qo§(param1:String) : §_-6CD§
      {
         var _loc2_:§_-6CD§ = null;
         for each(_loc2_ in this.§_-BqJ§)
         {
            if(_loc2_.action == param1)
            {
               return _loc2_;
            }
         }
         return new §_-6CD§();
      }
   }
}

