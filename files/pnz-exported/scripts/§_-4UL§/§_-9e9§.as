package §_-4UL§
{
   import flash.events.ContextMenuEvent;
   import flash.net.URLRequest;
   import flash.net.navigateToURL;
   import flash.ui.ContextMenuItem;
   import penzville.Config;
   
   public class §_-9e9§ extends §_-1Z6§
   {
      private var §_-5yD§:Object = {
         "ru":{
            "supportLabel":"Поддержка игры",
            "communityLabel":"Сообщество игры"
         },
         "en":{
            "supportLabel":"Game Support",
            "communityLabel":"Game Community"
         }
      };
      
      public function §_-9e9§()
      {
         super();
      }
      
      override protected function get contextMenuCustomItems() : Array
      {
         var _loc1_:Array = super.contextMenuCustomItems;
         if(Config.supportUrl != null && Config.supportUrl != "")
         {
            _loc1_.push(this.§_-BXq§);
         }
         if(Config.communityUrl != null && Config.communityUrl != "")
         {
            _loc1_.push(this.§_-2wm§);
         }
         return _loc1_;
      }
      
      private function get §_-BXq§() : ContextMenuItem
      {
         var _loc1_:ContextMenuItem = new ContextMenuItem(§_-4pt§(this.§_-5yD§,"supportLabel"));
         _loc1_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.§_-07-§);
         return _loc1_;
      }
      
      private function get §_-2wm§() : ContextMenuItem
      {
         var _loc1_:ContextMenuItem = new ContextMenuItem(§_-4pt§(this.§_-5yD§,"communityLabel"));
         _loc1_.addEventListener(ContextMenuEvent.MENU_ITEM_SELECT,this.§_-53c§);
         return _loc1_;
      }
      
      private function §_-07-§(param1:ContextMenuEvent) : void
      {
         var _loc2_:String = Config.supportUrl;
         if(_loc2_ != null && !Config.disableExternalLinks)
         {
            navigateToURL(new URLRequest(_loc2_),"_blank");
         }
      }
      
      private function §_-53c§(param1:ContextMenuEvent) : void
      {
         var _loc2_:String = Config.communityUrl;
         if(_loc2_ != null && !Config.disableExternalLinks)
         {
            navigateToURL(new URLRequest(_loc2_),"_blank");
         }
      }
   }
}

