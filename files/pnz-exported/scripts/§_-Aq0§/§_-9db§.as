package §_-Aq0§
{
   import §_-0uA§.§_-3YE§;
   import §_-8a5§.§_-5r1§;
   import flash.events.Event;
   
   public class §_-9db§ extends Event
   {
      public static const COMPLETE:String = "COMPLETE";
      
      public static const §_-vR§:int = 100;
      
      public var data:*;
      
      public var §_-3Z4§:int = 0;
      
      public var §_-8SE§:String = "";
      
      public function §_-9db§(param1:String = "COMPLETE", param2:Boolean = false, param3:Boolean = false, param4:* = null)
      {
         super(param1,param2,param3);
         this.data = param4;
      }
      
      override public function clone() : Event
      {
         var _loc1_:§_-9db§ = new §_-9db§(type,bubbles,cancelable,this.data);
         _loc1_.§_-3Z4§ = this.§_-3Z4§;
         _loc1_.§_-8SE§ = this.§_-8SE§;
         return _loc1_;
      }
      
      public function get request() : §_-Bs9§
      {
         return §_-Bs9§(target);
      }
      
      public function §_-6Oe§() : *
      {
         var decoder:§_-5r1§ = null;
         var response:Object = null;
         try
         {
            decoder = new §_-5r1§(this.data);
            response = decoder.getValue();
            return response;
         }
         catch(e:Error)
         {
            §_-3YE§.error("json parse fault json:" + data);
            §_-3Z4§ = §_-vR§;
            §_-8SE§ = "Cannot parse JSON string";
            return null;
         }
      }
      
      public function toXML() : XML
      {
         var xml:XML = null;
         try
         {
            xml = new XML(this.data);
            return xml;
         }
         catch(e:Error)
         {
            §_-3Z4§ = e.errorID;
            §_-8SE§ = e.message;
            return null;
         }
      }
   }
}

