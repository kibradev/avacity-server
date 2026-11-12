package §_-8Bm§
{
   import §_-0Uz§.§_-m3§;
   import §_-6-L§.§_-49j§;
   import §_-6Xf§.§_-6zQ§;
   import §_-76Z§.§_-2jg§;
   import §_-9MY§.§_-BL4§;
   import §_-AVi§.§_-CCu§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import §_-y§.§_-fK§;
   import ags.§_-5x-§;
   
   public class §_-14J§ extends §_-53f§ implements §_-m3§
   {
      public static const §_-2pN§:int = 30;
      
      private var _netManager:§_-fK§;
      
      private var §_-2qZ§:§_-CCu§ = null;
      
      public function §_-14J§()
      {
         super();
      }
      
      public function init() : void
      {
         this._netManager = new §_-fK§();
         this._netManager.addEventListener(§_-6zQ§.§_-Fl§,this.§_-48Z§);
         this._netManager.addEventListener(§_-6zQ§.CHANGE_ADVERTISEMENT,this.§_-3TH§);
         this._netManager.addEventListener(§_-6zQ§.§_-5nl§,this.§_-0sH§);
      }
      
      private function §_-0sH§(param1:§_-6zQ§) : void
      {
         if(!§_-2jg§.§_-67i§(§_-BL4§.WATCH_NEWS,Context.cityPlayer.clanInfo.role))
         {
            return;
         }
         if(this.§_-2qZ§ == null)
         {
            return;
         }
         if(this.§_-2qZ§.newsList.length > §_-2pN§)
         {
            this.§_-2qZ§.newsList = this.§_-2qZ§.newsList.slice(0,§_-2pN§);
         }
         §_-49j§.insert(this.§_-2qZ§.newsList,0,param1.§_-CdA§);
         dispatchEvent(new §_-6zQ§(§_-6zQ§.§_-5nl§));
      }
      
      private function §_-3TH§(param1:§_-6zQ§) : void
      {
         if(this.§_-2qZ§ == null)
         {
            return;
         }
         this.§_-2qZ§.advertisement = param1.advertisement;
         var _loc2_:§_-6zQ§ = new §_-6zQ§(§_-6zQ§.CHANGE_ADVERTISEMENT);
         _loc2_.§_-5aN§(§_-6zQ§.§_-4zo§,param1.advertisement);
         _loc2_.§_-5aN§(§_-6zQ§.§_-Bs0§,param1.success);
         dispatchEvent(_loc2_);
      }
      
      private function §_-48Z§(param1:§_-6zQ§) : void
      {
         this.§_-2qZ§ = param1.§_-0TE§;
         dispatchEvent(new §_-6zQ§(§_-6zQ§.§_-Fl§));
      }
      
      public function §_-C7F§() : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            return;
         }
         if(!§_-2jg§.§_-67i§(§_-BL4§.WATCH_NEWS,Context.cityPlayer.clanInfo.role))
         {
            return;
         }
         this._netManager.§_-C7F§();
      }
      
      public function changeAdvertisement(param1:String) : void
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            return;
         }
         if(!§_-2jg§.§_-67i§(§_-BL4§.CHANGE_ADVERTISEMENT,Context.cityPlayer.clanInfo.role))
         {
            return;
         }
         this._netManager.changeAdvertisement(param1);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function get §_-0TE§() : §_-CCu§
      {
         return this.§_-2qZ§;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-6zQ§.§_-Fl§,this.§_-48Z§);
            this._netManager.removeEventListener(§_-6zQ§.CHANGE_ADVERTISEMENT,this.§_-3TH§);
            this._netManager.removeEventListener(§_-6zQ§.§_-5nl§,this.§_-0sH§);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

