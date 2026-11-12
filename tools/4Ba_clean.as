package §_-A2M§
{
   import flash.events.Event;
   import flash.events.EventDispatcher;
   import flash.utils.setTimeout;

   public class §_-4Ba§
   {
      public static const §_-7NA§:int = 0;

      public static const §_-3F5§:int = 1;

      public static const §_-Af7§:int = 2;

      public static const STATUS_ABORTED:int = 3;

      private var _status:int = 0;

      private var §_-BNu§:Array = [];

      private var §_-1R8§:Array = [];

      private var §_-AlI§:Array;

      public function §_-4Ba§()
      {
         super();
      }

      public static function resolve(... rest) : §_-4Ba§
      {
         var _loc2_:§_-4Ba§ = new §_-4Ba§();
         _loc2_.resolve.apply(_loc2_,rest);
         return _loc2_;
      }

      public static function reject(... rest) : §_-4Ba§
      {
         var _loc2_:§_-4Ba§ = new §_-4Ba§();
         _loc2_.reject.apply(_loc2_,rest);
         return _loc2_;
      }

      public static function all(param1:Array) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var doneCount:int = 0;
         var awaitTask:§_-4Ba§ = null;
         var tasks:Array = param1;
         if(tasks.length == 0)
         {
            return resolve();
         }
         task = new §_-4Ba§();
         doneCount = 0;
         for each(awaitTask in tasks)
         {
            awaitTask.then(function():void
            {
               ++doneCount;
               if(doneCount == tasks.length)
               {
                  task.resolve();
               }
            }).error(task.reject);
         }
         return task;
      }

      public static function sequence(param1:Array, param2:* = null, ... rest) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var checkNext:Function = null;
         var functions:Array = param1;
         var thisArg:* = param2;
         var args:Array = rest;
         task = new §_-4Ba§();
         checkNext = function(... rest):void
         {
            var _loc3_:* = undefined;
            var _loc4_:Function = null;
            var _loc5_:§_-4Ba§ = null;
            if(functions.length == 0 || task._status == STATUS_ABORTED)
            {
               if(task._status != STATUS_ABORTED)
               {
                  task.resolve.apply(task,rest);
               }
               return;
            }
            var _loc2_:* = functions.shift();
            if(_loc2_ is Function)
            {
               _loc4_ = _loc2_;
               _loc3_ = _loc4_.apply(thisArg,rest);
            }
            else
            {
               _loc3_ = _loc2_;
            }
            if(_loc3_ is §_-4Ba§)
            {
               _loc5_ = _loc3_ as §_-4Ba§;
               _loc5_.then(checkNext);
               _loc5_.error(task.reject);
            }
            else
            {
               checkNext.apply(thisArg,_loc3_);
            }
         };
         checkNext.apply(thisArg,args);
         return task;
      }

      public static function §_-2f6§(param1:EventDispatcher, param2:String) : §_-4Ba§
      {
         var result:§_-4Ba§ = null;
         var listener:Function = null;
         var dispatcher:EventDispatcher = param1;
         var evType:String = param2;
         result = new §_-4Ba§();
         listener = function(param1:Event):void
         {
            dispatcher.removeEventListener(evType,listener);
            result.resolve(param1);
         };
         dispatcher.addEventListener(evType,listener);
         return result;
      }

      public static function §_-5y4§(param1:int) : Function
      {
         var milsec:int = param1;
         return function():§_-4Ba§
         {
            var _loc1_:* = new §_-4Ba§();
            setTimeout(_loc1_.resolve,milsec);
            return _loc1_;
         };
      }

      public function then(param1:Function) : §_-4Ba§
      {
         if(this._status == STATUS_ABORTED)
         {
            return this;
         }
         this.§_-BNu§.push(param1);
         this.§_-75A§();
         return this;
      }

      public function error(param1:Function) : §_-4Ba§
      {
         if(this._status == STATUS_ABORTED)
         {
            return this;
         }
         this.§_-1R8§.push(param1);
         this.§_-75A§();
         return this;
      }

      public function resolve(... rest) : void
      {
         this.§_-AlI§ = rest;
         this._status = §_-3F5§;
         this.§_-4U4§();
      }

      public function reject(... rest) : void
      {
         this._status = §_-Af7§;
         this.§_-AlI§ = rest;
         this.§_-8R§();
      }

      public function §_-Akz§() : void
      {
         this._status = STATUS_ABORTED;
         this.§_-BNu§ = [];
         this.§_-1R8§ = [];
      }

      public function next(param1:§_-4Ba§) : void
      {
         var nextTask:§_-4Ba§ = param1;
         this.then(function():void
         {
            nextTask.resolve.apply(nextTask,arguments);
         }).error(function():void
         {
            nextTask.reject.apply(nextTask,arguments);
         });
      }

      public function get status() : int
      {
         return this._status;
      }

      private function §_-75A§() : void
      {
         if(this._status == §_-3F5§)
         {
            this.§_-4U4§();
         }
         else if(this._status == §_-Af7§)
         {
            this.§_-8R§();
         }
      }

      private function §_-4U4§() : void
      {
         var _loc1_:Function = null;
         if(this.§_-1R8§.length > 0)
         {
            this.§_-1R8§ = [];
         }
         while(this.§_-BNu§.length > 0)
         {
            _loc1_ = this.§_-BNu§.shift();
            _loc1_.apply(null,this.§_-AlI§);
         }
      }

      private function §_-8R§() : void
      {
         var _loc1_:Function = null;
         if(this.§_-BNu§.length > 0)
         {
            this.§_-BNu§ = [];
         }
         while(this.§_-1R8§.length > 0)
         {
            _loc1_ = this.§_-1R8§.shift();
            _loc1_.apply(null,this.§_-AlI§);
         }
      }
   }
}
