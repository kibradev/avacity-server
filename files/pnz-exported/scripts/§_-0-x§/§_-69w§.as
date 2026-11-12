package §_-0-x§
{
   import §_-0Ob§.§_-1zz§;
   import §_-309§.§_-A5Y§;
   import §_-4NF§.§_-6uR§;
   import §_-5qo§.§_-5i0§;
   import §_-8Hp§.§_-5KD§;
   import §_-A2M§.§_-4Ba§;
   import §_-B6J§.§_-3m3§;
   import §_-ByP§.§_-0CV§;
   import §_-GM§.Context;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   
   public class §_-69w§
   {
      private static const §_-8sQ§:String = "profileTransfer";
      
      private static const §_-9Ho§:String = "profileTransferSource";
      
      private static const §_-6Ov§:String = "https://api.tortuga.club/instance1/gapi/profileTransfer";
      
      private static const §_-9g9§:String = "";
      
      private var _netManager:§_-A5Y§;
      
      private var §_-3ff§:String = "https://api.tortuga.club/instance1/gapi/profileTransfer";
      
      private var §_-9lM§:String = "";
      
      private var §_-4GQ§:§_-4Ba§;
      
      public function §_-69w§()
      {
         super();
      }
      
      public function init() : void
      {
         this._netManager = new §_-A5Y§();
         this._netManager.addEventListener(§_-3m3§.§_-5u4§,this.§_-9v2§);
         Context.§_-CLP§.§_-2ys§(this._netManager);
      }
      
      public function §_-BkK§() : §_-4Ba§
      {
         if(this.§_-4GQ§ != null)
         {
            this.§_-4GQ§.reject();
            this.§_-4GQ§ = null;
         }
         this.§_-4GQ§ = new §_-4Ba§();
         var _loc1_:§_-6uR§ = new §_-6uR§();
         var _loc2_:§_-5i0§ = Context.authClient.adapter;
         _loc1_.§_-7Na§ = _loc2_.params;
         _loc1_.socialId = _loc2_.userId;
         _loc1_.socialNetwork = _loc2_.project;
         this._netManager.§_-BkK§(_loc1_);
         return this.§_-4GQ§;
      }
      
      public function get isActive() : Boolean
      {
         return §_-5KD§.instance.§_-C6D§(§_-8sQ§);
      }
      
      public function §_-3v-§() : void
      {
         this.§_-BkK§().then(function(param1:String):void
         {
            new §_-1zz§(param1).showModal();
         });
      }
      
      public function get §_-7LU§() : Boolean
      {
         var _loc1_:§_-0CV§ = §_-5KD§.instance.§_-77X§(§_-8sQ§);
         return _loc1_ != null && _loc1_.getItem(§_-9Ho§) != null;
      }
      
      public function get helpUrl() : String
      {
         return this.§_-9lM§;
      }
      
      public function §_-25Z§(param1:String) : void
      {
         navigateToURL(new URLRequest(this.§_-3ff§ + "?key=" + param1),"_blank");
      }
      
      public function §_-3wz§() : void
      {
         navigateToURL(new URLRequest(this.§_-9lM§),"_blank");
      }
      
      private function §_-9v2§(param1:§_-3m3§) : void
      {
         this.§_-3ff§ = param1.§_-2Ya§ != null ? param1.§_-2Ya§ : §_-6Ov§;
         this.§_-9lM§ = param1.helpUrl != null ? param1.helpUrl : §_-9g9§;
         if(this.§_-4GQ§ != null)
         {
            this.§_-4GQ§.resolve(param1.key);
            this.§_-4GQ§ = null;
         }
      }
   }
}

