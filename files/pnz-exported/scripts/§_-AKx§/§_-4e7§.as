package §_-AKx§
{
   import §_-3eZ§.BaseButton;
   
   public class §_-4e7§ extends §_-2BF§
   {
      private var _buttons:Array = null;
      
      public function §_-4e7§(param1:int, param2:String, param3:String, param4:Array = null)
      {
         this._buttons = param4;
         super(param1,param2,param3);
      }
      
      override protected function createButtons() : void
      {
         var _loc1_:BaseButton = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:Object = null;
         if(this._buttons == null)
         {
            super.createButtons();
            return;
         }
         _loc1_ = null;
         _loc2_ = 10;
         _loc3_ = 105;
         _loc4_ = (clientWidth - (_loc3_ + _loc2_) * this._buttons.length) / 2;
         _loc5_ = clientHeight - 30;
         for each(_loc6_ in this._buttons)
         {
            _loc1_ = new BaseButton(_loc6_["label"]);
            _loc1_.modalResult = _loc6_["modalResult"];
            _loc1_.x = _loc4_;
            _loc1_.y = _loc5_;
            addContent(_loc1_);
            _loc4_ += _loc3_ + _loc2_;
         }
      }
   }
}

