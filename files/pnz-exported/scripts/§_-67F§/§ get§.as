package §_-67F§
{
   import §_-4HD§.§_-CHq§;
   import §_-4VM§.§_-7dA§;
   import §_-4fo§.§_-6VU§;
   import §_-AKx§.§_-2-c§;
   import §_-GM§.Context;
   
   public class § get§
   {
      public static const §_-6fj§:String = "facebookSocialLinkCampaign";
      
      private var _netManager:§_-7dA§ = null;
      
      private var _socialKey:String = null;
      
      public function § get§()
      {
         super();
      }
      
      public function init() : void
      {
         this._netManager = new §_-7dA§();
         this._netManager.addEventListener(§_-CHq§.§_-68U§,this.§_-6gf§);
         Context.§_-CLP§.§_-2ys§(this._netManager);
      }
      
      public function §_-9jI§(param1:Function = null) : void
      {
         var listener:Function = null;
         var callback:Function = param1;
         listener = function(param1:§_-CHq§):void
         {
            var dialog:§_-6VU§;
            var event:§_-CHq§ = param1;
            _netManager.removeEventListener(§_-CHq§.§_-1CA§,listener);
            dialog = new §_-6VU§(event);
            dialog.addEventListener(§_-2-c§.§_-41T§,function(param1:§_-2-c§):void
            {
               if(callback != null)
               {
                  callback(param1.§_-B66§.modalResult);
               }
            });
            dialog.showModal();
         };
         this._netManager.addEventListener(§_-CHq§.§_-1CA§,listener);
         this._netManager.checkSocialLinkStatus();
      }
      
      public function §_-1EU§(param1:Function) : void
      {
         var dialog:§_-6VU§;
         var loginCallback:Function = param1;
         this._socialKey = "";
         dialog = new §_-6VU§(null,function(param1:String):void
         {
            _socialKey = param1;
            loginCallback();
         });
         dialog.showModal(function(param1:§_-2-c§):void
         {
            if(param1.type == §_-2-c§.§_-41T§)
            {
               loginCallback();
            }
         });
      }
      
      public function §_-7I3§() : void
      {
         this._netManager.§_-7I3§();
      }
      
      public function §_-1JY§(param1:String) : void
      {
         this._netManager.§_-1JY§(param1);
      }
      
      private function §_-6gf§(param1:§_-CHq§) : void
      {
         this.§_-9jI§();
      }
      
      public function get §_-1AR§() : String
      {
         return this._socialKey;
      }
   }
}

