package §_-0c2§
{
   import §_-3eZ§.BaseButton;
   import §_-4GG§.§_-0Tn§;
   import §_-4GG§.§_-92V§;
   import §_-6-L§.§_-7uH§;
   import §_-8a5§.§_-2IQ§;
   import §_-AKx§.§_-7qo§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import flash.events.Event;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-7vc§ extends §_-7qo§
   {
      private var §_-1jc§:BaseButton = null;
      
      private var §_-DH§:BaseButton = null;
      
      private var §_-1be§:§_-92V§ = null;
      
      private var §_-3DG§:§_-0Tn§ = null;
      
      private var _targetUserId:int = 0;
      
      public function §_-7vc§(param1:int)
      {
         super(330,380,§_-7uH§.§_-118§(Context.§_-5o8§.message("banButtonTitle")));
         this._targetUserId = param1;
      }
      
      override public function init() : void
      {
         super.init();
         this.§_-3DG§ = this.createChatHistoryPanel();
         addContent(this.§_-3DG§);
         this.§_-1be§ = new §_-92V§(clientWidth,20);
         this.§_-1be§.x = 0;
         this.§_-1be§.y = 5;
         addContent(this.§_-1be§);
         this.§_-DH§ = new BaseButton(Context.§_-5o8§.message("banButtonTitle"));
         this.§_-DH§.x = clientWidth / 2 - this.§_-DH§.clientWidth - 5;
         this.§_-DH§.y = clientHeight - this.§_-DH§.clientHeight;
         this.§_-DH§.disabled = true;
         addContent(this.§_-DH§);
         this.§_-1jc§ = new BaseButton(Context.§_-5o8§.message("cancelButtonTitle"));
         this.§_-1jc§.x = clientWidth / 2 + 5;
         this.§_-1jc§.y = clientHeight - this.§_-1jc§.clientHeight;
         addContent(this.§_-1jc§);
         this.§_-1jc§.addEventListener(MouseEvent.CLICK,onCloseClick);
         var _loc1_:TextField = §_-5Kl§.createTextField(0,325,Context.§_-5o8§.message("banHelpLabel").split("\\r").join("\r"),§_-5Kl§.§_-BLY§);
         addContent(_loc1_);
      }
      
      protected function createChatHistoryPanel() : §_-0Tn§
      {
         var _loc1_:§_-0Tn§ = null;
         _loc1_ = new §_-0Tn§(290,240);
         _loc1_.x = 0;
         _loc1_.y = 70;
         _loc1_.addEventListener(MouseEvent.CLICK,this.§_-0Cl§);
         _loc1_.addEventListener(MouseEvent.MOUSE_MOVE,this.§_-0Cl§);
         return _loc1_;
      }
      
      protected function §_-15R§(param1:MouseEvent) : void
      {
         if(!this.§_-3DG§.§_-5Gn§())
         {
            return;
         }
         var _loc2_:§_-2IQ§ = new §_-2IQ§(this.§_-3DG§.§_-3um§);
         var _loc3_:String = _loc2_.getString();
         Context.§_-9do§.§_-4R§(this.§_-1be§.§_-1Ni§,this._targetUserId,0,null,_loc3_);
         close();
      }
      
      protected function §_-0Cl§(param1:Event) : void
      {
         var _loc2_:* = !this.§_-3DG§.§_-5Gn§();
         this.§_-7gt§(_loc2_);
      }
      
      protected function §_-7gt§(param1:Boolean) : void
      {
         var _loc2_:Boolean = false;
         _loc2_ = this.§_-DH§.disabled;
         this.§_-DH§.disabled = param1;
         if(param1 != _loc2_)
         {
            if(param1)
            {
               this.§_-DH§.removeEventListener(MouseEvent.CLICK,this.§_-15R§);
            }
            else
            {
               this.§_-DH§.addEventListener(MouseEvent.CLICK,this.§_-15R§);
            }
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-1jc§)
         {
            this.§_-1jc§.removeEventListener(MouseEvent.CLICK,onCloseClick);
            this.§_-1jc§.destroy();
            this.§_-1jc§ = null;
         }
         if(this.§_-DH§)
         {
            this.§_-DH§.removeEventListener(MouseEvent.CLICK,this.§_-15R§);
            this.§_-DH§.destroy();
            this.§_-DH§ = null;
         }
         if(this.§_-3DG§ != null)
         {
            this.§_-3DG§.removeEventListener(MouseEvent.CLICK,this.§_-0Cl§);
            this.§_-3DG§.removeEventListener(MouseEvent.MOUSE_MOVE,this.§_-0Cl§);
            this.§_-3DG§.destroy();
            this.§_-3DG§ = null;
         }
         super.destroy();
      }
   }
}

