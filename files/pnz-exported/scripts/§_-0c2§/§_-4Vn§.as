package §_-0c2§
{
   import §_-0Lb§.§_-5GY§;
   import §_-3eZ§.§_-ADU§;
   import §_-3eZ§.§_-BCG§;
   import §_-789§.§_-yS§;
   import §_-9VF§.§_-48g§;
   import §_-9VF§.§_-5ab§;
   import §_-AKx§.§_-4OH§;
   import §_-AKx§.§_-7qo§;
   import §_-AaA§.§_-5Kl§;
   import §_-BJ1§.§_-0r6§;
   import §_-GM§.Context;
   import flash.events.MouseEvent;
   import flash.text.TextField;
   
   public class §_-4Vn§ extends §_-7qo§
   {
      private var _player:§_-5ab§ = null;
      
      public function §_-4Vn§()
      {
         super(300,400,"Moderation");
         this._player = Context.player;
      }
      
      override public function init() : void
      {
         var _loc1_:§_-yS§ = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:§_-BCG§ = null;
         var _loc6_:§_-BCG§ = null;
         _loc1_ = new §_-yS§(this._player,§_-5GY§.VIEW_160);
         _loc1_.x = 10;
         _loc1_.y = 10;
         addContent(_loc1_);
         var _loc2_:TextField = §_-5Kl§.createTextField(_loc1_.x + _loc1_.width + 10,10,"(" + this._player.id + ") " + this._player.avatarAppearance.name,§_-5Kl§.§_-0iQ§);
         _loc2_.selectable = true;
         addContent(_loc2_);
         _loc3_ = _loc2_.x;
         _loc4_ = _loc2_.y + _loc2_.height + 10;
         if(this._player is §_-48g§)
         {
            _loc6_ = new §_-ADU§(((this._player as §_-48g§).cityInfo.§_-2u§ ? "Hide" : "Show") + " crown");
            _loc6_.x = _loc3_;
            _loc6_.y = _loc4_;
            addContent(_loc6_);
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-3kz§);
            _loc3_ += _loc6_.width + 5;
         }
         _loc5_ = new §_-ADU§((this._player.locationInfo.§_-7rj§ ? "Hide" : "Show") + " location");
         _loc5_.x = _loc3_;
         _loc5_.y = _loc4_;
         addContent(_loc5_);
         _loc5_.addEventListener(MouseEvent.CLICK,this.§_-89j§);
      }
      
      private function §_-3kz§(param1:MouseEvent) : void
      {
         if(!Context.§_-0vt§.§_-7IX§(§_-0r6§.ABILITY_HIDE_LETTER))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("accessDeny"));
            return;
         }
         (this._player as §_-48g§).cityInfo.§_-2u§ = !(this._player as §_-48g§).cityInfo.§_-2u§;
         (param1.currentTarget as §_-ADU§).label = ((this._player as §_-48g§).cityInfo.§_-2u§ ? "Hide" : "Show") + " crown";
         Context.§_-5y9§.§_-7Um§();
         §_-4OH§.§_-B5P§("Switch moderation crown","You must reenter to the room to apply the changes");
      }
      
      private function §_-89j§(param1:MouseEvent) : void
      {
         if(!Context.§_-0vt§.§_-7IX§(§_-0r6§.FIND_ITSELF_BAN))
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("error"),Context.§_-5o8§.message("accessDeny"));
            return;
         }
         this._player.locationInfo.§_-7rj§ = !this._player.locationInfo.§_-7rj§;
         (param1.currentTarget as §_-ADU§).label = (this._player.locationInfo.§_-7rj§ ? "Hide" : "Show") + " location";
         Context.§_-5y9§.§_-0Ga§();
         if(this._player.locationInfo.§_-7rj§)
         {
            §_-4OH§.§_-B5P§("Location shown","Now your friends could find you location");
         }
         else
         {
            §_-4OH§.§_-B5P§("Location hidden","Now your friends could not find you location");
         }
      }
   }
}

