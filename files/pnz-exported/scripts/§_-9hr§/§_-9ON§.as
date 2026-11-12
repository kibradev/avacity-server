package §_-9hr§
{
   import §_-0uA§.§_-3YE§;
   import §_-1lv§.§_-Ap1§;
   
   public class §_-9ON§
   {
      private static const §_-2AQ§:int = 1;
      
      private var §_-sp§:§_-Ap1§;
      
      private var §_-CLk§:Array = [];
      
      private var §_-4PG§:Array = [];
      
      private var _factor1:int = 0;
      
      private var _factor2:int = 0;
      
      private var _factor3:int = 0;
      
      private var _factor4:int = 0;
      
      private var §_-AfU§:String;
      
      public function §_-9ON§(param1:String, param2:§_-Ap1§)
      {
         super();
         this.§_-sp§ = param2;
         this.§_-AfU§ = param1;
      }
      
      public function §_-0nT§(param1:int, param2:int, param3:String, param4:String, param5:String) : void
      {
         var _loc6_:§_-COO§ = this.§_-1qL§(param1,param3,param4,param5);
         if(_loc6_ == null)
         {
            _loc6_ = new §_-COO§(param1,param2);
            _loc6_.category1 = param3;
            _loc6_.category2 = param4;
            _loc6_.category3 = param5;
            this.§_-CLk§.push(_loc6_);
         }
         else
         {
            _loc6_.value += param2;
         }
         if(this.§_-CLk§.length >= §_-2AQ§)
         {
            this.flush();
         }
         §_-3YE§.info("Log user event " + param3 + ":" + param4 + ":" + param5 + " [l:" + param1 + ";v:" + param2 + "]");
      }
      
      private function §_-1qL§(param1:int, param2:String, param3:String, param4:String) : §_-COO§
      {
         var _loc5_:§_-COO§ = null;
         for each(_loc5_ in this.§_-CLk§)
         {
            if(_loc5_.level == param1 && _loc5_.category1 == param2 && _loc5_.category2 == param3 && _loc5_.category3 == param4)
            {
               return _loc5_;
            }
         }
         return null;
      }
      
      public function §_-CP2§(param1:int, param2:int, param3:String, param4:String, param5:String) : void
      {
         var _loc6_:§_-AkV§ = this.§_-Ad9§(param3,param4,param5);
         if(_loc6_ == null)
         {
            _loc6_ = new §_-AkV§();
            _loc6_.price = param1;
            _loc6_.count = param2;
            _loc6_.category1 = param3;
            _loc6_.category2 = param4;
            _loc6_.category3 = param5;
            this.§_-4PG§.push(_loc6_);
         }
         else
         {
            _loc6_.count += param2;
         }
         if(this.§_-4PG§.length >= §_-2AQ§)
         {
            this.flush();
         }
      }
      
      private function §_-Ad9§(param1:String, param2:String, param3:String) : §_-AkV§
      {
         var _loc4_:§_-AkV§ = null;
         for each(_loc4_ in this.§_-4PG§)
         {
            if(_loc4_.category1 == param1 && _loc4_.category2 == param2 && _loc4_.category3 == param3)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function flush() : void
      {
         this.§_-Ac3§();
         this.§_-9Pa§();
         this.§_-8Jr§();
      }
      
      private function §_-8Jr§() : void
      {
         if(this.§_-4PG§.length > 0)
         {
            this.§_-sp§.§_-6qi§(this.§_-AfU§,this.§_-4PG§);
            this.§_-4PG§ = [];
         }
      }
      
      private function §_-9Pa§() : void
      {
         if(this.§_-CLk§.length > 0)
         {
            this.§_-sp§.§_-1fT§(this.§_-AfU§,this.§_-CLk§);
            this.§_-CLk§ = [];
         }
      }
      
      private function §_-Ac3§() : void
      {
         if(this.factor1 == 0 && this.factor2 == 0 && this.factor3 == 0 && this.factor4 == 0)
         {
            return;
         }
         this.§_-sp§.§_-5pj§(this.§_-AfU§,this._factor1,this._factor2,this._factor3,this._factor4);
         this.factor1 = 0;
         this.factor2 = 0;
         this.factor3 = 0;
         this.factor4 = 0;
      }
      
      public function get factor1() : int
      {
         return this._factor1;
      }
      
      public function set factor1(param1:int) : void
      {
         this._factor1 = param1;
      }
      
      public function get factor2() : int
      {
         return this._factor2;
      }
      
      public function set factor2(param1:int) : void
      {
         this._factor2 = param1;
      }
      
      public function get factor3() : int
      {
         return this._factor3;
      }
      
      public function set factor3(param1:int) : void
      {
         this._factor3 = param1;
      }
      
      public function get factor4() : int
      {
         return this._factor4;
      }
      
      public function set factor4(param1:int) : void
      {
         this._factor4 = param1;
      }
   }
}

