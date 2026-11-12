package §_-BJ1§
{
   import §_-0c2§.§_-22o§;
   import §_-0c2§.§_-2Iw§;
   import §_-0c2§.§_-4Vn§;
   import §_-0c2§.§_-7vc§;
   import §_-AKx§.§_-GN§;
   import §_-AaA§.§_-Bg7§;
   import §_-GM§.Context;
   
   public class §_-5y5§ extends §_-6Yy§
   {
      public static const §_-91j§:String = "none";
      
      public function §_-5y5§()
      {
         super();
      }
      
      public function §_-8aw§(param1:String = null) : void
      {
         var userId:String = param1;
         Context.§_-0vt§.§_-7yj§(§_-0r6§.SHIFT_CLICK,function():void
         {
            var _loc1_:§_-GN§ = null;
            if(userId == null || Context.player.id == userId)
            {
               _loc1_ = new §_-4Vn§();
            }
            else
            {
               _loc1_ = new §_-2Iw§(userId);
            }
            §_-Bg7§.instance.§_-57w§(_loc1_);
         });
      }
      
      public function showUserBanDialog(param1:String = null) : void
      {
         §_-Bg7§.instance.§_-57w§(new §_-7vc§(int(param1)));
      }
      
      public function §_-7Vk§(param1:String = null) : void
      {
         §_-Bg7§.instance.§_-57w§(new §_-22o§(int(param1)));
      }
   }
}

