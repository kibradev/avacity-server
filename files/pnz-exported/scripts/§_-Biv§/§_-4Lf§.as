package §_-Biv§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-ti§.§_-7E1§;
   
   public class §_-4Lf§ extends §_-3iK§
   {
      public function §_-4Lf§()
      {
         super("roam_info");
      }
      
      override protected function createDescriptor() : §_-7E1§
      {
         var _loc1_:§_-7E1§ = new §_-7E1§("roam_info","Get information about your current Roam game","roam_info","game");
         _loc1_.§_-AqZ§("roam_info","Show information about current Roam game");
         return _loc1_;
      }
      
      override protected function prepareParams(param1:Object) : §_-4Ww§
      {
         return new §_-4Ww§();
      }
   }
}

