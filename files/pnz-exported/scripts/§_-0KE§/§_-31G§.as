package §_-0KE§
{
   import §_-40e§.§_-1m0§;
   import §_-5E9§.getTimer;
   import §_-9VF§.§_-5ab§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import penzville.Application;
   
   public class §_-31G§
   {
      private var §_-2rc§:Number = 0;
      
      private var §_-A3m§:Number = 0;
      
      private var §_-6ho§:Number;
      
      private var §_-Az7§:Timer = null;
      
      private var §_-7gG§:Number = 0;
      
      private var _player:§_-5ab§ = null;
      
      public function §_-31G§()
      {
         super();
      }
      
      public function init(param1:§_-5ab§, param2:Number = 60500) : void
      {
         this.§_-2rc§ = param2;
         this.§_-6ho§ = getTimer();
         this._player = param1;
         var _loc3_:Number = this._player.timeDelta;
         this.§_-A3m§ = (this._player.energyModifiedDate - _loc3_) * 1000;
         var _loc4_:Number = Number(new Date().getTime());
         this.§_-7gG§ = _loc4_ - this.§_-A3m§;
         this.§_-6ho§ -= this.§_-7gG§;
         this.§_-3v8§();
         this.§_-9N6§();
      }
      
      public function get §_-ASI§() : int
      {
         return this.§_-7gG§;
      }
      
      public function get §_-xl§() : int
      {
         return this.§_-2rc§ - (new Date().getTime() - this.§_-A3m§);
      }
      
      public function §_-9N6§() : void
      {
         if(this.§_-Az7§ != null)
         {
            this.§_-Az7§.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this.§_-Az7§.stop();
            this.§_-Az7§ = null;
         }
         this.§_-Az7§ = new Timer(this.§_-2rc§);
         this.§_-Az7§.addEventListener(TimerEvent.TIMER,this.onTimer);
         this.§_-Az7§.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.§_-3v8§();
      }
      
      private function §_-3v8§() : void
      {
         var _loc1_:Number = getTimer();
         var _loc2_:Number = _loc1_ - this.§_-6ho§;
         this.§_-6ho§ = _loc1_;
         var _loc3_:int = Math.floor(_loc2_ / this.§_-2rc§);
         this.§_-7gG§ = _loc2_ % this.§_-2rc§;
         this.§_-6ho§ -= this.§_-7gG§;
         this.§_-A3m§ = new Date().getTime() - this._player.timeDelta;
         if(this._player.resources.energy >= this._player.getMaxEnergy())
         {
            return;
         }
         this._player.resources.energy += _loc3_;
         if(this._player.resources.energy > this._player.getMaxEnergy())
         {
            this._player.resources.energy = this._player.getMaxEnergy();
         }
         if(this._player.resources.energy < 0)
         {
            this._player.resources.energy = 0;
         }
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§,this._player));
      }
   }
}

