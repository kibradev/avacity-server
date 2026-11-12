package §_-CTx§
{
   import §_-0Uz§.§_-6v4§;
   import §_-0ca§.§_-C9s§;
   import §_-2qd§.§_-9ai§;
   import §_-7mP§.§_-0Pu§;
   import §_-9VF§.§_-48g§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-9pw§ extends §_-6v4§
   {
      public function §_-9pw§()
      {
         super();
         §_-1-t§(§_-0WD§.§_-75y§,this.§_-9kH§);
         §_-1-t§(§_-0WD§.§_-ih§,this.§_-5nN§);
         §_-1-t§(§_-0WD§.§_-il§,this.§_-5Nl§);
         §_-1-t§(§_-0WD§.§_-BGD§,this.§_-5k5§);
      }
      
      private function §_-9kH§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-3B9§.§_-885§,null);
         var _loc3_:§_-48g§ = §_-48g§(Context.§_-3B2§.§_-07a§(_loc2_));
         if(_loc3_ == null)
         {
            return;
         }
         new §_-0Pu§(_loc3_).showModal();
      }
      
      private function §_-5nN§(param1:§_-9ai§) : void
      {
         var _loc2_:Object = param1.data.getMap(§_-3B9§.TRADE_ITEMS,Object);
         var _loc3_:String = param1.data.getString(§_-3B9§.§_-885§,null);
         dispatchEvent(new §_-C9s§(§_-C9s§.§_-ih§,{
            "userId":_loc3_,
            "items":_loc2_
         }));
      }
      
      private function §_-5Nl§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-3B9§.§_-885§,null);
         var _loc3_:String = param1.data.getString(§_-3B9§.§_-1C5§,null);
         dispatchEvent(new §_-C9s§(§_-C9s§.§_-il§,{
            "userId":_loc2_,
            "userName":_loc3_
         }));
      }
      
      private function §_-5k5§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-3B9§.§_-885§);
         var _loc3_:String = param1.data.getString(§_-3B9§.§_-1C5§,null);
         dispatchEvent(new §_-C9s§(§_-C9s§.§_-BGD§,{
            "userId":_loc2_,
            "userName":_loc3_
         }));
      }
      
      public function §_-8Xe§(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-3B9§.§_-885§,param1);
         §_-6gl§.sendExtMessage(§_-0WD§.§_-75y§,_loc2_);
      }
      
      public function tradeOffer(param1:String, param2:Object) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.putString(§_-3B9§.§_-885§,param1);
         _loc3_.§_-5CI§(§_-3B9§.TRADE_ITEMS,param2);
         §_-6gl§.sendExtMessage(§_-0WD§.§_-ih§,_loc3_);
      }
      
      public function tradeAccept(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-3B9§.§_-885§,param1);
         §_-6gl§.sendExtMessage(§_-0WD§.§_-il§,_loc2_);
      }
      
      public function tradeCancel(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.putString(§_-3B9§.§_-885§,param1);
         §_-6gl§.sendExtMessage(§_-0WD§.§_-BGD§,_loc2_);
      }
   }
}

