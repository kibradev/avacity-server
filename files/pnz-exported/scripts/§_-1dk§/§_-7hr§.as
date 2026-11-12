package §_-1dk§
{
   import §_-0Uz§.§_-m3§;
   import §_-3TY§.§_-6k2§;
   import §_-40e§.§_-9uU§;
   import §_-5Zh§.§_-x4§;
   import §_-7xl§.§_-5m-§;
   import §_-8rl§.Relation;
   import §_-91S§.§_-CSt§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-CF7§.§_-AGc§;
   import §_-GM§.Context;
   import ags.§_-5x-§;
   
   public class §_-7hr§ extends §_-5m-§ implements §_-m3§
   {
      private var §_-6-X§:Object = {};
      
      private var §_-CAm§:Object = {};
      
      private var §_-6Gl§:Object = {};
      
      private var _netManager:§_-AGc§ = null;
      
      public function §_-7hr§()
      {
         super();
      }
      
      public function init(param1:Class) : void
      {
         this._netManager = new §_-AGc§(param1);
         this._netManager.addEventListener(§_-9uU§.§_-5hW§,this.§_-7jb§);
         this._netManager.addEventListener(§_-9uU§.§_-51Z§,this.§_-AtT§);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      private function §_-7jb§(param1:§_-9uU§) : void
      {
         var _loc3_:§_-5ab§ = null;
         var _loc4_:Array = null;
         var _loc5_:Function = null;
         var _loc2_:Array = [];
         if(this.§_-6Gl§.hasOwnProperty(param1.callId))
         {
            _loc2_ = this.§_-6Gl§[param1.callId];
            delete this.§_-6Gl§[param1.callId];
         }
         for each(_loc3_ in param1.§_-5DH§)
         {
            _loc2_.push(_loc3_);
            this.addPlayer(_loc3_);
         }
         if(Boolean(this.§_-CAm§.hasOwnProperty(param1.callId)) && this.§_-CAm§[param1.callId] is Array)
         {
            _loc4_ = this.§_-CAm§[param1.callId];
            for each(_loc5_ in _loc4_)
            {
               _loc5_(_loc2_);
            }
            delete this.§_-CAm§[param1.callId];
         }
         _loc2_ = [];
      }
      
      private function §_-AtT§(param1:§_-9uU§) : void
      {
         var _loc2_:Function = null;
         if(this.§_-CAm§.hasOwnProperty(param1.callId))
         {
            _loc2_ = this.§_-CAm§[param1.callId];
            delete this.§_-CAm§[param1.callId];
            _loc2_(param1.§_-6bA§);
         }
      }
      
      public function §_-00h§(param1:Array) : void
      {
         var _loc2_:§_-5ab§ = null;
         for each(_loc2_ in param1)
         {
            this.addPlayer(_loc2_);
         }
      }
      
      public function §_-C7w§(param1:Array, param2:Function) : void
      {
         this.§_-BYO§(param1,"friends",param2);
      }
      
      public function §_-71O§(param1:Array, param2:Function) : void
      {
         this.§_-ADX§(param1,"buddy",param2);
      }
      
      public function §_-4bR§(param1:String, param2:Array, param3:Function) : void
      {
         this.§_-ADX§(param2,"relations" + param1,param3);
      }
      
      public function §_-6wA§(param1:Array, param2:Function) : void
      {
         this.§_-ADX§(param1,"blackList",param2);
      }
      
      public function §_-8xN§(param1:Array, param2:Function) : void
      {
         this.§_-ADX§(param1,"mmld",param2);
      }
      
      public function §_-0tx§(param1:Array, param2:Function) : void
      {
         this.§_-ADX§(param1,"mbld",param2);
      }
      
      public function §_-Bzu§(param1:Array, param2:Function) : void
      {
         this.§_-ADX§(param1,"cmtwn",param2);
      }
      
      public function §_-CR9§(param1:String, param2:Function) : void
      {
         var playerId:String = param1;
         var callback:Function = param2;
         this.§_-ADX§([playerId],playerId,function(param1:Array):void
         {
            if(param1.length == 0)
            {
               callback(null);
            }
            else
            {
               callback(param1[0]);
            }
         });
      }
      
      public function §_-ADX§(param1:Array, param2:String, param3:Function) : void
      {
         var _loc6_:String = null;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in param1)
         {
            if(!(_loc6_ == "" || isNaN(parseInt(_loc6_))))
            {
               if(this.§_-6-X§.hasOwnProperty(_loc6_))
               {
                  _loc4_.push(this.§_-6-X§[_loc6_]);
               }
               else
               {
                  _loc5_.push(_loc6_);
               }
            }
         }
         if(_loc5_.length == 0)
         {
            param3(_loc4_);
            return;
         }
         if(this.addCallback(param2,param3))
         {
            this.§_-6Gl§[param2] = _loc4_;
            this._netManager.§_-9is§(_loc5_,param2);
         }
      }
      
      public function §_-BYO§(param1:Array, param2:String, param3:Function) : void
      {
         var _loc6_:String = null;
         var _loc4_:Array = [];
         var _loc5_:Array = [];
         for each(_loc6_ in param1)
         {
            if(!(_loc6_ == "" || isNaN(parseInt(_loc6_))))
            {
               _loc4_.push(_loc6_);
            }
         }
         if(_loc4_.length == 0)
         {
            param3(_loc5_);
            return;
         }
         if(this.addCallback(param2,param3))
         {
            this.§_-6Gl§[param2] = _loc5_;
            this._netManager.§_-3xk§(_loc4_,param2,§_-6k2§.§_-2pB§(Context.§_-2BT§.adapter.socialNetwork));
         }
      }
      
      private function addCallback(param1:String, param2:Function) : Boolean
      {
         if(!this.§_-CAm§.hasOwnProperty(param1))
         {
            this.§_-CAm§[param1] = [param2];
            return true;
         }
         (this.§_-CAm§[param1] as Array).push(param2);
         return false;
      }
      
      public function §_-07a§(param1:String) : §_-5ab§
      {
         return !!this.§_-6-X§.hasOwnProperty(param1) ? this.§_-6-X§[param1] : null;
      }
      
      public function §_-pz§(param1:Array) : Object
      {
         var _loc3_:§_-5ab§ = null;
         var _loc2_:Object = {};
         for each(_loc3_ in this.§_-6-X§)
         {
            if(param1.indexOf(_loc3_.id) >= 0)
            {
               _loc2_[_loc3_.id] = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public function §_-3EX§(param1:String) : §_-5ab§
      {
         var _loc2_:§_-5ab§ = null;
         for each(_loc2_ in this.§_-6-X§)
         {
            if(_loc2_.userInfo.socialId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-8kP§(param1:Array) : Object
      {
         var _loc3_:§_-5ab§ = null;
         var _loc2_:Object = {};
         for each(_loc3_ in this.§_-6-X§)
         {
            if(param1.indexOf(_loc3_.userInfo.socialId) >= 0)
            {
               _loc2_[_loc3_.id] = _loc3_;
            }
         }
         return _loc2_;
      }
      
      public function addPlayer(param1:§_-5ab§) : void
      {
         var _loc2_:§_-5ab§ = null;
         if(this.§_-6-X§.hasOwnProperty(param1.id))
         {
            _loc2_ = this.§_-6-X§[param1.id];
            if(Boolean(_loc2_.userInfo.socialId) && !param1.userInfo.socialId)
            {
               param1.userInfo = _loc2_.userInfo;
            }
         }
         this.§_-6-X§[param1.id] = param1;
      }
      
      public function §_-6yo§(param1:Array, param2:Function) : void
      {
         var _loc3_:String = "online";
         this.§_-CAm§[_loc3_] = param2;
         this._netManager.§_-6yo§(param1,_loc3_);
      }
      
      public function get §_-AuI§() : int
      {
         return this._netManager != null ? this._netManager.§_-AuI§ : 0;
      }
      
      public function follow(param1:String) : void
      {
         if(this._netManager == null)
         {
            return;
         }
         this._netManager.follow(param1);
      }
      
      public function §_-2yl§(param1:String) : Boolean
      {
         var _loc6_:§_-x4§ = null;
         var _loc7_:§_-x4§ = null;
         if(!this.§_-6-X§.hasOwnProperty(param1))
         {
            return true;
         }
         var _loc2_:§_-48g§ = this.§_-6-X§[param1] as §_-48g§;
         if(_loc2_ != null && _loc2_.cityInfo.§_-9qn§)
         {
            return false;
         }
         var _loc3_:Relation = Context.§_-AI9§.§_-112§(Context.player.id,param1);
         var _loc4_:Boolean = _loc3_ != null && _loc3_.statusGroupId != §_-CSt§.§_-28E§;
         var _loc5_:Boolean = false;
         if(Context.cityPlayer != null)
         {
            _loc6_ = Context.cityPlayer.clanInfo;
            _loc7_ = _loc2_.clanInfo;
            _loc5_ = _loc6_ != null && _loc7_ != null && _loc6_.clanId == _loc7_.clanId;
         }
         return !_loc4_ && !_loc5_;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-9uU§.§_-5hW§,this.§_-7jb§);
            this._netManager.removeEventListener(§_-9uU§.§_-51Z§,this.§_-AtT§);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

