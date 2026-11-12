package §_-8-a§
{
   import §_-0kB§.§_-4w1§;
   import §_-2qd§.§_-9ai§;
   import §_-6vH§.§_-AgE§;
   import §_-7s3§.§_-CTZ§;
   import §_-7s3§.§_-Fi§;
   import §_-8UF§.§_-5Xi§;
   import §_-BeZ§.§_-4Ww§;
   import §_-hb§.§_-CPX§;
   import penzville.Application;
   
   public class §_-8RG§ extends §_-4w1§
   {
      private var §_-5AD§:§_-AgE§;
      
      public function §_-8RG§()
      {
         super();
         this.§_-5AD§ = new §_-AgE§();
         §_-yx§(§_-8Xc§.§_-B0X§,this.§_-34U§);
         §_-yx§(§_-8Xc§.§_-CHL§,this.§_-sl§);
         §_-yx§(§_-8Xc§.§_-093§,this.§_-2QD§);
         §_-yx§(§_-8Xc§.§_-B11§,this.§_-1ad§);
         §_-yx§(§_-8Xc§.§_-BKn§,this.§_-3MM§);
         §_-yx§(§_-8Xc§.§_-9jc§,this.§_-108§);
         Application.instance.addEventListener(§_-5Xi§.§_-wG§,this.§_-4c8§);
      }
      
      public function §_-0Je§(param1:§_-CTZ§, param2:String) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.§_-6JD§(§_-8v5§.§_-1Ei§,param1);
         _loc3_.putString(§_-8v5§.§_-3Z1§,param2);
         send(§_-8Xc§.§_-B0X§,_loc3_);
      }
      
      public function addToBlackList(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = null;
         if(!this.§_-5AD§.contains(param1))
         {
            _loc2_ = new §_-4Ww§().putString(§_-8v5§.§_-9GV§,param1);
            §_-6gl§.sendExtMessage(§_-8Xc§.§_-CHL§,_loc2_);
         }
      }
      
      public function §_-83P§(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = null;
         if(this.§_-5AD§.contains(param1))
         {
            _loc2_ = new §_-4Ww§().putString(§_-8v5§.§_-9GV§,param1);
            §_-6gl§.sendExtMessage(§_-8Xc§.§_-093§,_loc2_);
         }
      }
      
      public function get blackList() : §_-AgE§
      {
         return this.§_-5AD§;
      }
      
      private function §_-34U§(param1:§_-9ai§) : void
      {
         var _loc3_:String = null;
         var _loc2_:§_-CTZ§ = param1.data.§_-2jV§(§_-8v5§.§_-1Ei§,new §_-Fi§());
         if(_loc2_ == null)
         {
            return;
         }
         if(!this.§_-5AD§.contains(_loc2_.senderId))
         {
            _loc3_ = null;
            switch(_loc2_.type)
            {
               case §_-CPX§.§_-6NG§:
                  _loc3_ = §_-8n-§.§_-BdN§;
                  break;
               case §_-CPX§.§_-A6A§:
                  _loc3_ = §_-8n-§.§_-BM-§;
                  break;
               case §_-CPX§.§_-5-7§:
                  _loc3_ = §_-8n-§.§_-3kf§;
                  break;
               case §_-CPX§.§_-0rC§:
                  _loc3_ = §_-8n-§.§_-5xB§;
                  break;
               case §_-CPX§.§_-6Bs§:
                  _loc3_ = §_-8n-§.§_-AAZ§;
            }
            if(_loc3_ != null)
            {
               dispatchEvent(new §_-8n-§(_loc3_).put(§_-8n-§.§_-ASm§,_loc2_));
            }
         }
      }
      
      private function §_-sl§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:String = _loc2_.getString(§_-8v5§.§_-9GV§);
         if(!this.§_-5AD§.contains(_loc3_))
         {
            this.§_-5AD§.§_-7if§(_loc3_);
            dispatchEvent(new §_-8n-§(§_-8n-§.§_-Aw8§).put(§_-8n-§.§_-1tE§,_loc3_));
         }
      }
      
      private function §_-2QD§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:String = _loc2_.getString(§_-8v5§.§_-9GV§);
         if(this.§_-5AD§.contains(_loc3_))
         {
            this.§_-5AD§.§_-8e0§(_loc3_);
            dispatchEvent(new §_-8n-§(§_-8n-§.§_-B2j§).put(§_-8n-§.§_-1tE§,_loc3_));
         }
      }
      
      private function §_-1ad§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:§_-AgE§ = _loc2_.§_-2jV§(§_-8v5§.§_-Bx§,§_-AgE§);
         this.§_-5AD§ = _loc3_;
         dispatchEvent(new §_-8n-§(§_-8n-§.§_-8QA§).put(§_-8n-§.§_-568§,_loc3_));
      }
      
      private function §_-3MM§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:String = _loc2_.getString(§_-8v5§.§_-5Cl§);
         var _loc4_:String = _loc2_.getString(§_-8v5§.§_-8HZ§);
         var _loc5_:Array = _loc2_.§_-Bc6§(§_-8v5§.§_-4dn§,new §_-Fi§());
         if(_loc3_ != null && _loc5_ != null)
         {
            dispatchEvent(new §_-8n-§(§_-8n-§.§_-0OI§).put(§_-8n-§.§_-9bh§,_loc3_).put(§_-8n-§.§_-4vc§,_loc4_).put(§_-8n-§.§_-0I7§,_loc5_));
         }
      }
      
      private function §_-108§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-4Ww§ = param1.data;
         var _loc3_:String = _loc2_.getString(§_-8v5§.§_-5Cl§);
         if(_loc3_ != null)
         {
            dispatchEvent(new §_-8n-§(§_-8n-§.§_-0sh§).put(§_-8n-§.§_-9bh§,_loc3_));
         }
      }
      
      private function §_-4c8§(param1:§_-5Xi§) : void
      {
         dispatchEvent(new §_-8n-§(§_-8n-§.§_-BdN§).put(§_-8n-§.§_-ASm§,param1.chatMessage));
      }
   }
}

