package com.greensock
{
   import com.greensock.core.Animation;
   import com.greensock.core.PropTween;
   import com.greensock.core.SimpleTimeline;
   import com.greensock.easing.§_-0x3§;
   import flash.display.Shape;
   import flash.events.Event;
   import flash.utils.Dictionary;
   
   public class TweenLite extends Animation
   {
      public static var §_-3Pk§:Function;
      
      protected static var §_-3XL§:Object;
      
      public static const version:String = "12.1.5";
      
      public static var defaultEase:§_-0x3§ = new §_-0x3§(null,null,1,1);
      
      public static var §_-9fB§:String = "auto";
      
      public static var ticker:Shape = Animation.ticker;
      
      public static var §_-8Lw§:Object = {};
      
      protected static var §_-189§:Dictionary = new Dictionary(false);
      
      protected static var _reservedProps:Object = {
         "ease":1,
         "delay":1,
         "overwrite":1,
         "onComplete":1,
         "onCompleteParams":1,
         "onCompleteScope":1,
         "useFrames":1,
         "runBackwards":1,
         "startAt":1,
         "onUpdate":1,
         "onUpdateParams":1,
         "onUpdateScope":1,
         "onStart":1,
         "onStartParams":1,
         "onStartScope":1,
         "onReverseComplete":1,
         "onReverseCompleteParams":1,
         "onReverseCompleteScope":1,
         "onRepeat":1,
         "onRepeatParams":1,
         "onRepeatScope":1,
         "easeParams":1,
         "yoyo":1,
         "onCompleteListener":1,
         "onUpdateListener":1,
         "onStartListener":1,
         "onReverseCompleteListener":1,
         "onRepeatListener":1,
         "orientToBezier":1,
         "immediateRender":1,
         "repeat":1,
         "repeatDelay":1,
         "data":1,
         "paused":1,
         "reversed":1
      };
      
      public var target:Object;
      
      public var ratio:Number;
      
      public var §_-0bC§:Object;
      
      public var §_-7vS§:PropTween;
      
      protected var §_-2fi§:Array;
      
      public var _ease:§_-0x3§;
      
      protected var §_-2Jq§:int;
      
      protected var §_-BOL§:int;
      
      protected var §_-3z6§:Array;
      
      protected var _overwrite:int;
      
      protected var _overwrittenProps:Object;
      
      protected var _notifyPluginsOfEnabled:Boolean;
      
      protected var §_-1Zu§:TweenLite;
      
      public function TweenLite(param1:Object, param2:Number, param3:Object)
      {
         var _loc4_:int = 0;
         super(param2,param3);
         if(param1 == null)
         {
            throw new Error("Cannot tween a null object. Duration: " + param2 + ", data: " + this.data);
         }
         if(!§_-3XL§)
         {
            §_-3XL§ = {
               "none":0,
               "all":1,
               "auto":2,
               "concurrent":3,
               "allOnStart":4,
               "preexisting":5,
               "true":1,
               "false":0
            };
            ticker.addEventListener("enterFrame",§_-B1i§,false,-1,true);
         }
         this.ratio = 0;
         this.target = param1;
         this._ease = defaultEase;
         this._overwrite = !("overwrite" in this.vars) ? int(§_-3XL§[§_-9fB§]) : (typeof this.vars.overwrite === "number" ? this.vars.overwrite >> 0 : int(§_-3XL§[this.vars.overwrite]));
         if(this.target is Array && typeof this.target[0] === "object")
         {
            this.§_-2fi§ = this.target.concat();
            this.§_-0bC§ = [];
            this.§_-3z6§ = [];
            _loc4_ = int(this.§_-2fi§.length);
            while(--_loc4_ > -1)
            {
               this.§_-3z6§[_loc4_] = §_-BIT§(this.§_-2fi§[_loc4_],this,false);
               if(this._overwrite == 1)
               {
                  if(this.§_-3z6§[_loc4_].length > 1)
                  {
                     §_-5MV§(this.§_-2fi§[_loc4_],this,null,1,this.§_-3z6§[_loc4_]);
                  }
               }
            }
         }
         else
         {
            this.§_-0bC§ = {};
            this.§_-3z6§ = §_-189§[param1];
            if(this.§_-3z6§ == null)
            {
               this.§_-3z6§ = §_-189§[param1] = [this];
            }
            else
            {
               this.§_-3z6§[this.§_-3z6§.length] = this;
               if(this._overwrite == 1)
               {
                  §_-5MV§(param1,this,null,1,this.§_-3z6§);
               }
            }
         }
         if(Boolean(this.vars.immediateRender) || param2 == 0 && _delay == 0 && this.vars.immediateRender != false)
         {
            this.render(-_delay,false,true);
         }
      }
      
      public static function to(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         return new TweenLite(param1,param2,param3);
      }
      
      public static function from(param1:Object, param2:Number, param3:Object) : TweenLite
      {
         param3 = §_-9r7§(param3,true);
         param3.runBackwards = true;
         return new TweenLite(param1,param2,param3);
      }
      
      public static function fromTo(param1:Object, param2:Number, param3:Object, param4:Object) : TweenLite
      {
         param4 = §_-9r7§(param4,true);
         param3 = §_-9r7§(param3);
         param4.startAt = param3;
         param4.immediateRender = param4.immediateRender != false && param3.immediateRender != false;
         return new TweenLite(param1,param2,param4);
      }
      
      protected static function §_-9r7§(param1:Object, param2:Boolean = false) : Object
      {
         if(param1._isGSVars)
         {
            param1 = param1.vars;
         }
         if(param2 && !("immediateRender" in param1))
         {
            param1.immediateRender = true;
         }
         return param1;
      }
      
      public static function delayedCall(param1:Number, param2:Function, param3:Array = null, param4:Boolean = false) : TweenLite
      {
         return new TweenLite(param2,0,{
            "delay":param1,
            "onComplete":param2,
            "onCompleteParams":param3,
            "onReverseComplete":param2,
            "onReverseCompleteParams":param3,
            "immediateRender":false,
            "useFrames":param4,
            "overwrite":0
         });
      }
      
      public static function set(param1:Object, param2:Object) : TweenLite
      {
         return new TweenLite(param1,0,param2);
      }
      
      private static function §_-B1i§(param1:Event) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Array = null;
         var _loc4_:Object = null;
         if(§_-A9h§ / 60 >> 0 === §_-A9h§ / 60)
         {
            for(_loc4_ in §_-189§)
            {
               _loc3_ = §_-189§[_loc4_];
               _loc2_ = int(_loc3_.length);
               while(--_loc2_ > -1)
               {
                  if(_loc3_[_loc2_]._gc)
                  {
                     _loc3_.splice(_loc2_,1);
                  }
               }
               if(_loc3_.length === 0)
               {
                  delete §_-189§[_loc4_];
               }
            }
         }
      }
      
      public static function killTweensOf(param1:*, param2:* = false, param3:Object = null) : void
      {
         if(typeof param2 === "object")
         {
            param3 = param2;
            param2 = false;
         }
         var _loc4_:Array = TweenLite.getTweensOf(param1,param2);
         var _loc5_:int = int(_loc4_.length);
         while(--_loc5_ > -1)
         {
            _loc4_[_loc5_]._kill(param3,param1);
         }
      }
      
      public static function killDelayedCallsTo(param1:Function) : void
      {
         killTweensOf(param1);
      }
      
      public static function getTweensOf(param1:*, param2:Boolean = false) : Array
      {
         var _loc3_:int = 0;
         var _loc4_:Array = null;
         var _loc5_:int = 0;
         var _loc6_:TweenLite = null;
         if(param1 is Array && typeof param1[0] != "string" && typeof param1[0] != "number")
         {
            _loc3_ = int(param1.length);
            _loc4_ = [];
            while(--_loc3_ > -1)
            {
               _loc4_ = _loc4_.concat(getTweensOf(param1[_loc3_],param2));
            }
            _loc3_ = int(_loc4_.length);
            while(--_loc3_ > -1)
            {
               _loc6_ = _loc4_[_loc3_];
               _loc5_ = _loc3_;
               while(--_loc5_ > -1)
               {
                  if(_loc6_ === _loc4_[_loc5_])
                  {
                     _loc4_.splice(_loc3_,1);
                  }
               }
            }
         }
         else
         {
            _loc4_ = §_-BIT§(param1).concat();
            _loc3_ = int(_loc4_.length);
            while(--_loc3_ > -1)
            {
               if(Boolean(_loc4_[_loc3_]._gc) || param2 && !_loc4_[_loc3_].isActive())
               {
                  _loc4_.splice(_loc3_,1);
               }
            }
         }
         return _loc4_;
      }
      
      protected static function §_-BIT§(param1:Object, param2:TweenLite = null, param3:Boolean = false) : Array
      {
         var _loc5_:int = 0;
         var _loc4_:Array = §_-189§[param1];
         if(_loc4_ == null)
         {
            _loc4_ = §_-189§[param1] = [];
         }
         if(param2)
         {
            _loc5_ = int(_loc4_.length);
            _loc4_[_loc5_] = param2;
            if(param3)
            {
               while(--_loc5_ > -1)
               {
                  if(_loc4_[_loc5_] === param2)
                  {
                     _loc4_.splice(_loc5_,1);
                  }
               }
            }
         }
         return _loc4_;
      }
      
      protected static function §_-5MV§(param1:Object, param2:TweenLite, param3:Object, param4:int, param5:Array) : Boolean
      {
         var _loc6_:int = 0;
         var _loc7_:Boolean = false;
         var _loc8_:TweenLite = null;
         var _loc13_:Number = NaN;
         var _loc14_:int = 0;
         if(param4 == 1 || param4 >= 4)
         {
            _loc14_ = int(param5.length);
            _loc6_ = 0;
            while(_loc6_ < _loc14_)
            {
               _loc8_ = param5[_loc6_];
               if(_loc8_ != param2)
               {
                  if(!_loc8_._gc)
                  {
                     if(_loc8_._enabled(false,false))
                     {
                        _loc7_ = true;
                     }
                  }
               }
               else if(param4 == 5)
               {
                  break;
               }
               _loc6_++;
            }
            return _loc7_;
         }
         var _loc9_:Number = param2._startTime + 1e-10;
         var _loc10_:Array = [];
         var _loc11_:int = 0;
         var _loc12_:* = param2._duration == 0;
         _loc6_ = int(param5.length);
         while(--_loc6_ > -1)
         {
            _loc8_ = param5[_loc6_];
            if(!(_loc8_ === param2 || _loc8_._gc || _loc8_._paused))
            {
               if(_loc8_._timeline != param2._timeline)
               {
                  _loc13_ ||= §_-8Vn§(param2,0,_loc12_);
                  if(§_-8Vn§(_loc8_,_loc13_,_loc12_) === 0)
                  {
                     var _loc15_:* = _loc11_++;
                     _loc10_[_loc15_] = _loc8_;
                  }
               }
               else if(_loc8_._startTime <= _loc9_)
               {
                  if(_loc8_._startTime + _loc8_.totalDuration() / _loc8_._timeScale > _loc9_)
                  {
                     if(!((_loc12_ || !_loc8_.§_-2ME§) && _loc9_ - _loc8_._startTime <= 2e-10))
                     {
                        _loc15_ = _loc11_++;
                        _loc10_[_loc15_] = _loc8_;
                     }
                  }
               }
            }
         }
         _loc6_ = _loc11_;
         while(--_loc6_ > -1)
         {
            _loc8_ = _loc10_[_loc6_];
            if(param4 == 2)
            {
               if(_loc8_._kill(param3,param1))
               {
                  _loc7_ = true;
               }
            }
            if(param4 !== 2 || !_loc8_.§_-7vS§ && _loc8_.§_-2ME§)
            {
               if(_loc8_._enabled(false,false))
               {
                  _loc7_ = true;
               }
            }
         }
         return _loc7_;
      }
      
      private static function §_-8Vn§(param1:Animation, param2:Number, param3:Boolean) : Number
      {
         var _loc4_:SimpleTimeline = param1._timeline;
         var _loc5_:Number = _loc4_._timeScale;
         var _loc6_:Number = param1._startTime;
         var _loc7_:Number = 1e-10;
         while(_loc4_._timeline)
         {
            _loc6_ += _loc4_._startTime;
            _loc5_ *= _loc4_._timeScale;
            if(_loc4_._paused)
            {
               return -100;
            }
            _loc4_ = _loc4_._timeline;
         }
         _loc6_ /= _loc5_;
         _loc6_ = _loc6_ + param1.totalDuration() / param1._timeScale / _loc5_;
         return _loc6_ > param2 ? _loc6_ - param2 : (param3 && _loc6_ == param2 || !param1.§_-2ME§ && _loc6_ - param2 < 2 * _loc7_ ? _loc7_ : (_loc6_ > param2 + _loc7_ ? 0 : _loc6_ - param2 - _loc7_));
      }
      
      protected function §_-8fw§() : void
      {
         var _loc2_:int = 0;
         var _loc3_:Boolean = false;
         var _loc4_:PropTween = null;
         var _loc5_:String = null;
         var _loc6_:Object = null;
         var _loc1_:Boolean = Boolean(vars.immediateRender);
         if(vars.startAt)
         {
            if(this.§_-1Zu§ != null)
            {
               this.§_-1Zu§.render(-1,true);
            }
            vars.startAt.overwrite = 0;
            vars.startAt.immediateRender = true;
            this.§_-1Zu§ = new TweenLite(this.target,0,vars.startAt);
            if(_loc1_)
            {
               if(_time > 0)
               {
                  this.§_-1Zu§ = null;
               }
               else if(_duration !== 0)
               {
                  return;
               }
            }
         }
         else if(Boolean(vars.runBackwards) && _duration !== 0)
         {
            if(this.§_-1Zu§ != null)
            {
               this.§_-1Zu§.render(-1,true);
               this.§_-1Zu§ = null;
            }
            else
            {
               _loc6_ = {};
               for(_loc5_ in vars)
               {
                  if(!(_loc5_ in _reservedProps))
                  {
                     _loc6_[_loc5_] = vars[_loc5_];
                  }
               }
               _loc6_.overwrite = 0;
               _loc6_.data = "isFromStart";
               this.§_-1Zu§ = TweenLite.to(this.target,0,_loc6_);
               if(!_loc1_)
               {
                  this.§_-1Zu§.render(-1,true);
               }
               else if(_time === 0)
               {
                  return;
               }
            }
         }
         if(vars.ease is §_-0x3§)
         {
            this._ease = vars.easeParams is Array ? vars.ease.config.apply(vars.ease,vars.easeParams) : vars.ease;
         }
         else if(typeof vars.ease === "function")
         {
            this._ease = new §_-0x3§(vars.ease,vars.easeParams);
         }
         else
         {
            this._ease = defaultEase;
         }
         this.§_-2Jq§ = this._ease._type;
         this.§_-BOL§ = this._ease.§_-1pZ§;
         this.§_-7vS§ = null;
         if(this.§_-2fi§)
         {
            _loc2_ = int(this.§_-2fi§.length);
            while(--_loc2_ > -1)
            {
               if(this.§_-7kp§(this.§_-2fi§[_loc2_],this.§_-0bC§[_loc2_] = {},this.§_-3z6§[_loc2_],!!this._overwrittenProps ? this._overwrittenProps[_loc2_] : null))
               {
                  _loc3_ = true;
               }
            }
         }
         else
         {
            _loc3_ = this.§_-7kp§(this.target,this.§_-0bC§,this.§_-3z6§,this._overwrittenProps);
         }
         if(_loc3_)
         {
            §_-3Pk§("_onInitAllProps",this);
         }
         if(this._overwrittenProps)
         {
            if(this.§_-7vS§ == null)
            {
               if(typeof this.target !== "function")
               {
                  this._enabled(false,false);
               }
            }
         }
         if(vars.runBackwards)
         {
            _loc4_ = this.§_-7vS§;
            while(_loc4_)
            {
               _loc4_.s += _loc4_.c;
               _loc4_.c = -_loc4_.c;
               _loc4_ = _loc4_._next;
            }
         }
         §_-9tb§ = vars.onUpdate;
         §_-2ME§ = true;
      }
      
      protected function §_-7kp§(param1:Object, param2:Object, param3:Array, param4:Object) : Boolean
      {
         var _loc6_:String = null;
         var _loc7_:int = 0;
         var _loc8_:Boolean = false;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc5_:Object = this.vars;
         if(param1 == null)
         {
            return false;
         }
         for(_loc6_ in _loc5_)
         {
            _loc10_ = _loc5_[_loc6_];
            if(_loc6_ in _reservedProps)
            {
               if(_loc10_ is Array)
               {
                  if(_loc10_.join("").indexOf("{self}") !== -1)
                  {
                     _loc5_[_loc6_] = §_-2K3§(_loc10_ as Array);
                  }
               }
            }
            else if(_loc6_ in §_-8Lw§ && Boolean((_loc9_ = new §_-8Lw§[_loc6_]())._onInitTween(param1,_loc10_,this)))
            {
               this.§_-7vS§ = new PropTween(_loc9_,"setRatio",0,1,_loc6_,true,this.§_-7vS§,_loc9_._priority);
               _loc7_ = int(_loc9_._overwriteProps.length);
               while(--_loc7_ > -1)
               {
                  param2[_loc9_._overwriteProps[_loc7_]] = this.§_-7vS§;
               }
               if(Boolean(_loc9_._priority) || "_onInitAllProps" in _loc9_)
               {
                  _loc8_ = true;
               }
               if("_onDisable" in _loc9_ || "_onEnable" in _loc9_)
               {
                  this._notifyPluginsOfEnabled = true;
               }
            }
            else
            {
               this.§_-7vS§ = param2[_loc6_] = new PropTween(param1,_loc6_,0,1,_loc6_,false,this.§_-7vS§);
               this.§_-7vS§.s = !this.§_-7vS§.f ? Number(param1[_loc6_]) : Number(param1[Boolean(_loc6_.indexOf("set")) || !("get" + _loc6_.substr(3) in param1) ? _loc6_ : "get" + _loc6_.substr(3)]());
               this.§_-7vS§.c = typeof _loc10_ === "number" ? Number(_loc10_) - this.§_-7vS§.s : (typeof _loc10_ === "string" && _loc10_.charAt(1) === "=" ? int(_loc10_.charAt(0) + "1") * Number(_loc10_.substr(2)) : Number(_loc10_) || 0);
            }
         }
         if(param4)
         {
            if(this._kill(param4,param1))
            {
               return this.§_-7kp§(param1,param2,param3,param4);
            }
         }
         if(this._overwrite > 1)
         {
            if(this.§_-7vS§ != null)
            {
               if(param3.length > 1)
               {
                  if(§_-5MV§(param1,this,param2,this._overwrite,param3))
                  {
                     this._kill(param2,param1);
                     return this.§_-7kp§(param1,param2,param3,param4);
                  }
               }
            }
         }
         return _loc8_;
      }
      
      override public function render(param1:Number, param2:Boolean = false, param3:Boolean = false) : void
      {
         var _loc4_:Boolean = false;
         var _loc5_:String = null;
         var _loc6_:PropTween = null;
         var _loc7_:Number = NaN;
         var _loc9_:Number = NaN;
         var _loc8_:Number = _time;
         if(param1 >= _duration)
         {
            §_-46q§ = _time = _duration;
            this.ratio = this._ease._calcEnd ? this._ease.getRatio(1) : 1;
            if(!§_-AyR§)
            {
               _loc4_ = true;
               _loc5_ = "onComplete";
            }
            if(_duration == 0)
            {
               _loc7_ = §_-6l6§;
               if(_startTime === _timeline._duration)
               {
                  param1 = 0;
               }
               if(param1 === 0 || _loc7_ < 0 || _loc7_ === §_-COs§)
               {
                  if(_loc7_ !== param1)
                  {
                     param3 = true;
                     if(_loc7_ > 0 && _loc7_ !== §_-COs§)
                     {
                        _loc5_ = "onReverseComplete";
                     }
                  }
               }
               §_-6l6§ = _loc7_ = !param2 || param1 !== 0 || §_-6l6§ === param1 ? param1 : §_-COs§;
            }
         }
         else if(param1 < 1e-7)
         {
            §_-46q§ = _time = 0;
            this.ratio = this._ease._calcEnd ? this._ease.getRatio(0) : 0;
            if(_loc8_ !== 0 || _duration === 0 && §_-6l6§ > 0 && §_-6l6§ !== §_-COs§)
            {
               _loc5_ = "onReverseComplete";
               _loc4_ = §_-AyR§;
            }
            if(param1 < 0)
            {
               §_-3zu§ = false;
               if(_duration == 0)
               {
                  if(§_-6l6§ >= 0)
                  {
                     param3 = true;
                  }
                  §_-6l6§ = _loc7_ = !param2 || param1 !== 0 || §_-6l6§ === param1 ? param1 : §_-COs§;
               }
            }
            else if(!§_-2ME§)
            {
               param3 = true;
            }
         }
         else
         {
            §_-46q§ = _time = param1;
            if(this.§_-2Jq§)
            {
               _loc9_ = param1 / _duration;
               if(this.§_-2Jq§ == 1 || this.§_-2Jq§ == 3 && _loc9_ >= 0.5)
               {
                  _loc9_ = 1 - _loc9_;
               }
               if(this.§_-2Jq§ == 3)
               {
                  _loc9_ *= 2;
               }
               if(this.§_-BOL§ == 1)
               {
                  _loc9_ *= _loc9_;
               }
               else if(this.§_-BOL§ == 2)
               {
                  _loc9_ *= _loc9_ * _loc9_;
               }
               else if(this.§_-BOL§ == 3)
               {
                  _loc9_ *= _loc9_ * _loc9_ * _loc9_;
               }
               else if(this.§_-BOL§ == 4)
               {
                  _loc9_ *= _loc9_ * _loc9_ * _loc9_ * _loc9_;
               }
               if(this.§_-2Jq§ == 1)
               {
                  this.ratio = 1 - _loc9_;
               }
               else if(this.§_-2Jq§ == 2)
               {
                  this.ratio = _loc9_;
               }
               else if(param1 / _duration < 0.5)
               {
                  this.ratio = _loc9_ / 2;
               }
               else
               {
                  this.ratio = 1 - _loc9_ / 2;
               }
            }
            else
            {
               this.ratio = this._ease.getRatio(param1 / _duration);
            }
         }
         if(_time == _loc8_ && !param3)
         {
            return;
         }
         if(!§_-2ME§)
         {
            this.§_-8fw§();
            if(!§_-2ME§ || _gc)
            {
               return;
            }
            if(Boolean(_time) && !_loc4_)
            {
               this.ratio = this._ease.getRatio(_time / _duration);
            }
            else if(_loc4_ && this._ease._calcEnd)
            {
               this.ratio = this._ease.getRatio(_time === 0 ? 0 : 1);
            }
         }
         if(!§_-3zu§)
         {
            if(!_paused && _time !== _loc8_ && param1 >= 0)
            {
               §_-3zu§ = true;
            }
         }
         if(_loc8_ == 0)
         {
            if(this.§_-1Zu§ != null)
            {
               if(param1 >= 0)
               {
                  this.§_-1Zu§.render(param1,param2,param3);
               }
               else if(!_loc5_)
               {
                  _loc5_ = "_dummyGS";
               }
            }
            if(vars.onStart)
            {
               if(_time != 0 || _duration == 0)
               {
                  if(!param2)
                  {
                     vars.onStart.apply(null,vars.onStartParams);
                  }
               }
            }
         }
         _loc6_ = this.§_-7vS§;
         while(_loc6_)
         {
            if(_loc6_.f)
            {
               _loc6_.t[_loc6_.p](_loc6_.c * this.ratio + _loc6_.s);
            }
            else
            {
               _loc6_.t[_loc6_.p] = _loc6_.c * this.ratio + _loc6_.s;
            }
            _loc6_ = _loc6_._next;
         }
         if(§_-9tb§ != null)
         {
            if(param1 < 0 && this.§_-1Zu§ != null && _startTime != 0)
            {
               this.§_-1Zu§.render(param1,param2,param3);
            }
            if(!param2)
            {
               if(_time !== _loc8_ || _loc4_)
               {
                  §_-9tb§.apply(null,vars.onUpdateParams);
               }
            }
         }
         if(_loc5_)
         {
            if(!_gc)
            {
               if(param1 < 0 && this.§_-1Zu§ != null && §_-9tb§ == null && _startTime != 0)
               {
                  this.§_-1Zu§.render(param1,param2,param3);
               }
               if(_loc4_)
               {
                  if(_timeline.autoRemoveChildren)
                  {
                     this._enabled(false,false);
                  }
                  §_-3zu§ = false;
               }
               if(!param2)
               {
                  if(vars[_loc5_])
                  {
                     vars[_loc5_].apply(null,vars[_loc5_ + "Params"]);
                  }
               }
               if(_duration === 0 && §_-6l6§ === §_-COs§ && _loc7_ !== §_-COs§)
               {
                  §_-6l6§ = 0;
               }
            }
         }
      }
      
      override public function _kill(param1:Object = null, param2:Object = null) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:Object = null;
         var _loc5_:String = null;
         var _loc6_:PropTween = null;
         var _loc7_:Object = null;
         var _loc8_:Boolean = false;
         var _loc9_:Object = null;
         var _loc10_:Boolean = false;
         if(param1 === "all")
         {
            param1 = null;
         }
         if(param1 == null)
         {
            if(param2 == null || param2 == this.target)
            {
               return this._enabled(false,false);
            }
         }
         param2 = param2 || this.§_-2fi§ || this.target;
         if(param2 is Array && typeof param2[0] === "object")
         {
            _loc3_ = int(param2.length);
            while(--_loc3_ > -1)
            {
               if(this._kill(param1,param2[_loc3_]))
               {
                  _loc8_ = true;
               }
            }
         }
         else
         {
            if(this.§_-2fi§)
            {
               _loc3_ = int(this.§_-2fi§.length);
               while(--_loc3_ > -1)
               {
                  if(param2 === this.§_-2fi§[_loc3_])
                  {
                     _loc7_ = this.§_-0bC§[_loc3_] || {};
                     this._overwrittenProps = this._overwrittenProps || [];
                     _loc4_ = this._overwrittenProps[_loc3_] = !!param1 ? this._overwrittenProps[_loc3_] || {} : "all";
                     break;
                  }
               }
            }
            else
            {
               if(param2 !== this.target)
               {
                  return false;
               }
               _loc7_ = this.§_-0bC§;
               _loc4_ = this._overwrittenProps = !!param1 ? this._overwrittenProps || {} : "all";
            }
            if(_loc7_)
            {
               _loc9_ = param1 || _loc7_;
               _loc10_ = param1 != _loc4_ && _loc4_ != "all" && param1 != _loc7_ && (typeof param1 != "object" || param1._tempKill != true);
               for(_loc5_ in _loc9_)
               {
                  _loc6_ = _loc7_[_loc5_];
                  if(_loc6_ != null)
                  {
                     if(_loc6_.pg && Boolean(_loc6_.t._kill(_loc9_)))
                     {
                        _loc8_ = true;
                     }
                     if(!_loc6_.pg || _loc6_.t._overwriteProps.length === 0)
                     {
                        if(_loc6_._prev)
                        {
                           _loc6_._prev._next = _loc6_._next;
                        }
                        else if(_loc6_ == this.§_-7vS§)
                        {
                           this.§_-7vS§ = _loc6_._next;
                        }
                        if(_loc6_._next)
                        {
                           _loc6_._next._prev = _loc6_._prev;
                        }
                        _loc6_._next = _loc6_._prev = null;
                     }
                     delete _loc7_[_loc5_];
                  }
                  if(_loc10_)
                  {
                     _loc4_[_loc5_] = 1;
                  }
               }
               if(this.§_-7vS§ == null && §_-2ME§)
               {
                  this._enabled(false,false);
               }
            }
         }
         return _loc8_;
      }
      
      override public function invalidate() : *
      {
         if(this._notifyPluginsOfEnabled)
         {
            §_-3Pk§("_onDisable",this);
         }
         this.§_-7vS§ = null;
         this._overwrittenProps = null;
         §_-9tb§ = null;
         this.§_-1Zu§ = null;
         §_-2ME§ = §_-3zu§ = this._notifyPluginsOfEnabled = false;
         this.§_-0bC§ = !!this.§_-2fi§ ? {} : [];
         return this;
      }
      
      override public function _enabled(param1:Boolean, param2:Boolean = false) : Boolean
      {
         var _loc3_:int = 0;
         if(param1 && _gc)
         {
            if(this.§_-2fi§)
            {
               _loc3_ = int(this.§_-2fi§.length);
               while(--_loc3_ > -1)
               {
                  this.§_-3z6§[_loc3_] = §_-BIT§(this.§_-2fi§[_loc3_],this,true);
               }
            }
            else
            {
               this.§_-3z6§ = §_-BIT§(this.target,this,true);
            }
         }
         super._enabled(param1,param2);
         if(this._notifyPluginsOfEnabled)
         {
            if(this.§_-7vS§ != null)
            {
               return §_-3Pk§(param1 ? "_onEnable" : "_onDisable",this);
            }
         }
         return false;
      }
   }
}

