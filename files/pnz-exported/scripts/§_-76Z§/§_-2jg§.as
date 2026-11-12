package §_-76Z§
{
   import §_-6zr§.§_-5FS§;
   import §_-6zr§.§_-A-9§;
   import §_-9MY§.§_-B1c§;
   import §_-9MY§.§_-BL4§;
   import §_-GM§.Context;
   
   public class §_-2jg§
   {
      private static var §_-00J§:Object = null;
      
      private static var §_-CKX§:Object = null;
      
      public function §_-2jg§()
      {
         super();
      }
      
      public static function §_-9p8§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:§_-A-9§ = null;
         var _loc5_:§_-5FS§ = null;
         §_-00J§ = {};
         for each(_loc2_ in (param1.elements("roles")[0] as XML).elements("role"))
         {
            _loc4_ = new §_-A-9§();
            _loc4_.fromXML(_loc2_);
            §_-00J§[_loc4_.id] = _loc4_;
         }
         §_-CKX§ = {};
         for each(_loc3_ in (param1.elements("privileges")[0] as XML).elements("privilege"))
         {
            _loc5_ = new §_-5FS§();
            _loc5_.fromXML(_loc3_);
            §_-CKX§[_loc5_.name] = _loc5_;
         }
      }
      
      public static function §_-67i§(param1:String, param2:int) : Boolean
      {
         var _loc3_:int = 0;
         if(§_-00J§.hasOwnProperty(param2))
         {
            _loc3_ = (§_-00J§[param2] as §_-A-9§).§_-8cK§;
            if(§_-CKX§.hasOwnProperty(param1))
            {
               return (§_-CKX§[param1] as §_-5FS§).§_-2A8§ <= _loc3_;
            }
         }
         return false;
      }
      
      public static function §_-5Vc§(param1:int) : Boolean
      {
         if(Context.cityPlayer.clanInfo == null)
         {
            return false;
         }
         if(param1 == §_-B1c§.MASTER && §_-67i§(§_-BL4§.KICK_MASTER,Context.cityPlayer.clanInfo.role))
         {
            return true;
         }
         if(param1 == §_-B1c§.MEMBER && §_-67i§(§_-BL4§.KICK_MEMBER,Context.cityPlayer.clanInfo.role))
         {
            return true;
         }
         return param1 == §_-B1c§.NOVICE && §_-67i§(§_-BL4§.KICK_NOVICE,Context.cityPlayer.clanInfo.role);
      }
   }
}

