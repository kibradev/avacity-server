package §_-1iV§
{
   import §_-6-L§.§_-6aF§;
   import §_-6-L§.§_-7P8§;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.ErrorEvent;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   
   public class §_-1J2§ extends MovieClip
   {
      private static var §_-5qd§:§_-1J2§;
      
      private var §_-0sP§:Object = {};
      
      public function §_-1J2§()
      {
         super();
         §_-5qd§ = this;
         addEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
      }
      
      public static function get instance() : §_-1J2§
      {
         return §_-5qd§;
      }
      
      private function onAddedToStage(param1:Event) : void
      {
         removeEventListener(Event.ADDED_TO_STAGE,this.onAddedToStage);
         this.init();
      }
      
      private function init() : void
      {
         this.§_-Btv§();
         this.§_-4-B§();
         this.§_-7CW§();
         this.initApplication();
      }
      
      protected function §_-Btv§() : void
      {
         §_-BkM§.§_-0zv§(stage);
      }
      
      protected function §_-4-B§() : void
      {
         var _loc1_:Array = §_-7P8§.§_-C7c§();
         if(_loc1_[0] == 10 && _loc1_[1] >= 1 || _loc1_[0] > 10)
         {
            if(loaderInfo.hasOwnProperty("uncaughtErrorEvents"))
            {
               IEventDispatcher(loaderInfo["uncaughtErrorEvents"]).addEventListener("uncaughtError",this.§_-0dt§);
            }
         }
      }
      
      protected function §_-7CW§() : void
      {
         if(Boolean(root) && Boolean(root.loaderInfo))
         {
            this.§_-0sP§ = root.loaderInfo.parameters;
         }
      }
      
      protected function initApplication() : void
      {
      }
      
      protected function §_-0dt§(param1:Event) : void
      {
         var _loc2_:Error = null;
         var _loc3_:ErrorEvent = null;
         param1.preventDefault();
         if(param1.hasOwnProperty("error"))
         {
            if(param1["error"] is Error)
            {
               _loc2_ = param1["error"];
               this.handleUncaughtError("*Uncaught Error* ErrorId: " + _loc2_.errorID + " ErrorName: " + _loc2_.name + " ErrorMessage:" + _loc2_.message + " ErrorStackTrace:" + _loc2_.getStackTrace());
            }
            else if(param1["error"] is ErrorEvent)
            {
               _loc3_ = param1["error"];
               this.handleUncaughtError("*Uncaught ErrorEvent* " + _loc3_.text);
            }
         }
         else
         {
            this.handleUncaughtError("*Unparsable error* " + §_-6aF§.toString(param1));
         }
      }
      
      protected function handleUncaughtError(param1:String) : void
      {
      }
      
      public function get flashVars() : Object
      {
         return this.§_-0sP§;
      }
      
      public function set flashVars(param1:Object) : void
      {
         this.§_-0sP§ = param1;
      }
      
      public function §_-8to§(param1:String, param2:* = null) : *
      {
         return !!this.§_-0sP§.hasOwnProperty(param1) ? this.§_-0sP§[param1] : param2;
      }
      
      public function §_-Gv§() : §_-42y§
      {
         return §_-BkM§.§_-Gv§();
      }
      
      public function §_-2Cn§() : DisplayObjectContainer
      {
         return §_-BkM§.§_-n1§();
      }
   }
}

