package §_-Bm4§
{
   import §_-18o§.§_-8-S§;
   import §_-40e§.§_-1m0§;
   import §_-52p§.§_-9d9§;
   import §_-9VF§.§_-5ab§;
   import flash.events.TimerEvent;
   import flash.utils.Timer;
   import penzville.Application;
   
   public class §_-C5l§
   {
      public static const §_-4BF§:int = 241;
      
      public static const §_-8gI§:int = 100;
      
      public static const §_-32u§:int = 20;
      
      private var §_-BFK§:Number = 0;
      
      private var §_-A05§:Number = 0;
      
      private var §_-6ho§:Number;
      
      private var _timer:Timer = null;
      
      private var §_-Bw5§:Number = 0;
      
      private var _player:§_-5ab§ = null;
      
      private var §_-BVS§:Number = 0;
      
      public function §_-C5l§()
      {
         super();
      }
      
      public function init(param1:§_-5ab§, param2:Number = 241) : void
      {
         this.§_-BFK§ = param2;
         this.§_-6ho§ = §_-8-S§.§_-9zq§();
         this._player = param1;
         this.§_-BVS§ = this._player.timeDelta;
         this.§_-A05§ = this._player.resources.§_-3dC§ - this.§_-BVS§;
         var _loc3_:Number = §_-8-S§.§_-9zq§();
         this.§_-Bw5§ = _loc3_ - this.§_-A05§;
         this.§_-6ho§ -= this.§_-Bw5§;
         this.§_-79g§();
         this.§_-379§();
      }
      
      public function updateResources(param1:§_-9d9§) : void
      {
         var _loc2_:Number = param1.§_-3dC§ - this.§_-BVS§;
         if(this.§_-A05§ == _loc2_)
         {
            return;
         }
         this.§_-A05§ = _loc2_;
         var _loc3_:Number = §_-8-S§.§_-9zq§();
         this.§_-Bw5§ = _loc3_ - this.§_-A05§;
         this.§_-6ho§ = this.§_-A05§;
         this.§_-379§();
      }
      
      public function §_-379§() : void
      {
         if(this._timer != null)
         {
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer.stop();
            this._timer = null;
         }
         this._timer = new Timer(this.§_-BFK§ * 1000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.§_-79g§();
      }
      
      private function §_-79g§() : void
      {
         var _loc1_:int = §_-8-S§.§_-9zq§();
         var _loc2_:int = _loc1_ - this.§_-6ho§;
         this.§_-6ho§ = _loc1_;
         var _loc3_:int = Math.floor(_loc2_ / this.§_-BFK§);
         this.§_-Bw5§ = _loc2_ % this.§_-BFK§;
         this.§_-6ho§ -= this.§_-Bw5§;
         this.§_-A05§ = §_-8-S§.§_-9zq§() - this._player.timeDelta;
         if(this._player.resources.vitality >= §_-8gI§)
         {
            return;
         }
         this._player.resources.vitality += _loc3_;
         if(this._player.resources.vitality > §_-8gI§)
         {
            this._player.resources.vitality = §_-8gI§;
         }
         if(this._player.resources.vitality < 0)
         {
            this._player.resources.vitality = 0;
         }
         Application.instance.dispatchEvent(new §_-1m0§(§_-1m0§.§_-2dd§,this._player));
      }
   }
}

