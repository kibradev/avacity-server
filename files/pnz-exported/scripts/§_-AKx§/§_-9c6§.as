package §_-AKx§
{
   import §_-1sb§.§_-7A5§;
   import §_-3eZ§.UILabelButton;
   import §_-3eZ§.§_-2UU§;
   import §_-3eZ§.§_-7Oo§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-At5§;
   import §_-Bi2§.§_-Fs§;
   import §_-GM§.Context;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import flash.text.TextFormatAlign;
   
   public class §_-9c6§ extends §_-3yT§
   {
      private static const §_-621§:int = 100;
      
      protected static var _translator:§_-7A5§ = §_-7A5§.§_-3OT§();
      
      protected var §_-CYv§:TextField;
      
      protected var §_-7Me§:UILabelButton;
      
      protected var §_-4Ki§:UILabelButton;
      
      private var §_-24q§:String;
      
      public function §_-9c6§(param1:int, param2:String, param3:String)
      {
         super(param1,§_-621§,param2);
         if(Context.instance.§_-AIA§.§_-3OB§)
         {
            this.§_-24q§ = §_-5Kl§.§_-8nE§("p",param3,{});
         }
         else
         {
            this.§_-24q§ = "<p><center>" + param3 + "</center></p>";
         }
      }
      
      override public function init() : void
      {
         this.§_-CYv§ = §_-5Kl§.§_-Ae-§(0,25,this.§_-24q§,§_-5Kl§.§_-BGn§,{
            "size":15,
            "align":TextFormatAlign.CENTER
         });
         this.§_-CYv§.width = clientWidth - 40;
         this.§_-CYv§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-CYv§.wordWrap = true;
         this.§_-CYv§.x = clientWidth / 2 - this.§_-CYv§.width / 2;
         addContent(this.§_-CYv§);
         this.createButtons();
         clientHeight = this.§_-CYv§.height + 110;
      }
      
      override protected function reDraw() : void
      {
         super.reDraw();
         if(this.§_-7Me§ != null)
         {
            this.§_-7Me§.x = clientWidth / 2 - this.§_-7Me§.clientWidth - 20;
            this.§_-7Me§.y = clientHeight - this.§_-7Me§.height - 30;
         }
         if(this.§_-4Ki§ != null)
         {
            this.§_-4Ki§.x = clientWidth / 2 + 20;
            this.§_-4Ki§.y = clientHeight - this.§_-4Ki§.height - 30;
         }
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-At5§();
      }
      
      protected function createButtons() : void
      {
         this.§_-7Me§ = new §_-7Oo§(_translator.message("yesButtonTitle"));
         this.§_-7Me§.modalResult = §_-0jI§.§_-9qy§;
         this.§_-7Me§.x = clientWidth / 2 - this.§_-7Me§.clientWidth - 20;
         this.§_-7Me§.y = clientHeight - this.§_-7Me§.height - 30;
         addContent(this.§_-7Me§);
         this.§_-4Ki§ = new §_-2UU§(_translator.message("noButtonTitle"));
         this.§_-4Ki§.modalResult = §_-0jI§.NO;
         this.§_-4Ki§.x = clientWidth / 2 + 20;
         this.§_-4Ki§.y = clientHeight - this.§_-4Ki§.height - 30;
         addContent(this.§_-4Ki§);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-CYv§ = null;
         this.§_-7Me§ = null;
         this.§_-4Ki§ = null;
         super.destroy();
      }
   }
}

