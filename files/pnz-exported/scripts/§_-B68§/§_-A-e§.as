package §_-B68§
{
   import §_-2S7§.§_-75P§;
   import §_-2U3§.ResourceManager;
   import §_-3eZ§.§_-7H-§;
   import §_-4cY§.§_-8Hh§;
   import §_-6EN§.§_-BjY§;
   import §_-95S§.§_-9E8§;
   import §_-99s§.§_-F§;
   import §_-AaA§.§_-5Kl§;
   import §_-Beo§.§_-2g1§;
   import §_-Bi2§.§_-Fs§;
   import §_-BxN§.§_-8RV§;
   import §_-ByP§.§_-0CV§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.MouseEvent;
   import flash.filters.GlowFilter;
   import flash.text.TextField;
   
   public class §_-A-e§ extends §_-75P§
   {
      public static const MODULE_ID:String = "blackFriday";
      
      private static const §_-6MQ§:String = "furniture";
      
      private static const §_-2FW§:String = "tech";
      
      private static const §_-7bg§:String = "clothes";
      
      private static const §_-6Yj§:String = "vip";
      
      private static const §_-2qq§:String = "gold";
      
      public function §_-A-e§(param1:§_-0CV§)
      {
         super(param1,566,377,"");
      }
      
      override public function init() : void
      {
         var _loc1_:TextField = null;
         var _loc3_:TextField = null;
         super.init();
         _loc1_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("blackFridayDialogTitle"),§_-5Kl§.§_-CW2§);
         _loc1_.x = clientWidth / 2 - _loc1_.width / 2;
         _loc1_.y = 5;
         addContent(_loc1_);
         var _loc2_:Array = _loc1_.filters;
         _loc2_.push(new GlowFilter(16777215,0.8,1.6,1.6,50,5));
         _loc1_.filters = _loc2_;
         _loc3_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("blackFridayDialogDescription"),§_-5Kl§.§_-3zr§,{"width":clientWidth - 20});
         _loc3_.x = clientWidth / 2 - _loc3_.width / 2;
         _loc3_.y = _loc1_.y + _loc1_.height + 5;
         addContent(_loc3_);
         if(this.§_-0Kg§(§_-6MQ§))
         {
            this.§_-5Ov§(18,100,§_-6MQ§);
         }
         if(this.§_-0Kg§(§_-2FW§))
         {
            this.§_-5Ov§(18,190,§_-2FW§);
         }
         if(this.§_-0Kg§(§_-7bg§))
         {
            this.§_-5Ov§(18,255,§_-7bg§);
         }
         if(this.§_-0Kg§(§_-6Yj§))
         {
            this.§_-5Ov§(330,125,§_-6Yj§);
         }
         if(this.§_-0Kg§(§_-2qq§))
         {
            this.§_-5Ov§(360,230,§_-2qq§);
         }
      }
      
      private function §_-5Ov§(param1:int, param2:int, param3:String) : void
      {
         var _loc4_:int = 0;
         var _loc5_:MovieClip = null;
         var _loc6_:§_-7H-§ = null;
         var _loc7_:TextField = null;
         _loc4_ = 68;
         _loc5_ = ResourceManager.createMovieClip("BlackFriday17PanelAsset@ui");
         _loc5_.gotoAndStop(param3);
         _loc5_.x = param1;
         _loc5_.y = param2;
         _loc6_ = new §_-7H-§(Context.§_-5o8§.message("buyButtonTitle"));
         _loc6_.x = _loc4_ - _loc6_.width / 2;
         _loc6_.y = _loc5_.height - 8 - _loc6_.height;
         _loc5_.addChild(_loc6_);
         _loc7_ = null;
         if(param3 == §_-6Yj§)
         {
            _loc6_.x = _loc5_.width - _loc4_ - _loc6_.width / 2;
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-1hh§);
         }
         else if(param3 == §_-2qq§)
         {
            _loc6_.x = _loc5_.width - _loc4_ - _loc6_.width / 2;
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-iA§);
         }
         else if(param3 == §_-7bg§)
         {
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-1Ly§);
            _loc7_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("avatarClothesCategory"),§_-5Kl§.§_-4xx§);
         }
         else if(param3 == §_-2FW§)
         {
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-61a§);
            _loc7_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("techCategory"),§_-5Kl§.§_-4xx§);
         }
         else if(param3 == §_-6MQ§)
         {
            _loc6_.addEventListener(MouseEvent.CLICK,this.§_-7Rt§);
            _loc7_ = §_-5Kl§.createTextField(0,0,Context.§_-5o8§.message("furnitureCategory"),§_-5Kl§.§_-4xx§);
         }
         if(_loc7_ != null)
         {
            _loc7_.x = _loc4_ - _loc7_.width / 2;
            _loc7_.y = _loc5_.height - 38 - _loc7_.height;
            _loc5_.addChild(_loc7_);
         }
         addContent(_loc5_);
      }
      
      private function §_-7Rt§(param1:MouseEvent) : void
      {
         §_-9E8§.§_-08G§(§_-F§.§_-6MQ§,§_-8Hh§.§_-1t6§);
         close();
      }
      
      private function §_-61a§(param1:MouseEvent) : void
      {
         §_-9E8§.§_-08G§(§_-F§.§_-2FW§,§_-8Hh§.§_-1t6§);
         close();
      }
      
      private function §_-1Ly§(param1:MouseEvent) : void
      {
         new §_-2g1§(Context.player,§_-BjY§.§_-17-§).showModal();
         close();
      }
      
      private function §_-iA§(param1:MouseEvent) : void
      {
         new §_-8RV§().showModal();
         close();
      }
      
      private function §_-1hh§(param1:MouseEvent) : void
      {
         Context.§_-06H§.§_-74§(Context.cityPlayer.id);
         close();
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-40c§();
      }
      
      override public function canShowDialog() : Boolean
      {
         return true;
      }
      
      private function §_-0Kg§(param1:String) : Boolean
      {
         return campaign.getItem(param1) != null;
      }
   }
}

