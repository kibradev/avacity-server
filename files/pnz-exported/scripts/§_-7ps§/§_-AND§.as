package §_-7ps§
{
   import §_-18o§.§_-ABX§;
   import §_-1sb§.§_-2xb§;
   import §_-C-a§.§_-3uA§;
   
   public class §_-AND§
   {
      private var §_-AcP§:int = 0;
      
      private var _type:int = 0;
      
      private var §_-Avc§:String = null;
      
      private var §_-9x2§:Boolean = false;
      
      private var §_-BeB§:Boolean = false;
      
      private var §_-2zz§:String = null;
      
      private var _time:int = 0;
      
      private var _x:int = 0;
      
      private var _y:int = 0;
      
      private var §_-3E9§:int = 0;
      
      private var _width:int = 0;
      
      private var _direction:String = null;
      
      private var _target:String = null;
      
      public function §_-AND§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-AcP§ = Math.round(Math.random() * 99999);
         this._type = param1["@type"];
         this.§_-Avc§ = !!param1.hasOwnProperty("@title") ? param1["@title"] : null;
         this.§_-9x2§ = !!param1.hasOwnProperty("@canFinish") ? int(param1["@canFinish"]) == 1 : false;
         this.§_-BeB§ = !!param1.hasOwnProperty("@canContinue") ? int(param1["@canContinue"]) == 1 : false;
         this.§_-2zz§ = !!param1.hasOwnProperty("@onContinue") ? param1["@onContinue"] : null;
         this._time = !!param1.hasOwnProperty("@time") ? int(param1["@time"]) : 0;
         this._x = !!param1.hasOwnProperty("@x") ? int(param1["@x"]) : 0;
         this._y = !!param1.hasOwnProperty("@y") ? int(param1["@y"]) : 0;
         this.§_-3E9§ = !!param1.hasOwnProperty("@z") ? int(param1["@z"]) : 0;
         this._width = !!param1.hasOwnProperty("@width") ? int(param1["@width"]) : 0;
         this._direction = !!param1.hasOwnProperty("@direction") ? param1["@direction"] : null;
         this._target = !!param1.hasOwnProperty("@target") ? param1["@target"] : null;
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function set title(param1:String) : void
      {
         this.§_-Avc§ = param1;
      }
      
      public function get localizedTitle() : String
      {
         return §_-ABX§.§_-631§(this.title);
      }
      
      public function get canFinish() : Boolean
      {
         return this.§_-9x2§;
      }
      
      public function set canFinish(param1:Boolean) : void
      {
         this.§_-9x2§ = param1;
      }
      
      public function get canContinue() : Boolean
      {
         return this.§_-BeB§;
      }
      
      public function set canContinue(param1:Boolean) : void
      {
         this.§_-BeB§ = param1;
      }
      
      public function get onContinue() : String
      {
         return this.§_-2zz§;
      }
      
      public function get time() : int
      {
         return this._time;
      }
      
      public function get x() : int
      {
         return this._x;
      }
      
      public function set x(param1:int) : void
      {
         this._x = param1;
      }
      
      public function get y() : int
      {
         return this._y;
      }
      
      public function set y(param1:int) : void
      {
         this._y = param1;
      }
      
      public function get z() : int
      {
         return this.§_-3E9§;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set width(param1:int) : void
      {
         this._width = param1;
      }
      
      public function get direction() : String
      {
         return this._direction;
      }
      
      public function set direction(param1:String) : void
      {
         this._direction = param1;
      }
      
      public function get target() : String
      {
         return this._target;
      }
      
      public function set target(param1:String) : void
      {
         this._target = param1;
      }
      
      public function getGenderTitle(param1:int) : String
      {
         return §_-ABX§.§_-631§(this.title,param1 == §_-3uA§.§_-908§ ? §_-2xb§.§_-dv§ : §_-2xb§.§_-BYe§);
      }
   }
}

