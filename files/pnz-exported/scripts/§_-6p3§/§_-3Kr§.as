package §_-6p3§
{
   import §_-8Hp§.§_-5KD§;
   import §_-GM§.Context;
   
   public class §_-3Kr§ extends §_-CYP§
   {
      public function §_-3Kr§()
      {
         super();
      }
      
      override public function get oldSilverPrice() : int
      {
         return super.oldSilverPrice > 0 || Context.§_-06H§.§_-6T5§(typeId) > 0 ? §_-79S§.value : 0;
      }
      
      override public function get oldGoldPrice() : int
      {
         return super.oldGoldPrice > 0 || Context.§_-06H§.§_-6T5§(typeId) > 0 ? §_-aj§.value : 0;
      }
      
      override public function get gold() : int
      {
         var _loc1_:int = Context.§_-06H§.§_-6T5§(typeId);
         if(!§_-5KD§.instance.isSaleItem(typeId) && !Context.§_-0Vr§.getSalePrice(typeId) && _loc1_ > 0)
         {
            return Math.ceil(this.oldGoldPrice - this.oldGoldPrice / 100 * _loc1_);
         }
         return super.gold;
      }
      
      override public function get silver() : int
      {
         var _loc1_:int = Context.§_-06H§.§_-6T5§(typeId);
         if(!§_-5KD§.instance.isSaleItem(typeId) && !Context.§_-0Vr§.getSalePrice(typeId) && _loc1_ > 0)
         {
            return Math.ceil(this.oldSilverPrice - this.oldSilverPrice / 100 * _loc1_);
         }
         return super.silver;
      }
      
      override public function get discount() : int
      {
         var _loc1_:int = super.discount;
         return _loc1_ <= 0 ? Context.§_-06H§.§_-6T5§(typeId) : _loc1_;
      }
   }
}

