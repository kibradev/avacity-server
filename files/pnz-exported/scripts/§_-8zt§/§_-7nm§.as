package §_-8zt§
{
   import §_-0Uz§.§_-6v4§;
   import §_-1Yc§.§_-4hh§;
   import §_-2qd§.§_-9ai§;
   import §_-9zU§.§_-0Mi§;
   import §_-9zU§.§_-3Oc§;
   import §_-GM§.Context;
   import flash.utils.ByteArray;
   import penzville.Config;
   
   public class §_-7nm§ extends §_-6v4§
   {
      public static const §_-BX-§:String = "acmr";
      
      public static const §_-6vu§:String = §_-BX-§ + ".init";
      
      public static const §_-1Li§:String = §_-BX-§ + ".adac";
      
      public static const §_-8sS§:String = "act";
      
      public static const §_-5oh§:String = "cid";
      
      public static const §_-3j4§:String = "cst";
      
      public static const §_-D6§:String = "vl";
      
      private static const §_-1fS§:Class = §_-9qq§;
      
      private var §_-6dH§:Array = [];
      
      private var §_-6Rr§:int = 0;
      
      private var §_-0pf§:int = 0;
      
      private var §_-1Py§:Array = null;
      
      private var §_-5ce§:§_-0Mi§ = new §_-0Mi§();
      
      public function §_-7nm§()
      {
         super();
         §_-1-t§(§_-6vu§,this.onInit);
         §_-1-t§(§_-1Li§,this.§_-454§);
      }
      
      private function onInit(param1:§_-9ai§) : void
      {
         this.§_-6Rr§ = param1.data.getInt(§_-5oh§);
         this.§_-0pf§ = param1.data.getInt(§_-3j4§);
      }
      
      private function §_-454§(param1:§_-9ai§) : void
      {
         var _loc2_:int = param1.data.getInt(§_-D6§);
         Context.cityPlayer.cityInfo.activityRating += _loc2_;
         dispatchEvent(new §_-4hh§(§_-4hh§.§_-A0w§,_loc2_));
      }
      
      public function configure(param1:XML) : void
      {
         if(param1 == null)
         {
            return;
         }
         this.§_-5ce§.§_-00O§ = !!param1["activityPoints"][0].hasOwnProperty("@activityMinCount") ? int(param1["activityPoints"][0]["@activityMinCount"]) : 0;
         this.§_-5ce§.§_-0u8§(param1);
         this.§_-5ce§.§_-6Kd§(param1);
         this.§_-6dH§.sortOn("place",Array.NUMERIC);
      }
      
      public function §_-59Y§() : Array
      {
         var _loc1_:ByteArray = null;
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:§_-3Oc§ = null;
         if(this.§_-1Py§ == null)
         {
            _loc1_ = new §_-1fS§() as ByteArray;
            _loc2_ = new XML(_loc1_.readUTFBytes(_loc1_.length));
            this.§_-1Py§ = [];
            for each(_loc3_ in _loc2_.elements("accrual"))
            {
               _loc4_ = new §_-3Oc§();
               _loc4_.configure(_loc3_);
               this.§_-1Py§.push(_loc4_);
            }
         }
         return this.§_-1Py§;
      }
      
      public function get competitionId() : int
      {
         return this.§_-6Rr§;
      }
      
      public function get §_-0UE§() : int
      {
         return this.§_-0pf§;
      }
      
      public function get awards() : Array
      {
         return this.§_-6dH§;
      }
      
      public function get §_-BlF§() : §_-0Mi§
      {
         return this.§_-5ce§;
      }
      
      public function get isActive() : Boolean
      {
         return Config.§_-2WK§;
      }
   }
}

