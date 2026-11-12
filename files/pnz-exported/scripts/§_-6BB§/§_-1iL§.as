package §_-6BB§
{
   import flash.events.Event;
   
   public class §_-1iL§ extends Event
   {
      public static const §_-8nO§:String = "connectorInited";
      
      public var message:String = null;
      
      public function §_-1iL§(param1:String, param2:String = null)
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

