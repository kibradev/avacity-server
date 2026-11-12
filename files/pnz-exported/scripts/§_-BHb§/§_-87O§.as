package §_-BHb§
{
   import §_-18o§.§_-8-S§;
   import §_-GM§.Context;
   import §_-d5§.§_-2nW§;
   
   public class §_-87O§
   {
      public function §_-87O§()
      {
         super();
      }
      
      public function §_-4y-§(param1:String) : int
      {
         var _loc2_:§_-3dq§ = null;
         for each(_loc2_ in Context.cityPlayer.cityInfo.boosters)
         {
            if(_loc2_.type == param1)
            {
               return _loc2_.time - Context.player.timeDelta;
            }
         }
         return 0;
      }
      
      public function §_-Fj§(param1:String) : Boolean
      {
         return this.§_-4y-§(param1) >= §_-8-S§.§_-9zq§();
      }
      
      public function §_-77b§(param1:String) : Boolean
      {
         if(param1 == §_-2nW§.§_-2eh§ || param1 == §_-2nW§.§_-st§ || param1 == §_-2nW§.§_-AvX§)
         {
            return this.§_-Fj§(§_-2hE§.§_-1fz§);
         }
         return false;
      }
   }
}

