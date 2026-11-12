package §_-zP§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2Kl§.§_-7-9§;
   import §_-2Y7§.§_-8Q2§;
   import §_-2Y7§.§_-Bpp§;
   import §_-2cp§.RB24Module;
   import §_-2qd§.§_-9ai§;
   import §_-3GV§.§_-8FB§;
   import §_-3gv§.§_-43l§;
   import §_-5a7§.§_-2vU§;
   import §_-5pa§.§_-9zV§;
   import §_-6bi§.§_-12P§;
   import §_-6lD§.§_-7at§;
   import §_-8M2§.§_-Ak8§;
   import §_-9jM§.§_-BHO§;
   import §_-9nj§.NewsList;
   import §_-9nj§.§_-0g3§;
   import §_-9nj§.§_-0xh§;
   import §_-9nj§.§_-1u2§;
   import §_-9nj§.§_-2UY§;
   import §_-9nj§.§_-2wf§;
   import §_-9nj§.§_-3jF§;
   import §_-9nj§.§_-403§;
   import §_-9nj§.§_-436§;
   import §_-9nj§.§_-4fT§;
   import §_-9nj§.§_-575§;
   import §_-9nj§.§_-74M§;
   import §_-9nj§.§_-8Dh§;
   import §_-9nj§.§_-8O1§;
   import §_-9nj§.§_-8SS§;
   import §_-9nj§.§_-8oe§;
   import §_-9nj§.§_-ANJ§;
   import §_-9nj§.§_-AWF§;
   import §_-9nj§.§_-BTM§;
   import §_-9nj§.§_-Bv7§;
   import §_-9nj§.§_-CH6§;
   import §_-ABs§.§_-0sU§;
   import §_-ABs§.§_-40H§;
   import §_-ABs§.§_-4zc§;
   import §_-ABs§.§_-73t§;
   import §_-ABs§.§_-8P4§;
   import §_-ABs§.§_-943§;
   import §_-ABs§.§_-9gD§;
   import §_-ABs§.§_-BH1§;
   import §_-ABs§.§_-C60§;
   import §_-ABs§.§_-lE§;
   import §_-ABs§.§_-tO§;
   import §_-AKx§.§_-5hc§;
   import §_-BeZ§.§_-4Ww§;
   import §_-kr§.§_-2NT§;
   
   public class §_-4ET§ extends §_-6v4§
   {
      private var §_-xn§:NewsList = null;
      
      private var §_-4kh§:NewsList = null;
      
      private var §_-3tt§:Boolean = false;
      
      public function §_-4ET§()
      {
         super();
         §_-1-t§(§_-0VX§.§_-Sd§,this.§_-7io§);
         §_-1-t§(§_-0VX§.§_-4BK§,this.§_-8PL§);
         §_-1-t§(§_-0VX§.§_-Tt§,this.§_-AME§);
      }
      
      public function §_-7wj§() : Boolean
      {
         return this.§_-3tt§;
      }
      
      public function §_-60F§(param1:String = null) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         if(param1 != null)
         {
            _loc2_.putString(§_-1cU§.§_-ANc§,param1);
         }
         §_-6gl§.sendExtMessage(§_-0VX§.§_-4BK§,_loc2_);
      }
      
      private function §_-AME§(param1:§_-9ai§) : void
      {
         this.§_-3tt§ = param1.data.getBoolean(§_-1cU§.§_-Bxy§);
         var _loc2_:Boolean = param1.data.getBoolean(§_-1cU§.§_-1D1§);
         if(_loc2_)
         {
            this.§_-60F§();
         }
      }
      
      private function §_-7io§(param1:§_-9ai§) : void
      {
         this.§_-xn§ = param1.data.§_-2jV§(§_-1cU§.§_-22P§,NewsList);
         this.§_-29E§();
      }
      
      private function §_-8PL§(param1:§_-9ai§) : void
      {
         this.§_-4kh§ = param1.data.§_-2jV§(§_-1cU§.§_-22P§,NewsList);
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         §_-6gl§.sendExtMessage(§_-0VX§.§_-0qH§,_loc2_);
         var _loc3_:String = param1.data.getString(§_-1cU§.§_-ANc§);
         this.§_-pR§(_loc3_);
      }
      
      private function §_-29E§() : void
      {
         var _loc1_:§_-74M§ = null;
         if(this.§_-xn§ == null)
         {
            return;
         }
         for each(_loc1_ in this.§_-xn§.newsList)
         {
            if(_loc1_ is §_-AWF§)
            {
               this.§_-6NT§(_loc1_ as §_-AWF§);
            }
            else if(_loc1_ is §_-4fT§)
            {
               this.§_-9l5§(_loc1_ as §_-4fT§);
            }
            else if(_loc1_ is §_-403§)
            {
               this.§_-07W§(_loc1_);
            }
            else if(_loc1_ is §_-0g3§)
            {
               this.§_-Bva§(_loc1_);
            }
            else if(_loc1_ is §_-8SS§)
            {
               this.§_-2zh§(_loc1_);
            }
            else if(_loc1_ is §_-BTM§)
            {
               this.§_-8yJ§(_loc1_);
            }
            else if(_loc1_ is §_-436§)
            {
               this.§_-4nj§(_loc1_);
            }
            else if(_loc1_ is §_-3jF§)
            {
               this.§_-3aZ§(_loc1_);
            }
            else if(_loc1_ is §_-2UY§)
            {
               this.§_-4uu§(_loc1_);
            }
            else if(_loc1_ is §_-8oe§)
            {
               this.§_-0-8§(_loc1_);
            }
            else if(_loc1_ is §_-8Dh§)
            {
               this.§_-9cd§(_loc1_);
            }
            else if(_loc1_ is §_-Bv7§)
            {
               this.§_-AM4§(_loc1_);
            }
            else if(_loc1_ is §_-CH6§)
            {
               this.§_-2yt§(_loc1_);
            }
            else if(_loc1_ is §_-2wf§)
            {
               this.§_-AGh§(_loc1_);
            }
            else if(_loc1_ is §_-0xh§)
            {
               this.§_-37f§(_loc1_);
            }
            else if(_loc1_ is §_-575§)
            {
               this.§_-9AT§(_loc1_);
            }
            else if(_loc1_ is §_-1u2§)
            {
               this.§_-5xC§(_loc1_);
            }
            else if(_loc1_ is §_-ANJ§)
            {
               this.§_-20§(_loc1_);
            }
         }
      }
      
      private function §_-37f§(param1:§_-74M§) : void
      {
         dispatchEvent(new §_-Ak8§(§_-Ak8§.§_-8po§,param1));
      }
      
      private function §_-pR§(param1:String = null) : void
      {
         var globalNews:Array = null;
         var subType:String = param1;
         if(this.§_-4kh§ != null)
         {
            globalNews = this.§_-4kh§.§_-Bwo§;
            if(globalNews.length > 0)
            {
               globalNews.sort(function(param1:§_-74M§, param2:§_-74M§):int
               {
                  return param1.time > param2.time ? -1 : 1;
               });
               if(subType == null)
               {
                  if(globalNews[0].subType == null)
                  {
                     this.§_-AG0§(globalNews);
                     return;
                  }
                  subType = globalNews[0].subType;
               }
               if(subType == §_-8O1§.§_-AcO§)
               {
                  this.§_-AG0§(globalNews);
               }
               else if(subType == §_-8O1§.§_-7Ug§)
               {
                  this.§_-0jT§(globalNews);
               }
            }
         }
      }
      
      private function §_-AG0§(param1:Array) : void
      {
         var _loc3_:§_-8O1§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            if(_loc3_.subType == null || _loc3_.subType == §_-8O1§.§_-AcO§)
            {
               _loc2_.push(_loc3_);
            }
         }
         new §_-8FB§(_loc2_).showModal();
      }
      
      private function §_-0jT§(param1:Array) : void
      {
         var _loc3_:§_-8O1§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            if(_loc3_.subType == §_-8O1§.§_-7Ug§)
            {
               _loc2_.push(_loc3_);
            }
         }
         new §_-12P§(_loc2_).showModal();
      }
      
      private function §_-5xC§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-tO§(param1),false);
      }
      
      private function §_-4uu§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-C60§(param1),true);
      }
      
      private function §_-07W§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-0sU§(param1),false);
      }
      
      private function §_-Bva§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-Bpp§(param1),true);
      }
      
      private function §_-2zh§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-8Q2§(param1),true);
      }
      
      private function §_-3aZ§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-40H§(param1),true);
      }
      
      private function §_-0-8§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-BH1§(param1),true);
      }
      
      private function §_-20§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-7-9§(param1),true);
      }
      
      private function §_-AGh§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-9gD§(param1),true);
      }
      
      private function §_-9AT§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-8P4§(param1),true);
      }
      
      private function §_-2yt§(param1:§_-74M§) : void
      {
         if(param1.type == §_-2vU§.§_-8W§)
         {
            §_-5hc§.§_-57w§(new §_-4zc§(param1),true);
         }
         else if(param1.type == §_-2vU§.§_-6oY§)
         {
            §_-5hc§.§_-57w§(new §_-lE§(param1),true);
         }
      }
      
      private function §_-4nj§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-43l§(param1),true);
      }
      
      private function §_-8yJ§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-9zV§(param1),true);
      }
      
      private function §_-9cd§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-943§(param1),false);
      }
      
      private function §_-9l5§(param1:§_-4fT§) : void
      {
         §_-5hc§.§_-57w§(§_-7at§.§_-5un§(param1),true);
      }
      
      private function §_-6NT§(param1:§_-AWF§) : void
      {
         var news:§_-AWF§ = param1;
         §_-2NT§.§_-5vY§(RB24Module.§_-iR§).then(function():void
         {
            §_-5hc§.§_-57w§(new §_-BHO§(news),true);
         });
      }
      
      private function §_-AM4§(param1:§_-74M§) : void
      {
         §_-5hc§.§_-57w§(new §_-73t§(param1 as §_-Bv7§),true);
      }
      
      public function §_-JT§(param1:§_-74M§) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-1cU§.§_-0xI§,param1.index);
         §_-6gl§.sendExtMessage(§_-0VX§.§_-3cr§,_loc2_);
      }
      
      public function §_-A7j§(param1:String) : Array
      {
         var _loc3_:§_-74M§ = null;
         var _loc2_:Array = [];
         if(this.§_-xn§ == null)
         {
            return _loc2_;
         }
         for each(_loc3_ in this.§_-xn§.§_-Bwo§)
         {
            if(param1 == _loc3_.type)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-8G2§(param1:§_-74M§) : void
      {
         this.§_-xn§.§_-3Ef§(param1.index);
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-CZf§(§_-1cU§.§_-0xI§,param1.index);
         §_-6gl§.sendExtMessage(§_-0VX§.REMOVE,_loc2_);
      }
   }
}

