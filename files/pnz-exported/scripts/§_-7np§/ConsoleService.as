package §_-7np§
{
   import §_-0uA§.§_-3YE§;
   import §_-1bk§.§_-C72§;
   import §_-6-L§.§_-7uH§;
   import §_-63P§.§_-5PR§;
   import §_-9VE§.§_-0wb§;
   import §_-9VE§.§_-9TS§;
   import §_-AOH§.§_-2gs§;
   import §_-AOH§.§_-3J5§;
   import §_-AOH§.§_-3Pj§;
   import §_-AOH§.§_-4xa§;
   import §_-AOH§.§_-6qY§;
   import §_-AOH§.§_-Can§;
   import §_-AOH§.§_-If§;
   import §_-AOH§.§_-kL§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Biv§.§_-0Ar§;
   import §_-Biv§.§_-0Jo§;
   import §_-Biv§.§_-0PC§;
   import §_-Biv§.§_-0VP§;
   import §_-Biv§.§_-3D0§;
   import §_-Biv§.§_-3iK§;
   import §_-Biv§.§_-437§;
   import §_-Biv§.§_-43x§;
   import §_-Biv§.§_-4Lf§;
   import §_-Biv§.§_-5xm§;
   import §_-Biv§.§_-6tx§;
   import §_-Biv§.§_-6ur§;
   import §_-Biv§.§_-6vK§;
   import §_-Biv§.§_-70L§;
   import §_-Biv§.§_-73z§;
   import §_-Biv§.§_-8-L§;
   import §_-Biv§.§_-8Gr§;
   import §_-Biv§.§_-9Ae§;
   import §_-Biv§.§_-ADa§;
   import §_-Biv§.§_-B9V§;
   import §_-Biv§.§_-QJ§;
   import §_-GM§.Context;
   import §_-ti§.§_-1RU§;
   import §_-ti§.§_-ACm§;
   import §_-ti§.§_-NM§;
   import ags.§_-5x-§;
   import flash.display.DisplayObjectContainer;
   import flash.display.Stage;
   import flash.events.EventDispatcher;
   import flash.events.KeyboardEvent;
   import flash.ui.Keyboard;
   
   public class ConsoleService extends EventDispatcher
   {
      private static var _instance:ConsoleService;
      
      private var §_-Brw§:§_-9TS§;
      
      private var §_-6Pt§:§_-0wb§;
      
      private var §_-5op§:§_-ACm§;
      
      private var §_-7iK§:§_-C72§;
      
      private var §_-3xN§:int = -1;
      
      private var _initialized:Boolean = false;
      
      private var §_-5xz§:DisplayObjectContainer = null;
      
      public function ConsoleService()
      {
         super();
         if(_instance)
         {
            throw new Error("Singleton violation");
         }
      }
      
      public static function get instance() : ConsoleService
      {
         if(!_instance)
         {
            _instance = new ConsoleService();
         }
         return _instance;
      }
      
      public function init(param1:DisplayObjectContainer) : void
      {
         if(this._initialized)
         {
            return;
         }
         this.§_-5xz§ = param1;
         this.§_-7iK§ = new §_-C72§();
         Context.§_-CLP§.§_-2ys§(this.§_-7iK§);
         this.§_-2qb§();
         this.§_-Brw§ = new §_-9TS§(this.§_-5op§);
         this.§_-6Pt§ = new §_-0wb§();
         if(!this.§_-6Pt§.parent)
         {
            this.§_-5xz§.addChild(this.§_-6Pt§);
         }
         this.§_-6Pt§.show();
         this.§_-0Oz§();
         this._initialized = true;
         this.log("Console tools initialized",§_-8rk§.INFO);
      }
      
      private function §_-0Oz§() : void
      {
         var _loc1_:Stage = this.§_-5xz§.stage;
         if(_loc1_)
         {
            _loc1_.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-aQ§);
         }
      }
      
      private function §_-aQ§(param1:KeyboardEvent) : void
      {
         if(param1.ctrlKey && param1.shiftKey && param1.altKey && param1.keyCode == Keyboard.C)
         {
            this.§_-7vt§();
         }
      }
      
      private function §_-7vt§() : void
      {
         if(this.§_-Brw§.visible)
         {
            this.§_-5b0§();
         }
         else
         {
            this.§_-4yf§();
         }
      }
      
      public function §_-4yf§() : void
      {
         if(!this.§_-Brw§.parent)
         {
            this.§_-5xz§.addChild(this.§_-Brw§);
         }
         this.§_-Brw§.show();
         this.§_-Brw§.§_-Bqo§();
         if(this.§_-6Pt§)
         {
            this.§_-6Pt§.hide();
         }
      }
      
      public function §_-5b0§() : void
      {
         this.§_-Brw§.hide();
         if(this.§_-6Pt§)
         {
            this.§_-6Pt§.show();
         }
      }
      
      public function §_-7F7§(param1:String) : void
      {
         var parts:Array;
         var commandName:String;
         var command:§_-1RU§;
         var params:Object;
         var result:§_-NM§ = null;
         var commandText:String = param1;
         this.log("> " + commandText,§_-8rk§.COMMAND);
         parts = §_-5PR§.split(commandText," ",2);
         commandName = parts[0];
         command = this.§_-5op§.§_-8yl§(commandName);
         if(!command)
         {
            this.log("Unknown command: " + commandName,§_-8rk§.ERROR);
            return;
         }
         if(command.§_-7Of§ > this.§_-3xN§)
         {
            this.log("Access denied",§_-8rk§.ERROR);
            return;
         }
         params = parts.length > 1 ? this.§_-5-M§(parts[1]) : {};
         try
         {
            result = command.execute(params);
            this.§_-0A6§(result);
         }
         catch(e:Error)
         {
            log("Command execution error: " + e.message,§_-8rk§.ERROR);
         }
      }
      
      public function §_-0A6§(param1:§_-NM§) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(!param1.success)
         {
            this.log(param1.message,§_-8rk§.WARNING);
         }
         else if(param1.message)
         {
            this.log(param1.message,§_-8rk§.COMMAND);
         }
      }
      
      private function §_-5-M§(param1:String) : Object
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc2_:Object = {};
         if(!param1 || param1.length == 0)
         {
            return _loc2_;
         }
         var _loc3_:Array = param1.split(" -");
         for each(_loc4_ in _loc3_)
         {
            if(§_-7uH§.§_-AIf§(_loc4_).length != 0)
            {
               _loc5_ = §_-5PR§.split(§_-7uH§.§_-AIf§(_loc4_)," ",2);
               if(_loc5_.length != 0)
               {
                  _loc6_ = _loc5_[0].replace(/^-/g,"");
                  if(_loc5_.length > 1)
                  {
                     _loc7_ = _loc5_[1];
                     _loc2_[_loc6_] = this.§_-CWq§(_loc7_);
                  }
                  else
                  {
                     _loc2_[_loc6_] = true;
                  }
               }
            }
         }
         return _loc2_;
      }
      
      private function §_-CWq§(param1:String) : String
      {
         if(param1.length >= 2 && (param1.charAt(0) == "\"" && param1.charAt(param1.length - 1) == "\"" || param1.charAt(0) == "\'" && param1.charAt(param1.length - 1) == "\'"))
         {
            return param1.substring(1,param1.length - 1);
         }
         return param1;
      }
      
      public function log(param1:String, param2:int = 0) : void
      {
         switch(param2)
         {
            case §_-8rk§.INFO:
               §_-3YE§.info(param1,"Console");
               break;
            case §_-8rk§.WARNING:
               §_-3YE§.§_-7aK§(param1,"Console");
               break;
            case §_-8rk§.ERROR:
               §_-3YE§.error(param1,"Console");
               break;
            case §_-8rk§.CRITICAL:
               §_-3YE§.§_-ANW§(param1,"Console");
               break;
            case §_-8rk§.COMMAND:
               this.§_-Brw§.§_-2FD§(param1);
         }
      }
      
      private function §_-2qb§() : void
      {
         if(this.§_-5op§ != null)
         {
            return;
         }
         this.§_-5op§ = new §_-ACm§();
         this.§_-5op§.§_-7di§(new §_-3J5§());
         this.§_-5op§.§_-7di§(new §_-kL§(this.§_-5op§));
         this.§_-5op§.§_-7di§(new §_-6qY§());
         this.§_-5op§.§_-7di§(new §_-If§());
         this.§_-5op§.§_-7di§(new §_-2gs§());
         this.§_-5op§.§_-7di§(new §_-4xa§());
         this.§_-5op§.§_-7di§(new §_-Can§());
         this.§_-5op§.§_-7di§(new §_-3Pj§());
         this.§_-5op§.§_-7di§(new §_-QJ§());
         this.§_-5op§.§_-7di§(new §_-0Jo§());
         this.§_-5op§.§_-7di§(new §_-43x§());
         this.§_-5op§.§_-7di§(new §_-3D0§());
         this.§_-5op§.§_-7di§(new §_-70L§());
         this.§_-5op§.§_-7di§(new §_-9Ae§());
         this.§_-5op§.§_-7di§(new §_-0VP§());
         this.§_-5op§.§_-7di§(new §_-B9V§());
         this.§_-5op§.§_-7di§(new §_-6vK§());
         this.§_-5op§.§_-7di§(new §_-8Gr§());
         this.§_-5op§.§_-7di§(new §_-0PC§());
         this.§_-5op§.§_-7di§(new §_-5xm§());
         this.§_-5op§.§_-7di§(new §_-437§());
         this.§_-5op§.§_-7di§(new §_-8-L§());
         this.§_-5op§.§_-7di§(new §_-6tx§());
         this.§_-5op§.§_-7di§(new §_-ADa§());
         this.§_-5op§.§_-7di§(new §_-4Lf§());
         this.§_-5op§.§_-7di§(new §_-73z§());
         this.§_-5op§.§_-7di§(new §_-0Ar§());
         this.§_-5op§.§_-7di§(new §_-6ur§());
      }
      
      public function §_-8tC§(param1:String, param2:§_-NM§) : void
      {
         var _loc5_:§_-1RU§ = null;
         var _loc3_:Boolean = param2.success;
         var _loc4_:String = param2.message || "";
         if(_loc3_)
         {
            this.log("Server command completed: " + param1,§_-8rk§.INFO);
            if(_loc4_)
            {
               this.log(_loc4_,§_-8rk§.COMMAND);
            }
            if(param2.data != null)
            {
               _loc5_ = this.§_-5op§.§_-8yl§(param1);
               if(_loc5_ is §_-3iK§)
               {
                  (_loc5_ as §_-3iK§).handleServerData(param2.data);
               }
            }
         }
         else
         {
            this.log("Server command execution error: " + param1,§_-8rk§.ERROR);
            if(_loc4_)
            {
               this.log(_loc4_,§_-8rk§.ERROR);
            }
         }
      }
      
      public function §_-2oV§(param1:int) : void
      {
         this.§_-3xN§ = param1;
         this.log("Console access level updated: " + this.§_-3xN§,§_-8rk§.COMMAND);
      }
      
      public function get §_-76V§() : int
      {
         return this.§_-3xN§;
      }
      
      public function get console() : §_-9TS§
      {
         return this.§_-Brw§;
      }
      
      public function get §_-9Up§() : §_-0wb§
      {
         return this.§_-6Pt§;
      }
      
      public function get netClient() : §_-5x-§
      {
         return this.§_-7iK§.netClient;
      }
      
      public function get §_-BoJ§() : §_-ACm§
      {
         if(this.§_-5op§ == null)
         {
            this.§_-2qb§();
         }
         return this.§_-5op§;
      }
      
      public function §_-6M§(param1:String, param2:§_-4Ww§) : void
      {
         this.§_-7iK§.§_-6M§(param1,param2);
      }
   }
}

