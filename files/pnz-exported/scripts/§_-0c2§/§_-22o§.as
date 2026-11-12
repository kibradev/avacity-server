package §_-0c2§
{
   import §_-3eZ§.BaseButton;
   import §_-4UW§.§_-5qx§;
   import §_-6-L§.DisplayUtils;
   import §_-6-L§.§_-7uH§;
   import §_-6JL§.§_-B9P§;
   import §_-8Yw§.§_-6CX§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-7qo§;
   import §_-AaA§.§_-5Kl§;
   import §_-B4k§.§_-4-8§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFieldType;
   import penzville.Config;
   
   public class §_-22o§ extends §_-7qo§
   {
      public static const §_-7Zr§:int = 0;
      
      private var _targetUserId:int = 0;
      
      private var §_-1jc§:BaseButton = null;
      
      private var §_-DH§:BaseButton = null;
      
      private var §_-8zq§:§_-4-8§ = null;
      
      private var _message:§_-6CX§ = null;
      
      public function §_-22o§(param1:int)
      {
         var _loc2_:TextField = null;
         super(400,220,§_-7uH§.§_-118§(Context.§_-5o8§.message("moderatorMessageDialogTitle")));
         this._targetUserId = param1;
         _loc2_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("messageCategory"),§_-5Kl§.§_-BGn§);
         addContent(_loc2_);
         this.§_-8zq§ = new §_-4-8§(this.getCategories(),clientWidth - _loc2_.x - _loc2_.width - 7);
         this.§_-8zq§.x = _loc2_.x + _loc2_.width + 5 + _skin.clientBounds.left;
         this.§_-8zq§.y = _loc2_.y + _skin.clientBounds.top;
         addContentOverlay(this.§_-8zq§);
         this.§_-8zq§.addEventListener(§_-B9P§.SELECTED,this.onCategorySelected);
         var _loc3_:TextField = §_-5Kl§.createTextField(0,35,Context.§_-5o8§.message("moderatorMessageFormLabel"),§_-5Kl§.§_-BGn§);
         addContent(_loc3_);
         this._message = new §_-6CX§(clientWidth,110);
         this._message.y = _loc3_.y + _loc3_.height + 5;
         this._message.addEventListener(MouseEvent.CLICK,this.§_-22p§);
         addContent(this._message);
         this.§_-DH§ = new BaseButton(Context.§_-5o8§.message("sendButtonTitle"));
         this.§_-DH§.x = clientWidth / 2 - this.§_-DH§.clientWidth - 5;
         this.§_-DH§.y = clientHeight - this.§_-DH§.clientHeight;
         addContent(this.§_-DH§);
         this.§_-DH§.addEventListener(MouseEvent.CLICK,this.onSendClick);
         this.§_-1jc§ = new BaseButton(Context.§_-5o8§.message("cancelButtonTitle"));
         this.§_-1jc§.x = clientWidth / 2 + 5;
         this.§_-1jc§.y = clientHeight - this.§_-1jc§.clientHeight;
         addContent(this.§_-1jc§);
         this.§_-1jc§.addEventListener(MouseEvent.CLICK,onCloseClick);
         DisplayUtils.§_-6zB§(this.§_-8zq§);
         this.§_-4Vw§();
      }
      
      private function onCategorySelected(param1:§_-B9P§) : void
      {
         var _loc2_:§_-5qx§ = Context.§_-05q§.§_-8-D§(this.§_-8zq§.value as int);
         if(_loc2_ == null && this.§_-8zq§.value != §_-7Zr§)
         {
            this.§_-4Vw§();
            return;
         }
         this._message.text = _loc2_ != null ? _loc2_.localizedDescription : Context.§_-5o8§.message("messageText0");
         this._message.input.selectable = this.§_-8zq§.value == §_-7Zr§;
         this._message.input.type = this.§_-8zq§.value == §_-7Zr§ ? TextFieldType.INPUT : TextFieldType.DYNAMIC;
      }
      
      private function getCategories() : Array
      {
         var _loc2_:Object = null;
         var _loc3_:§_-5qx§ = null;
         var _loc1_:Array = [{
            "value":§_-7Zr§,
            "itemLabel":Context.§_-5o8§.message("messageCategory0")
         }];
         for each(_loc2_ in Context.§_-05q§.notifications)
         {
            _loc3_ = _loc2_ as §_-5qx§;
            _loc1_.push({
               "itemLabel":_loc3_.localizedTitle,
               "value":_loc3_.id
            });
         }
         return _loc1_;
      }
      
      private function §_-4Vw§() : void
      {
         this.§_-8zq§.§_-3Ph§(0);
         this.onCategorySelected(new §_-B9P§(§_-B9P§.UPDATE,this.§_-8zq§.value));
      }
      
      private function onSendClick(param1:MouseEvent) : void
      {
         this.send();
      }
      
      private function send() : void
      {
         var _loc1_:§_-5qx§ = Context.§_-05q§.§_-8-D§(this.§_-8zq§.value as int);
         if(_loc1_ == null && this.§_-8zq§.value != §_-7Zr§)
         {
            this.§_-4Vw§();
            return;
         }
         var _loc2_:String = "";
         if(this.§_-8zq§.value == §_-7Zr§)
         {
            if(this._message.text.length == 0)
            {
               return;
            }
            _loc2_ = this._message.text;
         }
         Context.§_-9do§.moderatorMessage(this._targetUserId,this.§_-8zq§.value as int,_loc2_);
         close();
      }
      
      private function §_-22p§(param1:MouseEvent) : void
      {
         var event:MouseEvent = param1;
         if(Config.§_-0nZ§ && !Config.§_-0WN§)
         {
            Context.§_-BlB§.§_-Bsv§(function(param1:int):void
            {
               if(param1 == §_-0jI§.§_-9qy§ && Context.§_-CLP§.§_-8vQ§)
               {
                  Context.§_-CLP§.§_-0KB§();
               }
            });
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-8zq§ != null)
         {
            this.§_-8zq§.removeEventListener(§_-B9P§.SELECTED,this.onCategorySelected);
            this.§_-8zq§.destroy();
            this.§_-8zq§ = null;
         }
         if(this.§_-1jc§)
         {
            this.§_-1jc§.removeEventListener(MouseEvent.CLICK,onCloseClick);
            this.§_-1jc§.destroy();
            this.§_-1jc§ = null;
         }
         if(this.§_-DH§)
         {
            this.§_-DH§.removeEventListener(MouseEvent.CLICK,this.onSendClick);
            this.§_-DH§.destroy();
            this.§_-DH§ = null;
         }
         super.destroy();
      }
   }
}

