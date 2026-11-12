package §_-m8§
{
   import §_-0Uz§.§_-m3§;
   import §_-18o§.§_-8-S§;
   import §_-3DC§.SocialRequest;
   import §_-3DC§.§_-0pk§;
   import §_-3DC§.§_-8VM§;
   import §_-6-L§.§_-6aF§;
   import §_-6kh§.§_-5To§;
   import §_-9VF§.§_-5ab§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import ags.§_-5x-§;
   import flash.errors.IllegalOperationError;
   
   public class §_-Acd§ extends §_-53f§ implements §_-m3§
   {
      private static const §_-9gB§:String = "socialRequest";
      
      protected var §_-8bS§:§_-0pk§ = null;
      
      protected var _netManager:§_-5To§ = null;
      
      public function §_-Acd§()
      {
         super();
         this._netManager = new §_-5To§(this);
      }
      
      public function §_-2DL§() : void
      {
         this._netManager.§_-3cv§();
      }
      
      public function get §_-dj§() : Array
      {
         var _loc2_:SocialRequest = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-8bS§.requests)
         {
            if(!(_loc2_.status == §_-8VM§.§_-CFa§ || _loc2_.status == §_-8VM§.§_-6U4§))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-0oG§() : Array
      {
         var _loc2_:SocialRequest = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-8bS§.requests)
         {
            if(_loc2_.status == §_-8VM§.§_-9Qi§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-BDn§() : Array
      {
         var _loc2_:SocialRequest = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-8bS§.§_-8WY§)
         {
            if(_loc2_.status == §_-8VM§.§_-ZP§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get maxSendCount() : int
      {
         throw new IllegalOperationError("Must override");
      }
      
      public function §_-8aU§(param1:String) : Boolean
      {
         return this.§_-8bS§.§_-8aU§(param1);
      }
      
      public function get §_-B7Z§() : Object
      {
         return this.§_-8bS§.§_-8WY§;
      }
      
      public function get §_-4F8§() : Object
      {
         return this.§_-8bS§.requests;
      }
      
      public function §_-7DZ§(param1:String) : void
      {
         if(this.§_-8bS§.requests.hasOwnProperty(param1))
         {
            delete this.§_-8bS§.requests[param1];
            dispatchEvent(new §_-51T§(§_-51T§.CHANGE));
         }
      }
      
      public function §_-8N4§(param1:String) : void
      {
         if(this.§_-8bS§.§_-8WY§.hasOwnProperty(param1))
         {
            delete this.§_-8bS§.§_-8WY§[param1];
            dispatchEvent(new §_-51T§(§_-51T§.CHANGE));
         }
      }
      
      public function reject(param1:String) : void
      {
         this._netManager.reject(param1);
      }
      
      public function approve(param1:String) : void
      {
         this._netManager.approve(param1);
      }
      
      public function §_-3rr§(param1:String, param2:String, param3:int = 1) : void
      {
         this._netManager.§_-3rr§(param1,param2,param3);
      }
      
      public function pickUp(param1:String) : void
      {
         this._netManager.pickUp(param1);
      }
      
      public function cancel(param1:String) : void
      {
         this._netManager.cancel(param1);
      }
      
      public function requestApproved(param1:String) : void
      {
         if(this.§_-8bS§.lastApproveTime == null)
         {
            this.§_-8bS§.lastApproveTime = {};
         }
         this.§_-8bS§.lastApproveTime[param1] = §_-8-S§.§_-9zq§();
         var _loc2_:SocialRequest = !!this.§_-8bS§.§_-8WY§.hasOwnProperty(param1) ? this.§_-8bS§.§_-8WY§[param1] : null;
         if(_loc2_ != null)
         {
            _loc2_.status = §_-8VM§.§_-9Qi§;
            dispatchEvent(new §_-51T§(§_-51T§.CHANGE));
         }
      }
      
      public function requestCreated(param1:SocialRequest) : void
      {
         this.§_-8bS§.requests[param1.targetId] = param1;
         Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("craftResponseNotificationPanelTitle"),Context.§_-5o8§.message("craftFriendRequestCreated"));
         dispatchEvent(new §_-51T§(§_-51T§.CHANGE));
      }
      
      public function §_-6cn§(param1:§_-0pk§) : void
      {
         var _loc3_:SocialRequest = null;
         var _loc4_:SocialRequest = null;
         this.§_-8bS§ = param1;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-8bS§.§_-8WY§)
         {
            if(_loc2_.indexOf(_loc3_.senderId) == -1)
            {
               _loc2_.push(_loc3_.senderId);
            }
         }
         for each(_loc4_ in this.§_-8bS§.requests)
         {
            if(_loc2_.indexOf(_loc4_.targetId) == -1)
            {
               _loc2_.push(_loc4_.targetId);
            }
         }
         Context.§_-3B2§.§_-ADX§(_loc2_,§_-9gB§,this.onPlayers);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function get allowedFriendsForRequest() : Array
      {
         var _loc3_:§_-5ab§ = null;
         var _loc4_:SocialRequest = null;
         var _loc1_:Array = §_-6aF§.toArray(Context.§_-9q-§.§_-AB2§);
         var _loc2_:Array = [];
         for each(_loc3_ in _loc1_)
         {
            if(!this.§_-8bS§.requests.hasOwnProperty(_loc3_.id))
            {
               _loc2_.push(_loc3_);
            }
            else
            {
               _loc4_ = this.§_-8bS§.requests[_loc3_.id];
               if(_loc4_.status == §_-8VM§.§_-CFa§ || _loc4_.status == §_-8VM§.§_-6U4§ && !§_-8-S§.§_-r§(_loc4_.§_-6XR§))
               {
                  _loc2_.push(_loc3_);
               }
            }
         }
         return _loc2_;
      }
      
      public function hasWaitingRequests() : Boolean
      {
         return this.§_-8bS§.hasWaitingRequests();
      }
      
      protected function onPlayers(param1:Array) : void
      {
         dispatchEvent(new §_-51T§(§_-51T§.CHANGE));
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

