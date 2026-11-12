package §_-6lP§
{
   import §_-3eZ§.§_-2rC§;
   import §_-3eZ§.§_-9pX§;
   import §_-6JL§.§_-B9P§;
   import §_-9xx§.§_-3sA§;
   import §_-AKx§.§_-3yT§;
   import §_-Bi2§.§_-Fs§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;

   public class §_-A6V§ extends §_-3yT§
   {
      private static const WIDTH:int = 666;

      private static const §_-621§:int = 416;

      private var §_-0rP§:§_-9pX§ = null;

      private var §_-Bgu§:§_-2rC§ = null;

      public function §_-A6V§()
      {
         super(WIDTH,§_-621§,Context.§_-5o8§.message("nsCreateAvatarDialogTitle"));
      }

      override public function init() : void
      {
         super.init();
         this.§_-0rP§ = new §_-9pX§(Context.§_-5o8§.message("selectButtonTitle"),112,35);
         this.§_-0rP§.x = clientWidth / 4 - this.§_-0rP§.clientWidth / 2;
         this.§_-0rP§.y = clientHeight - this.§_-0rP§.clientHeight - 20;
         this.§_-0rP§.addEventListener(MouseEvent.CLICK,this.§_-66a§);
         addContent(this.§_-0rP§);
         this.§_-Bgu§ = new §_-2rC§(Context.§_-5o8§.message("selectButtonTitle"),112,35);
         this.§_-Bgu§.x = clientWidth - clientWidth / 4 - this.§_-Bgu§.clientWidth / 2;
         this.§_-Bgu§.y = clientHeight - this.§_-Bgu§.clientHeight - 20;
         this.§_-Bgu§.addEventListener(MouseEvent.CLICK,this.§_-1Va§);
         addContent(this.§_-Bgu§);
      }

      override protected function createSkin() : §_-Fs§
      {
         return new §_-4sZ§();
      }

      private function §_-66a§(param1:MouseEvent) : void
      {
         Context.player.avatarAppearance.gender = §_-3uA§.§_-BO7§;
         dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
         new §_-3sA§(Context.player.cloneFast()).showModal();
         close();
      }

      private function §_-1Va§(param1:MouseEvent) : void
      {
         Context.player.avatarAppearance.gender = §_-3uA§.§_-908§;
         dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
         new §_-3sA§(Context.player.cloneFast()).showModal();
         close();
      }

      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-0rP§ != null)
         {
            this.§_-0rP§.removeEventListener(MouseEvent.CLICK,this.§_-66a§);
         }
         if(this.§_-Bgu§ != null)
         {
            this.§_-Bgu§.removeEventListener(MouseEvent.CLICK,this.§_-1Va§);
         }
         super.destroy();
      }
   }
}
