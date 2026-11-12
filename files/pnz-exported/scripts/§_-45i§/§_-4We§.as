package §_-45i§
{
   import §_-0Au§.§_-4gY§;
   import §_-0fB§.§_-2QZ§;
   import §_-0fB§.§_-5ht§;
   import §_-1cZ§.§_-5wO§;
   import §_-1l5§.§_-4m-§;
   import §_-3VF§.§_-0nG§;
   import §_-3eZ§.BaseButton;
   import §_-4eY§.§_-3k8§;
   import §_-54O§.§_-9w9§;
   import §_-5PB§.§_-5hC§;
   import §_-5f7§.§_-7yc§;
   import §_-6Km§.§_-00§;
   import §_-6Km§.§_-3q§;
   import §_-6Km§.§_-5IT§;
   import §_-9PR§.§_-Bwy§;
   import §_-9PR§.§_-bw§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-7qo§;
   import §_-BJ1§.§_-0r6§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bwh§.§_-BYa§;
   import §_-GM§.Context;
   import §_-xF§.§_-0xs§;
   import flash.events.MouseEvent;
   import penzville.Application;
   import penzville.Config;
   
   public class §_-4We§ extends §_-7qo§
   {
      private var §_-2Z2§:§_-7yc§ = null;
      
      private var §_-5w7§:Object = {};
      
      private var §_-0-a§:String = null;
      
      private var §_-Ax6§:String = null;
      
      private var _context:Object = null;
      
      public function §_-4We§(param1:String = null, param2:String = null, param3:Object = null)
      {
         this.§_-0-a§ = param1;
         this.§_-Ax6§ = param2 == null ? §_-2QZ§.§_-4Hh§ : param2;
         this._context = param3 == null ? §_-BYa§.§_-9tU§("questsDialog") : param3;
         super(655,480,Context.§_-5o8§.message("allowedQuests"));
      }
      
      public function get §_-5sO§() : String
      {
         return this.§_-Ax6§;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-8Hj§(this.§_-0-a§ != null);
      }
      
      override public function init() : void
      {
         var infoPanel:§_-2QZ§ = null;
         var externalOfferEvent:Boolean = false;
         var externalOffer:§_-4m-§ = null;
         var closeButton:BaseButton = null;
         var emailQuestInfoPanel:§_-5ht§ = null;
         var externalOfferQuestPanel:§_-5wO§ = null;
         super.init();
         if(Context.§_-0vt§.§_-7IX§(§_-0r6§.SHIFT_CLICK))
         {
            §_-8y0§.addEventListener(MouseEvent.CLICK,function(param1:MouseEvent):void
            {
               var event:MouseEvent = param1;
               if(!event.shiftKey)
               {
                  return;
               }
               new §_-6cx§().showModal(function(param1:§_-2-c§):void
               {
                  var _loc5_:§_-3k8§ = null;
                  var _loc6_:§_-3q§ = null;
                  var _loc2_:String = (param1.§_-B66§ as §_-6cx§).questId;
                  var _loc3_:§_-00§ = new §_-00§();
                  _loc3_.questId = _loc2_;
                  if(_loc3_.descriptor == null)
                  {
                     return;
                  }
                  var _loc4_:int = 0;
                  for each(_loc5_ in _loc3_.descriptor.tasks)
                  {
                     _loc6_ = §_-5IT§.createTask(_loc5_.type);
                     _loc6_.index = _loc4_;
                     _loc3_.§_-8Gs§(_loc6_);
                     _loc4_++;
                  }
                  defaultPanel.currentQuest = _loc3_;
               });
            });
         }
         infoPanel = new §_-2QZ§();
         infoPanel.x = 230;
         infoPanel.y = 15;
         addContent(infoPanel);
         this.§_-5w7§[infoPanel.id] = infoPanel;
         if(Config.collectEmails)
         {
            emailQuestInfoPanel = new §_-5ht§();
            emailQuestInfoPanel.x = 230;
            emailQuestInfoPanel.y = 15;
            addContent(emailQuestInfoPanel);
            emailQuestInfoPanel.visible = false;
            this.§_-5w7§[emailQuestInfoPanel.id] = emailQuestInfoPanel;
         }
         externalOfferEvent = false;
         for each(externalOffer in §_-Bwy§.instance.offers)
         {
            if(externalOffer.descriptor.scenario is §_-9w9§ && !(externalOffer.descriptor.scenario as §_-9w9§).questCompleted(externalOffer))
            {
               externalOfferQuestPanel = new §_-5wO§(externalOffer);
               externalOfferQuestPanel.x = 230;
               externalOfferQuestPanel.y = 15;
               addContent(externalOfferQuestPanel);
               externalOfferQuestPanel.visible = false;
               this.§_-5w7§[externalOfferQuestPanel.id] = externalOfferQuestPanel;
               if(!externalOfferEvent && externalOffer.descriptor.statDescriptor != null)
               {
                  externalOffer.descriptor.statDescriptor.eventComplete(§_-5hC§.§_-6dm§);
                  externalOfferEvent = true;
               }
            }
         }
         §_-0nG§.instance.gameHelper.§_-7oF§();
         this.§_-8Rq§();
         this.§_-I3§(Context.cityPlayer.questCollection.currentQuests);
         closeButton = new BaseButton(Context.§_-5o8§.message("closeButtonTitle"));
         closeButton.x = clientWidth / 2 - closeButton.clientWidth / 2;
         closeButton.y = clientHeight - closeButton.clientHeight;
         addContent(closeButton);
         closeButton.modalResult = §_-0jI§.CLOSE;
         Application.instance.addEventListener(§_-4gY§.§_-4zg§,this.§_-2Aq§);
         Application.instance.addEventListener(§_-4gY§.§_-C2v§,this.§_-ft§);
         Application.instance.addEventListener(§_-4gY§.§_-4Rk§,this.§_-3g7§);
         §_-Bwy§.instance.addEventListener(§_-bw§.§_-1MQ§,this.§_-2Ea§);
         §_-Bwy§.instance.addEventListener(§_-bw§.§_-Am1§,this.§_-Awr§);
         §_-0nG§.instance.addEventListener(§_-0xs§.§_-1Cp§,this.§_-17z§);
         §_-0nG§.instance.addEventListener(§_-0xs§.§_-gg§,this.§_-3YF§);
      }
      
      private function §_-I3§(param1:Array) : void
      {
         if(this.§_-2Z2§ != null)
         {
            this.§_-2Z2§.destroy();
            this.§_-2Z2§ = null;
         }
         if(param1.length == 0)
         {
            close();
         }
         else
         {
            if(this.§_-5w7§[this.§_-Ax6§] == null || this.§_-5w7§[this.§_-Ax6§].id != this.§_-Ax6§)
            {
               this.§_-Ax6§ = §_-2QZ§.§_-4Hh§;
            }
            this.§_-2Z2§ = new §_-7yc§(param1,this.§_-0-a§,this.§_-Ax6§ == §_-2QZ§.§_-4Hh§ ? null : this.§_-Ax6§);
            this.§_-2Z2§.x = 19;
            this.§_-2Z2§.y = 70;
            this.§_-2Z2§.addEventListener(§_-4gY§.§_-Azt§,this.§_-0-s§);
            addContentOverlay(this.§_-2Z2§);
         }
      }
      
      private function get defaultPanel() : §_-2QZ§
      {
         return this.§_-5w7§[§_-2QZ§.§_-4Hh§];
      }
      
      public function get §_-AF5§() : Object
      {
         return this.§_-5w7§;
      }
      
      private function §_-8Rq§(param1:String = null) : void
      {
         §_-0nG§.instance.§_-2AP§.§_-AA6§(this,param1);
      }
      
      private function §_-3g7§(param1:§_-4gY§) : void
      {
         this.§_-8Rq§(param1.quest != null ? param1.quest.questId : null);
         this.§_-I3§(Context.cityPlayer.questCollection.currentQuests);
      }
      
      private function §_-ft§(param1:§_-4gY§) : void
      {
         this.§_-8Rq§(param1.quest != null ? param1.quest.questId : null);
         close();
      }
      
      private function §_-2Ea§(param1:§_-bw§) : void
      {
         var _loc2_:String = param1.offerId;
         var _loc3_:§_-4m-§ = §_-Bwy§.instance.§_-2V6§(_loc2_);
         if(_loc3_ == null || _loc3_.descriptor != null && _loc3_.descriptor.scenario != null && _loc3_.descriptor.scenario is §_-9w9§)
         {
            close();
         }
      }
      
      private function §_-Awr§(param1:§_-bw§) : void
      {
         close();
      }
      
      private function §_-3YF§(param1:§_-0xs§) : void
      {
         this.§_-8Rq§();
      }
      
      private function §_-17z§(param1:§_-0xs§) : void
      {
         close();
      }
      
      private function §_-2Aq§(param1:§_-4gY§) : void
      {
         var _loc2_:§_-2QZ§ = null;
         if(param1.quest == null)
         {
            return;
         }
         if(§_-0nG§.instance.§_-2AP§.isModuleQuest(param1.quest.questId))
         {
            _loc2_ = this.§_-5w7§[param1.quest.questId];
         }
         else
         {
            _loc2_ = this.defaultPanel;
         }
         if(_loc2_.currentQuest != null && param1.quest.questId == _loc2_.currentQuest.questId)
         {
            _loc2_.currentQuest = param1.quest;
         }
      }
      
      private function §_-0-s§(param1:§_-4gY§) : void
      {
         var _loc3_:§_-2QZ§ = null;
         var _loc2_:String = param1.panel == null ? §_-2QZ§.§_-4Hh§ : param1.panel;
         this.§_-Ax6§ = _loc2_;
         for each(_loc3_ in this.§_-5w7§)
         {
            if(param1.quest != null && _loc3_.id == _loc2_)
            {
               _loc3_.currentQuest = param1.quest;
            }
            _loc3_.visible = _loc2_ == _loc3_.id;
         }
      }
      
      override public function destroy() : void
      {
         Application.instance.removeEventListener(§_-4gY§.§_-4zg§,this.§_-2Aq§);
         Application.instance.removeEventListener(§_-4gY§.§_-C2v§,this.§_-ft§);
         Application.instance.removeEventListener(§_-4gY§.§_-4Rk§,this.§_-3g7§);
         §_-Bwy§.instance.removeEventListener(§_-bw§.§_-1MQ§,this.§_-2Ea§);
         §_-Bwy§.instance.removeEventListener(§_-bw§.§_-Am1§,this.§_-Awr§);
         §_-0nG§.instance.removeEventListener(§_-0xs§.§_-1Cp§,this.§_-17z§);
         §_-0nG§.instance.removeEventListener(§_-0xs§.§_-gg§,this.§_-3YF§);
         super.destroy();
      }
   }
}

