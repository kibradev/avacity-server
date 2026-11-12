package §_-3TY§
{
   import §_-6BB§.§_-8BS§;
   
   public class §_-6k2§
   {
      public static const §_-BTG§:int = 0;
      
      public static const §_-3bR§:int = 1;
      
      public static const OK:int = 2;
      
      public static const MM:int = 3;
      
      public static const §_-5E1§:int = 4;
      
      public static const §_-Boi§:int = 5;
      
      public static const §_-78i§:int = 6;
      
      public static const FB:int = 7;
      
      public static const GM:int = 8;
      
      public static const TGC:int = 9;
      
      public static const §_-AhK§:int = 10;
      
      public static const §_-Cs§:int = 11;
      
      public static const §_-8wY§:int = 12;
      
      public static const §_-7SL§:int = 13;
      
      public static const §_-07r§:int = 14;
      
      public static const §_-4Kk§:int = 15;
      
      public static const §_-8f0§:int = 16;
      
      public static const §_-1sr§:int = 17;
      
      public static const §_-5KM§:Array = [TGC,§_-AhK§,§_-8wY§,§_-7SL§];
      
      public function §_-6k2§()
      {
         super();
      }
      
      public static function §_-2pB§(param1:String) : int
      {
         switch(param1)
         {
            case §_-8BS§.§_-BTG§:
               return §_-BTG§;
            case §_-8BS§.§_-1sr§:
               return §_-1sr§;
            case §_-8BS§.§_-BS7§:
            case §_-8BS§.§_-9kU§:
               return §_-3bR§;
            case §_-8BS§.§_-Uu§:
               return OK;
            case §_-8BS§.§_-9kK§:
               return MM;
            case §_-8BS§.§_-614§:
               return §_-5E1§;
            case §_-8BS§.§_-Boi§:
               return §_-Boi§;
            case §_-8BS§.§_-8Lg§:
               return §_-78i§;
            case §_-8BS§.§_-BOa§:
               return FB;
            case §_-8BS§.§_-AVP§:
               return GM;
            case §_-8BS§.TGC:
               return TGC;
            case §_-8BS§.§_-AhK§:
               return §_-AhK§;
            case §_-8BS§.§_-Cs§:
               return §_-Cs§;
            case §_-8BS§.§_-8wY§:
               return §_-8wY§;
            case §_-8BS§.§_-7SL§:
               return §_-7SL§;
            case §_-8BS§.§_-07r§:
               return §_-07r§;
            case §_-8BS§.§_-4Kk§:
               return §_-4Kk§;
            case §_-8BS§.§_-8f0§:
               return §_-8f0§;
            default:
               throw new Error("socialNetwork: " + param1 + " not found");
         }
      }
      
      public static function §_-7wz§(param1:int) : String
      {
         switch(param1)
         {
            case §_-BTG§:
               return §_-8BS§.§_-BTG§;
            case §_-3bR§:
               return §_-8BS§.§_-9kU§;
            case OK:
               return §_-8BS§.§_-Uu§;
            case MM:
               return §_-8BS§.§_-9kK§;
            case §_-5E1§:
               return §_-8BS§.§_-614§;
            case §_-Boi§:
               return §_-8BS§.§_-Boi§;
            case §_-78i§:
               return §_-8BS§.§_-8Lg§;
            case FB:
               return §_-8BS§.§_-BOa§;
            case GM:
               return §_-8BS§.§_-AVP§;
            case TGC:
               return §_-8BS§.TGC;
            case §_-AhK§:
               return §_-8BS§.§_-AhK§;
            case §_-Cs§:
               return §_-8BS§.§_-Cs§;
            case §_-8wY§:
               return §_-8BS§.§_-8wY§;
            case §_-7SL§:
               return §_-8BS§.§_-7SL§;
            case §_-07r§:
               return §_-8BS§.§_-07r§;
            case §_-4Kk§:
               return §_-8BS§.§_-4Kk§;
            case §_-8f0§:
               return §_-8BS§.§_-8f0§;
            case §_-1sr§:
               return §_-8BS§.§_-1sr§;
            default:
               throw new Error("socialNetworkId: " + param1 + " not found");
         }
      }
      
      public static function §_-7o0§(param1:String) : Boolean
      {
         switch(param1)
         {
            case §_-8BS§.§_-BTG§:
            case §_-8BS§.§_-BS7§:
            case §_-8BS§.§_-9kU§:
            case §_-8BS§.§_-07r§:
            case §_-8BS§.§_-Uu§:
            case §_-8BS§.§_-9kK§:
            case §_-8BS§.§_-614§:
            case §_-8BS§.§_-Boi§:
            case §_-8BS§.§_-8Lg§:
            case §_-8BS§.§_-BOa§:
            case §_-8BS§.§_-AVP§:
            case §_-8BS§.§_-Cs§:
            case §_-8BS§.§_-7SL§:
            case §_-8BS§.§_-4Kk§:
            case §_-8BS§.§_-8f0§:
            case §_-8BS§.§_-1sr§:
               return false;
            case §_-8BS§.TGC:
            case §_-8BS§.§_-AhK§:
            case §_-8BS§.§_-8wY§:
               return true;
            default:
               throw new Error("social network with name: " + param1 + " not found");
         }
      }
   }
}

