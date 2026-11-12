package §_-8I6§
{
   import §_-9VF§.§_-48g§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-qH§.§_-6aI§;
   import §_-qH§.§_-8uS§;
   
   public class §_-004§ extends §_-0sT§
   {
      public function §_-004§(param1:String = null, param2:String = null)
      {
         super(param1,param2);
      }
      
      override protected function loadOwnerInfo() : void
      {
         var _loc3_:§_-48g§ = null;
         §_-6gl§.commandDispatcher.addEventListener(§_-8uS§.§_-4Ec§,§_-AXf§);
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         _loc1_.put(§_-6aI§.§_-9GV§,ownerId);
         var _loc2_:Object = Context.§_-9q-§.§_-AB2§;
         if(_loc2_.hasOwnProperty(ownerId))
         {
            _loc3_ = _loc2_[ownerId];
            _loc1_.put(§_-6aI§.§_-0Qk§,_loc3_.userInfo.socialId);
         }
         §_-6gl§.sendExtMessage(§_-8uS§.§_-4Ec§,_loc1_);
      }
   }
}

