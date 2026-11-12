package §_-25v§
{
   import §_-8a5§.JSONParseError;
   import §_-8a5§.§_-2IQ§;
   import §_-8a5§.§_-5r1§;
   import flash.events.Event;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.URLLoader;
   import flash.net.URLLoaderDataFormat;
   import flash.net.URLRequest;
   import flash.net.URLRequestHeader;
   import flash.net.URLRequestMethod;
   
   public class §_-1k3§
   {
      private var _url:String;
      
      private var §_-1ik§:String;
      
      private var §_-3zu§:Boolean;
      
      public function §_-1k3§(param1:§_-08i§)
      {
         super();
         this._url = param1.url;
         this.§_-1ik§ = param1.project;
         this.§_-3zu§ = param1.active;
      }
      
      private static function parse(param1:String, param2:Function, param3:Function) : void
      {
         var response:Object = null;
         var jsonrpc:String = null;
         var error:Object = null;
         var message:String = null;
         var json:String = param1;
         var onResponse:Function = param2;
         var onError:Function = param3;
         try
         {
            response = §_-99y§(json);
            jsonrpc = response.jsonrpc;
            if(jsonrpc != "2.0")
            {
               §_-8YG§(onError,new §_-8Kb§("There is no valid jsonrpc property"));
               return;
            }
            if(response.hasOwnProperty("result"))
            {
               §_-8YG§(onResponse,response.result);
            }
            else if(response.hasOwnProperty("error"))
            {
               error = response.error;
               message = "Jsonrpc error. code: " + error.code + ", message: " + error.message;
               §_-8YG§(onError,new §_-8Kb§(message));
            }
            else
            {
               §_-8YG§(onError,new §_-8Kb§("There is no valid result or error property"));
            }
         }
         catch(error:JSONParseError)
         {
            §_-8YG§(onError,new §_-8Kb§(error.text));
         }
      }
      
      private static function §_-8YG§(param1:Function, param2:*) : void
      {
         if(param1 != null)
         {
            param1(param2);
         }
      }
      
      private static function §_-99y§(param1:String) : *
      {
         return new §_-5r1§(param1).getValue();
      }
      
      private static function §_-54x§(param1:*) : String
      {
         return new §_-2IQ§(param1).getString();
      }
      
      public function §_-53Q§(param1:String) : void
      {
         if(!this.§_-3zu§)
         {
            return;
         }
         var _loc2_:* = [this.§_-1ik§,param1];
         this.request("staticLoadError",_loc2_);
      }
      
      public function §_-6IP§(param1:Array, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0) : void
      {
         if(!this.§_-3zu§)
         {
            return;
         }
         var _loc9_:* = [this.§_-1ik§,param1,param2,param3,param4,param5,param6,param7,param8];
         this.request("staticLoadComplete",_loc9_);
      }
      
      public function §_-7Ka§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int = 0, param7:int = 0) : void
      {
         if(!this.§_-3zu§)
         {
            return;
         }
         var _loc8_:* = [this.§_-1ik§,[],param1,param2,param3,param4,param5,param6,param7];
         this.request("staticLoadComplete",_loc8_);
      }
      
      public function §_-1CB§(param1:String, param2:String, param3:String) : void
      {
         if(!this.§_-3zu§)
         {
            return;
         }
         var _loc4_:* = [this.§_-1ik§,param1,param2,param3];
         this.request("appError",_loc4_);
      }
      
      public function §_-0Je§(param1:String, param2:String, param3:String) : void
      {
         if(!this.§_-3zu§)
         {
            return;
         }
         var _loc4_:* = [this.§_-1ik§,param1,param2,param3];
         this.request("appMessage",_loc4_);
      }
      
      public function request(param1:String, param2:Array = null, param3:Function = null, param4:Function = null) : void
      {
         var loader:URLLoader;
         var method:String = param1;
         var params:Array = param2;
         var onResponse:Function = param3;
         var onError:Function = param4;
         var request:URLRequest = new URLRequest(this._url);
         request.data = §_-54x§({
            "jsonrpc":"2.0",
            "method":method,
            "params":(!!params ? params : []),
            "id":1
         });
         request.method = URLRequestMethod.POST;
         request.requestHeaders.push(new URLRequestHeader("Content-type","application/json"));
         loader = new URLLoader();
         loader.dataFormat = URLLoaderDataFormat.TEXT;
         if(onResponse != null)
         {
            loader.addEventListener(Event.COMPLETE,function(param1:Event):void
            {
               var _loc2_:String = param1.target.data as String;
               parse(_loc2_,onResponse,onError);
            });
         }
         if(onError != null)
         {
            loader.addEventListener(IOErrorEvent.IO_ERROR,function(param1:IOErrorEvent):void
            {
               onError(new §_-8Kb§(param1.text));
            });
            loader.addEventListener(SecurityErrorEvent.SECURITY_ERROR,function(param1:SecurityErrorEvent):void
            {
               onError(new §_-8Kb§(param1.text));
            });
         }
         loader.load(request);
      }
   }
}

