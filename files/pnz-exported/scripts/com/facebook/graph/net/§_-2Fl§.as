package com.facebook.graph.net
{
   import §_-8a5§.JSON;
   import §_-Ahj§.§_-9XI§;
   import com.facebook.graph.core.FacebookURLDefaults;
   import com.facebook.graph.data.Batch;
   import com.facebook.graph.data.BatchItem;
   import com.facebook.graph.utils.§_-5z9§;
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.utils.ByteArray;
   
   public class §_-2Fl§ extends §_-3jK§
   {
      protected var §_-8dC§:Object;
      
      protected var §_-2o5§:String;
      
      protected var §_-7s§:Object;
      
      protected var §_-0dO§:String;
      
      protected var §_-0Ds§:Batch;
      
      public function §_-2Fl§(param1:Batch, param2:Function = null)
      {
         super();
         this.§_-0Ds§ = param1;
         _callback = param2;
      }
      
      public function call(param1:String) : void
      {
         var _loc8_:BatchItem = null;
         var _loc9_:Object = null;
         var _loc10_:Object = null;
         var _loc11_:String = null;
         var _loc12_:URLVariables = null;
         this.§_-0dO§ = param1;
         §_-77k§ = new URLRequest(FacebookURLDefaults.GRAPH_URL);
         §_-77k§.method = URLRequestMethod.POST;
         var _loc2_:Array = [];
         var _loc3_:Array = [];
         var _loc4_:Boolean = false;
         var _loc5_:Array = this.§_-0Ds§.requests;
         var _loc6_:uint = _loc5_.length;
         var _loc7_:uint = 0;
         while(_loc7_ < _loc6_)
         {
            _loc8_ = _loc5_[_loc7_];
            _loc9_ = this.§_-48H§(_loc8_.params);
            _loc10_ = {
               "method":_loc8_.requestMethod,
               "relative_url":_loc8_.relativeURL
            };
            if(_loc8_.params)
            {
               if(_loc8_.params["contentType"] != undefined)
               {
                  _loc10_.contentType = _loc8_.params["contentType"];
               }
               _loc11_ = this.§_-5Au§(_loc8_.params).toString();
               if(_loc8_.requestMethod == URLRequestMethod.GET || _loc8_.requestMethod.toUpperCase() == "DELETE")
               {
                  _loc10_.relative_url += "?" + _loc11_;
               }
               else
               {
                  _loc10_.body = _loc11_;
               }
            }
            _loc2_.push(_loc10_);
            if(_loc9_)
            {
               _loc3_.push(_loc9_);
               _loc10_.attached_files = _loc8_.params.fileName == null ? "file" + _loc7_ : _loc8_.params.fileName;
               _loc4_ = true;
            }
            else
            {
               _loc3_.push(null);
            }
            _loc7_++;
         }
         if(!_loc4_)
         {
            _loc12_ = new URLVariables();
            _loc12_.access_token = param1;
            _loc12_.batch = §_-8a5§.JSON.encode(_loc2_);
            §_-77k§.data = _loc12_;
            §_-Biz§();
         }
         else
         {
            this.§_-jw§(_loc2_,_loc3_);
         }
      }
      
      protected function §_-jw§(param1:Array, param2:Array) : void
      {
         var _loc6_:Object = null;
         var _loc7_:Object = null;
         var _loc8_:ByteArray = null;
         var _loc3_:§_-5z9§ = new §_-5z9§();
         _loc3_.§_-9LW§("access_token",this.§_-0dO§);
         _loc3_.§_-9LW§("batch",§_-8a5§.JSON.encode(param1));
         var _loc4_:uint = param1.length;
         var _loc5_:uint = 0;
         while(_loc5_ < _loc4_)
         {
            _loc6_ = param1[_loc5_];
            _loc7_ = param2[_loc5_];
            if(_loc7_)
            {
               if(_loc7_ is Bitmap)
               {
                  _loc7_ = (_loc7_ as Bitmap).bitmapData;
               }
               if(_loc7_ is ByteArray)
               {
                  _loc3_.§_-9R-§(_loc6_.attached_files,_loc7_ as ByteArray,_loc6_.contentType);
               }
               else if(_loc7_ is BitmapData)
               {
                  _loc8_ = §_-9XI§.encode(_loc7_ as BitmapData);
                  _loc3_.§_-9R-§(_loc6_.attached_files,_loc8_,"image/png");
               }
            }
            _loc5_++;
         }
         _loc3_.close();
         §_-77k§.contentType = "multipart/form-data; boundary=" + _loc3_.§_-Yg§;
         §_-77k§.data = _loc3_.getPostData();
         §_-Biz§();
      }
      
      override protected function handleDataReady() : void
      {
         var _loc4_:Object = null;
         var _loc1_:Array = _data as Array;
         var _loc2_:uint = _loc1_.length;
         var _loc3_:uint = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = §_-8a5§.JSON.§_-av§(_data[_loc3_].body);
            _data[_loc3_].body = _loc4_;
            if((this.§_-0Ds§.requests[_loc3_] as BatchItem).callback != null)
            {
               (this.§_-0Ds§.requests[_loc3_] as BatchItem).callback(_data[_loc3_]);
            }
            _loc3_++;
         }
      }
   }
}

