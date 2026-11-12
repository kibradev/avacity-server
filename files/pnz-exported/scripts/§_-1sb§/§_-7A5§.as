package §_-1sb§
{
   import flash.utils.Dictionary;
   
   public class §_-7A5§
   {
      protected static var §_-7RQ§:Dictionary = new Dictionary();
      
      protected var §_-8TH§:Vector.<§_-4uF§> = new Vector.<§_-4uF§>();
      
      protected var _name:String;
      
      protected var §_-C1D§:String;
      
      protected var §_-6JP§:String = null;
      
      public function §_-7A5§(param1:String = "", param2:String = "", param3:§_-4uF§ = null)
      {
         super();
         this._name = param1;
         §_-7RQ§[this._name] = this;
         this.§_-6JP§ = param2;
         if(param3 != null)
         {
            this.§_-5xu§(param3);
         }
      }
      
      public static function §_-3OT§(param1:String = "") : §_-7A5§
      {
         if(!§_-7RQ§.hasOwnProperty(param1))
         {
            §_-7RQ§[param1] = new §_-7A5§(param1);
         }
         return §_-7RQ§[param1];
      }
      
      public function §_-5xu§(param1:§_-4uF§) : void
      {
         this.§_-8TH§.push(param1);
      }
      
      protected function §_-CVP§(param1:String, param2:String) : §_-2xb§
      {
         var _loc3_:§_-4uF§ = null;
         var _loc4_:§_-2xb§ = null;
         for each(_loc3_ in this.§_-8TH§)
         {
            _loc4_ = _loc3_.translate(this.§_-C1D§,param1,param2);
            if(_loc4_ != null)
            {
               return _loc4_;
            }
         }
         return null;
      }
      
      public function message(param1:String, param2:Object = null, param3:String = null) : String
      {
         if(param3 == null)
         {
            param3 = this.§_-6JP§;
         }
         var _loc4_:§_-2xb§ = this.§_-CVP§(param1,param3);
         if(_loc4_ == null)
         {
            return param1;
         }
         if(param2 != null)
         {
            return this.§_-7iX§(_loc4_.§_-57o§,param2);
         }
         return _loc4_.§_-57o§;
      }
      
      public function plural(param1:String, param2:Number, param3:Object = null, param4:String = null) : String
      {
         if(param4 == null)
         {
            param4 = this.§_-6JP§;
         }
         var _loc5_:§_-2xb§ = this.§_-CVP§(param1,param4);
         if(_loc5_ == null)
         {
            return param1;
         }
         if(param3 == null)
         {
            param3 = {};
         }
         if(!param3.hasOwnProperty("value"))
         {
            param3["value"] = param2;
         }
         return this.§_-7iX§(_loc5_.plural(param2),param3);
      }
      
      public function gender(param1:String, param2:int, param3:Object = null, param4:String = null) : String
      {
         if(param4 == null)
         {
            param4 = this.§_-6JP§;
         }
         var _loc5_:§_-2xb§ = this.§_-CVP§(param1,param4);
         if(_loc5_ == null)
         {
            return param1;
         }
         if(param3 == null)
         {
            return _loc5_.gender(param2);
         }
         return this.§_-7iX§(_loc5_.gender(param2),param3);
      }
      
      protected function §_-7iX§(param1:String, param2:Object) : String
      {
         var _loc3_:String = null;
         for(_loc3_ in param2)
         {
            param1 = param1.replace(":" + _loc3_ + ":",param2[_loc3_]);
         }
         return param1;
      }
      
      public function get §_-3KW§() : String
      {
         return this.§_-6JP§;
      }
      
      public function set §_-3KW§(param1:String) : void
      {
         this.§_-6JP§ = param1;
      }
      
      public function get locale() : String
      {
         return this.§_-C1D§;
      }
      
      public function set locale(param1:String) : void
      {
         this.§_-C1D§ = param1;
      }
   }
}

