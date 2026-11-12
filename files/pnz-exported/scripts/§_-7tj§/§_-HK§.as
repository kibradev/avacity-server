package §_-7tj§
{
   import §_-0kB§.§_-4w1§;
   import §_-3VF§.§_-0nG§;
   
   public class §_-HK§ extends §_-4w1§
   {
      private var §_-00J§:Object = {};
      
      private var §_-CKX§:Object = {};
      
      public function §_-HK§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc4_:XML = null;
         var _loc5_:int = 0;
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:XML = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc2_:XMLList = !!param1.hasOwnProperty("roles") ? param1["roles"][0]["role"] : null;
         if(_loc2_ != null)
         {
            for each(_loc4_ in _loc2_)
            {
               _loc5_ = int(_loc4_["@id"]);
               _loc6_ = String(_loc4_["@name"]);
               _loc7_ = int(_loc4_["@authority"]);
               this.§_-00J§[_loc5_] = new §_-3UU§(_loc5_,_loc6_,_loc7_);
            }
         }
         var _loc3_:XMLList = !!param1.hasOwnProperty("privileges") ? param1["privileges"][0]["privilege"] : null;
         if(_loc3_ != null)
         {
            for each(_loc8_ in _loc3_)
            {
               _loc9_ = String(_loc8_["@name"]);
               _loc10_ = !!_loc8_.hasOwnProperty("@minAuthority") ? int(_loc8_["@minAuthority"]) : int.MIN_VALUE;
               _loc11_ = !!_loc8_.hasOwnProperty("@maxAuthority") ? int(_loc8_["@maxAuthority"]) : int.MAX_VALUE;
               _loc12_ = !!_loc8_.hasOwnProperty("@minLevel") ? int(_loc8_["@minLevel"]) : 0;
               this.§_-CKX§[_loc9_] = new §_-CU4§(_loc9_,_loc10_,_loc11_,_loc12_);
            }
         }
      }
      
      public function §_-3eK§(param1:int, param2:String, param3:int) : Boolean
      {
         var _loc4_:§_-3UU§ = null;
         var _loc5_:§_-CU4§ = null;
         if(§_-0nG§.instance.gameHelper.§_-6ZW§(param2))
         {
            return §_-0nG§.instance.gameHelper.§_-C9y§(param2);
         }
         if(this.§_-00J§.hasOwnProperty(String(param1)))
         {
            _loc4_ = this.§_-00J§[param1];
            if(this.§_-CKX§.hasOwnProperty(param2))
            {
               _loc5_ = this.§_-CKX§[param2];
               return _loc5_.§_-3eK§(_loc4_,param3);
            }
         }
         return false;
      }
   }
}

