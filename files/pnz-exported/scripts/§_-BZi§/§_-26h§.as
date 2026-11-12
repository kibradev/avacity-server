package §_-BZi§
{
   import §_-6-L§.§_-49j§;
   import §_-uR§.§_-53f§;
   
   public class §_-26h§ extends §_-53f§
   {
      private var §_-8f6§:Array = [];
      
      private var §_-34B§:Boolean = false;
      
      private var §_-b4§:Number = 1;
      
      public function §_-26h§()
      {
         super();
      }
      
      public function play(param1:§_-5mH§, param2:Boolean = false) : void
      {
         this.§_-8f6§.push(param1);
         param1.volume = this.§_-b4§;
         if(!param2)
         {
            param1.play(this.onComplete);
         }
         else
         {
            param1.loop(this.onComplete);
         }
         if(this.§_-34B§)
         {
            param1.§_-S4§();
         }
      }
      
      public function loop(param1:§_-5mH§) : void
      {
         this.play(param1,true);
      }
      
      public function stop(param1:§_-5mH§) : void
      {
         param1.stop();
      }
      
      public function §_-2j2§() : void
      {
         var _loc1_:§_-5mH§ = null;
         for each(_loc1_ in this.§_-8f6§)
         {
            _loc1_.stop();
         }
         this.§_-8f6§ = [];
      }
      
      public function §_-S4§() : void
      {
         var _loc1_:§_-5mH§ = null;
         this.§_-34B§ = true;
         for each(_loc1_ in this.§_-8f6§)
         {
            _loc1_.§_-S4§();
         }
      }
      
      public function §_-4oy§() : void
      {
         var _loc1_:§_-5mH§ = null;
         this.§_-34B§ = false;
         for each(_loc1_ in this.§_-8f6§)
         {
            _loc1_.§_-4oy§();
         }
      }
      
      public function get volume() : Number
      {
         return this.§_-b4§;
      }
      
      public function set volume(param1:Number) : void
      {
         var _loc2_:§_-5mH§ = null;
         this.§_-b4§ = param1;
         for each(_loc2_ in this.§_-8f6§)
         {
            _loc2_.volume = param1;
         }
      }
      
      private function onComplete(param1:§_-5mH§) : void
      {
         §_-49j§.remove(this.§_-8f6§,param1);
         dispatchEvent(new §_-7O9§(§_-7O9§.SOUND_COMPLETE,param1));
         param1.destroy();
      }
   }
}

