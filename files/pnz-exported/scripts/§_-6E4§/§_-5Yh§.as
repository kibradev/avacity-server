package §_-6E4§
{
   import §_-636§.ZipLoadingItem;
   import §_-8cq§.§_-5eD§;
   import §_-8cq§.§_-dB§;
   import §_-Xm§.MassLoader;
   import §_-zT§.§_-102§;
   import §_-zT§.§_-CIF§;
   import flash.events.Event;
   import flash.net.URLRequest;
   
   public class §_-5Yh§ extends ZipLoadingItem
   {
      public function §_-5Yh§(param1:MassLoader, param2:URLRequest, param3:String)
      {
         super(param1,param2,param3);
      }
      
      override protected function onLoadingComplete(param1:Event) : void
      {
         var _loc4_:§_-5eD§ = null;
         var _loc5_:§_-CIF§ = null;
         _data = param1.target.data;
         var _loc2_:§_-dB§ = new §_-dB§(param1.target.data);
         var _loc3_:§_-102§ = new §_-102§(_loc2_);
         for each(_loc4_ in _loc2_.entries)
         {
            if(!_loc4_.§_-ABu§())
            {
               _loc5_ = new §_-Aj5§(_loc4_,_loc2_,_context);
               _loc3_.add(_loc5_);
            }
         }
         _content = _loc3_;
         onComplete(param1);
      }
   }
}

