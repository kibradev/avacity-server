package §_-2qd§
{
   import §_-BeZ§.§_-4Ww§;
   import flash.events.Event;
   
   public class §_-9ai§ extends Event
   {
      private var §_-5xM§:String;
      
      private var _data:§_-4Ww§;
      
      public function §_-9ai§(param1:String, param2:String, param3:§_-4Ww§)
      {
         super(param1);
         this.§_-5xM§ = param2;
         this._data = param3;
      }
      
      public function get command() : String
      {
         return this.§_-5xM§;
      }
      
      public function get data() : §_-4Ww§
      {
         return this._data;
      }
      
      override public function clone() : Event
      {
         return new §_-9ai§(type,this.command,this.data);
      }
   }
}

