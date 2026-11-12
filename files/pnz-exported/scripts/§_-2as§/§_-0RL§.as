package §_-2as§
{
   import §_-0Uz§.§_-6v4§;
   import §_-2qd§.§_-9ai§;
   import §_-2qd§.§_-9tB§;
   import §_-BeZ§.§_-4Ww§;
   import ags.§_-5x-§;
   
   public class §_-0RL§ extends §_-6v4§
   {
      private var §_-BI6§:Object = {};
      
      private var _inited:Boolean = false;
      
      private var _deferredCalls:Array = [];
      
      public function §_-0RL§()
      {
         super();
         §_-1-t§(§_-0mh§.§_-3L1§,this.§_-2-w§);
      }
      
      public function §_-8sZ§(param1:String, param2:§_-3y6§) : void
      {
         if(this.§_-BI6§.hasOwnProperty(param1))
         {
            return;
         }
         this.§_-BI6§[param1] = param2;
      }
      
      public function §_-1xy§() : void
      {
         if(this._inited)
         {
            dispatchEvent(new §_-0N-§(§_-0N-§.§_-9FN§));
            return;
         }
         §_-6gl§.sendExtMessage(§_-0mh§.§_-2Gr§);
      }
      
      public function §_-AP9§() : void
      {
         §_-6gl§.sendExtMessage(§_-0mh§.§_-2Gr§);
      }
      
      public function loadDescriptors(param1:Array) : void
      {
         var params:§_-4Ww§;
         var keys:Array = param1;
         if(§_-6gl§ == null || !this._inited)
         {
            this._deferredCalls.push(function():void
            {
               loadDescriptors(keys);
            });
            return;
         }
         params = new §_-4Ww§();
         params.putString(§_-0mh§.§_-5NK§,keys.join(","));
         §_-6gl§.sendExtMessage(§_-0mh§.§_-2Tz§,params);
      }
      
      protected function §_-2-w§(param1:§_-9ai§) : void
      {
         var _loc2_:String = null;
         var _loc3_:Boolean = false;
         var _loc4_:§_-3y6§ = null;
         for each(_loc2_ in param1.data.keys)
         {
            if(_loc2_ != §_-0mh§.§_-BHc§)
            {
               if(!this.§_-BI6§.hasOwnProperty(_loc2_))
               {
                  throw new ArgumentError("Descriptor receiver for key " + _loc2_ + " not exists");
               }
               _loc4_ = this.§_-BI6§[_loc2_] as §_-3y6§;
               _loc4_.§_-Cbe§(_loc2_,param1.data.§_-Bc6§(_loc2_,_loc4_.§_-0s0§(_loc2_)));
            }
         }
         _loc3_ = param1.data.getBoolean(§_-0mh§.§_-BHc§);
         if(_loc3_)
         {
            this._inited = true;
            dispatchEvent(new §_-0N-§(§_-0N-§.§_-9FN§));
            this.§_-AH1§();
         }
         else
         {
            dispatchEvent(new §_-0N-§(§_-0N-§.§_-APY§));
         }
      }
      
      override public function set netClient(param1:§_-5x-§) : void
      {
         super.netClient = param1;
         if(§_-6gl§ != null)
         {
            if(!§_-6gl§.loggedIn)
            {
               §_-6gl§.addEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
            }
            else
            {
               this.§_-AH1§();
            }
         }
      }
      
      private function §_-AH1§() : void
      {
         var _loc2_:Function = null;
         if(!this._inited)
         {
            return;
         }
         var _loc1_:int = 0;
         while(_loc1_ < this._deferredCalls.length)
         {
            _loc2_ = this._deferredCalls[_loc1_];
            _loc2_();
            _loc1_++;
         }
         this._deferredCalls = [];
      }
      
      private function §_-3vM§(param1:§_-9tB§) : void
      {
         §_-6gl§.removeEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         (param1.currentTarget as §_-5x-§).removeEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         this.§_-AH1§();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-BI6§ = {};
         this._deferredCalls = [];
         this._inited = false;
         super.destroy();
      }
   }
}

