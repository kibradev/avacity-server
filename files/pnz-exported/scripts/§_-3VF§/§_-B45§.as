package §_-3VF§
{
   import §_-0TK§.§_-0M5§;
   import §_-AFi§.§_-3l5§;
   import §_-AOz§.§_-4aX§;
   
   public class §_-B45§
   {
      private var §_-Si§:Object = {};
      
      public function §_-B45§()
      {
         super();
      }
      
      public function §_-7tA§(param1:§_-3l5§) : void
      {
         var _loc2_:§_-0M5§ = param1.§_-4oW§();
         this.§_-Si§[param1.moduleId] = _loc2_;
      }
      
      public function §_-5Ky§(param1:String) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logFurnitureInstall(param1);
         }
      }
      
      public function logFurnitureShow(param1:String) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logFurnitureShow(param1);
         }
      }
      
      public function logOutsideLocationShow(param1:String) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logOutsideLocationShow(param1);
         }
      }
      
      public function logAvatarClothesShow(param1:§_-4aX§) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logAvatarClothesShow(param1);
         }
      }
      
      public function logAvatarClothesUse(param1:§_-4aX§) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logAvatarClothesUse(param1);
         }
      }
      
      public function logLocationGameStart(param1:String) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logLocationGameStart(param1);
         }
      }
      
      public function logLocationGameRequest(param1:String) : void
      {
         var _loc2_:§_-0M5§ = null;
         for each(_loc2_ in this.§_-Si§)
         {
            _loc2_.logLocationGameRequest(param1);
         }
      }
   }
}

