package §_-8f4§
{
   import §_-0sG§.§_-1fy§;
   import §_-5g6§.§_-1ib§;
   import §_-BGm§.§_-782§;
   
   public class §_-0D3§ extends §_-1fy§
   {
      protected var §_-4t0§:String = null;
      
      protected var §_-9mu§:String = null;
      
      public function §_-0D3§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-782§ = null;
         _loc3_ = new §_-782§();
         _loc3_.§_-6S6§ = _kind;
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         _loc3_.servicedSkinName = this.servicedSkinName;
         _loc3_.unservicedSkinName = this.unservicedSkinName;
         param1.addObject(_loc3_);
      }
      
      public function get servicedSkinName() : String
      {
         return this.§_-4t0§;
      }
      
      public function set servicedSkinName(param1:String) : void
      {
         this.§_-4t0§ = param1;
      }
      
      public function get unservicedSkinName() : String
      {
         return this.§_-9mu§;
      }
      
      public function set unservicedSkinName(param1:String) : void
      {
         this.§_-9mu§ = param1;
      }
   }
}

