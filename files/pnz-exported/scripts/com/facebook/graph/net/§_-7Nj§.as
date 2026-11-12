package com.facebook.graph.net
{
   import flash.events.DataEvent;
   import flash.events.ErrorEvent;
   import flash.events.IOErrorEvent;
   import flash.events.SecurityErrorEvent;
   import flash.net.FileReference;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   
   public class §_-7Nj§ extends §_-3jK§
   {
      protected var §_-2ya§:FileReference;
      
      public function §_-7Nj§()
      {
         super();
      }
      
      public function call(param1:String, param2:String = "GET", param3:Function = null, param4:* = null) : void
      {
         _url = param1;
         §_-4af§ = param2;
         _callback = param3;
         var _loc5_:String = param1;
         §_-77k§ = new URLRequest(_loc5_);
         §_-77k§.method = §_-4af§;
         if(param4 == null)
         {
            §_-Biz§();
            return;
         }
         var _loc6_:Object = §_-48H§(param4);
         if(_loc6_ == null)
         {
            §_-77k§.data = §_-5Au§(param4);
            §_-Biz§();
            return;
         }
         if(_loc6_ is FileReference)
         {
            §_-77k§.data = §_-5Au§(param4);
            §_-77k§.method = URLRequestMethod.POST;
            this.§_-2ya§ = _loc6_ as FileReference;
            this.§_-2ya§.addEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.§_-6hM§,false,0,true);
            this.§_-2ya§.addEventListener(IOErrorEvent.IO_ERROR,this.§_-A30§,false,0,false);
            this.§_-2ya§.addEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§_-A30§,false,0,false);
            this.§_-2ya§.upload(§_-77k§);
            return;
         }
         §_-77k§.data = §_-BfG§(_loc6_,param4).getPostData();
         §_-77k§.method = URLRequestMethod.POST;
         §_-Biz§();
      }
      
      override public function close() : void
      {
         super.close();
         if(this.§_-2ya§ != null)
         {
            this.§_-2ya§.removeEventListener(DataEvent.UPLOAD_COMPLETE_DATA,this.§_-6hM§);
            this.§_-2ya§.removeEventListener(IOErrorEvent.IO_ERROR,this.§_-A30§);
            this.§_-2ya§.removeEventListener(SecurityErrorEvent.SECURITY_ERROR,this.§_-A30§);
            try
            {
               this.§_-2ya§.cancel();
            }
            catch(e:*)
            {
            }
            this.§_-2ya§ = null;
         }
      }
      
      protected function §_-6hM§(param1:DataEvent) : void
      {
         §_-4rk§(param1.data);
      }
      
      protected function §_-A30§(param1:ErrorEvent) : void
      {
         §_-eU§ = false;
         _data = param1;
         §_-6Ax§();
      }
   }
}

