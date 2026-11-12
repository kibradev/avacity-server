package §_-8km§
{
   import §_-1iV§.§_-BkM§;
   import §_-7Hk§.§_-1U4§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import §_-kr§.§_-C1S§;
   import flash.external.ExternalInterface;
   import penzville.Config;
   
   public class §_-5aa§ implements §_-0Yu§
   {
      private var §_-6ro§:String = null;
      
      public function §_-5aa§()
      {
         super();
         this.§_-6ro§ = Context.§_-2BT§.adapter.userId;
      }
      
      public function get login() : String
      {
         return this.§_-6ro§;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put("sn",Context.§_-2BT§.adapter.socialNetwork);
         switch(Config.§_-37U§)
         {
            case Config.§_-20b§:
               param1.put("srv",Config.houseServer + ":" + Config.housePort);
               break;
            case Config.§_-1do§:
               param1.put("srv",Config.islandServer + ":" + Config.islandPort);
         }
         param1.put("slf",§_-BkM§.§_-n1§().loaderInfo.loaderURL);
         if(ExternalInterface.available && !(Context.§_-2BT§.adapter is §_-1U4§))
         {
            param1.put("web",ExternalInterface.call("window.location.href.toString"));
         }
         param1.put("v",Config.version);
         param1.put("cnt",§_-C1S§.instance.§_-9MO§.contentUrl);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
      }
   }
}

