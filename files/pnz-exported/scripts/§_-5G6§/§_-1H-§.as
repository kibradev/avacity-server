package §_-5G6§
{
   import §_-Aq0§.§_-9db§;
   import §_-Aq0§.§_-Bs9§;
   import §_-GM§.Context;
   import penzville.Config;
   
   public class §_-1H-§
   {
      private var §_-3dv§:Boolean = false;
      
      private var §_-8tc§:Boolean = false;
      
      private var §_-BEu§:Boolean = false;
      
      private var _loadingId:int = 0;
      
      public function §_-1H-§()
      {
         super();
         this.§_-3dv§ = Config.loadingStatisticUrl != null && Config.loadingStatisticUrl.length > 0 && Context.§_-2BT§.adapter.userId != null;
      }
      
      public function §_-9pe§() : void
      {
         var params:Object;
         if(!this.§_-3dv§)
         {
            return;
         }
         params = {
            "uid":Context.§_-2BT§.adapter.userId,
            "stage":2,
            "isNew":Context.preUserInfo == null || Context.preUserInfo.id == 0
         };
         this.send(params,function(param1:Object):void
         {
            _loadingId = int(param1);
         });
      }
      
      public function §_-6iy§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         if(!this.§_-3dv§ || this.§_-8tc§)
         {
            return;
         }
         this.§_-8tc§ = true;
         var _loc8_:Object = {
            "id":this._loadingId,
            "stage":3,
            "mItems":param1,
            "mCached":param2,
            "mDownloadedBytes":param3,
            "mDownloadTime":param4,
            "mDownloadSpeed":param5,
            "mExtraTries":param6,
            "mMirrorUsed":param7
         };
         this.send(_loc8_);
      }
      
      public function §_-7IO§() : void
      {
         if(!this.§_-3dv§)
         {
            return;
         }
         var _loc1_:Object = {
            "id":this._loadingId,
            "stage":4
         };
         this.send(_loc1_);
      }
      
      public function §_-9QB§(param1:int, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int) : void
      {
         if(!this.§_-3dv§ || this.§_-BEu§)
         {
            return;
         }
         this.§_-BEu§ = true;
         var _loc8_:Object = {
            "id":this._loadingId,
            "stage":5,
            "aItems":param1,
            "aCached":param2,
            "aDownloadedBytes":param3,
            "aDownloadTime":param4,
            "aDownloadSpeed":param5,
            "aExtraTries":param6,
            "aMirrorUsed":param7
         };
         this.send(_loc8_);
      }
      
      private function send(param1:Object, param2:Function = null) : void
      {
         var params:Object = param1;
         var callback:Function = param2;
         var request:§_-Bs9§ = new §_-Bs9§();
         request.url = Config.loadingStatisticUrl;
         request.§_-0fS§(params);
         if(callback != null)
         {
            request.addEventListener(§_-9db§.COMPLETE,function(param1:§_-9db§):void
            {
               var _loc2_:Object = param1.§_-6Oe§();
               if(_loc2_ != null)
               {
                  callback(_loc2_);
               }
            });
         }
         request.send();
      }
   }
}

