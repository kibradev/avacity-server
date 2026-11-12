package §_-02i§
{
   import §_-1Fr§.§_-0Ov§;
   import §_-3CW§.SocialChannelsTabItem;
   import §_-3eZ§.§_-2UU§;
   import §_-3eZ§.§_-7Oo§;
   import §_-6-L§.§_-7uH§;
   import §_-6JL§.§_-1yb§;
   import §_-6JL§.§_-5L§;
   import §_-6JL§.§_-B9P§;
   import §_-AKx§.§_-3yT§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import penzville.Config;
   
   public class §_-AN6§ extends §_-3yT§
   {
      private var §_-1Z5§:§_-7Oo§ = null;
      
      private var §_-x3§:§_-2UU§ = null;
      
      private var _tabulator:§_-1yb§ = null;
      
      private var §_-2u6§:Array = null;
      
      public function §_-AN6§(param1:Array)
      {
         super(600,505,§_-7uH§.§_-118§(Context.§_-5o8§.message("helpTitle")));
         this.§_-2u6§ = param1;
      }
      
      override public function init() : void
      {
         var panel:SocialChannelsTabItem = null;
         super.init();
         panel = new SocialChannelsTabItem(this.§_-2u6§);
         panel.x = 13;
         panel.y = 13;
         addContent(panel);
         if(Context.§_-5yK§ != null)
         {
            Context.§_-5yK§.init(function():void
            {
               var _loc1_:§_-0Ov§ = null;
               if(Context.§_-5yK§.isActive)
               {
                  _loc1_ = new §_-0Ov§(Context.§_-5o8§.message("ticketTabTitle"));
                  _tabulator.addTab(_loc1_);
                  _tabulator.addEventListener(§_-B9P§.SELECTED,onTabSelected);
               }
            });
         }
         this.§_-x3§ = new §_-2UU§(§_-7uH§.§_-118§(Context.§_-5o8§.message("closeButtonTitle")),100);
         this.§_-x3§.y = clientHeight - this.§_-x3§.clientHeight - 12;
         this.§_-x3§.x = clientWidth / 2 - this.§_-x3§.width / 2;
         this.§_-x3§.addEventListener(MouseEvent.CLICK,onCloseClick);
         addContent(this.§_-x3§);
         this.§_-1Z5§ = new §_-7Oo§(§_-7uH§.§_-118§(Context.§_-5o8§.message("internalOfferTabTitle")),100);
         this.§_-1Z5§.y = clientHeight - this.§_-1Z5§.clientHeight - 12;
         this.§_-1Z5§.addEventListener(MouseEvent.CLICK,this.§_-CGg§);
         addContent(this.§_-1Z5§);
         this.§_-x3§.x = clientWidth / 2 - (this.§_-x3§.clientWidth + this.§_-1Z5§.clientWidth + 10) / 2 + this.§_-1Z5§.clientWidth + 25;
         this.§_-1Z5§.x = clientWidth / 2 - (this.§_-x3§.clientWidth + this.§_-1Z5§.clientWidth + 10) / 2;
         this.§_-Bny§();
      }
      
      private function §_-Bny§() : void
      {
         var _loc1_:TextField = null;
         _loc1_ = §_-5Kl§.createTextField(0,0,"v" + Config.version,§_-5Kl§.§_-BLY§);
         _loc1_.x = clientWidth - _loc1_.width - 12;
         _loc1_.y = clientHeight - _loc1_.height - 10;
         addContent(_loc1_);
      }
      
      private function onTabSelected(param1:§_-B9P§) : void
      {
         var _loc2_:§_-5L§ = param1.currentTarget.getTab(param1.value);
         if(_loc2_ is §_-0Ov§)
         {
            if(Context.§_-5yK§ != null && Context.§_-5yK§.isActive)
            {
               Context.§_-5yK§.getTickets();
            }
         }
      }
      
      private function §_-CGg§(param1:MouseEvent) : void
      {
         new §_-3b-§().showModal();
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-1Z5§ != null)
         {
            this.§_-1Z5§.removeEventListener(MouseEvent.CLICK,this.§_-CGg§);
            this.§_-1Z5§.destroy();
            this.§_-1Z5§ = null;
         }
         if(this.§_-x3§ != null)
         {
            this.§_-x3§.removeEventListener(MouseEvent.CLICK,onCloseClick);
            this.§_-x3§.destroy();
            this.§_-x3§ = null;
         }
         if(this._tabulator != null)
         {
            if(this._tabulator.hasEventListener(§_-B9P§.SELECTED))
            {
               this._tabulator.removeEventListener(§_-B9P§.SELECTED,this.onTabSelected);
            }
            this._tabulator.destroy();
            this._tabulator = null;
         }
         super.destroy();
      }
   }
}

