package §_-7nb§
{
   import §_-0PY§.§_-03T§;
   import §_-0PY§.§_-1yk§;
   import §_-0PY§.§_-27n§;
   import §_-0PY§.§_-5AO§;
   import §_-0PY§.§_-6SR§;
   import §_-0PY§.§_-7cd§;
   import §_-0PY§.§_-83o§;
   import §_-0PY§.§_-9HT§;
   import §_-0PY§.§_-9ny§;
   import §_-0PY§.§_-AQI§;
   import §_-0PY§.§_-B01§;
   import §_-0PY§.§_-CIi§;
   import §_-0PY§.§_-fO§;
   import §_-0uA§.§_-3YE§;
   import §_-1hy§.§_-1oh§;
   import §_-1hy§.§_-9Lo§;
   import §_-28F§.§_-0Be§;
   import §_-28F§.§_-6qm§;
   import §_-28F§.§_-9JC§;
   import §_-2EM§.FM24FishingAction;
   import §_-2yL§.§_-5Z4§;
   import §_-5yU§.§_-4K3§;
   import §_-6EY§.§_-23B§;
   import §_-6EY§.§_-7VX§;
   import §_-6EY§.§_-968§;
   import §_-6EY§.§_-A2N§;
   import §_-6EY§.§_-CHy§;
   import §_-70D§.§_-1Ax§;
   import §_-70D§.§_-2dJ§;
   import §_-70D§.§_-2wR§;
   import §_-70D§.§_-51W§;
   import §_-70D§.§_-7D8§;
   import §_-70D§.§_-9El§;
   import §_-70D§.§_-9gm§;
   import §_-70D§.§_-Bg-§;
   import §_-70D§.§_-C4z§;
   import §_-7qB§.§_-8Ja§;
   import §_-8Fb§.§_-3FP§;
   import §_-8Fb§.§_-3jX§;
   import §_-9mm§.§_-CQD§;
   import §_-A0U§.§_-BTr§;
   import §_-AyL§.§_-088§;
   import §_-AyL§.§_-5P1§;
   import §_-BEt§.§_-G7§;
   import §_-BVr§.§_-6eL§;
   import §_-BVr§.§_-8XK§;
   import §_-BVr§.§_-AFA§;
   import §_-Bmg§.§_-L5§;
   import §_-CRx§.§_-2Kn§;
   import §_-UB§.§_-9Ij§;
   import flash.utils.getQualifiedClassName;
   
   public class §_-BJk§
   {
      
      private static var §_-B33§:Object = {
         "idle":§_-9gm§,
         "skTrk1":§_-CHy§,
         "skTrk2":§_-968§,
         "skTrk3":§_-23B§,
         "skTrk4":§_-A2N§,
         "skTrk5":§_-7VX§,
         "lgh":§_-51W§,
         "dgng":§_-2wR§,
         "htpnchbg":§_-1Ax§,
         "drwncnvs":§_-2dJ§,
         "hpy":§_-9Ij§,
         "lk":§_-CQD§,
         "emtn":§_-C4z§,
         "rspra":§_-088§,
         "rspfa":§_-5P1§,
         "tdba":§_-7D8§,
         "fsd":§_-8XK§,
         "fls":§_-6qm§,
         "fwn":§_-9JC§,
         "fdrw":§_-0Be§,
         "fak":§_-6eL§,
         "fblk":§_-AFA§,
         "dpck":§_-1oh§,
         "wsfc":§_-9Lo§,
         "rmvmktpz":§_-4K3§,
         "dphlpt":§_-G7§,
         "ildBU":§_-03T§,
         "ildCFT":§_-AQI§,
         "ildCR":§_-CIi§,
         "ildCFR":§_-6SR§,
         "ildCT":§_-1yk§,
         "ildCTF":§_-9ny§,
         "ildBS":§_-27n§,
         "ildMD":§_-fO§,
         "ildPS":§_-7cd§,
         "ildPT":§_-9HT§,
         "ildPF":§_-B01§,
         "ildUF":§_-5AO§,
         "ildPPt":§_-3FP§,
         "ildFPt":§_-3jX§,
         "bblgm":§_-2Kn§,
         "chmml":§_-5Z4§,
         "cnft":§_-8Ja§,
         "rsnns":§_-BTr§,
         "rmvtmpcls":§_-Bg-§,
         "mkiccrm":§_-L5§,
         "fshng":FM24FishingAction,
         "ist":§_-83o§
      };
      
      public function §_-BJk§()
      {
         super();
      }
      
      public static function §_-36F§(param1:String, param2:Class) : void
      {
         §_-B33§[param1] = param2;
      }
      
      public static function getClass(param1:String) : Class
      {
         if(!§_-B33§.hasOwnProperty(param1))
         {
            §_-3YE§.§_-7aK§("Unknown actionId " + param1);
            return null;
         }
         return §_-B33§[param1];
      }
      
      public static function §_-BM9§(param1:§_-9El§) : String
      {
         var _loc2_:String = null;
         var _loc3_:Class = null;
         for(_loc2_ in §_-B33§)
         {
            _loc3_ = §_-B33§[_loc2_];
            if(param1 is _loc3_ && getQualifiedClassName(param1) == getQualifiedClassName(_loc3_))
            {
               return _loc2_;
            }
         }
         throw new Error("Unknown action " + param1);
      }
   }
}

