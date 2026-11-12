package §_-8KL§
{
   import §_-1Fx§.§_-5n7§;
   import §_-7ps§.§_-AND§;
   import §_-Btg§.§_-71s§;
   import §_-Btg§.§_-7l7§;
   import §_-Btg§.§_-8jl§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   
   public class §_-3-M§ extends §_-5n7§
   {
      private var §_-Bbc§:§_-AND§ = null;
      
      public function §_-3-M§(param1:§_-AND§)
      {
         super();
         this.§_-Bbc§ = param1;
         if(§_-71s§.instance.§_-C-q§() == null)
         {
            return;
         }
         §_-71s§.instance.§_-C-q§().setText(this.§_-Bbc§.getGenderTitle(Context.player.avatarAppearance.gender));
         if(this.§_-Bbc§.onContinue != null)
         {
            §_-71s§.instance.§_-C-q§().sendButton.addEventListener(MouseEvent.CLICK,this.onSendClick);
         }
      }
      
      private function onSendClick(param1:MouseEvent) : void
      {
         if(this.§_-Bbc§.onContinue == §_-7l7§.§_-BL§)
         {
            §_-8jl§.§_-Do§.finishStep();
         }
         else
         {
            §_-8jl§.§_-Do§.§_-1pa§(this.§_-Bbc§.onContinue);
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         §_-71s§.instance.§_-C-q§().setText("");
         if(this.§_-Bbc§.onContinue != null && §_-71s§.instance.§_-C-q§() != null)
         {
            §_-71s§.instance.§_-C-q§().sendButton.removeEventListener(MouseEvent.CLICK,this.onSendClick);
         }
         super.destroy();
      }
   }
}

