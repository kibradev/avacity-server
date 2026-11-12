package §_-BIp§
{
   import §_-0Lb§.§_-5GY§;
   import §_-1Fx§.§_-5n7§;
   import §_-2U3§.ResourceManager;
   import §_-39l§.§_-5t6§;
   import §_-3eZ§.§_-6Bt§;
   import §_-3eZ§.§_-BCG§;
   import §_-45g§.§_-CKP§;
   import §_-5Zh§.§_-19w§;
   import §_-5Zh§.§_-AlG§;
   import §_-6Pj§.§_-BsD§;
   import §_-9VF§.§_-5ab§;
   import §_-AaA§.§_-5Kl§;
   import §_-GM§.Context;
   import com.greensock.TweenLite;
   import flash.display.Bitmap;
   import flash.display.GradientType;
   import flash.display.Graphics;
   import flash.display.MovieClip;
   import flash.display.Sprite;
   import flash.events.MouseEvent;
   import flash.geom.Matrix;
   import flash.geom.Rectangle;
   import flash.text.TextField;
   
   public class §_-4Wl§ extends §_-77v§
   {
      public static const §_-AdY§:String = "NewNews";
      
      public static const §_-gp§:String = "NewRequest";
      
      public static const §_-6v3§:String = "RequestAccepted";
      
      public static const §_-ADN§:String = "RequestReject";
      
      public static const §_-8sv§:String = "Invite";
      
      public static const §_-Ajl§:String = "InviteAccepted";
      
      public static const §_-669§:String = "InviteRejected";
      
      public static const §_-0I0§:String = "KickedFromClan";
      
      public static const §_-2Hq§:String = "ClanDismiss";
      
      public static const §_-7G1§:String = "ClanEditSuccess";
      
      public static const §_-CKt§:String = "ClanAddVitalityRequest";
      
      private static const §_-28U§:String = "Positive";
      
      private static const §_-1AT§:String = "Negative";
      
      protected static const §_-7oV§:int = 105;
      
      protected static const §_-8iS§:uint = 26;
      
      protected var _icon:MovieClip = null;
      
      protected var _type:String = null;
      
      protected var §_-oI§:TextField;
      
      private var §_-0M1§:§_-5ab§;
      
      protected var §_-1TN§:§_-BCG§;
      
      protected var §_-1Pj§:§_-BCG§;
      
      private var §_-BMV§:§_-6Bt§ = null;
      
      public function §_-4Wl§(param1:String, param2:§_-19w§ = null, param3:§_-5ab§ = null)
      {
         this._type = param1;
         this.§_-0M1§ = param3;
         super(param2);
      }
      
      override protected function init() : void
      {
         var _loc1_:int = 0;
         super.init();
         §_-AXX§.y = this.§_-5yq§ + 10;
         _loc1_ = this.§_-7Oy§ + 5;
         var _loc2_:TextField = §_-5Kl§.createTextField(§_-7oV§,4,this.title,§_-5Kl§.§_-0iQ§,{
            "width":width - 25,
            "color":this.titleColor
         });
         addChild(_loc2_);
         this.§_-oI§ = §_-5Kl§.§_-Ae-§(§_-7oV§,_loc1_,this.message,§_-5Kl§.§_-BGn§,{
            "width":width - 105,
            "multiline":true,
            "wordWrap":true
         });
         addChild(this.§_-oI§);
         _loc1_ += this.§_-oI§.height + 4;
         if(this._type == §_-8sv§)
         {
            this.§_-BMV§ = new §_-6Bt§(Context.§_-5o8§.message("walkToButtonTitle"));
            this.§_-BMV§.x = (width + §_-7oV§) / 2 - this.§_-BMV§.width / 2 - 5;
            this.§_-BMV§.y = _loc1_;
            this.§_-BMV§.addEventListener(MouseEvent.CLICK,this.§_-6Ir§);
            addChild(this.§_-BMV§);
            _loc1_ += this.§_-BMV§.clientHeight + 10;
         }
         height = _loc1_ > this.§_-85P§ ? _loc1_ : this.§_-85P§;
      }
      
      private function §_-6Ir§(param1:MouseEvent) : void
      {
         Context.§_-BlB§.dispatchEvent(new §_-CKP§(§_-CKP§.§_-7NN§));
         var _loc2_:§_-AlG§ = Context.§_-CJo§.§_-AC5§(clanModel.id,int(Context.cityPlayer.id));
         if(_loc2_ == null)
         {
            return;
         }
         §_-5t6§.instance.openMainDialog(_loc2_.clanId);
         hide();
      }
      
      protected function §_-6rn§() : void
      {
      }
      
      override protected function createCloseButton() : §_-BCG§
      {
         return new §_-BCG§(ResourceManager.createMovieClip("ClanNotificationsCloseIcon" + this.style + "@ui"));
      }
      
      protected function §_-BY3§() : void
      {
         var _loc1_:Sprite = null;
         var _loc2_:MovieClip = null;
         var _loc3_:Bitmap = null;
         _loc1_ = new §_-5n7§();
         _loc2_ = ResourceManager.createMovieClip("AvatarSpotBg@ui");
         _loc2_.x = 8;
         _loc2_.y = 43;
         _loc1_.addChild(_loc2_);
         _loc3_ = this.§_-0M1§.getAvatarIcon(§_-5GY§.ICON_80);
         _loc3_.x = 10;
         _loc3_.y = 45;
         _loc1_.addChild(_loc3_);
         addChild(_loc1_);
      }
      
      override protected function drawBackground() : void
      {
         super.drawBackground();
         §_-5LY§.y = this.§_-5yq§;
      }
      
      override protected function drawStroke(param1:Graphics) : void
      {
         param1.beginFill(this.strokeColor);
         param1.drawRoundRect(0,0,width,height - this.§_-5yq§,6);
         param1.endFill();
      }
      
      override protected function drawBg(param1:Graphics) : void
      {
         param1.beginFill(bgColor);
         param1.drawRoundRect(2,§_-8iS§,width - 4,height - this.§_-7Oy§ - 2,6);
         param1.endFill();
         this.drawTitle(param1);
      }
      
      protected function drawTitle(param1:Graphics) : void
      {
         var _loc2_:Matrix = new Matrix();
         _loc2_.createGradientBox(width - 4,§_-8iS§,Math.PI / 2);
         param1.beginGradientFill(GradientType.LINEAR,[16777215,16777215],[0.6,0],[0,255],_loc2_);
         param1.drawRoundRect(2,2,width - 4,§_-8iS§ - 2,6);
         param1.endFill();
      }
      
      override protected function showNotificationPanel() : void
      {
         this.scrollRect = new Rectangle(-this.leftScrollRectOffset,-20,width + this.leftScrollRectOffset,-20);
         this.alpha = 0;
         TweenLite.to(this,0.2,{
            "scrollRect":{"bottom":height},
            "alpha":1,
            "onComplete":function():void
            {
               §_-1z9§();
            }
         });
      }
      
      protected function get title() : String
      {
         if(this._type == null)
         {
            return "";
         }
         return Context.§_-5o8§.message("clanNotificationTitle" + this._type);
      }
      
      protected function get message() : String
      {
         if(this._type == null)
         {
            return "";
         }
         if(this._type == §_-8sv§)
         {
            return Context.§_-5o8§.message("clanInviteNotificationMessage",{"clanName":clanModel.taggedTitle});
         }
         if(this._type == §_-ADN§)
         {
            return Context.§_-5o8§.message("clanFailMessage",{"clanName":clanModel.taggedTitle});
         }
         if(this._type == §_-7G1§)
         {
            return Context.§_-5o8§.message("changeClanParamsSuccess");
         }
         if(this._type == §_-CKt§)
         {
            return Context.§_-5o8§.message("addVitalityRequestNotification");
         }
         return Context.§_-5o8§.message("clanNotification" + this._type,{"clanName":clanModel.taggedTitle});
      }
      
      protected function get style() : String
      {
         if(this._type == null)
         {
            return null;
         }
         switch(this._type)
         {
            case §_-AdY§:
            case §_-gp§:
            case §_-6v3§:
            case §_-8sv§:
            case §_-Ajl§:
            case §_-7G1§:
            case §_-CKt§:
               return §_-28U§;
            case §_-ADN§:
            case §_-0I0§:
            case §_-2Hq§:
               return §_-1AT§;
            default:
               return null;
         }
      }
      
      protected function get §_-7Oy§() : uint
      {
         return §_-8iS§;
      }
      
      override protected function get strokeColor() : uint
      {
         if(this._type == null || this.style == null)
         {
            return super.strokeColor;
         }
         if(this.style == §_-1AT§)
         {
            return 16202497;
         }
         if(this.style == §_-28U§)
         {
            return 16503602;
         }
         return super.strokeColor;
      }
      
      override protected function get leftScrollRectOffset() : int
      {
         return 23;
      }
      
      override protected function get showTime() : uint
      {
         return §_-BsD§.§_-0Bd§ * 2.5;
      }
      
      public function get targetPlayer() : §_-5ab§
      {
         return this.§_-0M1§;
      }
      
      private function get §_-85P§() : Number
      {
         return 130;
      }
      
      private function get §_-5yq§() : uint
      {
         return this.§_-7Oy§ - §_-8iS§;
      }
      
      private function get titleColor() : Object
      {
         return this.style != null && this.style == §_-1AT§ ? "0xfff3df" : "0x424343";
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this.§_-BMV§ != null)
         {
            this.§_-BMV§.removeEventListener(MouseEvent.CLICK,this.§_-6Ir§);
         }
         super.destroy();
      }
   }
}

