package §_-6JL§
{
   import flash.events.Event;
   
   public class §_-B9P§ extends Event
   {
      public static const SELECTED:String = "Selected";
      
      public static const §_-0G9§:String = "BeforeOpen";
      
      public static const OPENED:String = "Opened";
      
      public static const §_-1BI§:String = "BeforeClose";
      
      public static const §_-3Tr§:String = "Closed";
      
      public static const RESIZE:String = "Resize";
      
      public static const UPDATE:String = "Update";
      
      public static const COMPLETE:String = "Complete";
      
      public static const §_-A-E§:String = "VisibilityChange";
      
      private var _value:*;
      
      public function §_-B9P§(param1:String, param2:* = null)
      {
         super(param1,false,false);
         this._value = param2;
      }
      
      public function get value() : *
      {
         return this._value;
      }
      
      override public function clone() : Event
      {
         return new §_-B9P§(type,this._value);
      }
   }
}

