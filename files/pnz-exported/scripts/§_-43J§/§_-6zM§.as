package §_-43J§
{
   import §_-0Uz§.§_-m3§;
   import §_-0pH§.§_-3Jp§;
   import §_-0pH§.§_-9sy§;
   import §_-1uC§.§_-8DE§;
   import §_-4Vx§.§_-4gG§;
   import §_-7xl§.§_-5m-§;
   import §_-9HF§.§_-AVV§;
   import §_-GM§.Context;
   import ags.§_-5x-§;
   import penzville.Application;
   
   public class §_-6zM§ extends §_-5m-§ implements §_-m3§
   {
      private var _netManager:§_-AVV§ = new §_-AVV§();
      
      private var §_-Bdv§:Vector.<§_-3Jp§> = new Vector.<§_-3Jp§>();
      
      private var §_-0Sz§:Vector.<§_-3Jp§> = new Vector.<§_-3Jp§>();
      
      private var §_-5qi§:Vector.<§_-3Jp§> = new Vector.<§_-3Jp§>();
      
      private var §_-1nA§:Vector.<§_-3Jp§> = new Vector.<§_-3Jp§>();
      
      private var §_-AAY§:Object = {};
      
      public function §_-6zM§()
      {
         super();
      }
      
      public function init() : void
      {
         Application.instance.addEventListener(§_-4gG§.§_-9uH§,this.§_-4XW§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-3Jp§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("craftedItem"))
         {
            _loc3_ = new §_-3Jp§();
            _loc3_.configure(_loc2_);
            this.§_-2zX§(_loc3_);
         }
      }
      
      public function §_-6AC§(param1:String) : void
      {
         var _loc3_:§_-3Jp§ = null;
         var _loc4_:§_-3Jp§ = null;
         var _loc5_:§_-3Jp§ = null;
         var _loc6_:§_-3Jp§ = null;
         var _loc7_:§_-9sy§ = null;
         var _loc8_:§_-9sy§ = null;
         var _loc9_:§_-9sy§ = null;
         var _loc10_:§_-9sy§ = null;
         var _loc2_:§_-3Jp§ = null;
         for each(_loc3_ in this.§_-0Sz§)
         {
            if(_loc3_.isHoliday)
            {
               _loc7_ = _loc3_.getComponent(param1);
               if(_loc7_ != null && _loc7_.isEnough() && !this.§_-0kW§(_loc3_.itemId,param1))
               {
                  if(_loc2_ == null)
                  {
                     _loc2_ = _loc3_;
                  }
                  else if(_loc3_.§_-H5§() > _loc2_.§_-H5§())
                  {
                     _loc2_ = _loc3_;
                  }
               }
            }
         }
         for each(_loc4_ in this.§_-Bdv§)
         {
            _loc8_ = _loc4_.getComponent(param1);
            if(_loc8_ != null && _loc8_.isEnough() && !this.§_-0kW§(_loc4_.itemId,param1))
            {
               if(_loc2_ == null)
               {
                  _loc2_ = _loc4_;
               }
               else if(_loc4_.§_-H5§() > _loc2_.§_-H5§())
               {
                  _loc2_ = _loc4_;
               }
            }
         }
         for each(_loc5_ in this.§_-5qi§)
         {
            if(_loc5_.§_-9b8§)
            {
               _loc9_ = _loc5_.getComponent(param1);
               if(_loc9_ != null && _loc9_.isEnough() && !this.§_-0kW§(_loc5_.itemId,param1))
               {
                  if(_loc2_ == null)
                  {
                     _loc2_ = _loc5_;
                  }
                  else if(_loc5_.§_-H5§() > _loc2_.§_-H5§())
                  {
                     _loc2_ = _loc5_;
                  }
               }
            }
         }
         for each(_loc6_ in this.§_-1nA§)
         {
            if(_loc6_.§_-9BB§)
            {
               _loc10_ = _loc6_.getComponent(param1);
               if(_loc10_ != null && _loc10_.isEnough() && !this.§_-0kW§(_loc6_.itemId,param1))
               {
                  if(_loc2_ == null)
                  {
                     _loc2_ = _loc6_;
                  }
                  else if(_loc6_.§_-H5§() > _loc2_.§_-H5§())
                  {
                     _loc2_ = _loc6_;
                  }
               }
            }
         }
         if(_loc2_ != null && !_loc2_.§_-hU§)
         {
            Context.§_-BlB§.§_-CCK§(new §_-8DE§(_loc2_,param1));
            this.§_-Au1§(_loc2_.itemId,param1);
         }
      }
      
      public function §_-2zX§(param1:§_-3Jp§) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1.isHolidayItem)
         {
            this.§_-0Sz§.push(param1);
         }
         else if(param1.isProfessionItem)
         {
            this.§_-5qi§.push(param1);
         }
         else if(param1.§_-5nO§)
         {
            this.§_-1nA§.push(param1);
         }
         else if(param1.isCommonItem)
         {
            this.§_-Bdv§.push(param1);
         }
      }
      
      public function §_-3sJ§(param1:String) : §_-3Jp§
      {
         var _loc2_:§_-3Jp§ = null;
         var _loc3_:§_-3Jp§ = null;
         var _loc4_:§_-3Jp§ = null;
         var _loc5_:§_-3Jp§ = null;
         for each(_loc2_ in this.§_-Bdv§)
         {
            if(_loc2_.itemId == param1)
            {
               return _loc2_;
            }
         }
         for each(_loc3_ in this.§_-0Sz§)
         {
            if(_loc3_.itemId == param1)
            {
               return _loc3_;
            }
         }
         for each(_loc4_ in this.§_-5qi§)
         {
            if(_loc4_.itemId == param1)
            {
               return _loc4_;
            }
         }
         for each(_loc5_ in this.§_-1nA§)
         {
            if(_loc5_.itemId == param1)
            {
               return _loc5_;
            }
         }
         throw new Error("Unknown crafting item descriptor: " + param1);
      }
      
      public function §_-4tI§() : Vector.<§_-3Jp§>
      {
         var _loc2_:§_-3Jp§ = null;
         var _loc1_:Vector.<§_-3Jp§> = new Vector.<§_-3Jp§>();
         for each(_loc2_ in this.§_-0Sz§)
         {
            if(_loc2_.isHoliday)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function produceCraft(param1:String) : void
      {
         this._netManager.produceCraft(param1);
      }
      
      public function canCraftItem(param1:§_-3Jp§) : Boolean
      {
         if(param1.isHolidayItem && !param1.isHoliday)
         {
            return false;
         }
         if(param1.isProfessionItem && Context.cityPlayer.§_-tA§(param1.profession))
         {
            return Context.cityPlayer.professions.§_-2k3§(param1.profession).§_-0wN§ >= param1.professionLevel;
         }
         if(param1.isCraftLocked)
         {
            return false;
         }
         return true;
      }
      
      public function buyComponent(param1:String, param2:Array) : void
      {
         this._netManager.buyComponent(param1,param2);
      }
      
      public function §_-ArT§() : void
      {
         this.§_-AAY§ = {};
      }
      
      private function §_-4XW§(param1:§_-4gG§) : void
      {
         this.§_-6AC§(param1.item.typeId);
      }
      
      private function §_-Au1§(param1:String, param2:String) : void
      {
         if(!this.§_-AAY§.hasOwnProperty(param1))
         {
            this.§_-AAY§[param1] = [];
         }
         (this.§_-AAY§[param1] as Array).push(param2);
      }
      
      private function §_-0kW§(param1:String, param2:String) : Boolean
      {
         if(!this.§_-AAY§.hasOwnProperty(param1))
         {
            return false;
         }
         return (this.§_-AAY§[param1] as Array).indexOf(param2) != -1;
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         if(this._netManager != null)
         {
            this._netManager.netClient = param1;
         }
         else
         {
            this._netManager = new §_-AVV§();
            this._netManager.netClient = param1;
         }
      }
      
      public function get §_-19j§() : Vector.<§_-3Jp§>
      {
         return this.§_-0Sz§;
      }
      
      public function get §_-4PL§() : Vector.<§_-3Jp§>
      {
         return this.§_-Bdv§;
      }
      
      public function get §_-6Ou§() : Vector.<§_-3Jp§>
      {
         return this.§_-5qi§;
      }
      
      public function get §_-eQ§() : Vector.<§_-3Jp§>
      {
         return this.§_-1nA§;
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
         Application.instance.removeEventListener(§_-4gG§.§_-9uH§,this.§_-4XW§);
         super.destroy();
      }
   }
}

