package §_-6Cn§
{
   import §_-0uA§.§_-COU§;
   
   public class §_-66r§ implements §_-COU§
   {
      private static var _instance:§_-66r§;
      
      private static const §_-0NN§:int = 1000;
      
      private static const §_-0Jl§:Array = ["INFO","NOTICE","WARNING","ERROR","CRITICAL"];
      
      private var §_-1d§:Array;
      
      private var §_-5GT§:uint;
      
      public function §_-66r§()
      {
         super();
         this.§_-1d§ = [];
         this.§_-5GT§ = 0;
      }
      
      public static function get instance() : §_-66r§
      {
         if(_instance == null)
         {
            _instance = new §_-66r§();
         }
         return _instance;
      }
      
      public function write(param1:String, param2:uint, param3:String) : void
      {
         ++this.§_-5GT§;
         var _loc4_:Object = {
            "seq":this.§_-5GT§,
            "time":this.§_-714§(new Date()),
            "type":param2,
            "typeName":(param2 < §_-0Jl§.length ? §_-0Jl§[param2] : "UNKNOWN"),
            "source":param3,
            "message":param1
         };
         this.§_-1d§.push(_loc4_);
         if(this.§_-1d§.length > §_-0NN§)
         {
            this.§_-1d§.shift();
         }
      }
      
      public function getLogs(param1:uint = 0, param2:uint = 0, param3:String = "", param4:int = 0) : Object
      {
         var _loc8_:Object = null;
         var _loc5_:Array = [];
         var _loc6_:String = param3.toLowerCase();
         var _loc7_:int = 0;
         while(_loc7_ < this.§_-1d§.length)
         {
            _loc8_ = this.§_-1d§[_loc7_];
            if(_loc8_.seq > param1)
            {
               if(_loc8_.type >= param2)
               {
                  if(!(_loc6_.length > 0 && String(_loc8_.source).toLowerCase().indexOf(_loc6_) == -1))
                  {
                     _loc5_.push(_loc8_);
                     if(param4 > 0 && _loc5_.length >= param4)
                     {
                        break;
                     }
                  }
               }
            }
            _loc7_++;
         }
         return {
            "entries":_loc5_,
            "count":_loc5_.length,
            "lastSeq":this.§_-5GT§,
            "bufferSize":this.§_-1d§.length
         };
      }
      
      public function clear() : void
      {
         this.§_-1d§ = [];
      }
      
      private function §_-714§(param1:Date) : String
      {
         return this.pad(param1.getHours()) + ":" + this.pad(param1.getMinutes()) + ":" + this.pad(param1.getSeconds()) + "." + this.pad3(param1.getMilliseconds());
      }
      
      private function pad(param1:int) : String
      {
         return param1 < 10 ? "0" + param1 : String(param1);
      }
      
      private function pad3(param1:int) : String
      {
         if(param1 < 10)
         {
            return "00" + param1;
         }
         if(param1 < 100)
         {
            return "0" + param1;
         }
         return String(param1);
      }
   }
}

