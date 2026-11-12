package §_-5G6§
{
   import §_-0uA§.§_-COU§;
   import §_-6-L§.§_-7uH§;
   
   public class §_-BS2§ implements §_-COU§
   {
      private var §_-6-2§:Array = [];
      
      private var §_-2jS§:Boolean = false;
      
      private var §_-8hJ§:int;
      
      private var §_-4Zl§:int;
      
      private var §_-2I5§:Function;
      
      private var §_-B56§:int;
      
      public function §_-BS2§(param1:Function, param2:int = 40, param3:int = 3, param4:int = 10000)
      {
         super();
         this.§_-2I5§ = param1;
         this.§_-8hJ§ = param2;
         this.§_-4Zl§ = param3;
         this.§_-B56§ = param4;
      }
      
      protected function format(param1:String, param2:uint, param3:String) : String
      {
         param1 = this.§_-6hS§(param1,param2,param3);
         if(param1.length > this.§_-B56§)
         {
            param1 = §_-7uH§.§_-Bgy§(param1,this.§_-B56§);
         }
         return param1;
      }
      
      public function write(param1:String, param2:uint, param3:String) : void
      {
         if(this.§_-2jS§)
         {
            return;
         }
         this.§_-6-2§.push(this.format(param1,param2,param3));
         if(this.§_-6-2§.length == this.§_-8hJ§)
         {
            this.§_-6-2§.shift();
         }
         if(param2 >= this.§_-4Zl§)
         {
            this.send();
         }
      }
      
      private function send() : void
      {
         this.§_-2jS§ = true;
         var _loc1_:String = this.§_-6-2§[this.§_-6-2§.length - 1];
         this.§_-6-2§.pop();
         this.§_-6-2§.reverse();
         this.§_-2I5§("ClientError: " + _loc1_,this.§_-6-2§);
         this.§_-2mu§();
      }
      
      private function §_-2mu§() : void
      {
         this.§_-6-2§ = [];
         this.§_-2jS§ = false;
      }
      
      private function §_-6hS§(param1:String, param2:uint, param3:String) : String
      {
         var _loc4_:Array = ["INFO","NOTICE","WARNING","ERROR","CRITICAL"];
         var _loc5_:* = new Date().toString() + " ";
         if(param2 >= 0 && param2 < _loc4_.length)
         {
            _loc5_ += "[" + _loc4_[param2] + "] ";
         }
         if(param3)
         {
            _loc5_ += "[" + param3 + "] ";
         }
         return _loc5_ + param1;
      }
      
      public function toString() : String
      {
         return this.§_-6-2§.join("\n");
      }
   }
}

