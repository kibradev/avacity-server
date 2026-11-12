package §_-7lY§
{
   import §_-3KG§.MusicCenterChannelItem;
   import §_-3KG§.TvChannelItem;
   import §_-6-L§.§_-3hw§;
   import flash.utils.ByteArray;
   
   public class §_-86S§
   {
      private static const §_-6yI§:Class = §_-7eZ§;
      
      private var §_-0uS§:Object = {};
      
      private var §_-51i§:Object = {};
      
      public function §_-86S§()
      {
         super();
         this.configure();
      }
      
      private function configure() : void
      {
         var _loc5_:TvChannelItem = null;
         var _loc1_:ByteArray = new §_-6yI§() as ByteArray;
         var _loc2_:XML = new XML(_loc1_.readUTFBytes(_loc1_.length));
         var _loc3_:XML = null;
         var _loc4_:MusicCenterChannelItem = null;
         for each(_loc3_ in §_-3hw§.§_-3bk§(_loc2_,"musicTracks.musicTrack"))
         {
            _loc4_ = new MusicCenterChannelItem();
            _loc4_.configure(_loc3_);
            this.§_-0uS§[_loc4_.id] = _loc4_;
         }
         _loc5_ = null;
         for each(_loc3_ in §_-3hw§.§_-3bk§(_loc2_,"tvChannels.tvChannel"))
         {
            _loc5_ = new TvChannelItem();
            _loc5_.configure(_loc3_);
            this.§_-51i§[_loc5_.id] = _loc5_;
         }
      }
      
      public function §_-9iN§(param1:String) : MusicCenterChannelItem
      {
         return !!this.§_-0uS§.hasOwnProperty(param1) ? this.§_-0uS§[param1] : null;
      }
      
      public function getTvChannelItem(param1:String) : TvChannelItem
      {
         return !!this.§_-51i§.hasOwnProperty(param1) ? this.§_-51i§[param1] : null;
      }
   }
}

