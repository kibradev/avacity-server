package §_-3ie§
{
   import flash.events.Event;
   
   public class §_-6SW§ extends Event
   {
      public static const §_-1ml§:String = "worldCreated";
      
      public static const §_-2ix§:String = "enteredRoom";
      
      public static const §_-2ae§:String = "leavedRoom";
      
      public static const §_-3x9§:String = "panelsCreated";
      
      public static const §_-CDg§:String = "getRoomInfo";
      
      public static const §_-7fK§:String = "screenDestroyed";
      
      public static const §_-CDH§:String = "worldDestroyed";
      
      public static const §_-4hI§:String = "avatarsLoaded";
      
      public static const §_-CM0§:String = "actionMenuShowed";
      
      public static const §_-AnH§:String = "actionMenuClosed";
      
      public static const §_-3xi§:String = "rightPanelUpdate";
      
      public static const §_-1W9§:String = "rightPanelClear";
      
      public static const §_-73I§:String = "screenInitEnded";
      
      private var _data:* = null;
      
      public function §_-6SW§(param1:String, param2:* = null)
      {
         super(param1,false,false);
         this._data = param2;
      }
      
      public function get data() : *
      {
         return this._data;
      }
      
      public function get userId() : String
      {
         return this._data as String;
      }
   }
}

