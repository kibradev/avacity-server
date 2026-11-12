package §_-AFv§
{
   import §_-0Uz§.§_-m3§;
   import §_-5az§.§_-A0k§;
   import §_-6-L§.§_-6aF§;
   import §_-6BB§.§_-2qC§;
   import §_-7xl§.§_-5m-§;
   import §_-8m3§.§_-25S§;
   import §_-9Lu§.§_-AAz§;
   import §_-9VF§.§_-48g§;
   import §_-9o5§.§_-4FM§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-GM§.Context;
   import ags.§_-5x-§;
   import penzville.Config;
   
   public class §_-0Vo§ extends §_-5m-§ implements §_-m3§
   {
      public static const §_-7oN§:int = 10;
      
      public static const §_-6rb§:int = 5;
      
      private var _netManager:§_-4FM§ = null;
      
      private var §_-7CA§:§_-25S§ = null;
      
      private var §_-CGi§:Function = null;
      
      private var _enabled:Boolean = true;
      
      public function §_-0Vo§()
      {
         super();
         this._netManager = new §_-4FM§();
         this._netManager.addEventListener(§_-AAz§.§_-5mh§,this.§_-8jX§);
         this._netManager.addEventListener(§_-AAz§.§_-0Vx§,this.§_-1Yp§);
         this._netManager.addEventListener(§_-AAz§.§_-CNb§,this.§_-2nE§);
      }
      
      public function load(param1:Function) : void
      {
         if(!this.enabled)
         {
            param1(null);
            return;
         }
         if(this.§_-7CA§ != null)
         {
            param1(this.§_-7CA§);
            return;
         }
         this.§_-CGi§ = param1;
         this._netManager.loadTrash();
      }
      
      public function pickTrash(param1:String) : void
      {
         if(!this.enabled)
         {
            return;
         }
         this._netManager.pickTrash(param1);
      }
      
      public function §_-4IN§(param1:String) : void
      {
         if(!this.enabled)
         {
            return;
         }
         this._netManager.§_-4IN§(param1);
      }
      
      private function §_-1Yp§(param1:§_-AAz§) : void
      {
         var ownerId:String;
         var friend:§_-48g§ = null;
         var event:§_-AAz§ = param1;
         if(!this.enabled)
         {
            return;
         }
         ownerId = event.tag as String;
         this.§_-7CA§.§_-C7b§(ownerId);
         if(this.§_-7CA§.§_-9GB§() >= §_-7oN§)
         {
            return;
         }
         for each(friend in Context.§_-9q-§.§_-AB2§)
         {
            if(this.§_-7CA§.getUserInfo(friend.id).§_-4BA§ > 0)
            {
               return;
            }
         }
         if(§_-6aF§.toArray(Context.§_-9q-§.§_-AB2§).length < §_-7oN§ && Context.§_-2BT§.adapter.hasSocialFeature(§_-2qC§.§_-0CY§))
         {
            §_-4OH§.confirm(Context.§_-5o8§.message("trashInviteTitle"),Context.§_-5o8§.message("trashInviteMessage",{"maxCount":§_-7oN§}),function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  if(Config.§_-0nZ§)
                  {
                     Context.§_-CLP§.§_-0KB§();
                  }
                  new §_-A0k§(Context.§_-5o8§.message("invitationMessage")).showModal();
               }
            });
         }
      }
      
      private function §_-2nE§(param1:§_-AAz§) : void
      {
         var ownerId:String;
         var friend:§_-48g§ = null;
         var event:§_-AAz§ = param1;
         if(!this.enabled)
         {
            return;
         }
         ownerId = event.tag as String;
         this.§_-7CA§.§_-6fm§(ownerId);
         if(this.§_-7CA§.§_-9GB§() >= §_-7oN§)
         {
            return;
         }
         for each(friend in Context.§_-9q-§.§_-AB2§)
         {
            if(this.§_-7CA§.getUserInfo(friend.id).§_-4BA§ > 0)
            {
               return;
            }
         }
         if(§_-6aF§.toArray(Context.§_-9q-§.§_-AB2§).length < §_-7oN§ && Context.§_-2BT§.adapter.hasSocialFeature(§_-2qC§.§_-0CY§))
         {
            §_-4OH§.confirm(Context.§_-5o8§.message("trashInviteTitle"),Context.§_-5o8§.message("trashInviteMessage",{"maxCount":§_-7oN§}),function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  if(Config.§_-0nZ§)
                  {
                     Context.§_-CLP§.§_-0KB§();
                  }
                  new §_-A0k§(Context.§_-5o8§.message("invitationMessage")).showModal();
               }
            });
         }
      }
      
      private function §_-8jX§(param1:§_-AAz§) : void
      {
         if(!this.enabled)
         {
            return;
         }
         this.§_-7CA§ = param1.tag as §_-25S§;
         if(this.§_-CGi§ != null)
         {
            this.§_-CGi§(this.§_-7CA§);
            this.§_-CGi§ = null;
         }
      }
      
      public function get enabled() : Boolean
      {
         return this._enabled;
      }
      
      public function set enabled(param1:Boolean) : void
      {
         this._enabled = param1;
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.removeEventListener(§_-AAz§.§_-5mh§,this.§_-8jX§);
            this._netManager.removeEventListener(§_-AAz§.§_-0Vx§,this.§_-1Yp§);
            this._netManager.removeEventListener(§_-AAz§.§_-CNb§,this.§_-2nE§);
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

