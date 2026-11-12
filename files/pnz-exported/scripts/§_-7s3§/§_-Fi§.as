package §_-7s3§
{
   import §_-BeZ§.§_-1AH§;
   import §_-BeZ§.§_-4Ww§;
   import §_-hb§.§_-CPX§;
   
   public class §_-Fi§ implements §_-1AH§
   {
      public function §_-Fi§()
      {
         super();
      }
      
      public function §_-3xF§(param1:§_-4Ww§) : Object
      {
         var _loc2_:§_-CTZ§ = null;
         switch(param1.getString(§_-CTZ§.§_-zf§))
         {
            case §_-CPX§.§_-6NG§:
               _loc2_ = new §_-BrL§();
               break;
            case §_-CPX§.§_-A6A§:
               _loc2_ = new §_-13s§();
               break;
            case §_-CPX§.§_-0rC§:
               _loc2_ = new §_-6oP§();
               break;
            case §_-CPX§.§_-6Bs§:
               _loc2_ = new §_-7lx§();
               break;
            default:
               return new §_-CTZ§();
         }
         _loc2_.fromAGSObject(param1);
         return _loc2_;
      }
   }
}

