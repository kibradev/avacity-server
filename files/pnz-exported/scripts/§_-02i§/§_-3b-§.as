package §_-02i§
{
   import §_-1Fr§.§_-9Xp§;
   import §_-1iV§.§_-BkM§;
   import §_-3eZ§.§_-7Oo§;
   import §_-AKx§.§_-3yT§;
   import §_-AaA§.§_-22D§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import flash.events.KeyboardEvent;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormatAlign;
   import flash.ui.Keyboard;
   
   public class §_-3b-§ extends §_-3yT§
   {
      private var §_-9ss§:§_-9Xp§ = null;
      
      private var §_-5wu§:§_-7Oo§;
      
      public function §_-3b-§()
      {
         super(460,240,Context.§_-5o8§.message("internalOfferTabTitle"));
      }
      
      override public function init() : void
      {
         var _loc1_:§_-22D§ = null;
         _loc1_ = new §_-22D§(400,110,§_-22D§.BORDER_NONE,§_-22D§.§_-Et§,10);
         _loc1_.x = 27;
         _loc1_.y = 5;
         addContent(_loc1_);
         var _loc2_:TextField = §_-5Kl§.createTextField(24,18,Context.§_-5o8§.message("internalOfferTabDescription"),§_-5Kl§.§_-BGn§,{
            "size":15,
            "font":"CalibriI",
            "wordWrap":true,
            "align":TextFormatAlign.CENTER
         });
         _loc2_.width = 360;
         _loc1_.addChild(_loc2_);
         this.§_-9ss§ = new §_-9Xp§(270,33,TextFormatAlign.CENTER,false,Context.§_-5o8§.message("internalOfferInputTitle"));
         this.§_-9ss§.y = 135;
         this.§_-9ss§.textField.y = this.§_-9ss§.height / 2 - 10;
         this.§_-9ss§.x = (clientWidth - this.§_-9ss§.width) / 2;
         addContent(this.§_-9ss§);
         this.§_-5wu§ = new §_-7Oo§(Context.§_-5o8§.message("internalOfferTabActivateButtonLabel"),160,33);
         this.§_-5wu§.x = (clientWidth - this.§_-5wu§.width) / 2 + 3;
         this.§_-5wu§.y = 190;
         this.§_-5wu§.addEventListener(MouseEvent.CLICK,this.§_-3qv§);
         addContent(this.§_-5wu§);
         this.§_-9ss§.textField.addEventListener(KeyboardEvent.KEY_DOWN,this.§_-8mX§);
         §_-BkM§.getStage().focus = this.§_-9ss§.textField;
      }
      
      private function §_-8mX§(param1:KeyboardEvent) : void
      {
         if(param1.keyCode == Keyboard.ENTER)
         {
            this.§_-3qv§(null);
         }
      }
      
      private function §_-3qv§(param1:MouseEvent) : void
      {
         var _loc2_:String = this.§_-9ss§.text;
         if(_loc2_ != null && _loc2_.length > 0)
         {
            Context.§_-8Rv§.§_-2si§(_loc2_);
            this.§_-9ss§.text = "";
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-5wu§ != null)
         {
            this.§_-5wu§.removeEventListener(MouseEvent.CLICK,this.§_-3qv§);
         }
         if(this.§_-9ss§ != null && this.§_-9ss§.textField != null)
         {
            this.§_-9ss§.textField.removeEventListener(KeyboardEvent.KEY_DOWN,this.§_-8mX§);
         }
         super.destroy();
      }
   }
}

