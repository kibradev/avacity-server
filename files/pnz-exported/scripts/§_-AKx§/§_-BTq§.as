package §_-AKx§
{
   import §_-1sb§.§_-7A5§;
   import §_-3eZ§.BaseButton;
   import §_-3eZ§.UILabelButton;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bi2§.§_-ig§;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   
   public class §_-BTq§ extends §_-7qo§
   {
      private static const §_-621§:int = 100;
      
      protected static var _translator:§_-7A5§ = §_-7A5§.§_-3OT§();
      
      protected var §_-24q§:String = "";
      
      protected var §_-CYv§:TextField = null;
      
      protected var §_-4cR§:UILabelButton = null;
      
      public function §_-BTq§(param1:int, param2:String, param3:String)
      {
         super(param1,§_-621§,param2,true);
         this.§_-24q§ = param3;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-ig§();
      }
      
      override public function init() : void
      {
         this.§_-CYv§ = §_-5Kl§.createTextField(0,0,this.§_-24q§,§_-5Kl§.§_-5Lt§);
         this.§_-CYv§.width = clientWidth - 20;
         this.§_-CYv§.autoSize = TextFieldAutoSize.LEFT;
         this.§_-CYv§.wordWrap = true;
         addContent(this.§_-CYv§);
         this.§_-4cR§ = new BaseButton(_translator.message("okButtonTitle"));
         this.§_-4cR§.modalResult = §_-0jI§.OK;
         this.§_-4cR§.x = clientWidth / 2 - this.§_-4cR§.clientWidth / 2;
         this.§_-4cR§.y = this.§_-CYv§.height + 20;
         addContent(this.§_-4cR§);
         clientHeight = this.§_-CYv§.height + 50;
      }
      
      override public function destroy() : void
      {
         this.§_-CYv§ = null;
         this.§_-4cR§ = null;
         super.destroy();
      }
   }
}

