package §_-AaI§
{
   import flash.events.Event;
   
   public class §_-2CK§ extends Event
   {
      public static const §_-7Hj§:String = "messageReviewed";
      
      public static const §_-Aoi§:String = "messageAbused";
      
      public static const §_-7Qi§:String = "banMessageSended";
      
      public static const §_-90W§:String = "eventComplained";
      
      public static const §_-A4b§:String = "messageSended";
      
      public static const §_-6r8§:String = "closeEventSended";
      
      public static const §_-6HT§:String = "requestUserBanned";
      
      public static const §_-0fj§:String = "banRequestAdded";
      
      public static const §_-1jk§:String = "accessResponse";
      
      public static const §_-4Fr§:String = "banned";
      
      public static const §_-1tE§:String = "userId";
      
      public static const §_-C84§:String = "privilege";
      
      public static const §_-Bs0§:String = "success";
      
      private var _data:Object = {};
      
      public function §_-2CK§(param1:String)
      {
         super(param1,false,false);
      }
      
      public function §_-5aN§(param1:String, param2:*) : void
      {
         this._data[param1] = param2;
      }
      
      public function getParam(param1:String) : *
      {
         return !!this._data.hasOwnProperty(param1) ? this._data[param1] : null;
      }
      
      public function get banned() : Boolean
      {
         return !!this._data.hasOwnProperty(§_-4Fr§) ? Boolean(this._data[§_-4Fr§]) : false;
      }
      
      public function get userId() : String
      {
         return this.getParam(§_-1tE§);
      }
      
      public function get privilege() : String
      {
         return this.getParam(§_-C84§);
      }
      
      public function get success() : Boolean
      {
         return this.getParam(§_-Bs0§);
      }
   }
}

