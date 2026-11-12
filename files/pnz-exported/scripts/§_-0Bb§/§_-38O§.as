package §_-0Bb§
{
   import §_-6R5§.§_-0vr§;
   import flash.events.EventDispatcher;
   import flash.utils.getTimer;
   
   public class §_-38O§ extends EventDispatcher
   {
      private static var _instance:§_-38O§;
      
      private static const §_-0y7§:int = 20000;
      
      private static const §_-56D§:int = 1000;
      
      private var §_-0hV§:Boolean = true;
      
      private var §_-AQf§:Number;
      
      private var §_-9Ss§:int;
      
      public function §_-38O§()
      {
         super();
         var _loc1_:Date = new Date();
         var _loc2_:int = getTimer();
         this.§_-AQf§ = _loc1_.getTime() - _loc2_;
         this.§_-9Ss§ = _loc2_;
      }
      
      public static function get instance() : §_-38O§
      {
         if(_instance == null)
         {
            _instance = new §_-38O§();
         }
         return _instance;
      }
      
      public function §_-5tt§() : int
      {
         if(!this.§_-0hV§)
         {
            return this.§_-JC§();
         }
         var _loc1_:int = getTimer();
         if(_loc1_ - this.§_-9Ss§ > §_-0y7§)
         {
            this.§_-Bv5§();
         }
         return _loc1_;
      }
      
      private function §_-Bv5§() : void
      {
         var _loc1_:int = getTimer();
         var _loc2_:int = this.§_-JC§();
         this.§_-9Ss§ = _loc1_;
         var _loc3_:int = Math.abs(_loc1_ - _loc2_);
         if(_loc3_ > §_-56D§)
         {
            this.§_-0hV§ = false;
            dispatchEvent(new §_-0vr§(§_-0vr§.§_-1HL§));
         }
      }
      
      public function §_-JC§() : int
      {
         var _loc1_:Date = new Date();
         return _loc1_.getTime() - this.§_-AQf§;
      }
   }
}

