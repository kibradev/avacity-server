package com.facebook.graph.core
{
   import com.facebook.graph.data.Batch;
   import com.facebook.graph.data.FQLMultiQuery;
   import com.facebook.graph.data.FacebookAuthResponse;
   import com.facebook.graph.data.FacebookSession;
   import com.facebook.graph.net.§_-2Fl§;
   import com.facebook.graph.net.§_-7Nj§;
   import com.facebook.graph.utils.§_-1wt§;
   import com.facebook.graph.utils.§_-24f§;
   import flash.net.URLRequestMethod;
   import flash.utils.Dictionary;
   
   public class AbstractFacebook
   {
      protected var session:FacebookSession;
      
      protected var authResponse:FacebookAuthResponse;
      
      protected var oauth2:Boolean;
      
      protected var openRequests:Dictionary;
      
      protected var resultHash:Dictionary;
      
      protected var locale:String;
      
      protected var parserHash:Dictionary;
      
      public function AbstractFacebook()
      {
         super();
         this.openRequests = new Dictionary();
         this.resultHash = new Dictionary(true);
         this.parserHash = new Dictionary();
      }
      
      protected function get accessToken() : String
      {
         if(this.oauth2 && this.authResponse != null || this.session != null)
         {
            return this.oauth2 ? this.authResponse.accessToken : this.session.accessToken;
         }
         return null;
      }
      
      protected function api(param1:String, param2:Function = null, param3:* = null, param4:String = "GET") : void
      {
         param1 = param1.indexOf("/") != 0 ? "/" + param1 : param1;
         if(this.accessToken)
         {
            if(param3 == null)
            {
               param3 = {};
            }
            if(param3.access_token == null)
            {
               param3.access_token = this.accessToken;
            }
         }
         var _loc5_:§_-7Nj§ = new §_-7Nj§();
         if(this.locale)
         {
            param3.locale = this.locale;
         }
         this.openRequests[_loc5_] = param2;
         _loc5_.call(FacebookURLDefaults.GRAPH_URL + param1,param4,this.handleRequestLoad,param3);
      }
      
      protected function uploadVideo(param1:String, param2:Function = null, param3:* = null) : void
      {
         param1 = param1.indexOf("/") != 0 ? "/" + param1 : param1;
         if(this.accessToken)
         {
            if(param3 == null)
            {
               param3 = {};
            }
            if(param3.access_token == null)
            {
               param3.access_token = this.accessToken;
            }
         }
         var _loc4_:§_-7Nj§ = new §_-7Nj§();
         if(this.locale)
         {
            param3.locale = this.locale;
         }
         this.openRequests[_loc4_] = param2;
         _loc4_.call(FacebookURLDefaults.VIDEO_URL + param1,"POST",this.handleRequestLoad,param3);
      }
      
      protected function pagingCall(param1:String, param2:Function) : §_-7Nj§
      {
         var _loc3_:§_-7Nj§ = new §_-7Nj§();
         this.openRequests[_loc3_] = param2;
         _loc3_.§_-8KB§(this.handleRequestLoad,param1,this.locale);
         return _loc3_;
      }
      
      protected function getRawResult(param1:Object) : Object
      {
         return this.resultHash[param1];
      }
      
      protected function nextPage(param1:Object, param2:Function = null) : §_-7Nj§
      {
         var _loc3_:§_-7Nj§ = null;
         var _loc4_:Object = this.getRawResult(param1);
         if(_loc4_ && _loc4_.paging && Boolean(_loc4_.paging.next))
         {
            _loc3_ = this.pagingCall(_loc4_.paging.next,param2);
         }
         else if(param2 != null)
         {
            param2(null,"no page");
         }
         return _loc3_;
      }
      
      protected function previousPage(param1:Object, param2:Function = null) : §_-7Nj§
      {
         var _loc3_:§_-7Nj§ = null;
         var _loc4_:Object = this.getRawResult(param1);
         if(_loc4_ && _loc4_.paging && Boolean(_loc4_.paging.previous))
         {
            _loc3_ = this.pagingCall(_loc4_.paging.previous,param2);
         }
         else if(param2 != null)
         {
            param2(null,"no page");
         }
         return _loc3_;
      }
      
      protected function handleRequestLoad(param1:§_-7Nj§) : void
      {
         var _loc3_:Object = null;
         var _loc4_:§_-1wt§ = null;
         var _loc2_:Function = this.openRequests[param1];
         if(_loc2_ === null)
         {
            delete this.openRequests[param1];
         }
         if(param1.success)
         {
            _loc3_ = "data" in param1.data ? param1.data.data : param1.data;
            this.resultHash[_loc3_] = param1.data;
            if(_loc3_.hasOwnProperty("error_code"))
            {
               _loc2_(null,_loc3_);
            }
            else
            {
               if(this.parserHash[param1] is §_-1wt§)
               {
                  _loc4_ = this.parserHash[param1] as §_-1wt§;
                  _loc3_ = _loc4_.parse(_loc3_);
                  this.parserHash[param1] = null;
                  delete this.parserHash[param1];
               }
               _loc2_(_loc3_,null);
            }
         }
         else
         {
            _loc2_(null,param1.data);
         }
         delete this.openRequests[param1];
      }
      
      protected function callRestAPI(param1:String, param2:Function = null, param3:* = null, param4:String = "GET") : void
      {
         var _loc6_:§_-1wt§ = null;
         if(param3 == null)
         {
            param3 = {};
         }
         param3.format = "json";
         if(this.accessToken)
         {
            param3.access_token = this.accessToken;
         }
         if(this.locale)
         {
            param3.locale = this.locale;
         }
         var _loc5_:§_-7Nj§ = new §_-7Nj§();
         this.openRequests[_loc5_] = param2;
         if(this.parserHash[param3["queries"]] is §_-1wt§)
         {
            _loc6_ = this.parserHash[param3["queries"]] as §_-1wt§;
            this.parserHash[param3["queries"]] = null;
            delete this.parserHash[param3["queries"]];
            this.parserHash[_loc5_] = _loc6_;
         }
         _loc5_.call(FacebookURLDefaults.API_URL + "/method/" + param1,param4,this.handleRequestLoad,param3);
      }
      
      protected function fqlQuery(param1:String, param2:Function = null, param3:Object = null) : void
      {
         var _loc4_:String = null;
         for(_loc4_ in param3)
         {
            param1 = param1.replace(new RegExp("\\{" + _loc4_ + "\\}","g"),param3[_loc4_]);
         }
         this.callRestAPI("fql.query",param2,{"query":param1});
      }
      
      protected function fqlMultiQuery(param1:FQLMultiQuery, param2:Function = null, param3:§_-1wt§ = null) : void
      {
         this.parserHash[param1.toString()] = param3 != null ? param3 : new §_-24f§();
         this.callRestAPI("fql.multiquery",param2,{"queries":param1.toString()});
      }
      
      protected function batchRequest(param1:Batch, param2:Function = null) : void
      {
         var _loc3_:§_-2Fl§ = null;
         if(this.accessToken)
         {
            _loc3_ = new §_-2Fl§(param1,param2);
            this.resultHash[_loc3_] = true;
            _loc3_.call(this.accessToken);
         }
      }
      
      protected function deleteObject(param1:String, param2:Function = null) : void
      {
         var _loc3_:Object = {"method":"delete"};
         this.api(param1,param2,_loc3_,URLRequestMethod.POST);
      }
      
      protected function getImageUrl(param1:String, param2:String = null) : String
      {
         return FacebookURLDefaults.GRAPH_URL + "/" + param1 + "/picture" + (param2 != null ? "?type=" + param2 : "");
      }
   }
}

