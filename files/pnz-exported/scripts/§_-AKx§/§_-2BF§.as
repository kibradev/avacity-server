package §_-AKx§
{
   import §_-1sb§.§_-7A5§;
   import §_-3eZ§.BaseButton;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bi2§.§_-ig§;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class §_-2BF§ extends §_-7qo§
   {
      private static const §_-621§:int = 100;
      
      private static var _translator:§_-7A5§ = §_-7A5§.§_-3OT§();
      
      protected var §_-CYv§:TextField;
      
      protected var §_-7Me§:BaseButton;
      
      protected var §_-4Ki§:BaseButton;
      
      private var §_-24q§:String;
      
      public function §_-2BF§(param1:int, param2:String, param3:String)
      {
         super(param1,§_-621§,param2,true);
         this.§_-24q§ = param3;
      }
      
      override public function init() : void
      {
         super.init();
         this.§_-CYv§ = §_-5Kl§.createTextField(0,0,this.§_-24q§,§_-5Kl§.§_-5Lt§);
         this.§_-CYv§.width = clientWidth;
         this.§_-CYv§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-CYv§.wordWrap = true;
         §_-AXu§.addChild(this.§_-CYv§);
         this.createButtons();
      }
      
      protected function createButtons() : void
      {
         this.§_-7Me§ = new BaseButton(_translator.message("yesButtonTitle"));
         this.§_-7Me§.modalResult = §_-0jI§.§_-9qy§;
         this.§_-7Me§.x = clientWidth / 2 - this.§_-7Me§.clientWidth - 5;
         this.§_-7Me§.y = §_-BAA§ - 30;
         addContent(this.§_-7Me§);
         this.§_-4Ki§ = new BaseButton(_translator.message("noButtonTitle"));
         this.§_-4Ki§.modalResult = §_-0jI§.NO;
         this.§_-4Ki§.x = clientWidth / 2 + 5;
         this.§_-4Ki§.y = §_-BAA§ - 30;
         addContent(this.§_-4Ki§);
         clientHeight = this.§_-CYv§.height + 50;
      }
      
      override protected function reDraw() : void
      {
         super.reDraw();
         if(this.§_-7Me§ != null)
         {
            this.§_-7Me§.x = clientWidth / 2 - this.§_-7Me§.clientWidth - 5;
            this.§_-7Me§.y = §_-BAA§ - 30;
         }
         if(this.§_-4Ki§ != null)
         {
            this.§_-4Ki§.x = clientWidth / 2 + 5;
            this.§_-4Ki§.y = §_-BAA§ - 30;
         }
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-ig§();
      }
      
      override public function destroy() : void
      {
         this.§_-CYv§ = null;
         this.§_-7Me§ = null;
         this.§_-4Ki§ = null;
         super.destroy();
      }
   }
}

