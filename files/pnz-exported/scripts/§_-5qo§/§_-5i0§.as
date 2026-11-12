package §_-5qo§
{
   import §_-6MS§.§_-19W§;
   import §_-6MS§.§_-4D-§;
   import §_-CLv§.§_-3zt§;
   import §_-CLv§.§_-BDF§;
   import §_-CLv§.§_-C-X§;
   import flash.errors.IllegalOperationError;
   
   public class §_-5i0§
   {
      private static const SECONDS_IN_HOUR:Number = 60 * 60;
      
      private static const EXPIRE_HOUR_COUNT:String = "expireTime";
      
      private static const EXPIRE_AT_TIME_PARAM:String = "expireAt";
      
      private static const KEY:String = "key";
      
      private static const §_-58X§:String = "time";
      
      private static const TIME_DELTA_PARAM:String = "timeDelta";
      
      private static const TTL_HOURS:Number = 1;
      
      protected var §_-3zu§:Boolean;
      
      private var §_-1ik§:String;
      
      private var _userId:String;
      
      private var §_-8dC§:Object;
      
      protected var §_-sp§:§_-19W§;
      
      protected var §_-5Pt§:String = null;
      
      protected var §_-6hQ§:Number;
      
      public function §_-5i0§(param1:§_-BDF§, param2:Object)
      {
         super();
         §_-3zt§.§_-7cy§(param1,"descriptor");
         §_-3zt§.§_-7cy§(param2,"flashVars");
         this.§_-sp§ = new §_-19W§(param1.url);
         this.§_-1ik§ = param1.project;
         this._userId = param1.userId;
         this.§_-3zu§ = param1.active;
         this.§_-8dC§ = this.getParams(param2);
      }
      
      public static function §_-9zq§() : int
      {
         return Math.floor(new Date().getTime() / 1000);
      }
      
      protected function getParams(param1:Object) : Object
      {
         throw new IllegalOperationError("Must override in concrete class.");
      }
      
      public function auth(param1:Function, param2:Function = null) : void
      {
         var errorCallback:Function;
         var responseCallback:Function;
         var onResponse:Function = param1;
         var onError:Function = param2;
         if(this.§_-0mB§())
         {
            onResponse(this.§_-5Pt§);
            return;
         }
         errorCallback = onError == null ? null : function(param1:§_-4D-§):void
         {
            onError(new §_-C-X§(param1.message));
         };
         responseCallback = function(param1:Object):void
         {
            §_-5Pt§ = param1[KEY];
            if(EXPIRE_AT_TIME_PARAM in param1 && TIME_DELTA_PARAM in param1)
            {
               §_-6hQ§ = param1[EXPIRE_AT_TIME_PARAM] - param1[TIME_DELTA_PARAM];
            }
            else
            {
               §_-6hQ§ = (param1[EXPIRE_HOUR_COUNT] + TTL_HOURS) * SECONDS_IN_HOUR;
            }
            onResponse(§_-5Pt§);
         };
         this.§_-8dC§[§_-58X§] = §_-9zq§();
         this.§_-sp§.request("auth",[this.§_-1ik§,this._userId,this.§_-8dC§],responseCallback,errorCallback);
      }
      
      public function get active() : Boolean
      {
         return this.§_-3zu§;
      }
      
      public function get project() : String
      {
         return this.§_-1ik§;
      }
      
      public function get userId() : String
      {
         return this._userId;
      }
      
      public function get params() : Object
      {
         return this.§_-8dC§;
      }
      
      private function §_-0mB§() : Boolean
      {
         return this.§_-5Pt§ != null && this.§_-6hQ§ > §_-9zq§();
      }
      
      public function updateFlashVars(param1:Object) : void
      {
         this.§_-8dC§ = this.getParams(param1);
      }
   }
}

