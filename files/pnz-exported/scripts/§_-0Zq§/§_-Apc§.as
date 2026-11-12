package §_-0Zq§
{
   import §_-0Uz§.§_-6v4§;
   import §_-1Zk§.§_-3Xd§;
   import §_-1Zk§.§_-rK§;
   import §_-1t9§.§_-96c§;
   import §_-3tV§.§_-2lQ§;
   import §_-8Hp§.§_-5KD§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-5hc§;
   import §_-B1o§.§_-5ls§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-Apc§ extends §_-6v4§
   {
      public static const §_-9fx§:String = "callToGame";
      
      private var §_-O0§:Array;
      
      public function §_-Apc§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-5ls§ = null;
         this.§_-O0§ = [];
         for each(_loc2_ in (param1.elements("callToGame")[0] as XML).elements("call"))
         {
            _loc3_ = new §_-5ls§();
            _loc3_.fromXML(_loc2_);
            this.§_-O0§.push(_loc3_);
         }
      }
      
      public function get isActive() : Boolean
      {
         return §_-5KD§.instance.getModuleItem(§_-9fx§) != null && Context.§_-2BT§.isAllowSocialMedia(§_-96c§.§_-6SG§);
      }
      
      public function §_-BI7§(param1:String, param2:String) : void
      {
         if(!this.isActive)
         {
            return;
         }
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-rK§.§_-9Ac§,param1);
         _loc3_.putString(§_-rK§.§_-9-r§,param2);
         §_-6gl§.sendExtMessage(§_-3Xd§.§_-0XU§,_loc3_);
      }
      
      public function §_-8VQ§(param1:String, param2:§_-5ab§) : void
      {
         if(!this.isActive)
         {
            return;
         }
         var _loc3_:§_-5ls§ = this.§_-6a9§(param1);
         if(_loc3_ == null)
         {
            return;
         }
         §_-5hc§.§_-57w§(new §_-2lQ§(param2,_loc3_),true);
      }
      
      private function §_-6a9§(param1:String) : §_-5ls§
      {
         var _loc2_:§_-5ls§ = null;
         for each(_loc2_ in this.§_-O0§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
   }
}

