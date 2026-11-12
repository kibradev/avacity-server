package §_-6Cn§
{
   import §_-3eZ§.§_-BCG§;
   import §_-7np§.ConsoleService;
   import §_-GM§.Context;
   import flash.display.DisplayObject;
   import flash.display.DisplayObjectContainer;
   import flash.display.MovieClip;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.MouseEvent;
   import flash.events.ProgressEvent;
   import flash.events.SecurityErrorEvent;
   import flash.events.TimerEvent;
   import flash.net.Socket;
   import flash.system.ApplicationDomain;
   import flash.text.TextField;
   import flash.utils.ByteArray;
   import flash.utils.Timer;
   import flash.utils.describeType;
   import flash.utils.getDefinitionByName;
   import flash.utils.getQualifiedClassName;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-5PQ§
   {
      private static var §_-2S5§:Socket;
      
      private static var §_-AlD§:ByteArray;
      
      private static var §_-3gp§:Timer;
      
      private static const §_-6xY§:String = "127.0.0.1";
      
      private static const §_-8er§:int = 9876;
      
      private static const §_-25F§:int = 10000;
      
      private static const §_-26D§:int = 100;
      
      private static const §_-APX§:int = 500;
      
      private static var _initialized:Boolean = false;
      
      public function §_-5PQ§()
      {
         super();
      }
      
      public static function init() : void
      {
         if(_initialized)
         {
            return;
         }
         _initialized = true;
         §_-AlD§ = new ByteArray();
         §_-3gp§ = new Timer(§_-25F§,1);
         §_-3gp§.addEventListener(TimerEvent.TIMER,§_-gU§);
      }
      
      public static function connect() : void
      {
         try
         {
            if(§_-2S5§ != null)
            {
               §_-2S5§.removeEventListener(Event.CONNECT,§_-1vF§);
               §_-2S5§.removeEventListener(Event.CLOSE,§_-3G4§);
               §_-2S5§.removeEventListener(ProgressEvent.SOCKET_DATA,§_-65V§);
               §_-2S5§.removeEventListener(IOErrorEvent.IO_ERROR,onError);
               §_-2S5§.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
               try
               {
                  §_-2S5§.close();
               }
               catch(ce:Error)
               {
               }
            }
            §_-2S5§ = new Socket();
            §_-2S5§.addEventListener(Event.CONNECT,§_-1vF§);
            §_-2S5§.addEventListener(Event.CLOSE,§_-3G4§);
            §_-2S5§.addEventListener(ProgressEvent.SOCKET_DATA,§_-65V§);
            §_-2S5§.addEventListener(IOErrorEvent.IO_ERROR,onError);
            §_-2S5§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,onSecurityError);
            §_-2S5§.connect(§_-6xY§,§_-8er§);
         }
         catch(e:Error)
         {
            §_-5-q§();
         }
      }
      
      private static function §_-5-q§() : void
      {
         §_-3gp§.reset();
         §_-3gp§.start();
      }
      
      private static function §_-gU§(param1:TimerEvent) : void
      {
         connect();
      }
      
      private static function §_-1vF§(param1:Event) : void
      {
      }
      
      private static function §_-3G4§(param1:Event) : void
      {
         §_-AlD§ = new ByteArray();
         §_-5-q§();
      }
      
      private static function onError(param1:IOErrorEvent) : void
      {
         §_-5-q§();
      }
      
      private static function onSecurityError(param1:SecurityErrorEvent) : void
      {
      }
      
      private static function §_-65V§(param1:ProgressEvent) : void
      {
         var _loc2_:uint = §_-AlD§.length;
         §_-2S5§.readBytes(§_-AlD§,_loc2_,§_-2S5§.bytesAvailable);
         §_-68n§();
      }
      
      private static function §_-68n§() : void
      {
         var _loc1_:uint = 0;
         var _loc2_:uint = 0;
         var _loc3_:ByteArray = null;
         var _loc4_:String = null;
         var _loc5_:ByteArray = null;
         §_-AlD§.position = 0;
         while(§_-AlD§.bytesAvailable >= 4)
         {
            _loc1_ = §_-AlD§.position;
            _loc2_ = §_-AlD§.readUnsignedInt();
            if(§_-AlD§.bytesAvailable < _loc2_)
            {
               §_-AlD§.position = _loc1_;
               break;
            }
            _loc3_ = new ByteArray();
            §_-AlD§.readBytes(_loc3_,0,_loc2_);
            _loc4_ = _loc3_.readUTFBytes(_loc3_.length);
            §_-4ax§(_loc4_);
         }
         if(§_-AlD§.position > 0)
         {
            _loc5_ = new ByteArray();
            if(§_-AlD§.bytesAvailable > 0)
            {
               §_-AlD§.readBytes(_loc5_);
            }
            §_-AlD§ = _loc5_;
         }
      }
      
      private static function §_-4ax§(param1:String) : void
      {
         var id:String = null;
         var method:String = null;
         var params:Object = null;
         var result:Object = null;
         var requestJson:String = param1;
         var request:Object = JSON.parse(requestJson);
         id = request.id;
         try
         {
            method = request.method;
            params = request.params || {};
            switch(method)
            {
               case "getDisplayTree":
                  result = §_-2Og§(params);
                  break;
               case "getProperties":
                  result = §_-5eu§(params);
                  break;
               case "setProperty":
                  result = §_-4c4§(params);
                  break;
               case "eval":
                  result = §_-2eg§(params);
                  break;
               case "executeConsoleCommand":
                  result = §_-4Cu§(params);
                  break;
               case "findByName":
                  result = §_-5Ru§(params);
                  break;
               case "callMethod":
                  result = §_-6-r§(params);
                  break;
               case "click":
                  result = §_-2qv§(params);
                  break;
               case "findButtons":
                  result = §_-6Xd§(params);
                  break;
               case "getLogs":
                  result = §_-4HM§(params);
                  break;
               case "clearLogs":
                  §_-66r§.instance.clear();
                  result = {"success":true};
                  break;
               case "ping":
                  result = {
                     "status":"ok",
                     "timestamp":new Date().time
                  };
                  break;
               default:
                  §_-3c7§(id,null,"Unknown method: " + method);
                  return;
            }
            §_-3c7§(id,result,null);
         }
         catch(e:Error)
         {
            §_-3c7§(id,null,e.message + "\n" + e.getStackTrace());
         }
      }
      
      private static function §_-3c7§(param1:String, param2:Object, param3:String) : void
      {
         var _loc4_:Object = {"id":param1};
         if(param3 != null)
         {
            _loc4_.error = param3;
         }
         else
         {
            _loc4_.result = param2;
         }
         var _loc5_:String = JSON.stringify(_loc4_);
         var _loc6_:ByteArray = new ByteArray();
         _loc6_.writeUTFBytes(_loc5_);
         §_-2S5§.writeUnsignedInt(_loc6_.length);
         §_-2S5§.writeBytes(_loc6_);
         §_-2S5§.flush();
      }
      
      private static function §_-2Og§(param1:Object) : Object
      {
         var _loc2_:String = param1.path != null ? String(param1.path) : "";
         var _loc3_:int = param1.depth != null ? int(param1.depth) : 3;
         var _loc4_:DisplayObject = §_-8OK§(_loc2_);
         if(_loc4_ == null)
         {
            return {"error":"DisplayObject not found at path: " + _loc2_};
         }
         return §_-2mG§(_loc4_,_loc3_);
      }
      
      private static function §_-5eu§(param1:Object) : Object
      {
         var typeInfo:XML;
         var result:Object = null;
         var accessor:XML = null;
         var variable:XML = null;
         var method:XML = null;
         var accName:String = null;
         var accAccess:String = null;
         var varName:String = null;
         var methodInfo:Object = null;
         var param:XML = null;
         var params:Object = param1;
         var path:String = String(params.path || "");
         var target:* = path.length > 0 ? §_-81q§(path) : Application.instance.stage;
         if(target == null)
         {
            return {"error":"Object not found: " + path};
         }
         result = {
            "type":getQualifiedClassName(target),
            "properties":{},
            "methods":[]
         };
         typeInfo = describeType(target);
         for each(accessor in typeInfo.accessor)
         {
            accName = accessor.@name;
            accAccess = accessor.@access;
            if(accAccess == "readonly" || accAccess == "readwrite")
            {
               try
               {
                  result.properties[accName] = {
                     "value":§_-3Vz§(target[accName]),
                     "type":String(accessor.@type),
                     "access":accAccess
                  };
               }
               catch(ae:Error)
               {
                  result.properties[accName] = {
                     "type":String(accessor.@type),
                     "access":accAccess,
                     "error":ae.message
                  };
               }
            }
            else
            {
               result.properties[accName] = {
                  "type":String(accessor.@type),
                  "access":accAccess
               };
            }
         }
         for each(variable in typeInfo.variable)
         {
            varName = variable.@name;
            try
            {
               result.properties[varName] = {
                  "value":§_-3Vz§(target[varName]),
                  "type":String(variable.@type),
                  "access":"readwrite"
               };
            }
            catch(ve:Error)
            {
               result.properties[varName] = {
                  "type":String(variable.@type),
                  "access":"readwrite",
                  "error":ve.message
               };
            }
         }
         for each(method in typeInfo.method)
         {
            methodInfo = {
               "name":String(method.@name),
               "returnType":String(method.@returnType),
               "parameters":[]
            };
            for each(param in method.parameter)
            {
               methodInfo.parameters.push({
                  "index":int(param.@index),
                  "type":String(param.@type),
                  "optional":param.@optional == "true"
               });
            }
            result.methods.push(methodInfo);
         }
         return result;
      }
      
      private static function §_-4c4§(param1:Object) : Object
      {
         var _loc2_:String = String(param1.path || "");
         var _loc3_:String = String(param1.property);
         var _loc4_:* = param1.value;
         var _loc5_:* = §_-81q§(_loc2_);
         if(_loc5_ == null)
         {
            return {"error":"Object not found: " + _loc2_};
         }
         var _loc6_:* = _loc5_[_loc3_];
         _loc5_[_loc3_] = §_-RI§(_loc4_,typeof _loc6_);
         return {
            "success":true,
            "oldValue":§_-3Vz§(_loc6_),
            "newValue":§_-3Vz§(_loc5_[_loc3_])
         };
      }
      
      private static function §_-2eg§(param1:Object) : Object
      {
         var _loc2_:String = String(param1.expression);
         var _loc3_:* = §_-81q§(_loc2_);
         if(_loc3_ is DisplayObject)
         {
            return {
               "type":getQualifiedClassName(_loc3_),
               "value":§_-2mG§(_loc3_ as DisplayObject,0),
               "isDisplayObject":true
            };
         }
         return {
            "type":(_loc3_ != null ? getQualifiedClassName(_loc3_) : "null"),
            "value":§_-3Vz§(_loc3_)
         };
      }
      
      private static function §_-4Cu§(param1:Object) : Object
      {
         var _loc2_:String = String(param1.command);
         ConsoleService.instance.§_-7F7§(_loc2_);
         return {
            "success":true,
            "command":_loc2_
         };
      }
      
      private static function §_-4HM§(param1:Object) : Object
      {
         var _loc2_:uint = param1.sinceSeq != null ? uint(param1.sinceSeq) : 0;
         var _loc3_:uint = param1.minType != null ? uint(param1.minType) : 0;
         var _loc4_:String = param1.source != null ? String(param1.source) : "";
         var _loc5_:int = param1.limit != null ? int(param1.limit) : 0;
         return §_-66r§.instance.getLogs(_loc2_,_loc3_,_loc4_,_loc5_);
      }
      
      private static function §_-5Ru§(param1:Object) : Object
      {
         var _loc2_:String = String(param1.name);
         var _loc3_:String = param1.path != null ? String(param1.path) : "";
         var _loc4_:int = param1.maxResults != null ? int(param1.maxResults) : 50;
         var _loc5_:DisplayObject = §_-8OK§(_loc3_);
         if(_loc5_ == null)
         {
            return {"error":"Root not found: " + _loc3_};
         }
         var _loc6_:Array = [];
         §_-CZy§(_loc5_,_loc2_.toLowerCase(),"",_loc6_,_loc4_);
         return {
            "count":_loc6_.length,
            "matches":_loc6_
         };
      }
      
      private static function §_-6-r§(param1:Object) : Object
      {
         var _loc2_:String = String(param1.path || "");
         var _loc3_:String = String(param1.method);
         var _loc4_:Array = param1.args is Array ? param1.args as Array : [];
         var _loc5_:* = §_-81q§(_loc2_);
         if(_loc5_ == null)
         {
            return {"error":"Object not found: " + _loc2_};
         }
         var _loc6_:Function = _loc5_[_loc3_] as Function;
         if(_loc6_ == null)
         {
            return {"error":"Method not found: " + _loc3_ + " on " + getQualifiedClassName(_loc5_)};
         }
         var _loc7_:* = _loc6_.apply(_loc5_,_loc4_);
         return {
            "type":(_loc7_ != null ? getQualifiedClassName(_loc7_) : "void"),
            "value":§_-3Vz§(_loc7_)
         };
      }
      
      private static function §_-2qv§(param1:Object) : Object
      {
         var _loc2_:String = String(param1.path || "");
         var _loc3_:* = null;
         try
         {
            _loc3_ = §_-81q§(_loc2_);
         }
         catch(e:Error)
         {
         }
         if(_loc3_ == null)
         {
            _loc3_ = §_-8OK§(_loc2_);
         }
         if(_loc3_ == null)
         {
            return {"error":"Object not found: " + _loc2_};
         }
         if(!(_loc3_ is DisplayObject))
         {
            return {"error":"Target is not a DisplayObject: " + getQualifiedClassName(_loc3_)};
         }
         var _loc4_:DisplayObject = _loc3_ as DisplayObject;
         _loc4_.dispatchEvent(new MouseEvent(MouseEvent.CLICK,true,false));
         return {
            "success":true,
            "target":_loc4_.name,
            "type":getQualifiedClassName(_loc4_)
         };
      }
      
      private static function §_-6Xd§(param1:Object) : Object
      {
         var _loc2_:String = param1.path != null ? String(param1.path) : "";
         var _loc3_:int = param1.maxResults != null ? int(param1.maxResults) : 100;
         var _loc4_:* = param1.onlyVisible !== false;
         var _loc5_:DisplayObject = §_-8OK§(_loc2_);
         if(_loc5_ == null)
         {
            return {"error":"Root not found: " + _loc2_};
         }
         var _loc6_:Array = [];
         §_-3v6§(_loc5_,"",_loc6_,_loc3_,_loc4_);
         return {
            "count":_loc6_.length,
            "buttons":_loc6_
         };
      }
      
      private static function §_-3v6§(param1:DisplayObject, param2:String, param3:Array, param4:int, param5:Boolean) : void
      {
         var _loc7_:§_-BCG§ = null;
         var _loc8_:Object = null;
         var _loc9_:DisplayObjectContainer = null;
         var _loc10_:int = 0;
         if(param3.length >= param4)
         {
            return;
         }
         var _loc6_:String = param2.length > 0 ? param2 + "." + param1.name : param1.name;
         if(param1 is §_-BCG§)
         {
            if(!param5 || §_-4fE§(param1))
            {
               _loc7_ = param1 as §_-BCG§;
               _loc8_ = {
                  "path":_loc6_,
                  "type":getQualifiedClassName(param1),
                  "x":Math.round(param1.x * 100) / 100,
                  "y":Math.round(param1.y * 100) / 100,
                  "width":Math.round(param1.width * 100) / 100,
                  "height":Math.round(param1.height * 100) / 100,
                  "visible":param1.visible,
                  "disabled":_loc7_.disabled
               };
               if(_loc7_.asset != null)
               {
                  _loc8_.asset = getQualifiedClassName(_loc7_.asset);
               }
               param3.push(_loc8_);
            }
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc9_ = param1 as DisplayObjectContainer;
            _loc10_ = 0;
            while(_loc10_ < _loc9_.numChildren)
            {
               if(param3.length >= param4)
               {
                  return;
               }
               try
               {
                  §_-3v6§(_loc9_.getChildAt(_loc10_),_loc6_,param3,param4,param5);
               }
               catch(e:Error)
               {
               }
               _loc10_++;
            }
         }
      }
      
      private static function §_-4fE§(param1:DisplayObject) : Boolean
      {
         var _loc2_:DisplayObject = param1;
         while(_loc2_ != null)
         {
            if(!_loc2_.visible)
            {
               return false;
            }
            _loc2_ = _loc2_.parent;
         }
         return true;
      }
      
      private static function §_-2mG§(param1:DisplayObject, param2:int) : Object
      {
         var mc:MovieClip = null;
         var tf:TextField = null;
         var container:DisplayObjectContainer = null;
         var children:Array = null;
         var count:int = 0;
         var i:int = 0;
         var obj:DisplayObject = param1;
         var depth:int = param2;
         var node:Object = {
            "name":obj.name,
            "type":getQualifiedClassName(obj),
            "x":Math.round(obj.x * 100) / 100,
            "y":Math.round(obj.y * 100) / 100,
            "width":Math.round(obj.width * 100) / 100,
            "height":Math.round(obj.height * 100) / 100,
            "scaleX":Math.round(obj.scaleX * 1000) / 1000,
            "scaleY":Math.round(obj.scaleY * 1000) / 1000,
            "alpha":Math.round(obj.alpha * 1000) / 1000,
            "visible":obj.visible,
            "rotation":obj.rotation
         };
         if(obj is MovieClip)
         {
            mc = obj as MovieClip;
            node.currentFrame = mc.currentFrame;
            node.totalFrames = mc.totalFrames;
            node.currentLabel = mc.currentLabel;
         }
         if(obj is TextField)
         {
            tf = obj as TextField;
            node.text = tf.text.length > 200 ? tf.text.substr(0,200) + "..." : tf.text;
         }
         if(obj is DisplayObjectContainer)
         {
            container = obj as DisplayObjectContainer;
            node.numChildren = container.numChildren;
            if(depth > 0)
            {
               children = [];
               count = Math.min(container.numChildren,§_-APX§);
               i = 0;
               while(i < count)
               {
                  try
                  {
                     children.push(§_-2mG§(container.getChildAt(i),depth - 1));
                  }
                  catch(e:Error)
                  {
                     children.push({
                        "error":e.message,
                        "index":i
                     });
                  }
                  i++;
               }
               if(container.numChildren > §_-APX§)
               {
                  children.push({
                     "truncated":true,
                     "total":container.numChildren,
                     "shown":§_-APX§
                  });
               }
               node.children = children;
            }
         }
         return node;
      }
      
      private static function §_-8OK§(param1:String) : DisplayObject
      {
         var _loc3_:DisplayObject = null;
         var _loc6_:* = undefined;
         var _loc7_:String = null;
         var _loc8_:DisplayObjectContainer = null;
         var _loc9_:DisplayObject = null;
         var _loc10_:Number = NaN;
         var _loc11_:* = undefined;
         if(param1 == null || param1.length == 0 || param1 == "stage")
         {
            return Application.instance.stage;
         }
         var _loc2_:Array = param1.split(".");
         var _loc4_:String = _loc2_[0];
         switch(_loc4_)
         {
            case "stage":
               _loc3_ = Application.instance.stage;
               break;
            case "uiLayout":
               _loc3_ = Application.instance.uiLayout;
               break;
            case "app":
               _loc3_ = Application.instance;
               break;
            default:
               try
               {
                  _loc6_ = Application.instance[_loc4_];
                  if(_loc6_ is DisplayObject)
                  {
                     _loc3_ = _loc6_ as DisplayObject;
                     break;
                  }
               }
               catch(e1:Error)
               {
               }
               _loc3_ = §_-3Ee§(Application.instance,_loc4_);
               if(_loc3_ == null)
               {
                  _loc3_ = §_-3Ee§(Application.instance.stage,_loc4_);
               }
               if(_loc3_ == null)
               {
                  _loc3_ = §_-1Iq§(Application.instance.stage,_loc4_);
               }
         }
         if(_loc3_ == null)
         {
            return null;
         }
         var _loc5_:int = 1;
         while(true)
         {
            if(_loc5_ >= _loc2_.length)
            {
               return _loc3_;
            }
            _loc7_ = _loc2_[_loc5_];
            try
            {
               _loc11_ = _loc3_[_loc7_];
               if(_loc11_ is DisplayObject)
               {
                  _loc3_ = _loc11_ as DisplayObject;
                  continue;
               }
            }
            catch(e2:Error)
            {
            }
            if(!(_loc3_ is DisplayObjectContainer))
            {
               break;
            }
            _loc8_ = _loc3_ as DisplayObjectContainer;
            _loc9_ = §_-3Ee§(_loc8_,_loc7_);
            if(_loc9_ != null)
            {
               _loc3_ = _loc9_;
            }
            else
            {
               _loc10_ = Number(_loc7_);
               if(!(!isNaN(_loc10_) && _loc10_ >= 0 && _loc10_ < _loc8_.numChildren))
               {
                  return null;
               }
               _loc3_ = _loc8_.getChildAt(int(_loc10_));
            }
            _loc5_++;
         }
         return null;
      }
      
      private static function §_-3Ee§(param1:DisplayObjectContainer, param2:String) : DisplayObject
      {
         var _loc4_:DisplayObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            try
            {
               _loc4_ = param1.getChildAt(_loc3_);
               if(_loc4_.name == param2)
               {
                  return _loc4_;
               }
            }
            catch(e:Error)
            {
            }
            _loc3_++;
         }
         return null;
      }
      
      private static function §_-1Iq§(param1:DisplayObjectContainer, param2:String) : DisplayObject
      {
         var _loc4_:DisplayObject = null;
         var _loc5_:DisplayObject = null;
         var _loc3_:int = 0;
         while(_loc3_ < param1.numChildren)
         {
            try
            {
               _loc4_ = param1.getChildAt(_loc3_);
               if(_loc4_.name == param2)
               {
                  return _loc4_;
               }
               if(_loc4_ is DisplayObjectContainer)
               {
                  _loc5_ = §_-1Iq§(_loc4_ as DisplayObjectContainer,param2);
                  if(_loc5_ != null)
                  {
                     return _loc5_;
                  }
               }
            }
            catch(e:Error)
            {
            }
            _loc3_++;
         }
         return null;
      }
      
      private static function §_-CZy§(param1:DisplayObject, param2:String, param3:String, param4:Array, param5:int) : void
      {
         var _loc7_:DisplayObjectContainer = null;
         var _loc8_:int = 0;
         if(param4.length >= param5)
         {
            return;
         }
         var _loc6_:String = param3.length > 0 ? param3 + "." + param1.name : param1.name;
         if(param1.name != null && param1.name.toLowerCase().indexOf(param2) > -1)
         {
            param4.push({
               "path":_loc6_,
               "name":param1.name,
               "type":getQualifiedClassName(param1),
               "visible":param1.visible,
               "x":param1.x,
               "y":param1.y
            });
         }
         if(param1 is DisplayObjectContainer)
         {
            _loc7_ = param1 as DisplayObjectContainer;
            _loc8_ = 0;
            while(_loc8_ < _loc7_.numChildren)
            {
               if(param4.length >= param5)
               {
                  return;
               }
               try
               {
                  §_-CZy§(_loc7_.getChildAt(_loc8_),param2,_loc6_,param4,param5);
               }
               catch(e:Error)
               {
               }
               _loc8_++;
            }
         }
      }
      
      private static function §_-81q§(param1:String) : *
      {
         var _loc5_:String = null;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:String = null;
         var _loc9_:String = null;
         var _loc10_:Array = null;
         var _loc11_:Function = null;
         var _loc12_:String = null;
         var _loc2_:Array = §_-5oT§(param1);
         if(_loc2_.length == 0)
         {
            return null;
         }
         var _loc3_:* = §_-9kw§(String(_loc2_[0]));
         if(_loc3_ === undefined)
         {
            return undefined;
         }
         var _loc4_:int = 1;
         while(_loc4_ < _loc2_.length)
         {
            if(_loc3_ == null)
            {
               return null;
            }
            _loc5_ = String(_loc2_[_loc4_]);
            _loc6_ = int(_loc5_.indexOf("("));
            if(_loc6_ > 0 && _loc5_.charAt(_loc5_.length - 1) == ")")
            {
               _loc8_ = _loc5_.substring(0,_loc6_);
               _loc9_ = _loc5_.substring(_loc6_ + 1,_loc5_.length - 1);
               _loc10_ = _loc9_.length > 0 ? §_-3CV§(_loc9_) : [];
               _loc11_ = _loc3_[_loc8_] as Function;
               if(_loc11_ == null)
               {
                  return undefined;
               }
               _loc3_ = _loc11_.apply(_loc3_,_loc10_);
            }
            else
            {
               _loc7_ = int(_loc5_.indexOf("["));
               if(_loc7_ > -1 && _loc5_.charAt(_loc5_.length - 1) == "]")
               {
                  if(_loc7_ > 0)
                  {
                     _loc3_ = _loc3_[_loc5_.substring(0,_loc7_)];
                     if(_loc3_ == null)
                     {
                        return null;
                     }
                  }
                  _loc12_ = _loc5_.substring(_loc7_ + 1,_loc5_.length - 1);
                  if(_loc12_.length >= 2 && (_loc12_.charAt(0) == "\"" && _loc12_.charAt(_loc12_.length - 1) == "\"" || _loc12_.charAt(0) == "\'" && _loc12_.charAt(_loc12_.length - 1) == "\'"))
                  {
                     _loc12_ = _loc12_.substring(1,_loc12_.length - 1);
                  }
                  _loc3_ = _loc3_[_loc12_];
               }
               else
               {
                  _loc3_ = _loc3_[_loc5_];
               }
            }
            _loc4_++;
         }
         return _loc3_;
      }
      
      private static function §_-9kw§(param1:String) : *
      {
         switch(param1)
         {
            case "Context":
               return Context;
            case "Application":
               return Application.instance;
            case "app":
               return Application.instance;
            case "stage":
               return Application.instance.stage;
            case "uiLayout":
               return Application.instance.uiLayout;
            case "Config":
               return Config;
            case "player":
               return Context.player;
            case "ConsoleService":
               return ConsoleService.instance;
            default:
               if(ApplicationDomain.currentDomain.hasDefinition(param1))
               {
                  try
                  {
                     return getDefinitionByName(param1);
                  }
                  catch(e:Error)
                  {
                  }
               }
               return undefined;
         }
      }
      
      private static function §_-5oT§(param1:String) : Array
      {
         var _loc6_:String = null;
         var _loc2_:Array = [];
         var _loc3_:String = "";
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         while(_loc5_ < param1.length)
         {
            _loc6_ = param1.charAt(_loc5_);
            if(_loc6_ == "(" || _loc6_ == "[")
            {
               _loc4_++;
            }
            else if(_loc6_ == ")" || _loc6_ == "]")
            {
               _loc4_--;
            }
            if(_loc6_ == "." && _loc4_ == 0)
            {
               if(_loc3_.length > 0)
               {
                  _loc2_.push(_loc3_);
               }
               _loc3_ = "";
            }
            else
            {
               _loc3_ += _loc6_;
            }
            _loc5_++;
         }
         if(_loc3_.length > 0)
         {
            _loc2_.push(_loc3_);
         }
         return _loc2_;
      }
      
      private static function §_-3CV§(param1:String) : Array
      {
         var _loc4_:String = null;
         var _loc5_:* = undefined;
         var _loc2_:Array = param1.split(",");
         var _loc3_:Array = [];
         for each(_loc4_ in _loc2_)
         {
            _loc4_ = §_-AIf§(_loc4_);
            if(!isNaN(Number(_loc4_)) && _loc4_.length > 0)
            {
               _loc3_.push(Number(_loc4_));
            }
            else if(_loc4_ == "true")
            {
               _loc3_.push(true);
            }
            else if(_loc4_ == "false")
            {
               _loc3_.push(false);
            }
            else if(_loc4_ == "null")
            {
               _loc3_.push(null);
            }
            else if(_loc4_.length >= 2 && (_loc4_.charAt(0) == "\"" && _loc4_.charAt(_loc4_.length - 1) == "\"" || _loc4_.charAt(0) == "\'" && _loc4_.charAt(_loc4_.length - 1) == "\'"))
            {
               _loc3_.push(_loc4_.substring(1,_loc4_.length - 1));
            }
            else
            {
               _loc5_ = §_-81q§(_loc4_);
               _loc3_.push(_loc5_ !== undefined ? _loc5_ : _loc4_);
            }
         }
         return _loc3_;
      }
      
      private static function §_-3Vz§(param1:*) : *
      {
         var arr:Array = null;
         var arrLen:int = 0;
         var ai:int = 0;
         var dobj:DisplayObject = null;
         var xmlStr:String = null;
         var str:String = null;
         var value:* = param1;
         if(value == null)
         {
            return null;
         }
         if(value is String)
         {
            return value;
         }
         if(value is Number || value is int || value is uint)
         {
            return value;
         }
         if(value is Boolean)
         {
            return value;
         }
         if(value is Array)
         {
            arr = [];
            arrLen = Math.min((value as Array).length,§_-26D§);
            ai = 0;
            while(ai < arrLen)
            {
               arr.push(§_-3Vz§(value[ai]));
               ai++;
            }
            if((value as Array).length > §_-26D§)
            {
               arr.push("... (" + (value as Array).length + " total)");
            }
            return arr;
         }
         if(value is DisplayObject)
         {
            dobj = value as DisplayObject;
            return "[" + getQualifiedClassName(dobj) + " name=\"" + dobj.name + "\"]";
         }
         if(value is XML || value is XMLList)
         {
            xmlStr = value.toXMLString();
            return xmlStr.length > 500 ? xmlStr.substr(0,500) + "..." : xmlStr;
         }
         try
         {
            str = String(value);
            return {
               "_type":getQualifiedClassName(value),
               "_string":(str.length > 500 ? str.substr(0,500) + "..." : str)
            };
         }
         catch(e:Error)
         {
            return {
               "_type":getQualifiedClassName(value),
               "_error":e.message
            };
         }
      }
      
      private static function §_-RI§(param1:*, param2:String) : *
      {
         switch(param2)
         {
            case "number":
               return Number(param1);
            case "boolean":
               return param1 === true || param1 === "true" || param1 === 1;
            case "string":
               return String(param1);
            default:
               return param1;
         }
      }
      
      private static function §_-AIf§(param1:String) : String
      {
         var _loc2_:int = 0;
         var _loc3_:int = param1.length - 1;
         while(_loc2_ <= _loc3_ && param1.charCodeAt(_loc2_) <= 32)
         {
            _loc2_++;
         }
         while(_loc3_ >= _loc2_ && param1.charCodeAt(_loc3_) <= 32)
         {
            _loc3_--;
         }
         return param1.substring(_loc2_,_loc3_ + 1);
      }
   }
}

