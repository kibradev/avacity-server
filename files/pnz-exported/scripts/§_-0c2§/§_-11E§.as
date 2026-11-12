package §_-0c2§
{
   import §_-18o§.§_-8-S§;
   import §_-3Kp§.§_-3n0§;
   import §_-3eZ§.§_-7Oo§;
   import §_-4UW§.§_-9es§;
   import §_-6-L§.§_-7uH§;
   import §_-8a5§.§_-5r1§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-3yT§;
   import §_-AKx§.§_-4OH§;
   import §_-AaA§.§_-5Kl§;
   import §_-B6f§.§_-7wF§;
   import §_-B9N§.§_-79O§;
   import §_-BJ1§.§_-5y5§;
   import §_-Bwh§.§_-AMW§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.net.URLRequest;
   import flash.net.URLRequestMethod;
   import flash.net.URLVariables;
   import flash.net.navigateToURL;
   import flash.text.TextField;
   import flash.text.TextFieldAutoSize;
   import penzville.Config;
   
   public class §_-11E§ extends §_-3yT§
   {
      private static const §_-8kN§:int = 200;
      
      private static const §_-CSc§:int = 6;
      
      private static const §_-1R§:int = 7;
      
      private static const §_-9cm§:String = Config.supportUrl + "/Tickets/Submit/RenderForm";
      
      private static const §_-APK§:int = 604800000;
      
      private var §_-9tI§:§_-79O§ = null;
      
      private var §_-570§:§_-7wF§ = null;
      
      public function §_-11E§(param1:§_-79O§)
      {
         var _loc2_:String = null;
         super(420,250,Context.§_-5o8§.message("youAreBanned"));
         this.§_-9tI§ = param1;
         if(this.§_-9tI§.unbanType != null && this.§_-9tI§.unbanType != §_-5y5§.§_-91j§)
         {
            if(this.§_-9tI§.unbanType.indexOf("product:") >= 0)
            {
               _loc2_ = this.§_-9tI§.unbanType.split(":")[1];
               this.§_-570§ = Context.§_-2hc§.§_-5Yn§(_loc2_);
            }
         }
      }
      
      override public function init() : void
      {
         var timeLeft:Number;
         var category:§_-9es§;
         var description:String;
         var descriptionField:TextField = null;
         var posY:int = 0;
         var okButton:§_-7Oo§ = null;
         var supportButton:§_-7Oo§ = null;
         var history:Array = null;
         var decoder:§_-5r1§ = null;
         var name:String = null;
         var historyPanel:§_-3n0§ = null;
         super.init();
         timeLeft = this.§_-9tI§.leftTime;
         category = Context.§_-05q§.getCategory(this.§_-9tI§.reasonId);
         description = Context.§_-5o8§.message("banInfoMessage",{
            "reason":category.localizedDescription,
            "leftTime":§_-8-S§.§_-2Xf§(timeLeft,false,true)
         });
         if(this.§_-570§ != null)
         {
            description += "<br/>" + Context.§_-5o8§.message("unbanLabel",{"coins":§_-AMW§.§_-B7i§(this.§_-570§.points,this.§_-570§.id)});
         }
         descriptionField = §_-5Kl§.§_-Ae-§(0,0,"<p><center>" + description + "</center></p>");
         descriptionField.width = clientWidth;
         descriptionField.autoSize = TextFieldAutoSize.LEFT;
         descriptionField.wordWrap = true;
         addContent(descriptionField);
         clientHeight = descriptionField.height + 50;
         posY = descriptionField.y + descriptionField.height;
         if(this.§_-9tI§.notes != null && §_-7uH§.§_-AIf§(this.§_-9tI§.notes) != "")
         {
            history = null;
            try
            {
               decoder = new §_-5r1§(this.§_-9tI§.notes);
               history = decoder.getValue();
            }
            catch(e:Error)
            {
               name = Context.player != null && Context.player.avatarAppearance != null ? Context.player.avatarAppearance.name : "";
               history = [{
                  "uid":§_-9tI§.id,
                  "nm":name,
                  "txt":§_-9tI§.notes
               }];
            }
            if(history != null)
            {
               historyPanel = new §_-3n0§(null,clientWidth,§_-8kN§,§_-3n0§.§_-4qn§);
               historyPanel.x = 0;
               historyPanel.y = posY;
               addContent(historyPanel);
               historyPanel.§_-CTy§(history);
               posY += historyPanel.clientHeight;
            }
         }
         okButton = new §_-7Oo§(Context.§_-5o8§.message(this.§_-570§ != null ? "unbanButtonTitle" : "okButtonTitle"),100);
         okButton.x = clientWidth / 2 - okButton.clientWidth - 25;
         okButton.y = posY + 10;
         addContent(okButton);
         if(this.§_-570§ != null)
         {
            okButton.addEventListener(MouseEvent.CLICK,this.§_-CHl§);
         }
         else
         {
            okButton.modalResult = §_-0jI§.OK;
         }
         supportButton = null;
         if(Config.supportUrl != null && Config.supportUrl != "" && !Config.disableExternalLinks)
         {
            supportButton = new §_-7Oo§(§_-7uH§.§_-118§(Context.§_-5o8§.message("supportButtonTitle")),150);
            supportButton.x = clientWidth / 2 - 10;
            supportButton.y = posY + 10;
            supportButton.addEventListener(MouseEvent.CLICK,this.onSupportClick);
            addContent(supportButton);
         }
         if(supportButton == null)
         {
            okButton.x = clientWidth / 2 - okButton.width / 2;
         }
         clientHeight = posY + 50;
      }
      
      private function §_-CHl§(param1:MouseEvent) : void
      {
         var _loc2_:§_-AMW§ = new §_-AMW§();
         _loc2_.§_-9k0§(this.§_-570§);
         §_-4OH§.§_-B5P§(Context.§_-5o8§.message("youAreBanned"),Context.§_-5o8§.message("refreshAfterUnban"));
      }
      
      private function onSupportClick(param1:MouseEvent) : void
      {
         var _loc2_:URLRequest = null;
         var _loc3_:URLVariables = null;
         if(§_-9cm§.indexOf("support.tortugasocial.com") >= 0)
         {
            _loc2_ = new URLRequest(§_-9cm§);
            _loc3_ = new URLVariables();
            _loc3_["tickettypeid"] = §_-1R§;
            _loc3_["departmentid"] = §_-CSc§;
            _loc2_.data = _loc3_;
            _loc2_.method = URLRequestMethod.POST;
            navigateToURL(_loc2_,"_blank");
         }
         else
         {
            navigateToURL(new URLRequest(Config.supportUrl),"_blank");
         }
      }
   }
}

