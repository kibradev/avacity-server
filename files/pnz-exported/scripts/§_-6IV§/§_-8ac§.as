package §_-6IV§
{
   import §_-1CD§.§_-1V4§;
   import §_-1CD§.§_-1Vd§;
   import §_-1ks§.§_-VC§;
   import §_-2UV§.§_-0jk§;
   import §_-2UV§.§_-iQ§;
   import §_-2qd§.§_-9ai§;
   import §_-55S§.§_-6Lp§;
   import §_-5OE§.§_-1v2§;
   import §_-5OE§.§_-680§;
   import §_-7nb§.§_-6kZ§;
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-8ac§ extends §_-6kZ§
   {
      private var §_-749§:§_-iQ§ = null;
      
      private var §_-4DI§:§_-0jk§ = null;
      
      private var §_-35l§:String = null;
      
      public function §_-8ac§(param1:String)
      {
         super();
         this.§_-749§ = Context.§_-4y8§.§_-4jk§(param1);
         §_-9yg§ = this.§_-749§.loadingContent;
         §_-6Lp§.showAds();
      }
      
      public function get workId() : String
      {
         return this.§_-749§ != null ? this.§_-749§.id : null;
      }
      
      override protected function createPreloaderScreen() : §_-VC§
      {
         return Context.§_-4y8§.§_-B4s§(this.§_-749§.id);
      }
      
      override protected function createNetClient(param1:Function) : void
      {
         Context.§_-CLP§.§_-0u1§(param1,Config.workServer,Config.workPort,this.zoneId);
      }
      
      override protected function initLocation() : void
      {
         super.initLocation();
         this.getRoom();
      }
      
      private function getRoom() : void
      {
         §_-6gl§.commandDispatcher.addEventListener(§_-1V4§.§_-5WP§,this.§_-2D7§);
         var _loc1_:§_-4Ww§ = new §_-4Ww§();
         _loc1_.put(§_-1Vd§.§_-70k§,this.§_-749§.id);
         §_-6gl§.sendExtMessage(§_-1V4§.§_-5WP§,_loc1_);
      }
      
      protected function §_-2D7§(param1:§_-9ai§) : void
      {
         §_-6gl§.commandDispatcher.removeEventListener(§_-1V4§.§_-5WP§,this.§_-2D7§);
         var _loc2_:String = param1.data.§_-ANw§(§_-1Vd§.§_-7Lo§).getString(§_-1v2§.§_-3su§);
         this.§_-4DI§ = §_-680§.§_-2qF§(_loc2_);
         this.§_-4DI§.fromAGSObject(param1.data.§_-ANw§(§_-1Vd§.§_-7Lo§));
         this.§_-35l§ = param1.data.getString(§_-1Vd§.§_-3Z1§);
         Context.cityPlayer.§_-BjJ§.§_-5sb§(this.§_-4DI§);
         Context.cityPlayer.locationInfo.updateLocation(this.§_-35l§);
         Context.cityPlayer.locationInfo.resetPos();
         var _loc3_:Class = §_-680§.§_-3Ki§(this.§_-4DI§.work.id);
         if(_loc3_ != null)
         {
            currentScreen = new _loc3_(§_-6gl§,this.§_-35l§,this.§_-4DI§);
         }
      }
      
      override public function get zoneId() : String
      {
         return this.§_-749§.zoneId;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-35l§ != null)
         {
            if(Application.instance.status != Application.§_-1Ui§)
            {
               §_-6gl§.leaveRoom(this.§_-35l§);
            }
            this.§_-35l§ = null;
         }
         super.destroy();
      }
   }
}

