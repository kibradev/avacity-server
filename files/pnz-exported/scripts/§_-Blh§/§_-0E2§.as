package §_-Blh§
{
   import §_-0Jm§.§_-B8B§;
   import §_-0sG§.§_-1fy§;
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-0E2§ extends §_-1fy§
   {
      private var §_-7yQ§:String = null;
      
      public function §_-0E2§()
      {
         super();
      }
      
      override protected function createObject() : §_-C9k§
      {
         return new §_-B8B§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-B8B§ = this.createObject() as §_-B8B§;
         _loc3_.§_-6S6§ = _kind;
         _loc3_.flowerbedType = this.flowerbedType;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      public function get flowerbedType() : String
      {
         return this.§_-7yQ§;
      }
      
      public function set flowerbedType(param1:String) : void
      {
         this.§_-7yQ§ = param1;
      }
   }
}

