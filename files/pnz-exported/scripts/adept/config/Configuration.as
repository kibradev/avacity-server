package adept.config
{
   import §_-0uA§.§_-3YE§;
   import §_-6-L§.§_-6aF§;
   import §_-6-L§.§_-7uH§;
   
   public class Configuration
   {
      private var §_-cB§:Object = {};
      
      public function Configuration()
      {
         super();
      }
      
      public function loadXML(param1:XML) : void
      {
         var _loc5_:XML = null;
         var _loc6_:String = null;
         var _loc7_:XML = null;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:XMLList = null;
         var _loc11_:Array = null;
         var _loc12_:XML = null;
         var _loc13_:Configuration = null;
         var _loc2_:XMLList = param1.attributes();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length())
         {
            _loc7_ = _loc2_[_loc3_] as XML;
            _loc8_ = _loc7_.name();
            this.§_-cB§[_loc8_] = XML(_loc2_[_loc3_]).toString();
            _loc3_++;
         }
         var _loc4_:Array = [];
         for each(_loc5_ in param1.children())
         {
            _loc9_ = _loc5_.name();
            if(_loc9_ == null)
            {
               §_-3YE§.§_-ANW§("Strange config element was found: \'" + _loc5_.toXMLString() + "\'");
               throw new Error("Strange config element was found: \'" + _loc5_.toXMLString() + "\'");
            }
            _loc4_.push(_loc9_);
         }
         for each(_loc6_ in _loc4_)
         {
            _loc10_ = param1.elements(_loc6_);
            _loc11_ = [];
            for each(_loc12_ in _loc10_)
            {
               if(Boolean(_loc12_.hasComplexContent()) || _loc12_.attributes().length() > 0)
               {
                  _loc13_ = new Configuration();
                  _loc13_.loadXML(_loc12_);
                  _loc11_.push(_loc13_);
               }
               else
               {
                  _loc11_.push(_loc12_.toString());
               }
            }
            this.§_-cB§[_loc6_] = _loc10_.length() > 1 ? _loc11_ : _loc11_[0];
         }
      }
      
      public function getBoolean(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:String = this.getString(param1);
         return _loc3_ == null ? param2 : §_-7uH§.§_-5i§(this.getString(param1));
      }
      
      public function getInt(param1:String, param2:int = 0) : int
      {
         var _loc3_:String = this.getString(param1);
         return _loc3_ == null ? param2 : int(parseInt(_loc3_));
      }
      
      public function getNumber(param1:String, param2:int = 0) : Number
      {
         var _loc3_:String = this.getString(param1);
         return _loc3_ == null ? param2 : parseFloat(_loc3_);
      }
      
      public function getString(param1:String) : String
      {
         return this.getValue(param1) as String;
      }
      
      public function getConfiguration(param1:String) : Configuration
      {
         return this.getValue(param1) as Configuration;
      }
      
      public function getList(param1:String) : Array
      {
         var _loc2_:* = this.getValue(param1);
         if(_loc2_ is Array)
         {
            return _loc2_ as Array;
         }
         return [_loc2_];
      }
      
      public function getNames() : Array
      {
         return §_-6aF§.§_-1t1§(this.§_-cB§);
      }
      
      public function setValue(param1:String, param2:*) : void
      {
         this.§_-cB§[param1] = param2;
      }
      
      public function getValue(param1:String) : *
      {
         var _loc2_:Array = param1.split(".");
         var _loc3_:String = _loc2_.shift();
         if(_loc2_.length == 0)
         {
            return !!this.§_-cB§.hasOwnProperty(_loc3_) ? this.§_-cB§[_loc3_] : null;
         }
         var _loc4_:* = this.§_-cB§[_loc3_];
         if(_loc4_ is Configuration)
         {
            return Configuration(_loc4_).getValue(_loc2_.join("."));
         }
         return null;
      }
      
      private function §_-7Se§(param1:XML, param2:String, param3:*) : void
      {
         var _loc4_:XML = null;
         var _loc5_:* = undefined;
         var _loc6_:XML = null;
         if(param3 is Configuration)
         {
            _loc4_ = new XML("<" + param2 + " />");
            Configuration(param3).§_-4c6§(_loc4_);
            param1.appendChild(_loc4_);
         }
         else if(param3 is Array)
         {
            for each(_loc5_ in param3)
            {
               this.§_-7Se§(param1,param2,_loc5_);
            }
         }
         else
         {
            _loc6_ = new XML("<" + param2 + " />");
            _loc6_.appendChild(param3);
            param1.appendChild(_loc6_);
         }
      }
      
      private function §_-4c6§(param1:XML) : void
      {
         var _loc2_:String = null;
         for(_loc2_ in this.§_-cB§)
         {
            this.§_-7Se§(param1,_loc2_,this.§_-cB§[_loc2_]);
         }
      }
      
      public function toXML() : XML
      {
         var _loc1_:XML = <config/>;
         this.§_-4c6§(_loc1_);
         return _loc1_;
      }
      
      public function toString() : String
      {
         return this.toXML().toString();
      }
      
      public function toObject() : Object
      {
         var _loc2_:String = null;
         var _loc3_:* = undefined;
         var _loc1_:Object = {};
         for(_loc2_ in this.§_-cB§)
         {
            _loc3_ = this.§_-cB§[_loc2_];
            _loc1_[_loc2_] = this.§_-7P4§(_loc3_);
         }
         return _loc1_;
      }
      
      private function §_-7P4§(param1:*) : Object
      {
         var _loc2_:Array = null;
         var _loc3_:* = undefined;
         if(param1 is Configuration)
         {
            return Configuration(param1).toObject();
         }
         if(param1 is Array)
         {
            _loc2_ = [];
            for each(_loc3_ in param1)
            {
               _loc2_.push(this.§_-7P4§(_loc3_));
            }
            return _loc2_;
         }
         return param1;
      }
      
      public function get values() : Object
      {
         return this.§_-cB§;
      }
   }
}

