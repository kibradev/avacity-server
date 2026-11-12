package com.greensock.core
{
   import flash.display.Shape;
   import flash.events.Event;
   import flash.utils.getTimer;
   
   public class Animation
   {
      public static var §_-972§:SimpleTimeline;
      
      public static var §_-8CF§:SimpleTimeline;
      
      public static const version:String = "12.1.1";
      
      public static var ticker:Shape = new Shape();
      
      protected static var §_-A9h§:Number = -1;
      
      protected static var §_-Cav§:Event = new Event("tick");
      
      protected static var §_-COs§:Number = 1e-10;
      
      protected var §_-9tb§:Function;
      
      public var _delay:Number;
      
      public var §_-6l6§:Number;
      
      public var §_-3zu§:Boolean;
      
      public var _gc:Boolean;
      
      public var §_-2ME§:Boolean;
      
      public var _startTime:Number;
      
      public var _time:Number;
      
      public var §_-46q§:Number;
      
      public var _duration:Number;
      
      public var §_-B1p§:Number;
      
      public var _pauseTime:Number;
      
      public var _timeScale:Number;
      
      public var §_-AyR§:Boolean;
      
      public var _timeline:SimpleTimeline;
      
      public var §_-6ze§:Boolean;
      
      public var _paused:Boolean;
      
      public var _next:Animation;
      
      public var _prev:Animation;
      
      public var vars:Object;
      
      public var timeline:SimpleTimeline;
      
      public var data:*;
      
      public function Animation(param1:Number = 0, param2:Object = null)
      {
         super();
         this.vars = param2 || {};
         if(this.vars._isGSVars)
         {
            this.vars = this.vars.vars;
         }
         this._duration = this.§_-B1p§ = param1 || 0;
         this._delay = Number(this.vars.delay) || 0;
         this._timeScale = 1;
         this.§_-46q§ = this._time = 0;
         this.data = this.vars.data;
         this.§_-6l6§ = -1;
         if(§_-972§ == null)
         {
            if(§_-A9h§ != -1)
            {
               return;
            }
            §_-A9h§ = 0;
            §_-8CF§ = new SimpleTimeline();
            §_-972§ = new SimpleTimeline();
            §_-972§._startTime = getTimer() / 1000;
            §_-8CF§._startTime = 0;
            §_-972§.§_-3zu§ = §_-8CF§.§_-3zu§ = true;
            ticker.addEventListener("enterFrame",§_-3W2§,false,0,true);
         }
         var _loc3_:SimpleTimeline = !!this.vars.useFrames ? §_-8CF§ : §_-972§;
         _loc3_.add(this,_loc3_._time);
         this.§_-AyR§ = this.vars.reversed == true;
         if(this.vars.paused)
         {
            this.paused(true);
         }
      }
      
      public static function §_-3W2§(param1:Event = null) : void
      {
         ++§_-A9h§;
         §_-972§.render((getTimer() / 1000 - §_-972§._startTime) * §_-972§._timeScale,false,false);
         §_-8CF§.render((§_-A9h§ - §_-8CF§._startTime) * §_-8CF§._timeScale,false,false);
         ticker.dispatchEvent(§_-Cav§);
      }
      
      public function play(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1,param2);
         }
         this.reversed(false);
         return this.paused(false);
      }
      
      public function §_-2rW§(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1,param2);
         }
         return this.paused(true);
      }
      
      public function §_-4ci§(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1,param2);
         }
         return this.paused(false);
      }
      
      public function seek(param1:*, param2:Boolean = true) : *
      {
         return this.totalTime(Number(param1),param2);
      }
      
      public function restart(param1:Boolean = false, param2:Boolean = true) : *
      {
         this.reversed(false);
         this.paused(false);
         return this.totalTime(param1 ? -this._delay : 0,param2,true);
      }
      
      public function reverse(param1:* = null, param2:Boolean = true) : *
      {
         if(param1 != null)
         {
            this.seek(param1 || this.totalDuration(),param2);
         }
         this.reversed(true);
         return this.paused(false);
      }
      
      public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
      }
      
      public function invalidate() : *
      {
         return this;
      }
      
      public function isActive() : Boolean
      {
         var _loc2_:Number = NaN;
         var _loc1_:SimpleTimeline = this._timeline;
         return _loc1_ == null || !this._gc && !this._paused && _loc1_.isActive() && (_loc2_ = _loc1_.rawTime()) >= this._startTime && _loc2_ < this._startTime + this.totalDuration() / this._timeScale;
      }
      
      public function _enabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         this._gc = !param1;
         this.§_-3zu§ = Boolean(param1 && !this._paused && this.§_-46q§ > 0 && this.§_-46q§ < this.§_-B1p§);
         if(!param2)
         {
            if(param1 && this.timeline == null)
            {
               this._timeline.add(this,this._startTime - this._delay);
            }
            else if(!param1 && this.timeline != null)
            {
               this._timeline._remove(this,true);
            }
         }
         return false;
      }
      
      public function _kill(param1:Object = null, param2:Object = null) : Boolean
      {
         return this._enabled(false,false);
      }
      
      public function §_-6Vr§(param1:Object = null, param2:Object = null) : *
      {
         this._kill(param1,param2);
         return this;
      }
      
      protected function §_-7Ri§(param1:Boolean) : *
      {
         var _loc2_:Animation = param1 ? this : this.timeline;
         while(_loc2_)
         {
            _loc2_.§_-6ze§ = true;
            _loc2_ = _loc2_.timeline;
         }
         return this;
      }
      
      protected function §_-2K3§(param1:Array) : Array
      {
         var _loc2_:int = int(param1.length);
         var _loc3_:Array = param1.concat();
         while(--_loc2_ > -1)
         {
            if(param1[_loc2_] === "{self}")
            {
               _loc3_[_loc2_] = this;
            }
         }
         return _loc3_;
      }
      
      public function §_-2M0§(param1:String, param2:Function = null, param3:Array = null) : *
      {
         if(param1 == null)
         {
            return null;
         }
         if(param1.substr(0,2) == "on")
         {
            if(arguments.length == 1)
            {
               return this.vars[param1];
            }
            if(param2 == null)
            {
               delete this.vars[param1];
            }
            else
            {
               this.vars[param1] = param2;
               this.vars[param1 + "Params"] = param3 is Array && param3.join("").indexOf("{self}") !== -1 ? this.§_-2K3§(param3) : param3;
            }
            if(param1 == "onUpdate")
            {
               this.§_-9tb§ = param2;
            }
         }
         return this;
      }
      
      public function delay(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            return this._delay;
         }
         if(this._timeline.§_-B3B§)
         {
            this.startTime(this._startTime + param1 - this._delay);
         }
         this._delay = param1;
         return this;
      }
      
      public function duration(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            this.§_-6ze§ = false;
            return this._duration;
         }
         this._duration = this.§_-B1p§ = param1;
         this.§_-7Ri§(true);
         if(this._timeline.§_-B3B§)
         {
            if(this._time > 0)
            {
               if(this._time < this._duration)
               {
                  if(param1 != 0)
                  {
                     this.totalTime(this.§_-46q§ * (param1 / this._duration),true);
                  }
               }
            }
         }
         return this;
      }
      
      public function totalDuration(param1:Number = NaN) : *
      {
         this.§_-6ze§ = false;
         return !arguments.length ? this.§_-B1p§ : this.duration(param1);
      }
      
      public function time(param1:Number = NaN, param2:Boolean = false) : *
      {
         if(!arguments.length)
         {
            return this._time;
         }
         if(this.§_-6ze§)
         {
            this.totalDuration();
         }
         if(param1 > this._duration)
         {
            param1 = this._duration;
         }
         return this.totalTime(param1,param2);
      }
      
      public function totalTime(param1:Number = NaN, param2:Boolean = false, param3:Boolean = false) : *
      {
         var _loc5_:SimpleTimeline = null;
         if(!arguments.length)
         {
            return this.§_-46q§;
         }
         if(this._timeline)
         {
            if(param1 < 0 && !param3)
            {
               param1 += this.totalDuration();
            }
            if(this._timeline.§_-B3B§)
            {
               if(this.§_-6ze§)
               {
                  this.totalDuration();
               }
               if(param1 > this.§_-B1p§ && !param3)
               {
                  param1 = this.§_-B1p§;
               }
               _loc5_ = this._timeline;
               this._startTime = (this._paused ? this._pauseTime : _loc5_._time) - (!this.§_-AyR§ ? param1 : this.§_-B1p§ - param1) / this._timeScale;
               if(!this._timeline.§_-6ze§)
               {
                  this.§_-7Ri§(false);
               }
               if(_loc5_._timeline != null)
               {
                  while(_loc5_._timeline)
                  {
                     if(_loc5_._timeline._time !== (_loc5_._startTime + _loc5_.§_-46q§) / _loc5_._timeScale)
                     {
                        _loc5_.totalTime(_loc5_.§_-46q§,true);
                     }
                     _loc5_ = _loc5_._timeline;
                  }
               }
            }
            if(this._gc)
            {
               this._enabled(true,false);
            }
            if(this.§_-46q§ != param1 || this._duration === 0)
            {
               this.render(param1,param2,false);
            }
         }
         return this;
      }
      
      public function progress(param1:Number = NaN, param2:Boolean = false) : *
      {
         return !arguments.length ? this._time / this.duration() : this.totalTime(this.duration() * param1,param2);
      }
      
      public function totalProgress(param1:Number = NaN, param2:Boolean = false) : *
      {
         return !arguments.length ? this._time / this.duration() : this.totalTime(this.duration() * param1,param2);
      }
      
      public function startTime(param1:Number = NaN) : *
      {
         if(!arguments.length)
         {
            return this._startTime;
         }
         if(param1 != this._startTime)
         {
            this._startTime = param1;
            if(this.timeline)
            {
               if(this.timeline.§_-1PV§)
               {
                  this.timeline.add(this,param1 - this._delay);
               }
            }
         }
         return this;
      }
      
      public function §_-3W1§(param1:Number = NaN) : *
      {
         var _loc3_:Number = NaN;
         if(!arguments.length)
         {
            return this._timeScale;
         }
         param1 ||= 0.000001;
         if(Boolean(this._timeline) && this._timeline.§_-B3B§)
         {
            _loc3_ = Boolean(this._pauseTime) || this._pauseTime == 0 ? this._pauseTime : this._timeline.§_-46q§;
            this._startTime = _loc3_ - (_loc3_ - this._startTime) * this._timeScale / param1;
         }
         this._timeScale = param1;
         return this.§_-7Ri§(false);
      }
      
      public function reversed(param1:Boolean = false) : *
      {
         if(!arguments.length)
         {
            return this.§_-AyR§;
         }
         if(param1 != this.§_-AyR§)
         {
            this.§_-AyR§ = param1;
            this.totalTime(Boolean(this._timeline) && !this._timeline.§_-B3B§ ? this.totalDuration() - this.§_-46q§ : this.§_-46q§,true);
         }
         return this;
      }
      
      public function paused(param1:Boolean = false) : *
      {
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(!arguments.length)
         {
            return this._paused;
         }
         if(param1 != this._paused)
         {
            if(this._timeline)
            {
               _loc3_ = this._timeline.rawTime();
               _loc4_ = _loc3_ - this._pauseTime;
               if(!param1 && this._timeline.§_-B3B§)
               {
                  this._startTime += _loc4_;
                  this.§_-7Ri§(false);
               }
               this._pauseTime = param1 ? _loc3_ : NaN;
               this._paused = param1;
               this.§_-3zu§ = !param1 && this.§_-46q§ > 0 && this.§_-46q§ < this.§_-B1p§;
               if(!param1 && _loc4_ != 0 && this.§_-2ME§ && this.duration() !== 0)
               {
                  this.render(this._timeline.§_-B3B§ ? this.§_-46q§ : (_loc3_ - this._startTime) / this._timeScale,true,true);
               }
            }
         }
         if(this._gc && !param1)
         {
            this._enabled(true,false);
         }
         return this;
      }
   }
}

