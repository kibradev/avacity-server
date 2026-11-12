package §_-08V§
{
   import §_-2U3§.ResourceManager;
   import §_-4RH§.§_-9L4§;
   import §_-6-L§.§_-49j§;
   import penzville.Config;
   import penzville.§_-002§;
   
   public class §_-CDq§
   {
      private static const §_-4yC§:Array = ["ui","decorUi","uiLang","vipUi","clubUi","cityPetsUi","clan","location"];
      
      private static const §_-3o7§:Array = ["uiMobile"];
      
      private static const §_-5HT§:Array = ["mobile","stickers","offers"];
      
      private static const §_-0Ig§:Array = ["promoAnimations","avatarAnimation","cityPets"];
      
      private static const §_-5ib§:Array = ["appearanceIcons","furnitureCollectionIcons","avatarIcons","cityPetIcons","house","kitchen","decor","furniture","bathroom"];
      
      private static const §_-84v§:Array = ["config","sounds"];
      
      private static const §_-45a§:Array = ["avatarAnimation","avatarIcons","config","ui"];
      
      private static const §_-Cdp§:Array = ["avatarAnimation","avatarIcons","location","house","kitchen","decor","bathroom","furniture","ui","decorUi","config","clan","appearanceIcons","furnitureCollectionIcons"];
      
      public function §_-CDq§()
      {
         super();
      }
      
      public static function §_-Bl6§() : Array
      {
         var _loc1_:Array = [];
         §_-49j§.merge(_loc1_,§_-4yC§);
         §_-49j§.merge(_loc1_,§_-5HT§);
         §_-49j§.merge(_loc1_,§_-0Ig§);
         §_-49j§.merge(_loc1_,§_-5ib§);
         §_-49j§.merge(_loc1_,§_-84v§);
         §_-49j§.merge(_loc1_,§_-3o7§);
         return §_-6z7§(_loc1_);
      }
      
      public static function §_-1wn§() : Array
      {
         var _loc1_:Array = ["avatarAnimation","appearanceIcons","uiInit"];
         §_-49j§.merge(_loc1_,§_-84v§);
         §_-49j§.merge(_loc1_,§_-3o7§);
         return §_-6z7§(_loc1_);
      }
      
      public static function §_-9Il§() : Array
      {
         return §_-6z7§(§_-45a§);
      }
      
      public static function §_-BUc§() : Array
      {
         return §_-6z7§(§_-Cdp§);
      }
      
      private static function §_-6z7§(param1:Array) : Array
      {
         var _loc4_:String = null;
         var _loc2_:Array = [];
         var _loc3_:Object = §_-002§.§_-Bl7§(Config.§_-37U§);
         for each(_loc4_ in param1)
         {
            if(_loc3_.hasOwnProperty(_loc4_))
            {
               §_-49j§.merge(_loc2_,_loc3_[_loc4_]);
            }
            else
            {
               _loc2_.push(_loc4_);
            }
         }
         return _loc2_;
      }
      
      public static function §_-4go§() : void
      {
         var _loc2_:String = null;
         var _loc3_:§_-9L4§ = null;
         var _loc4_:String = null;
         var _loc1_:Object = §_-002§.§_-Bl7§(Config.§_-37U§);
         for(_loc2_ in _loc1_)
         {
            _loc3_ = new §_-9L4§(_loc2_);
            for each(_loc4_ in _loc1_[_loc2_])
            {
               _loc3_.§_-3RG§(ResourceManager.getADF(_loc4_));
            }
            ResourceManager.§_-0cZ§(_loc2_,_loc3_);
         }
      }
   }
}

