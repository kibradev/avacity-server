package §_-5xE§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-18o§.§_-8-S§;
   import §_-1sb§.§_-2xb§;
   import §_-1x4§.FacebookAdapter;
   import §_-2qd§.§_-9ai§;
   import §_-2zv§.§_-6BY§;
   import §_-3TY§.§_-5I8§;
   import §_-3TY§.§_-6nA§;
   import §_-6-L§.§_-3hw§;
   import §_-62k§.§_-7Mj§;
   import §_-6Pj§.§_-02c§;
   import §_-7RA§.§_-6Wa§;
   import §_-7Zq§.§_-3G3§;
   import §_-7kf§.§_-9S8§;
   import §_-8rl§.Relation;
   import §_-91S§.§_-1BO§;
   import §_-91S§.§_-1a6§;
   import §_-91S§.§_-3Z3§;
   import §_-91S§.§_-4DP§;
   import §_-91S§.§_-4Ju§;
   import §_-91S§.§_-5V3§;
   import §_-91S§.§_-8p9§;
   import §_-91S§.§_-CSt§;
   import §_-9M3§.§_-7TA§;
   import §_-9M3§.§_-8Ef§;
   import §_-9Nd§.§_-3iv§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-9xw§.§_-9BV§;
   import §_-9xw§.§_-CAc§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-5hc§;
   import §_-AQB§.§_-58H§;
   import §_-AdD§.Avatar;
   import §_-AdD§.§_-6r6§;
   import §_-An-§.§_-v5§;
   import §_-B1o§.§_-6xF§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import penzville.Config;
   
   public class §_-AkN§ extends §_-6v4§
   {
      private static const §_-3WR§:int = 70;
      
      private static const §_-8al§:int = 50;
      
      private var §_-Bfx§:Object = {};
      
      private var §_-uo§:Object = {};
      
      private var _inited:Boolean = false;
      
      private var §_-1il§:int = 0;
      
      private var §_-7Ff§:Object = null;
      
      private var §_-1O4§:Object = null;
      
      private var §_-82Z§:Array = null;
      
      private var §_-0EU§:Object = null;
      
      private var §_-7CD§:Array = null;
      
      private var §_-AhU§:§_-0NE§ = null;
      
      public function §_-AkN§()
      {
         super();
         §_-1-t§(§_-7TA§.§_-3bP§,this.§_-66s§);
         §_-1-t§(§_-7TA§.§_-9Fq§,this.§_-BIZ§);
         §_-1-t§(§_-7TA§.§_-7Ty§,this.§_-B0I§);
         §_-1-t§(§_-7TA§.§_-1RE§,this.§_-75-§);
         §_-1-t§(§_-7TA§.§_-2p9§,this.§_-6b§);
         §_-1-t§(§_-7TA§.§_-66V§,this.§_-728§);
         §_-1-t§(§_-7TA§.§_-6SX§,this.§_-6Aq§);
         §_-1-t§(§_-7TA§.§_-0hc§,this.§_-9jd§);
         §_-1-t§(§_-7TA§.§_-27f§,this.§_-0RH§);
         §_-1-t§(§_-7TA§.§_-5Qr§,this.§_-6V5§);
         §_-1-t§(§_-7TA§.§_-DY§,this.§_-ub§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         var _loc6_:XML = null;
         var _loc7_:XML = null;
         var _loc8_:§_-1BO§ = null;
         var _loc9_:§_-5V3§ = null;
         var _loc10_:§_-4DP§ = null;
         var _loc11_:§_-6xF§ = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:XML = §_-3hw§.§_-1s9§(param1,"notesConfig");
         this.§_-1il§ = 0;
         if(_loc2_ != null)
         {
            this.§_-1il§ = !!_loc2_.hasOwnProperty("@maxLength") ? int(_loc2_["@maxLength"]) : 0;
         }
         this.§_-7Ff§ = {};
         for each(_loc3_ in §_-3hw§.§_-3bk§(param1,"statuses.status"))
         {
            _loc8_ = new §_-1BO§();
            _loc8_.fromXML(_loc3_);
            this.§_-7Ff§[_loc8_.id] = _loc8_;
         }
         this.§_-1O4§ = {};
         for each(_loc4_ in §_-3hw§.§_-3bk§(param1,"groups.group"))
         {
            _loc9_ = new §_-5V3§();
            _loc9_.fromXML(_loc4_);
            this.§_-1O4§[_loc9_.id] = _loc9_;
         }
         this.§_-82Z§ = [];
         for each(_loc5_ in §_-3hw§.§_-3bk§(param1,"permissions.rule"))
         {
            _loc10_ = new §_-4DP§();
            _loc10_.fromXML(_loc5_);
            this.§_-82Z§.push(_loc10_);
         }
         this.§_-0EU§ = {};
         for each(_loc6_ in §_-3hw§.§_-3bk§(param1,"progresses.progress"))
         {
            this.§_-0EU§[_loc6_["@reason"]] = _loc6_["@value"];
         }
         this.§_-7CD§ = [];
         for each(_loc7_ in §_-3hw§.§_-3bk§(param1,"callToGameRelationRules.call"))
         {
            _loc11_ = new §_-6xF§();
            _loc11_.fromXML(_loc7_);
            this.§_-7CD§.push(_loc11_);
         }
      }
      
      public function §_-14E§(param1:String, param2:String) : §_-4DP§
      {
         var _loc3_:§_-4DP§ = null;
         for each(_loc3_ in this.§_-82Z§)
         {
            if(_loc3_.resource == param1 && _loc3_.privilege == param2)
            {
               return _loc3_;
            }
         }
         return new §_-4DP§();
      }
      
      public function §_-6F2§(param1:int) : §_-1BO§
      {
         return !!this.§_-7Ff§.hasOwnProperty(String(param1)) ? this.§_-7Ff§[param1] : null;
      }
      
      public function getGroup(param1:String) : §_-5V3§
      {
         return !!this.§_-1O4§.hasOwnProperty(param1) ? this.§_-1O4§[param1] : null;
      }
      
      public function §_-602§(param1:int) : §_-5V3§
      {
         var _loc2_:§_-5V3§ = null;
         for each(_loc2_ in this.§_-1O4§)
         {
            if(_loc2_.§_-7TV§(param1))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-3fe§(param1:String) : int
      {
         return !!this.§_-0EU§.hasOwnProperty(param1) ? int(this.§_-0EU§[param1]) : 0;
      }
      
      public function §_-8Mf§(param1:int) : Boolean
      {
         return param1 == §_-3Z3§.§_-8A8§ || param1 == §_-3Z3§.§_-Ow§ || param1 == §_-3Z3§.§_-6qg§ || param1 == §_-3Z3§.§_-41G§;
      }
      
      public function init() : void
      {
         §_-6gl§.sendExtMessage(§_-7TA§.§_-3bP§);
      }
      
      public function get inited() : Boolean
      {
         return this._inited;
      }
      
      private function §_-66s§(param1:§_-9ai§) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:Relation = null;
         var _loc7_:Function = null;
         var _loc2_:§_-4Ww§ = param1.data.§_-ANw§(§_-8Ef§.RELATIONS);
         var _loc3_:Object = {};
         for each(_loc4_ in _loc2_.keys)
         {
            _loc6_ = new Relation();
            _loc6_.fromAGSObject(_loc2_.§_-ANw§(_loc4_));
            _loc3_[_loc4_] = _loc6_;
         }
         _loc5_ = param1.data.getString(§_-3mj§.§_-9GV§);
         this.§_-Bfx§[_loc5_] = _loc3_;
         if(_loc5_ == Context.player.id && !this._inited)
         {
            this._inited = true;
            this.§_-0CG§();
         }
         if(this.§_-uo§.hasOwnProperty(_loc5_))
         {
            _loc7_ = this.§_-uo§[_loc5_];
            delete this.§_-uo§[_loc5_];
            _loc7_(_loc3_);
         }
      }
      
      private function §_-75-§(param1:§_-9ai§) : void
      {
         var _loc7_:int = 0;
         var _loc8_:Object = null;
         var _loc9_:§_-5ab§ = null;
         var _loc2_:String = Context.player.id;
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:String = param1.data.getString(§_-8Ef§.§_-5uv§);
         var _loc5_:Relation = param1.data.§_-2jV§(§_-8Ef§.§_-Ccg§,Relation);
         var _loc6_:int = param1.data.getInt(§_-8Ef§.§_-2Mq§);
         if(_loc4_ == §_-4Ju§.§_-252§)
         {
            dispatchEvent(new §_-v5§(§_-v5§.§_-4oS§,_loc3_,_loc5_,_loc6_));
         }
         if(this.§_-Bfx§.hasOwnProperty(_loc2_))
         {
            _loc7_ = 0;
            _loc8_ = this.§_-Bfx§[_loc2_];
            if(_loc8_.hasOwnProperty(_loc3_))
            {
               _loc7_ = (_loc8_[_loc3_] as Relation).progress;
               (_loc8_[_loc3_] as Relation).update(_loc5_);
            }
            else
            {
               _loc8_[_loc3_] = _loc5_;
            }
            _loc9_ = Context.§_-3B2§.§_-07a§(_loc3_);
            if(_loc7_ != _loc5_.progress)
            {
               Context.§_-BlB§.§_-CCK§(new §_-6BY§(_loc9_,_loc5_,_loc4_));
               dispatchEvent(new §_-v5§(§_-v5§.§_-4oS§,_loc3_,_loc5_));
            }
         }
      }
      
      private function §_-ub§(param1:§_-9ai§) : void
      {
         var _loc5_:Object = null;
         var _loc2_:String = Context.player.id;
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:Relation = param1.data.§_-2jV§(§_-8Ef§.§_-Ccg§,Relation);
         if(this.§_-Bfx§.hasOwnProperty(_loc2_))
         {
            _loc5_ = this.§_-Bfx§[_loc2_];
            if(_loc5_.hasOwnProperty(_loc3_))
            {
               (_loc5_[_loc3_] as Relation).update(_loc4_);
            }
            else
            {
               _loc5_[_loc3_] = _loc4_;
            }
            dispatchEvent(new §_-v5§(§_-v5§.§_-4X8§,_loc3_,_loc4_));
         }
      }
      
      private function §_-728§(param1:§_-9ai§) : void
      {
         var _loc5_:Object = null;
         var _loc2_:String = Context.player.id;
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:Relation = param1.data.§_-2jV§(§_-8Ef§.§_-Ccg§,Relation);
         if(this.§_-Bfx§.hasOwnProperty(_loc2_))
         {
            _loc5_ = this.§_-Bfx§[_loc2_];
            if(_loc5_.hasOwnProperty(_loc3_))
            {
               (_loc5_[_loc3_] as Relation).update(_loc4_);
            }
            else
            {
               _loc5_[_loc3_] = _loc4_;
            }
            dispatchEvent(new §_-v5§(§_-v5§.§_-4oS§,_loc3_,_loc4_));
         }
      }
      
      private function §_-6b§(param1:§_-9ai§) : void
      {
         var _loc5_:Object = null;
         var _loc6_:§_-5ab§ = null;
         var _loc7_:Object = null;
         var _loc2_:String = Context.player.id;
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:Relation = param1.data.§_-2jV§(§_-8Ef§.§_-Ccg§,Relation);
         if(this.§_-Bfx§.hasOwnProperty(_loc2_))
         {
            _loc5_ = this.§_-Bfx§[_loc2_];
            if(_loc5_.hasOwnProperty(_loc3_))
            {
               (_loc5_[_loc3_] as Relation).update(_loc4_);
            }
            else
            {
               _loc5_[_loc3_] = _loc4_;
            }
            if(_loc4_.statusGroupId != §_-CSt§.§_-8Fm§)
            {
               §_-5hc§.§_-57w§(new §_-3G3§(_loc3_,_loc4_.status));
            }
            dispatchEvent(new §_-v5§(§_-v5§.§_-0A9§,_loc3_,_loc4_));
            if(Context.§_-2BT§.adapter is FacebookAdapter && Config.openGraph)
            {
               _loc7_ = {};
               _loc7_[§_-CAc§.§_-Ccg§] = §_-5I8§.replace(Config.socialGraph[§_-CAc§.§_-Ccg§],{
                  "status":_loc4_.status,
                  "pid":_loc3_,
                  "pname":Context.§_-3B2§.§_-07a§(_loc3_).avatarAppearance.name,
                  "uname":Context.player.avatarAppearance.name
               });
               §_-6nA§.§_-4FB§(§_-9BV§.ADD,_loc7_);
            }
            _loc6_ = Context.§_-3B2§.§_-07a§(_loc3_);
            if(this.§_-5rI§(_loc6_,_loc4_))
            {
               Context.§_-BlB§.§_-CCK§(new §_-6Wa§(_loc6_,_loc4_));
            }
         }
      }
      
      private function §_-5rI§(param1:§_-5ab§, param2:Relation) : Boolean
      {
         var _loc3_:§_-4DP§ = null;
         if(param2.statusGroupId == §_-CSt§.§_-AYt§)
         {
            _loc3_ = Context.§_-AI9§.§_-14E§(§_-1a6§.§_-TA§,§_-8p9§.§_-3Tj§);
            return _loc3_.§_-0BX§(param1.id);
         }
         if(param2.statusGroupId == §_-CSt§.§_-1Gx§ && Context.player.avatarAppearance.gender != param1.avatarAppearance.gender)
         {
            _loc3_ = Context.§_-AI9§.§_-14E§(§_-1a6§.§_-TA§,§_-8p9§.§_-7Yw§);
            return _loc3_.§_-0BX§(param1.id);
         }
         return false;
      }
      
      private function §_-BIZ§(param1:§_-9ai§) : void
      {
         var _loc5_:Object = null;
         var _loc6_:Object = null;
         var _loc2_:String = Context.player.id;
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         var _loc4_:Relation = param1.data.§_-2jV§(§_-8Ef§.§_-Ccg§,Relation);
         if(this.§_-Bfx§.hasOwnProperty(_loc2_))
         {
            _loc5_ = this.§_-Bfx§[_loc2_];
            if(!_loc5_.hasOwnProperty(_loc3_))
            {
               this.§_-Bfx§[_loc2_][_loc3_] = _loc4_;
               if(_loc4_.statusGroupId != §_-CSt§.§_-8Fm§)
               {
                  §_-5hc§.§_-57w§(new §_-3G3§(_loc3_,_loc4_.status));
               }
               dispatchEvent(new §_-v5§(§_-v5§.§_-9Fq§,_loc3_,_loc4_));
               if(Context.§_-2BT§.adapter is FacebookAdapter && Config.openGraph)
               {
                  _loc6_ = {};
                  _loc6_[§_-CAc§.§_-Ccg§] = §_-5I8§.replace(Config.socialGraph[§_-CAc§.§_-Ccg§],{
                     "status":_loc4_.status,
                     "pid":_loc3_,
                     "pname":Context.§_-3B2§.§_-07a§(_loc3_).avatarAppearance.name,
                     "uname":Context.player.avatarAppearance.name
                  });
                  §_-6nA§.§_-4FB§(§_-9BV§.ADD,_loc6_);
               }
            }
         }
      }
      
      private function §_-B0I§(param1:§_-9ai§) : void
      {
         var _loc4_:Object = null;
         var _loc5_:Relation = null;
         var _loc6_:§_-5ab§ = null;
         var _loc2_:String = Context.player.id;
         var _loc3_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         if(this.§_-Bfx§.hasOwnProperty(_loc2_))
         {
            _loc4_ = this.§_-Bfx§[_loc2_];
            if(_loc4_.hasOwnProperty(_loc3_))
            {
               _loc5_ = this.§_-Bfx§[_loc2_][_loc3_];
               delete this.§_-Bfx§[_loc2_][_loc3_];
               if(_loc5_.statusGroupId != §_-CSt§.§_-8Fm§)
               {
                  _loc6_ = Context.§_-3B2§.§_-07a§(_loc3_);
                  if(_loc6_ != null)
                  {
                     §_-4OH§.§_-B5P§(Context.§_-5o8§.message("removeRelationTitle"),Context.§_-5o8§.message("removeRelationAlert",{"name":_loc6_.avatarAppearance.name}));
                  }
               }
               dispatchEvent(new §_-v5§(§_-v5§.§_-0TT§,_loc3_,null));
            }
         }
      }
      
      private function §_-6Aq§(param1:§_-9ai§) : void
      {
         var _loc4_:String = null;
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc2_:int = param1.data.getInt(§_-3iv§.§_-0JN§);
         var _loc3_:int = Context.player.avatarAppearance.gender == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
         switch(_loc2_)
         {
            case §_-8Ef§.§_-5Jv§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("maxRelationsTitle"),Context.§_-5o8§.message("targetMaxAssociateMessage"));
               break;
            case §_-8Ef§.§_-0Wz§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("maxRelationsTitle"),Context.§_-5o8§.message("targetMaxEnemyMessage"));
               break;
            case §_-8Ef§.§_-2MN§:
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("ringNotDefinedTitle"),Context.§_-5o8§.message("ringNotDefinedMessage"));
               break;
            case §_-8Ef§.§_-6Tn§:
               _loc4_ = param1.data.getString(§_-3mj§.§_-9GV§);
               _loc5_ = param1.data.getString(§_-7Mj§.§_-8Aa§);
               _loc6_ = param1.data.getInt(§_-7Mj§.§_-2K5§);
               _loc7_ = _loc6_ == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
               if(_loc4_ == Context.player.id)
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.gender("alreadyEngagedTitle",_loc3_),Context.§_-5o8§.gender("alreadyEngagedMessage",_loc3_));
               }
               else
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.gender("userAlreadyEngagedTitle",_loc7_,{"userName":_loc5_}),Context.§_-5o8§.gender("userAlreadyEngagedMessage",_loc7_,{"userName":_loc5_}));
               }
               break;
            case §_-8Ef§.§_-6pP§:
               _loc8_ = param1.data.getString(§_-3mj§.§_-9GV§);
               _loc9_ = param1.data.getString(§_-7Mj§.§_-8Aa§);
               _loc10_ = param1.data.getInt(§_-7Mj§.§_-2K5§);
               _loc11_ = _loc10_ == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§;
               if(_loc8_ == Context.player.id)
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.gender("alreadyMarriedTitle",_loc3_),Context.§_-5o8§.gender("alreadyMarriedMessage",_loc3_));
               }
               else
               {
                  §_-4OH§.§_-B5P§(Context.§_-5o8§.gender("userAlreadyMarriedTitle",_loc11_,{"userName":_loc9_}),Context.§_-5o8§.gender("userAlreadyMarriedMessage",_loc11_,{"userName":_loc9_}));
               }
         }
      }
      
      private function §_-0RH§(param1:§_-9ai§) : void
      {
         var event:§_-9ai§ = param1;
         var buddyId:String = event.data.getString(§_-8Ef§.§_-3b5§);
         Context.§_-3B2§.§_-CR9§(buddyId,function(param1:§_-5ab§):void
         {
            var _loc2_:String = param1.avatarAppearance.name;
            Context.§_-BlB§.§_-5eA§(Context.§_-5o8§.message("buddyOnlineTitle"),Context.§_-5o8§.message("buddyOnlineMessage",{"userName":_loc2_}));
         });
      }
      
      private function §_-6V5§(param1:§_-9ai§) : void
      {
      }
      
      public function §_-0kV§(param1:Function = null) : void
      {
         var _loc2_:String = Context.player.id;
         if(Boolean(this.§_-Bfx§.hasOwnProperty(_loc2_)) && param1 != null)
         {
            param1(this.§_-Bfx§[_loc2_]);
            return;
         }
         if(param1 != null)
         {
            this.§_-uo§[_loc2_] = param1;
         }
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         §_-6gl§.sendExtMessage(§_-7TA§.§_-3bP§,_loc3_);
      }
      
      public function §_-bG§(param1:int, param2:String = null) : Object
      {
         var _loc4_:String = null;
         if(param2 == null)
         {
            param2 = Context.player.id;
         }
         if(!this.§_-Bfx§.hasOwnProperty(param2))
         {
            return {};
         }
         var _loc3_:Object = {};
         for(_loc4_ in this.§_-Bfx§[param2])
         {
            if(Boolean(this.§_-Bfx§[param2].hasOwnProperty(_loc4_)) && (this.§_-Bfx§[param2][_loc4_] as Relation).status == param1)
            {
               _loc3_[_loc4_] = this.§_-Bfx§[param2][_loc4_];
            }
         }
         return _loc3_;
      }
      
      public function §_-0TO§(param1:String, param2:String, param3:int) : void
      {
         var userId:String = param1;
         var userName:String = param2;
         var status:int = param3;
         if(!this.§_-5iv§(status))
         {
            return;
         }
         if(status != §_-3Z3§.§_-AYt§)
         {
            this._createRelation(userId,status);
            return;
         }
         §_-02c§.instance.confirm(userId,userName,§_-9S8§.§_-AYt§,function(param1:Avatar, param2:Avatar):void
         {
            _createRelation(param2.userId,status,§_-9S8§.§_-AYt§);
         });
      }
      
      private function _createRelation(param1:String, param2:int, param3:String = null) : void
      {
         var _loc4_:§_-4Ww§ = new §_-4Ww§();
         _loc4_.put(§_-3mj§.§_-9GV§,param1);
         _loc4_.put(Relation.§_-4wt§,param2);
         _loc4_.putString(§_-58H§.§_-0BM§,param3);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-8-J§,_loc4_);
      }
      
      public function removeRelation(param1:String) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.put(§_-3mj§.§_-9GV§,param1);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-7Ty§,_loc2_);
      }
      
      public function §_-49E§(param1:String, param2:String, param3:int, param4:Object = null, param5:String = null) : void
      {
         if(!this.§_-5iv§(param3))
         {
            return;
         }
         var _loc6_:Relation = Context.§_-AI9§.§_-112§(Context.player.id,param1);
         var _loc7_:§_-4Ww§ = new §_-4Ww§();
         _loc7_.put(§_-3mj§.§_-9GV§,param1);
         _loc7_.put(Relation.§_-4wt§,param3);
         _loc7_.put(Relation.§_-CCC§,_loc6_ != null ? _loc6_.status : 0);
         _loc7_.putString(§_-58H§.§_-0BM§,param5);
         if(param4 != null)
         {
            _loc7_.put(Relation.§_-24l§,new §_-4Ww§(param4));
         }
         §_-6gl§.sendExtMessage(§_-7TA§.§_-2p9§,_loc7_);
      }
      
      public function §_-9d§(param1:String, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-3mj§.§_-9GV§,param1);
         _loc3_.put(§_-8Ef§.§_-2Mq§,param2);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-1RE§,_loc3_);
      }
      
      public function §_-2xe§(param1:String, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-3mj§.§_-9GV§,param1);
         _loc3_.put(Relation.§_-4wt§,param2);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-0wS§,_loc3_);
      }
      
      public function §_-Acb§(param1:String, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-3mj§.§_-9GV§,param1);
         _loc3_.put(§_-8Ef§.§_-2g9§,param2);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-BKd§,_loc3_);
      }
      
      public function §_-112§(param1:String, param2:String) : Relation
      {
         var _loc3_:Object = null;
         if(this.§_-Bfx§.hasOwnProperty(param1))
         {
            _loc3_ = this.§_-Bfx§[param1];
            return !!_loc3_.hasOwnProperty(param2) ? _loc3_[param2] : null;
         }
         return null;
      }
      
      private function §_-5iv§(param1:int) : Boolean
      {
         var _loc3_:Object = null;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Relation = null;
         var _loc2_:§_-5V3§ = this.§_-602§(param1);
         if(_loc2_ == null || _loc2_.id != §_-CSt§.§_-28E§ && _loc2_.id != §_-CSt§.§_-AYt§)
         {
            return true;
         }
         if(this.§_-Bfx§.hasOwnProperty(Context.player.id))
         {
            _loc3_ = this.§_-Bfx§[Context.player.id];
            _loc4_ = 0;
            _loc5_ = 0;
            for each(_loc6_ in _loc3_)
            {
               if(_loc2_.id == §_-CSt§.§_-AYt§ && _loc6_.statusGroupId == §_-CSt§.§_-AYt§)
               {
                  _loc4_++;
               }
               else if(_loc2_.id == §_-CSt§.§_-28E§ && _loc6_.statusGroupId == §_-CSt§.§_-28E§)
               {
                  _loc5_++;
               }
            }
            if(_loc4_ >= §_-3WR§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("maxRelationsTitle"),Context.§_-5o8§.message("maxAssociateMessage"));
               return false;
            }
            if(_loc5_ >= §_-8al§)
            {
               §_-4OH§.§_-B5P§(Context.§_-5o8§.message("maxRelationsTitle"),Context.§_-5o8§.message("maxEnemyMessage"));
               return false;
            }
         }
         return true;
      }
      
      private function §_-9jd§(param1:§_-9ai§) : void
      {
         var _loc2_:String = param1.data.getString(§_-3mj§.§_-9GV§);
         if(this.§_-AhU§ == null)
         {
            this.§_-AhU§ = new §_-0NE§(_loc2_,§_-6gl§);
         }
         this.§_-AhU§.start();
      }
      
      public function §_-0vK§(param1:§_-6r6§) : void
      {
         var _loc2_:§_-4Ww§ = null;
         this.§_-6vQ§();
         this.§_-AhU§ = new §_-0NE§(param1.userId,§_-6gl§);
         if(this.§_-AhU§.validate())
         {
            _loc2_ = new §_-4Ww§();
            _loc2_.put(§_-3mj§.§_-9GV§,param1.userId);
            §_-6gl§.sendExtMessage(§_-7TA§.§_-0hc§,_loc2_);
         }
         else
         {
            this.§_-6vQ§();
         }
      }
      
      public function §_-6vQ§() : void
      {
         if(this.§_-AhU§ != null)
         {
            this.§_-AhU§.destroy();
            this.§_-AhU§ = null;
         }
      }
      
      public function §_-7kJ§(param1:String, param2:String) : void
      {
         if(param2.length > this.§_-8Sl§)
         {
            param2 = param2.slice(0,this.§_-8Sl§ - 1);
         }
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-3mj§.§_-9GV§,param1);
         _loc3_.put(§_-8Ef§.§_-3Q4§,param2);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-DY§,_loc3_);
      }
      
      public function §_-0CG§() : void
      {
         var _loc3_:String = null;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc1_:§_-48g§ = Context.cityPlayer;
         if(_loc1_ == null || !_loc1_.loaded)
         {
            return;
         }
         var _loc2_:Object = this.§_-bG§(§_-3Z3§.§_-Yo§);
         for(_loc3_ in _loc2_)
         {
            if(_loc1_.cityInfo.§_-Mg§ != int(_loc3_))
            {
               this.§_-5kq§(int(_loc3_),0);
               return;
            }
         }
         _loc4_ = this.§_-5Q5§(§_-3Z3§.§_-23n§);
         for(_loc5_ in _loc4_)
         {
            if(_loc1_.cityInfo.§_-4-7§ != int(_loc5_))
            {
               this.§_-5kq§(0,int(_loc5_));
               return;
            }
         }
      }
      
      private function §_-5kq§(param1:int, param2:int) : void
      {
         var _loc3_:§_-4Ww§ = new §_-4Ww§();
         _loc3_.put(§_-8Ef§.§_-4kn§,param1);
         _loc3_.put(§_-8Ef§.§_-47X§,param2);
         §_-6gl§.sendExtMessage(§_-7TA§.§_-3Wo§,_loc3_);
      }
      
      public function §_-4iH§() : void
      {
         var _loc2_:§_-6xF§ = null;
         var _loc3_:Object = null;
         var _loc4_:String = null;
         var _loc5_:§_-48g§ = null;
         var _loc6_:int = 0;
         var _loc1_:§_-48g§ = Context.cityPlayer;
         if(_loc1_ == null)
         {
            return;
         }
         if(!Context.§_-CAt§.isActive)
         {
            return;
         }
         for each(_loc2_ in this.§_-7CD§)
         {
            _loc3_ = this.§_-1ur§(_loc2_.groupId);
            for(_loc4_ in _loc3_)
            {
               _loc5_ = Context.§_-3B2§.§_-07a§(_loc4_) as §_-48g§;
               if(!(_loc5_ == null || !Context.§_-9q-§.§_-62H§(_loc5_.userInfo.socialId)))
               {
                  _loc6_ = §_-8-S§.§_-9zq§() + _loc1_.timeDelta - _loc5_.cityInfo.§_-Bqy§;
                  if(_loc6_ > _loc2_.§_-3P8§ * §_-8-S§.§_-4PC§)
                  {
                     Context.§_-CAt§.§_-8VQ§(_loc2_.callId,_loc5_);
                  }
               }
            }
         }
      }
      
      public function get §_-4V7§() : Object
      {
         var _loc1_:String = Context.player.id;
         return !!this.§_-Bfx§.hasOwnProperty(_loc1_) ? this.§_-Bfx§[_loc1_] : {};
      }
      
      public function §_-1ur§(param1:String, param2:String = null) : Object
      {
         var _loc5_:String = null;
         if(param2 == null)
         {
            param2 = Context.player.id;
         }
         if(!this.§_-Bfx§.hasOwnProperty(param2))
         {
            return {};
         }
         var _loc3_:§_-5V3§ = this.getGroup(param1);
         if(_loc3_ == null)
         {
            return {};
         }
         var _loc4_:Object = {};
         for(_loc5_ in this.§_-Bfx§[param2])
         {
            if(Boolean(this.§_-Bfx§[param2].hasOwnProperty(_loc5_)) && _loc3_.§_-7TV§((this.§_-Bfx§[param2][_loc5_] as Relation).status))
            {
               _loc4_[_loc5_] = this.§_-Bfx§[param2][_loc5_];
            }
         }
         return _loc4_;
      }
      
      public function §_-5Q5§(param1:Array, param2:String = null) : Object
      {
         var _loc4_:String = null;
         if(param2 == null)
         {
            param2 = Context.player.id;
         }
         if(!this.§_-Bfx§.hasOwnProperty(param2))
         {
            return {};
         }
         var _loc3_:Object = {};
         for(_loc4_ in this.§_-Bfx§[param2])
         {
            if(Boolean(this.§_-Bfx§[param2].hasOwnProperty(_loc4_)) && param1.indexOf((this.§_-Bfx§[param2][_loc4_] as Relation).status) > 0)
            {
               _loc3_[_loc4_] = this.§_-Bfx§[param2][_loc4_];
            }
         }
         return _loc3_;
      }
      
      public function get §_-8Sl§() : int
      {
         return this.§_-1il§;
      }
   }
}

