package §_-kr§
{
   import §_-0uA§.§_-3YE§;
   import §_-uR§.§_-53f§;
   import flash.events.NetStatusEvent;
   import flash.net.SharedObject;
   import flash.net.SharedObjectFlushStatus;
   import penzville.§_-2Vb§;
   
   public class SWFSharedManager extends §_-53f§
   {
      private static const §_-ARp§:String = "permission";
      
      private static const §_-C0l§:String = "denied";
      
      private static const §_-8s0§:String = "accept";
      
      private static const §_-3n5§:int = 30000000;
      
      private static var §_-1GD§:SharedObject = null;
      
      private static var §_-BdW§:Function = null;
      
      private static var §_-6hk§:Function = null;
      
      private static var §_-3zu§:Boolean = false;
      
      public function SWFSharedManager()
      {
         super();
      }
      
      public static function isActive() : Boolean
      {
         return §_-3zu§;
      }
      
      public static function save(param1:String, param2:String, param3:*, param4:int = 0) : void
      {
         var status:String = null;
         var name:String = param1;
         var version:String = param2;
         var content:* = param3;
         var size:int = param4;
         var share:SharedObject = load(name);
         share.data.version = version;
         share.data.content = content;
         try
         {
            status = null;
            if(size == 0)
            {
               status = share.flush();
            }
            else
            {
               status = share.flush(size);
            }
            if(status == SharedObjectFlushStatus.FLUSHED)
            {
               §_-3YE§.info("Added {swf: " + name + ", version: " + version + "} to local share");
            }
            else
            {
               §_-3YE§.info("Not added {swf: " + name + ", version: " + version + "} to local share");
            }
         }
         catch(error:Error)
         {
            §_-3YE§.§_-7aK§("SWFSharedManager.save " + error);
         }
      }
      
      public static function §_-BCR§(param1:String) : String
      {
         var _loc2_:SharedObject = load(param1);
         if(_loc2_ != null)
         {
            return _loc2_.data.version;
         }
         return null;
      }
      
      public static function §_-42G§(param1:String) : *
      {
         var _loc2_:SharedObject = load(param1);
         if(_loc2_ != null)
         {
            return _loc2_.data.content;
         }
         return null;
      }
      
      public static function canUse() : Boolean
      {
         var _loc1_:SharedObject = load(§_-ARp§);
         return _loc1_ != null && _loc1_.data.content == §_-8s0§;
      }
      
      private static function load(param1:String) : SharedObject
      {
         return §_-2Vb§.getShared(param1);
      }
      
      public static function §_-1-§(param1:Function = null, param2:Function = null) : void
      {
         var acceptCallback:Function = param1;
         var deniedCallback:Function = param2;
         §_-BdW§ = acceptCallback;
         §_-6hk§ = deniedCallback;
         §_-1GD§ = load(§_-ARp§);
         var status:String = null;
         try
         {
            status = §_-1GD§.flush(§_-3n5§);
         }
         catch(error:Error)
         {
            §_-3YE§.§_-7aK§("SWFSharedManager.requestPermissions " + error);
            return;
         }
         switch(status)
         {
            case SharedObjectFlushStatus.PENDING:
               §_-3YE§.info("Requesting permission to local share...");
               §_-1GD§.addEventListener(NetStatusEvent.NET_STATUS,handle);
               break;
            case SharedObjectFlushStatus.FLUSHED:
         }
      }
      
      private static function handle(param1:NetStatusEvent) : void
      {
         var _loc2_:Function = null;
         var _loc3_:Function = null;
         switch(param1.info.code)
         {
            case "SharedObject.Flush.Success":
               §_-3YE§.info("User ACCEPT permission to local share");
               §_-1GD§.data.content = §_-8s0§;
               if(§_-BdW§ != null)
               {
                  _loc2_ = §_-BdW§;
                  §_-BdW§ = null;
                  _loc2_();
               }
               §_-6hk§ = null;
               break;
            case "SharedObject.Flush.Failed":
               §_-3YE§.info("User DENIED permission to local share");
               §_-1GD§.data.content = §_-C0l§;
               if(§_-6hk§ != null)
               {
                  _loc3_ = §_-6hk§;
                  §_-6hk§ = null;
                  _loc3_();
               }
               §_-BdW§ = null;
         }
         §_-1GD§.flush();
         §_-1GD§.removeEventListener(NetStatusEvent.NET_STATUS,handle);
      }
   }
}

