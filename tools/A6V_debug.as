package §_-6lP§
{
   import §_-3eZ§.§_-2rC§;
   import §_-3eZ§.§_-9pX§;
   import §_-6JL§.§_-B9P§;
   import §_-9VF§.§_-5ab§;
   import §_-9xx§.§_-3sA§;
   import §_-AKx§.§_-3yT§;
   import §_-Bi2§.§_-Fs§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   import flash.text.TextFormat;

   public class §_-A6V§ extends §_-3yT§
   {
      private static const WIDTH:int = 666;

      private static const §_-621§:int = 416;

      private var §_-0rP§:§_-9pX§ = null;

      private var §_-Bgu§:§_-2rC§ = null;

      private var §_-dbgField§:TextField = null;

      public function §_-A6V§()
      {
         super(WIDTH,§_-621§,Context.§_-5o8§.message("nsCreateAvatarDialogTitle"));
      }

      override public function init() : void
      {
         super.init();
         this.§_-BOOM§("A6V:init:enter");
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
         this.§_-BOOM§("A6V:init:exit");
      }

      override protected function createSkin() : §_-Fs§
      {
         return new §_-4sZ§();
      }

      private function §_-BOOM§(param1:String, param2:* = null) : void
      {
         try
         {
            if(this.§_-dbgField§ == null)
            {
               this.§_-dbgField§ = new TextField();
               this.§_-dbgField§.x = 10;
               this.§_-dbgField§.y = 40;
               this.§_-dbgField§.width = 646;
               this.§_-dbgField§.height = 340;
               this.§_-dbgField§.multiline = true;
               this.§_-dbgField§.wordWrap = true;
               this.§_-dbgField§.background = true;
               this.§_-dbgField§.backgroundColor = 16777215;
               this.§_-dbgField§.border = true;
               this.§_-dbgField§.borderColor = 255;
               this.§_-dbgField§.textColor = 255;
               var fmt:TextFormat = new TextFormat();
               fmt.size = 13;
               fmt.bold = true;
               this.§_-dbgField§.defaultTextFormat = fmt;
            }
            if(this.§_-dbgField§.parent == null)
            {
               addContent(this.§_-dbgField§);
            }
            var line:String = param2 == null ? param1 : param1 + ": " + param2;
            this.§_-dbgField§.appendText(line + "\n");
         }
         catch(e:*)
         {
         }
      }

      private function §_-BOOMERR§(param1:String, param2:*) : void
      {
         var extra:String = "";
         try
         {
            extra = " id=" + param2["errorID"];
         }
         catch(e2:*)
         {
         }
         try
         {
            extra += " stack=" + param2["getStackTrace"]();
         }
         catch(e3:*)
         {
         }
         this.§_-BOOM§(param1,param2.toString() + extra);
      }

      private function §_-66a§(param1:MouseEvent) : void
      {
         var clonedPlayer:§_-5ab§ = null;
         var dlg:§_-3sA§ = null;
         this.§_-BOOM§("A6V:male:start");
         try
         {
            Context.player.avatarAppearance.gender = §_-3uA§.§_-BO7§;
         }
         catch(eA:*)
         {
            this.§_-BOOMERR§("A6V:male:CAUGHT:genderSet",eA);
            return;
         }
         this.§_-BOOM§("A6V:male:genderSet:ok");
         try
         {
            dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
         }
         catch(eB:*)
         {
            this.§_-BOOMERR§("A6V:male:CAUGHT:dispatch",eB);
            return;
         }
         this.§_-BOOM§("A6V:male:dispatched:ok");
         try
         {
            clonedPlayer = Context.player.cloneFast();
         }
         catch(eC:*)
         {
            this.§_-BOOMERR§("A6V:male:CAUGHT:cloneFast",eC);
            return;
         }
         this.§_-BOOM§("A6V:male:cloneFast:ok");
         try
         {
            dlg = new §_-3sA§(clonedPlayer);
         }
         catch(eD:*)
         {
            this.§_-BOOMERR§("A6V:male:CAUGHT:construct3sA",eD);
            return;
         }
         this.§_-BOOM§("A6V:male:construct3sA:ok");
         try
         {
            dlg.showModal();
         }
         catch(eE:*)
         {
            this.§_-BOOMERR§("A6V:male:CAUGHT:showModal",eE);
            return;
         }
         this.§_-BOOM§("A6V:male:showModal:ok");
         close();
      }

      private function §_-1Va§(param1:MouseEvent) : void
      {
         var clonedPlayer:§_-5ab§ = null;
         var dlg:§_-3sA§ = null;
         this.§_-BOOM§("A6V:female:start");
         try
         {
            Context.player.avatarAppearance.gender = §_-3uA§.§_-908§;
         }
         catch(eA:*)
         {
            this.§_-BOOMERR§("A6V:female:CAUGHT:genderSet",eA);
            return;
         }
         this.§_-BOOM§("A6V:female:genderSet:ok");
         try
         {
            dispatchEvent(new §_-B9P§(§_-B9P§.SELECTED,null));
         }
         catch(eB:*)
         {
            this.§_-BOOMERR§("A6V:female:CAUGHT:dispatch",eB);
            return;
         }
         this.§_-BOOM§("A6V:female:dispatched:ok");
         try
         {
            clonedPlayer = Context.player.cloneFast();
         }
         catch(eC:*)
         {
            this.§_-BOOMERR§("A6V:female:CAUGHT:cloneFast",eC);
            return;
         }
         this.§_-BOOM§("A6V:female:cloneFast:ok");
         try
         {
            dlg = new §_-3sA§(clonedPlayer);
         }
         catch(eD:*)
         {
            this.§_-BOOMERR§("A6V:female:CAUGHT:construct3sA",eD);
            return;
         }
         this.§_-BOOM§("A6V:female:construct3sA:ok");
         try
         {
            dlg.showModal();
         }
         catch(eE:*)
         {
            this.§_-BOOMERR§("A6V:female:CAUGHT:showModal",eE);
            return;
         }
         this.§_-BOOM§("A6V:female:showModal:ok");
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
