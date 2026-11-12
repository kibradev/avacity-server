package §_-1sb§
{
   public class §_-8eK§ extends §_-4uF§
   {
      public function §_-8eK§(param1:XML = null)
      {
         super();
         if(param1 != null)
         {
            this.§_-7Tc§(param1);
         }
      }
      
      protected function §_-CaG§(param1:XML) : String
      {
         return !!param1.hasComplexContent() ? param1.elements().toString() : param1.toString();
      }
      
      protected function §_-555§(param1:XML) : Array
      {
         var _loc3_:XML = null;
         var _loc2_:Array = [];
         if(param1.hasOwnProperty("form"))
         {
            for each(_loc3_ in param1.form)
            {
               _loc2_.push(this.§_-CaG§(_loc3_));
            }
         }
         return _loc2_;
      }
      
      protected function §_-7L0§(param1:XML, param2:String, param3:String) : void
      {
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         if(param1.hasOwnProperty("message"))
         {
            for each(_loc4_ in param1["message"])
            {
               §_-BRR§(param3,param2,_loc4_["@key"],[this.§_-CaG§(_loc4_)],§_-2xb§.§_-577§);
            }
         }
         if(param1.hasOwnProperty("plural"))
         {
            for each(_loc5_ in param1["plural"])
            {
               §_-BRR§(param3,param2,_loc5_["@key"],this.§_-555§(_loc5_),§_-2xb§.§_-CE0§);
            }
         }
         if(param1.hasOwnProperty("gender"))
         {
            for each(_loc6_ in param1["gender"])
            {
               §_-BRR§(param3,param2,_loc6_["@key"],this.§_-555§(_loc6_),§_-2xb§.§_-CJs§);
            }
         }
      }
      
      public function §_-7Tc§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:String = null;
         var _loc4_:XML = null;
         var _loc5_:String = null;
         for each(_loc2_ in param1["locale"])
         {
            if(_loc2_.hasOwnProperty("@name"))
            {
               _loc3_ = _loc2_["@name"];
               if(_loc2_.hasOwnProperty("context"))
               {
                  for each(_loc4_ in _loc2_["context"])
                  {
                     _loc5_ = "";
                     if(_loc4_.hasOwnProperty("@name"))
                     {
                        _loc5_ = _loc4_["@name"];
                     }
                     this.§_-7L0§(_loc4_,_loc5_,_loc3_);
                  }
               }
               this.§_-7L0§(_loc2_,"",_loc3_);
            }
         }
      }
   }
}

