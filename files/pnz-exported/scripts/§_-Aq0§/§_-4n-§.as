package §_-Aq0§
{
   import flash.events.Event;
   
   public class §_-4n-§ extends Event
   {
      public static const HTTP_ERROR:String = "HTTP_ERROR";
      
      public var §_-5-l§:String;
      
      public var errorCode:int;
      
      public function §_-4n-§(param1:String, param2:Boolean = false, param3:Boolean = false, param4:String = "HTTP_ERROR", param5:uint = 0)
      {
         super(param1,param2,param3);
         this.§_-5-l§ = param4;
         this.errorCode = param5;
      }
      
      override public function clone() : Event
      {
         return new §_-4n-§(type,bubbles,cancelable,this.§_-5-l§,this.errorCode);
      }
      
      public function get request() : §_-Bs9§
      {
         return §_-Bs9§(target);
      }
   }
}

