package §_-9Bv§
{
   import §_-0uA§.§_-3YE§;
   import §_-6-L§.§_-3hw§;
   import §_-6-L§.§_-49j§;
   import §_-6-L§.§_-6aF§;
   import §_-63P§.§_-5J5§;
   import §_-A2M§.§_-4Ba§;
   import adept.config.Configuration;
   import flash.utils.ByteArray;
   
   public class §_-8fL§
   {
      private var _vars:Object;
      
      private var _template:Object;
      
      private var _patches:Array;
      
      public function §_-8fL§()
      {
         super();
      }
      
      public static function §_-6RH§(param1:ByteArray) : §_-8fL§
      {
         var _loc2_:String = param1.readUTFBytes(param1.length);
         return §_-3jq§(_loc2_);
      }
      
      public static function §_-3jq§(param1:String) : §_-8fL§
      {
         var _loc2_:§_-8fL§ = new §_-8fL§();
         _loc2_.§_-7qS§(param1);
         return _loc2_;
      }
      
      private static function §_-AgU§(param1:Object, param2:Object) : §_-8fL§
      {
         var _loc3_:§_-8fL§ = new §_-8fL§();
         _loc3_._template = param1;
         _loc3_._vars = param2;
         return _loc3_;
      }
      
      public function getBoolean(param1:String, param2:Boolean = false) : Boolean
      {
         var _loc3_:String = this.getString(param1);
         if(_loc3_ == null)
         {
            return param2;
         }
         return _loc3_ == "true";
      }
      
      public function getString(param1:String, param2:String = null) : String
      {
         var _loc3_:Object = this.§_-2Bq§(param1);
         if(_loc3_ != null && _loc3_ is String)
         {
            return this.§_-CVX§(_loc3_ as String);
         }
         return param2;
      }
      
      public function §_-3vm§(param1:String) : Boolean
      {
         var _loc2_:Object = this.§_-2Bq§(param1);
         return _loc2_ != null;
      }
      
      public function getInt(param1:String, param2:int = 0) : int
      {
         var _loc3_:String = this.getString(param1);
         if(_loc3_ == null)
         {
            return param2;
         }
         return parseInt(_loc3_);
      }
      
      public function getNumber(param1:String, param2:Number = 0) : Number
      {
         var _loc3_:String = this.getString(param1);
         if(_loc3_ == null)
         {
            return param2;
         }
         return parseFloat(_loc3_);
      }
      
      public function §_-2hy§(param1:String, param2:Object = null) : Object
      {
         var _loc3_:Object = this.§_-2Bq§(param1);
         if(_loc3_ == null)
         {
            return param2;
         }
         return _loc3_;
      }
      
      public function getConfiguration(param1:String, param2:§_-8fL§ = null) : §_-8fL§
      {
         var _loc3_:Object = this.§_-2Bq§(param1);
         if(_loc3_ == null)
         {
            return param2;
         }
         return §_-8fL§.§_-AgU§(_loc3_,this._vars);
      }
      
      public function getList(param1:String, param2:Array = null) : Array
      {
         var _loc5_:Object = null;
         var _loc3_:Object = this.§_-2Bq§(param1);
         if(_loc3_ == null)
         {
            return param2;
         }
         var _loc4_:Array = [];
         if(!(_loc3_ is Array))
         {
            _loc3_ = [_loc3_];
         }
         for each(_loc5_ in _loc3_)
         {
            if(_loc5_ is String)
            {
               _loc4_.push(this.§_-CVX§(_loc5_ as String));
            }
            else
            {
               _loc4_.push(§_-8fL§.§_-AgU§(_loc5_,this._vars));
            }
         }
         return _loc4_;
      }
      
      public function getNames() : Array
      {
         return §_-6aF§.§_-1t1§(this._template);
      }
      
      public function toObject() : Object
      {
         return this.§_-8QD§().toObject();
      }
      
      public function setValue(param1:String, param2:Object) : void
      {
         var _loc3_:String = param1;
         var _loc4_:Array = param1.split(".");
         var _loc5_:Object = this._template;
         if(_loc4_.length > 1)
         {
            _loc3_ = _loc4_.pop();
            param1 = _loc4_.join(".");
         }
         if(param1 != _loc3_)
         {
            _loc5_ = this.§_-2Bq§(param1);
         }
         _loc5_[_loc3_] = param2;
      }
      
      public function §_-C3a§(param1:§_-8fL§) : void
      {
         var _loc2_:§_-0te§ = null;
         §_-6aF§.merge(param1._vars,this._vars);
         for each(_loc2_ in param1._patches)
         {
            _loc2_.apply(this);
         }
      }
      
      public function §_-7Tc§(param1:XML) : §_-4Ba§
      {
         var includeSrcArray:Array = null;
         var includeAppConfigs:Array = null;
         var importXml:XML = null;
         var importSrc:String = null;
         var xml:XML = param1;
         var tasks:Array = [];
         includeSrcArray = [];
         includeAppConfigs = [];
         for each(importXml in §_-3hw§.§_-3bk§(xml,"include"))
         {
            importSrc = §_-3hw§.getString(importXml,"@src");
            includeSrcArray.push(importSrc);
            includeAppConfigs.push(null);
            tasks.push(§_-4po§.§_-97K§(importSrc).then(function(param1:§_-8fL§, param2:String):void
            {
               var _loc3_:* = includeSrcArray.indexOf(param2);
               includeAppConfigs[_loc3_] = param1;
            }));
         }
         return §_-4Ba§.all(tasks).then(function():void
         {
            var _loc1_:* = undefined;
            var _loc2_:* = undefined;
            var _loc3_:* = undefined;
            _patches = [];
            _vars = {};
            for each(_loc1_ in includeAppConfigs)
            {
               §_-6aF§.merge(_loc1_._vars,_vars);
               §_-49j§.merge(_patches,_loc1_._patches);
            }
            §_-6aF§.merge(§_-5J5§.§_-4yD§(xml,"vars"),_vars);
            _loc2_ = §_-2Ho§.§_-B2Z§(xml,"template");
            if(_loc2_ != null)
            {
               _template = _loc2_.toObject();
            }
            for each(_loc3_ in §_-3hw§.§_-3bk§(xml,"patch"))
            {
               _patches.push(new §_-0te§(_loc3_));
            }
         });
      }
      
      public function §_-7qS§(param1:String) : §_-4Ba§
      {
         var task:§_-4Ba§ = null;
         var xml:XML = null;
         var str:String = param1;
         try
         {
            xml = new XML(str);
            task = this.§_-7Tc§(xml);
         }
         catch(e:Error)
         {
            §_-3YE§.§_-ANW§("Unable to load appconfig xml " + e.toString());
            throw e;
         }
         return task;
      }
      
      public function get template() : Object
      {
         return this._template;
      }
      
      public function §_-8QD§() : Configuration
      {
         var _loc2_:String = null;
         var _loc3_:Object = null;
         var _loc4_:Array = null;
         var _loc5_:Object = null;
         var _loc1_:Configuration = new Configuration();
         for(_loc2_ in this._template)
         {
            _loc3_ = this._template[_loc2_];
            if(_loc3_ is String)
            {
               _loc1_.setValue(_loc2_,this.§_-CVX§(_loc3_ as String));
            }
            else if(_loc3_ is Array)
            {
               _loc4_ = [];
               for each(_loc5_ in _loc3_)
               {
                  if(_loc5_ is String)
                  {
                     _loc4_.push(_loc5_);
                  }
                  else
                  {
                     _loc4_.push(§_-8fL§.§_-AgU§(_loc5_,this._vars).§_-8QD§());
                  }
               }
               _loc1_.setValue(_loc2_,_loc4_);
            }
            else
            {
               _loc1_.setValue(_loc2_,§_-8fL§.§_-AgU§(_loc3_,this._vars).§_-8QD§());
            }
         }
         return _loc1_;
      }
      
      public function §_-2Bq§(param1:String, param2:Boolean = false) : Object
      {
         var _loc5_:String = null;
         var _loc3_:Array = param1.split(".");
         var _loc4_:Object = this._template;
         while(_loc3_.length > 0)
         {
            _loc5_ = _loc3_.shift();
            if(!_loc4_.hasOwnProperty(_loc5_))
            {
               if(!param2)
               {
                  return null;
               }
               _loc4_[_loc5_] = {};
            }
            _loc4_ = _loc4_[_loc5_];
         }
         return _loc4_;
      }
      
      private function §_-CVX§(param1:String) : String
      {
         var value:String = param1;
         return value.replace(/\{@([a-zA-Z0-9]+?)}/g,function(param1:String, param2:String, param3:String, param4:String):String
         {
            if(_vars.hasOwnProperty(param2))
            {
               return _vars[param2];
            }
            §_-3YE§.§_-7aK§("Unknown variable \"" + param2 + "\" in appconfig.");
            return param1;
         });
      }
   }
}

