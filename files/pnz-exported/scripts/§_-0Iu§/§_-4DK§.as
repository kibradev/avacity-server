package §_-0Iu§
{
   import §_-1iV§.§_-BkM§;
   import §_-7Wy§.SimpleButton;
   import §_-7Wy§.§_-5iT§;
   import flash.display.Sprite;
   import flash.events.Event;
   import flash.events.MouseEvent;
   
   public class §_-4DK§ extends Sprite
   {
      public static const §_-2PJ§:int = 150;
      
      public static const §_-4lq§:int = 30;
      
      public static const §_-BJS§:int = 10;
      
      public static const §_-5ED§:int = 10;
      
      private var §_-33H§:Array;
      
      private var §_-1dO§:Function;
      
      private var §_-9ZK§:Function;
      
      private var §_-9bN§:Function;
      
      public function §_-4DK§(param1:Array, param2:Function = null, param3:Function = null)
      {
         super();
         this.§_-33H§ = param1;
         this.§_-1dO§ = param2;
         this.§_-9ZK§ = param3;
         this.createPanel();
         this.§_-8UE§();
      }
      
      private function createPanel() : void
      {
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:Sprite = null;
         var _loc11_:int = 0;
         var _loc12_:int = 0;
         var _loc13_:SimpleButton = null;
         var _loc1_:int = §_-2PJ§ + §_-BJS§;
         var _loc2_:int = Math.max(1,Math.ceil(this.§_-33H§.length / §_-5ED§));
         var _loc3_:int = int(this.§_-33H§.length == 0 ? 0 : int(this.§_-33H§.length % §_-5ED§) || §_-5ED§);
         var _loc4_:int = 0;
         while(_loc4_ < this.§_-33H§.length)
         {
            _loc8_ = Math.floor(_loc4_ / §_-5ED§);
            _loc9_ = _loc4_ % §_-5ED§;
            _loc10_ = this.§_-556§(this.§_-33H§[_loc4_]);
            _loc10_.x = _loc8_ * _loc1_ + §_-BJS§;
            _loc10_.y = _loc9_ * (§_-4lq§ + §_-BJS§) + §_-BJS§;
            addChild(_loc10_);
            _loc4_++;
         }
         if(this.§_-9ZK§ != null)
         {
            _loc11_ = _loc3_ * (§_-4lq§ + §_-BJS§) + §_-BJS§;
            _loc12_ = §_-BJS§;
            if(this.§_-33H§.length > 0)
            {
               _loc12_ = (_loc2_ - 1) * _loc1_ + §_-BJS§;
            }
            _loc13_ = new SimpleButton("Add User",§_-2PJ§,§_-4lq§,6736998,16777215,this.§_-9ZK§);
            _loc13_.x = _loc12_;
            _loc13_.y = _loc11_;
            addChild(_loc13_);
         }
         var _loc5_:int = Math.max(1,_loc3_);
         var _loc6_:int = _loc2_ * _loc1_ + §_-BJS§;
         var _loc7_:int = Math.min(§_-5ED§,_loc5_ + 1) * (§_-4lq§ + §_-BJS§) + §_-BJS§;
         graphics.beginFill(15658734);
         graphics.drawRect(0,0,_loc6_,_loc7_);
         graphics.endFill();
         this.centerPanel();
      }
      
      private function §_-556§(param1:Object) : Sprite
      {
         return new §_-5iT§(param1,§_-2PJ§,§_-4lq§,this.§_-7Kw§);
      }
      
      private function §_-7Kw§(param1:MouseEvent) : void
      {
         var _loc2_:§_-5iT§ = param1.currentTarget as §_-5iT§;
         if(this.§_-1dO§ != null)
         {
            this.§_-1dO§(_loc2_);
         }
      }
      
      private function centerPanel() : void
      {
         x = §_-BkM§.getStage().stageWidth / 2 - width / 2;
         y = §_-BkM§.getStage().stageHeight / 2 - height / 2;
      }
      
      private function §_-8UE§() : void
      {
         this.§_-9bN§ = function():void
         {
            centerPanel();
         };
         §_-BkM§.getStage().addEventListener(Event.RESIZE,this.§_-9bN§);
      }
      
      public function show() : void
      {
         §_-BkM§.§_-n1§().addChild(this);
      }
      
      public function hide() : void
      {
         if(parent)
         {
            parent.removeChild(this);
         }
         if(Boolean(this.§_-9bN§))
         {
            §_-BkM§.getStage().removeEventListener(Event.RESIZE,this.§_-9bN§);
         }
      }
      
      public function §_-9xM§(param1:Function) : void
      {
         this.§_-1dO§ = param1;
      }
      
      public function §_-7zj§(param1:Function) : void
      {
         this.§_-9ZK§ = param1;
      }
   }
}

