package §_-BVP§
{
   import §_-0Au§.§_-4gY§;
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-45i§.§_-8Fq§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-5Qa§ extends §_-6v4§
   {
      public static const §_-BJG§:int = 10;
      
      public static const §_-2ay§:int = 4;
      
      private static const §_-3Ev§:String = "eml.rgst";
      
      private static const §_-40k§:String = "eml";
      
      public function §_-5Qa§()
      {
         super();
         §_-1-t§(§_-3Ev§,this.§_-6DN§);
      }
      
      public static function §_-C-C§() : Boolean
      {
         return Config.collectEmails && !Context.cityPlayer.cityInfo.§_-70X§ && Context.player.level >= §_-2ay§;
      }
      
      public static function §_-7OG§(param1:String) : Boolean
      {
         var _loc2_:RegExp = /^[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]$/;
         return param1.match(_loc2_) != null;
      }
      
      private function §_-6DN§(param1:§_-9ai§) : void
      {
         new §_-8Fq§().showModal();
         Application.instance.dispatchEvent(new §_-4gY§(§_-4gY§.§_-4Rk§));
      }
      
      public function §_-2CM§(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-40k§,param1);
         netClient.sendExtMessage(§_-3Ev§,_loc2_);
      }
   }
}

