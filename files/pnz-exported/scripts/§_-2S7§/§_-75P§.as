package §_-2S7§
{
   import §_-0CA§.§_-59p§;
   import §_-0yZ§.§_-aD§;
   import §_-18o§.§_-8-S§;
   import §_-2U3§.ResourceManager;
   import §_-4Ms§.Hint;
   import §_-4Ms§.§_-5VT§;
   import §_-8Hp§.§_-5KD§;
   import §_-AKx§.§_-7qo§;
   import §_-AaA§.§_-5Kl§;
   import §_-Bi2§.§_-Fs§;
   import §_-Bwh§.§_-BYa§;
   import §_-ByP§.§_-0CV§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import flash.display.MovieClip;
   import flash.events.TimerEvent;
   import flash.text.TextField;
   import flash.utils.Timer;
   
   public class §_-75P§ extends §_-7qo§
   {
      private var §_-3ut§:§_-0CV§ = null;
      
      protected var §_-54q§:int = 0;
      
      private var _context:Object;
      
      private var §_-6rG§:TextField = null;
      
      private var §_-0D5§:MovieClip = null;
      
      private var _timer:Timer = null;
      
      private var §_-Bng§:MovieClip = null;
      
      private var §_-1WA§:Hint = null;
      
      private var §_-6HM§:§_-0CV§ = null;
      
      public function §_-75P§(param1:§_-0CV§, param2:int, param3:int, param4:String, param5:Object = null)
      {
         super(param2,param3,param4);
         this.§_-3ut§ = param1;
         this._context = param5 == null || param5 == "" ? {} : param5;
         this._context[§_-BYa§.§_-3CX§] = param1.id;
      }
      
      override public function init() : void
      {
         super.init();
         Context.§_-3gu§.§_-9pq§(this.campaign.id);
      }
      
      public function get campaign() : §_-0CV§
      {
         return this.§_-3ut§;
      }
      
      override protected function createSkin() : §_-Fs§
      {
         return new §_-4Bb§();
      }
      
      protected function validateItem(param1:§_-A7b§) : Boolean
      {
         return false;
      }
      
      public function canShowDialog() : Boolean
      {
         return false;
      }
      
      public function get context() : Object
      {
         return this._context;
      }
      
      override public function showModal(param1:Function = null, param2:Boolean = true) : void
      {
         super.showModal(param1,param2);
         if(!§_-5KD§.instance.§_-62L§(this.campaign.id) || !this.canShowDialog())
         {
            close();
         }
         else
         {
            §_-5KD§.instance.§_-1s-§(this.campaign.id);
         }
      }
      
      protected function §_-6To§(param1:int) : §_-aD§
      {
         var _loc2_:§_-aD§ = new §_-aD§(param1);
         _loc2_.context = this._context;
         return _loc2_;
      }
      
      public function §_-CQV§(param1:int = 0, param2:int = 0, param3:Boolean = true) : void
      {
         if(§_-5KD§.instance.§_-AXw§(this.campaign.id) != null)
         {
            this.§_-6HM§ = §_-5KD§.instance.§_-AXw§(this.campaign.id);
            if(this.§_-6HM§.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 < new Date().getTime())
            {
               return;
            }
            this.§_-A-A§();
            this.§_-1kE§(param1,param2,param3);
            return;
         }
      }
      
      private function §_-1kE§(param1:int, param2:int, param3:Boolean) : void
      {
         var _loc4_:MovieClip = null;
         var _loc5_:String = null;
         var _loc7_:MovieClip = null;
         this.§_-Bng§ = new MovieClip();
         _loc4_ = ResourceManager.createMovieClip("saleBackgroundIcon@ui");
         this.§_-Bng§.addChild(_loc4_);
         this.§_-1wQ§();
         _loc5_ = "";
         var _loc6_:String = "";
         _loc7_ = null;
         if(this.§_-6HM§.getItem(§_-59p§.§_-7H5§))
         {
            _loc7_ = ResourceManager.createMovieClip("vkSaleStickerIcon@ui");
            _loc7_.x = _loc4_.x + _loc4_.width / 4;
            _loc7_.y = _loc4_.y + _loc4_.height / 4;
            this.§_-0D5§.x = _loc7_.x + _loc7_.width / 2 + 10;
            this.§_-0D5§.y = _loc7_.y + _loc7_.height / 2 - 2;
            this.§_-Bng§.addChild(this.§_-0D5§);
            this.§_-Bng§.addChild(_loc7_);
            this.§_-Bng§.y = param2 - this.§_-Bng§.height / 2;
            _loc5_ = Context.§_-5o8§.message("vkSalesDayTitle");
            _loc6_ = Context.§_-5o8§.message("vkSalesDayDescription");
         }
         else if(this.§_-6HM§.getItem(§_-59p§.§_-5SA§))
         {
            _loc7_ = ResourceManager.createMovieClip("okGameFridayIcon@ui");
            _loc7_.x = _loc4_.x + _loc4_.width / 4;
            _loc7_.y = _loc4_.y + _loc4_.height / 4 + 5;
            this.§_-0D5§.x = _loc7_.x + _loc7_.width - 5;
            this.§_-0D5§.y = _loc7_.y + _loc7_.height / 2 - this.§_-0D5§.height / 2 - 3;
            this.§_-Bng§.addChild(this.§_-0D5§);
            this.§_-Bng§.addChild(_loc7_);
            this.§_-Bng§.y = param2 - this.§_-Bng§.height / 2 + this.§_-0D5§.height / 2;
            _loc5_ = Context.§_-5o8§.message("okGameFridayTitle");
            _loc6_ = Context.§_-5o8§.message("okGameFridayDescription");
         }
         this.§_-Bng§.x = param1 - this.§_-Bng§.width;
         this.§_-1WA§ = §_-5VT§.§_-2lL§(this.§_-Bng§,_loc5_,_loc6_,200);
         _loc4_.visible = param3;
         addChild(this.§_-Bng§);
      }
      
      private function §_-A-A§() : void
      {
         if(this.§_-Bng§ == null)
         {
            return;
         }
         removeContent(this.§_-Bng§);
         this.§_-Bng§ = null;
      }
      
      private function §_-1wQ§() : void
      {
         this.§_-0D5§ = ResourceManager.createMovieClip("saleTimerBackgroundIcon@ui");
         var _loc1_:Number = this.§_-6HM§.endDate.getTime() - new Date().getTime();
         this.§_-6rG§ = §_-5Kl§.createTextField(0,0,§_-8-S§.§_-2Xf§(_loc1_),§_-5Kl§.§_-B-C§,{
            "color":6455303,
            "size":14
         });
         this.§_-6rG§.x = this.§_-0D5§.width / 2 - this.§_-6rG§.width / 2 + 3;
         this.§_-0D5§.addChild(this.§_-6rG§);
         this._timer = new Timer(60000);
         this._timer.addEventListener(TimerEvent.TIMER,this.onTimer);
         this._timer.start();
      }
      
      private function onTimer(param1:TimerEvent) : void
      {
         this.§_-6rG§.text = §_-8-S§.§_-2Xf§(this.§_-6HM§.endDate.getTime() - Context.cityPlayer.timeDelta * 1000 - new Date().getTime());
      }
      
      override public function destroy() : void
      {
         if(this._timer != null)
         {
            this._timer.stop();
            this._timer.removeEventListener(TimerEvent.TIMER,this.onTimer);
            this._timer = null;
         }
         super.destroy();
      }
   }
}

