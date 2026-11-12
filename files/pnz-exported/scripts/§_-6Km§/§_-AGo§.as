package §_-6Km§
{
   import §_-0Uz§.§_-m3§;
   import §_-0uA§.§_-3YE§;
   import §_-4eY§.§_-2CJ§;
   import §_-4eY§.§_-3k8§;
   import §_-4eY§.§_-4aG§;
   import §_-6-L§.§_-6aF§;
   import §_-7xl§.§_-5m-§;
   import §_-BfX§.§_-7uE§;
   import ags.§_-5x-§;
   
   public class §_-AGo§ extends §_-5m-§ implements §_-m3§
   {
      public static const §_-9o§:int = 3;
      
      public static const §_-3kS§:int = 1;
      
      public static const §_-24z§:int = 1;
      
      private var §_-7BB§:Object = {};
      
      private var _netManager:§_-7uE§ = null;
      
      public function §_-AGo§()
      {
         super();
         this._netManager = new §_-7uE§();
      }
      
      public function §_-Bk0§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-4aG§ = null;
         if(param1 == null)
         {
            §_-3YE§.error("quest not loaded");
            return;
         }
         for each(_loc2_ in param1.elements("quest"))
         {
            _loc3_ = new §_-4aG§();
            _loc3_.configure(_loc2_);
            this.§_-7BB§[_loc3_.questId] = _loc3_;
         }
      }
      
      public function §_-BXn§(param1:String) : §_-4aG§
      {
         return !!this.§_-7BB§.hasOwnProperty(param1) ? this.§_-7BB§[param1] : null;
      }
      
      public function §_-8m6§(param1:String, param2:int) : void
      {
         this._netManager.§_-8m6§(param1,param2);
      }
      
      public function §_-3BI§(param1:String) : void
      {
         this._netManager.§_-3BI§(param1);
      }
      
      public function §_-7oF§() : void
      {
         this._netManager.§_-7oF§();
      }
      
      public function §_-1rf§() : void
      {
         this._netManager.§_-9m1§();
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
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
      
      public function toString(param1:Array) : String
      {
         var _loc4_:§_-4aG§ = null;
         var _loc5_:§_-3k8§ = null;
         var _loc6_:Object = null;
         var _loc7_:int = 0;
         var _loc2_:* = "<table border=\"1\">";
         _loc2_ += "<tr><th>ID</th><th>Title</th><th>Tasks</th><th>MinLvl</th><th>NdQuest</th><th>C&D</th><th>E&E</th><th>Social</th><td>Queue</td></tr>";
         var _loc3_:Array = §_-6aF§.toArray(this.§_-7BB§).sortOn(["queue","minLevel"],Array.NUMERIC);
         for each(_loc4_ in _loc3_)
         {
            if(param1.indexOf(_loc4_.type) >= 0)
            {
               _loc2_ += "<tr><td>" + _loc4_.questId + "</td><td>" + _loc4_.localizedTitle + "</td><td>";
               for each(_loc5_ in _loc4_.tasks)
               {
                  _loc2_ += _loc5_.type + ",";
               }
               _loc2_ += "</td><td>" + _loc4_.rules.§_-0y5§ + "</td>";
               _loc2_ += "<td>" + _loc4_.rules.§_-23p§.join(",") + "</td>";
               _loc6_ = _loc4_.§_-6kk§();
               _loc7_ = int(§_-6aF§.toArray(_loc4_.tasks).length);
               _loc2_ += "<td>" + Math.round(_loc6_[§_-2CJ§.§_-A-I§] / _loc7_ * 100) / 100 + "</td>";
               _loc2_ += "<td>" + Math.round(_loc6_[§_-2CJ§.§_-4tF§] / _loc7_ * 100) / 100 + "</td>";
               _loc2_ += "<td>" + Math.round(_loc6_[§_-2CJ§.§_-8Y§] / _loc7_ * 100) / 100 + "</td>";
               _loc2_ += "<td>" + _loc4_.queue + "</td>";
               _loc2_ += "</tr>";
            }
         }
         return _loc2_ + "</table>";
      }
      
      public function §_-8-O§() : void
      {
         var _loc2_:§_-4aG§ = null;
         var _loc3_:String = null;
         var _loc4_:§_-4aG§ = null;
         var _loc1_:Array = §_-6aF§.toArray(this.§_-7BB§).sortOn("minLevel",Array.NUMERIC);
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.rules.§_-23p§.length > 0)
            {
               for each(_loc3_ in _loc2_.rules.§_-23p§)
               {
                  _loc4_ = this.§_-BXn§(_loc3_);
                  if(_loc4_ != null)
                  {
                     if(_loc4_.queue != _loc2_.queue)
                     {
                     }
                  }
               }
            }
         }
      }
   }
}

