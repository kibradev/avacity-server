package §_-4UL§
{
   import §_-6BB§.§_-8BS§;
   import §_-GM§.Context;
   import flash.events.ContextMenuEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.ui.ContextMenu;
   import flash.ui.ContextMenuItem;
   import penzville.Config;
   
   public class §_-1Z6§
   {
      private var §_-Bln§:ContextMenu = null;
      
      private var §_-BpP§:Object = {
         "ru":{"tortugaSite":"tortuga.games - сайт разработчика игры"},
         "en":{"tortugaSite":"https://tortuga.games"}
      };
      
      public function §_-1Z6§()
      {
         super();
         this.init();
      }
      
      private function init() : void
      {
         this.§_-Bln§ = new ContextMenu();
         this.§_-Bln§.hideBuiltInItems();
         this.§_-Bln§.customItems = this.contextMenuCustomItems;
      }
      
      protected function get contextMenuCustomItems() : Array
      {
         var _loc1_:Array = [];
         if(Context.§_-2BT§.adapter.socialNetwork != §_-8BS§.§_-Uu§ && Context.§_-2BT§.adapter.socialNetwork != §_-8BS§.§_-AVP§ && !Config.disableExternalLinks)
         {
            _loc1_.push(this.tortugaSiteMenuItem);
         }
         return _loc1_;
      }
      
      public function get contextMenu() : ContextMenu
      {
         return this.§_-Bln§;
      }
      
      private function get tortugaSiteMenuItem() : ContextMenuItem
      {
         var _loc1_:ContextMenuItem = new ContextMenuItem(this.§_-4pt§(this.§_-BpP§,"tortugaSite"));
         _loc1_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.§_-7bW§);
         return _loc1_;
      }
      
      private function §_-7bW§(param1:ContextMenuEvent) : void
      {
         navigateToURL(new URLRequest("https://tortuga.games"),"_blank");
      }
      
      protected function §_-4pt§(param1:Object, param2:String) : String
      {
         return !!param1.hasOwnProperty(Config.locale) ? param1[Config.locale][param2] : param1["en"][param2];
      }
   }
}

