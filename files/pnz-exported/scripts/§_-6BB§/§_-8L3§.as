package §_-6BB§
{
   import flash.events.Event;
   
   public class §_-8L3§ extends Event
   {
      public static const §_-As9§:String = "adapterInited";
      
      public static const §_-A90§:String = "invalidMethod";
      
      public var message:String = null;
      
      public function §_-8L3§(param1:String, param2:String = null)
      {
         super(param1,false,false);
         this.message = param2;
      }
      
      override public function toString() : String
      {
         return super.toString() + "; message: " + this.message;
      }
   }
}

