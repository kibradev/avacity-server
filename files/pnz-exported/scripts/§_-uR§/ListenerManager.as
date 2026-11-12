package §_-uR§
{
   import §_-6-L§.§_-49j§;
   import §_-7xl§.§_-5m-§;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public class ListenerManager extends §_-5m-§
   {
      private static var §_-7RQ§:Dictionary = null;
      
      protected var _dispatcher:IEventDispatcher;
      
      protected var §_-CLk§:Array = [];
      
      protected var §_-CAe§:Boolean = false;
      
      public function ListenerManager(param1:IEventDispatcher)
      {
         super();
         this._dispatcher = param1;
      }
      
      public static function §_-5hG§(param1:IEventDispatcher) : ListenerManager
      {
         if(§_-7RQ§ == null)
         {
            §_-7RQ§ = new Dictionary(true);
         }
         if(§_-7RQ§[param1] == null)
         {
            §_-7RQ§[param1] = new ListenerManager(param1);
         }
         return §_-7RQ§[param1];
      }
      
      public function addEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         var _loc5_:EventListenerInfo = null;
         var _loc4_:EventListenerInfo = new EventListenerInfo(param1,param2,param3);
         for each(_loc5_ in this.§_-CLk§)
         {
            if(_loc4_.equals(_loc5_))
            {
               return;
            }
         }
         this.§_-CLk§.push(_loc4_);
      }
      
      public function removeEventListener(param1:String, param2:Function, param3:Boolean = false) : void
      {
         if(this.§_-CAe§)
         {
            return;
         }
         var _loc4_:EventListenerInfo = new EventListenerInfo(param1,param2,param3);
         var _loc5_:int = int(this.§_-CLk§.length - 1);
         while(_loc5_ >= 0)
         {
            if(EventListenerInfo(this.§_-CLk§[_loc5_]).equals(_loc4_))
            {
               this.§_-CLk§.splice(_loc5_,1);
            }
            _loc5_--;
         }
      }
      
      public function §_-3sy§(param1:String) : void
      {
         var _loc3_:EventListenerInfo = null;
         this.§_-CAe§ = true;
         var _loc2_:int = int(this.§_-CLk§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-CLk§[_loc2_];
            if(_loc3_.type == param1)
            {
               this._dispatcher.removeEventListener(_loc3_.type,_loc3_.listener,_loc3_.useCapture);
               this.§_-CLk§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         this.§_-CAe§ = false;
      }
      
      public function §_-6qf§(param1:Function) : void
      {
         var _loc3_:EventListenerInfo = null;
         this.§_-CAe§ = true;
         var _loc2_:int = int(this.§_-CLk§.length - 1);
         while(_loc2_ >= 0)
         {
            _loc3_ = this.§_-CLk§[_loc2_];
            if(_loc3_.listener == param1)
            {
               this._dispatcher.removeEventListener(_loc3_.type,_loc3_.listener,_loc3_.useCapture);
               this.§_-CLk§.splice(_loc2_,1);
            }
            _loc2_--;
         }
         this.§_-CAe§ = false;
      }
      
      public function removeEventListeners() : void
      {
         var _loc1_:EventListenerInfo = null;
         this.§_-CAe§ = true;
         while(this.§_-CLk§.length > 0)
         {
            _loc1_ = this.§_-CLk§.shift();
            this._dispatcher.removeEventListener(_loc1_.type,_loc1_.listener,_loc1_.useCapture);
         }
         this.§_-CAe§ = false;
      }
      
      public function §_-0Qz§(param1:String = null) : uint
      {
         if(param1 == null)
         {
            return this.§_-CLk§.length;
         }
         return §_-49j§.§_-8hA§(this.§_-CLk§,"type",param1).length;
      }
      
      override public function destroy() : void
      {
         this.removeEventListeners();
         delete §_-7RQ§[this._dispatcher];
         this._dispatcher = null;
         super.destroy();
      }
   }
}

class EventListenerInfo
{
   public var type:String;
   
   public var listener:Function;
   
   public var useCapture:Boolean;
   
   public function EventListenerInfo(param1:String, param2:Function, param3:Boolean)
   {
      super();
      this.type = param1;
      this.listener = param2;
      this.useCapture = param3;
   }
   
   public function equals(param1:EventListenerInfo) : Boolean
   {
      return this.type == param1.type && this.listener == param1.listener && this.useCapture == param1.useCapture;
   }
}
