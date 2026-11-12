package §_-Am4§
{
   import §_-0Uz§.§_-6v4§;
   import §_-0kB§.§_-4H0§;
   import §_-0wn§.§_-9eS§;
   import §_-2zv§.CityRelationListItem;
   import §_-3na§.§_-6Aw§;
   import §_-3na§.§_-CCU§;
   import §_-6-L§.§_-49j§;
   import §_-6vH§.§_-AgE§;
   import §_-8-a§.§_-8RG§;
   import §_-8-a§.§_-8n-§;
   import §_-8UF§.§_-7wp§;
   import §_-8rl§.Relation;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-4OH§;
   import §_-B9N§.§_-12e§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-6eR§ extends §_-6v4§
   {
      private static const §_-8uF§:Number = 100;
      
      public function §_-6eR§()
      {
         super();
         if(§_-AeD§ != null)
         {
            §_-AeD§.addEventListener(§_-8n-§.§_-Aw8§,this.§_-sl§);
            §_-AeD§.addEventListener(§_-8n-§.§_-B2j§,this.§_-2QD§);
         }
         if(§_-3NB§ != null)
         {
            §_-3NB§.addEventListener(§_-6Aw§.§_-CA-§,this.§_-6-n§);
            §_-3NB§.addEventListener(§_-6Aw§.§_-CWd§,this.§_-1or§);
         }
      }
      
      private static function get §_-AeD§() : §_-8RG§
      {
         var _loc1_:§_-4H0§ = Context.§_-2ap§;
         return _loc1_.§_-0rO§(§_-8RG§) ? _loc1_.getComponent(§_-8RG§) : null;
      }
      
      private static function get §_-3NB§() : §_-CCU§
      {
         var _loc1_:§_-4H0§ = Context.§_-2ap§;
         return _loc1_.§_-0rO§(§_-CCU§) ? _loc1_.getComponent(§_-CCU§) : null;
      }
      
      private function §_-6-n§(param1:§_-6Aw§) : void
      {
         var _loc2_:§_-7wp§ = new §_-7wp§(§_-7wp§.§_-9Z3§);
         _loc2_.§_-5aN§(§_-7wp§.§_-6eI§,param1.bannedChatUser);
         Application.instance.dispatchEvent(_loc2_);
      }
      
      private function §_-1or§(param1:§_-6Aw§) : void
      {
         var _loc2_:§_-7wp§ = new §_-7wp§(§_-7wp§.§_-5eh§);
         _loc2_.§_-5aN§(§_-7wp§.§_-6eI§,new §_-12e§());
         Application.instance.dispatchEvent(_loc2_);
      }
      
      private function §_-sl§(param1:§_-8n-§) : void
      {
         var _loc2_:String = param1.userId;
         var _loc3_:§_-7wp§ = new §_-7wp§(§_-7wp§.§_-4Kz§);
         _loc3_.§_-5aN§(§_-7wp§.§_-1tE§,_loc2_);
         §_-9eS§.instance.dispatchEvent(_loc3_);
      }
      
      private function §_-2QD§(param1:§_-8n-§) : void
      {
         var _loc2_:String = param1.userId;
         var _loc3_:§_-7wp§ = new §_-7wp§(§_-7wp§.§_-4iO§);
         _loc3_.§_-5aN§(§_-7wp§.§_-1tE§,_loc2_);
         §_-9eS§.instance.dispatchEvent(_loc3_);
      }
      
      public function §_-06D§(param1:Array, param2:Function) : void
      {
         var userIds:Array = param1;
         var callback:Function = param2;
         if(userIds == null || userIds.length == 0)
         {
            userIds = §_-49j§.clone(this.§_-9Xx§.userIds);
         }
         Context.§_-AI9§.§_-0kV§(function(param1:Object):void
         {
            var relations:Object = param1;
            var filteredRelationIds:Array = userIds;
            Context.§_-3B2§.§_-6wA§(filteredRelationIds,function(param1:Array):void
            {
               var _loc2_:Array = prepareList(param1,relations);
               callback(_loc2_);
            });
         });
      }
      
      private function prepareList(param1:Array, param2:Object) : Array
      {
         var _loc5_:§_-5ab§ = null;
         var _loc3_:Array = [];
         var _loc4_:CityRelationListItem = null;
         for each(_loc5_ in param1)
         {
            _loc4_ = new CityRelationListItem();
            _loc4_.player = _loc5_;
            _loc4_.relation = !!param2.hasOwnProperty(_loc5_.id) ? param2[_loc5_.id] : null;
            _loc3_.push(_loc4_);
         }
         return _loc3_;
      }
      
      public function get §_-9Xx§() : §_-AgE§
      {
         if(§_-AeD§ == null)
         {
            return new §_-AgE§();
         }
         return §_-AeD§.blackList;
      }
      
      public function §_-94l§(param1:String) : Boolean
      {
         return §_-AeD§ != null && §_-AeD§.blackList.contains(param1);
      }
      
      public function get bannedChatUser() : §_-12e§
      {
         if(§_-3NB§ != null)
         {
            return §_-3NB§.bannedChatUser;
         }
         return null;
      }
      
      public function get §_-8td§() : Boolean
      {
         return this.bannedChatUser != null && this.bannedChatUser.§_-0RM§(Context.player.timeDelta);
      }
      
      public function §_-CAi§(param1:String) : void
      {
         if(§_-AeD§ != null)
         {
            §_-AeD§.§_-83P§(param1);
         }
      }
      
      public function §_-BDa§(param1:String) : void
      {
         if(§_-AeD§ != null)
         {
            if(§_-AeD§.blackList.size >= §_-8uF§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("blockedChatUsersLengthWarning"));
               return;
            }
            §_-AeD§.addToBlackList(param1);
         }
      }
   }
}

