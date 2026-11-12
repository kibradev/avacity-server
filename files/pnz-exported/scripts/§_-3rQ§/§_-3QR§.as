package §_-3rQ§
{
   import §_-0CU§.§_-2p7§;
   import §_-1p5§.§_-vH§;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-3ib§.§_-5G5§;
   import §_-49H§.§_-3hc§;
   import §_-4Nr§.§_-3-X§;
   import §_-99s§.§_-7Tj§;
   import §_-AFi§.§_-AWw§;
   import §_-AKx§.§_-5hc§;
   import §_-BBG§.§_-3Yg§;
   import §_-BBG§.§_-4Yr§;
   import §_-C2V§.§_-9Ht§;
   import §_-COx§.§_-B-M§;
   import §_-GM§.Context;
   import §_-uR§.§_-53f§;
   import penzville.Application;
   
   public class §_-3QR§ extends §_-53f§
   {
      private var §_-CLk§:Object = {};
      
      public function §_-3QR§()
      {
         super();
      }
      
      public function init() : void
      {
         Application.instance.addEventListener(§_-9Ht§.§_-6Di§,this.§_-A3z§);
         Application.instance.addEventListener(§_-2p7§.§_-0Wx§,this.§_-9dL§);
         Application.instance.addEventListener(§_-4Yr§.§_-4B§,this.§_-9ei§);
         Application.instance.addEventListener(§_-3Yg§.§_-5bp§,this.§_-3ee§);
      }
      
      public function showDialog(param1:int = 0) : void
      {
         §_-5hc§.§_-57w§(new §_-3hc§(param1));
      }
      
      public function get §_-AeW§() : §_-vH§
      {
         return new §_-vH§(this.events);
      }
      
      public function get events() : Array
      {
         var _loc2_:§_-3-X§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-CLk§)
         {
            if(_loc2_ != null)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-6dw§() : Boolean
      {
         return this.events.length > 0 && !Context.cityPlayer.isTutorial;
      }
      
      public function eventViewed(param1:int, param2:String = null) : void
      {
         if(param1 == §_-5G5§.§_-6Mm§)
         {
            Context.§_-2hc§.§_-BCe§(param2);
         }
         else if(param1 == §_-5G5§.§_-Byo§)
         {
            Context.§_-0Vr§.dispatchEvent(new §_-B-M§(§_-B-M§.§_-1MN§,Context.§_-0Vr§.§_-5wQ§));
            Context.§_-3gu§.§_-1jp§();
         }
         this.§_-CLk§[param1].isNew = false;
         dispatchEvent(new §_-4Yr§(§_-4Yr§.§_-BQ7§,param1));
      }
      
      public function §_-AzA§(param1:String = null, param2:String = "") : void
      {
         var _loc3_:String = param1 + param2;
         this.§_-CLk§[§_-5G5§.§_-AFS§ + "_" + _loc3_].isNew = false;
         var _loc4_:§_-4Yr§ = new §_-4Yr§(§_-4Yr§.§_-BQ7§,§_-5G5§.§_-AFS§);
         _loc4_.moduleId = param1;
         _loc4_.tabId = param2;
         dispatchEvent(_loc4_);
      }
      
      public function §true §(param1:§_-3-X§) : void
      {
         if(this.§_-CLk§.hasOwnProperty(param1.type))
         {
            this.§_-CLk§[param1.type] = param1;
         }
         dispatchEvent(new §_-4Yr§(§_-4Yr§.§_-ATn§,this.events));
      }
      
      private function §_-A3z§(param1:§_-9Ht§) : void
      {
         var _loc3_:§_-3-X§ = null;
         var _loc2_:Array = param1.params[§_-9Ht§.§_-BFC§];
         if(_loc2_ == null || _loc2_.length <= 0)
         {
            this.§_-CLk§[§_-5G5§.§_-6Mm§] = null;
         }
         else
         {
            _loc3_ = new §_-3-X§(§_-5G5§.§_-6Mm§,param1.params);
            _loc3_.isNew = param1.params[§_-9Ht§.§_-4JG§];
            this.§_-CLk§[§_-5G5§.§_-6Mm§] = _loc3_;
         }
         dispatchEvent(new §_-4Yr§(§_-4Yr§.§_-ATn§,this.events));
      }
      
      private function §_-9dL§(param1:§_-2p7§) : void
      {
         var _loc2_:§_-3-X§ = new §_-3-X§(§_-5G5§.§_-17Q§,param1.params);
         _loc2_.isNew = param1.params[§_-2p7§.§_-09C§];
         this.§_-CLk§[§_-5G5§.§_-17Q§] = _loc2_;
         dispatchEvent(new §_-4Yr§(§_-4Yr§.§_-ATn§,this.events));
         if(!Context.cityPlayer.isTutorial && _loc2_.isNew)
         {
            this.§_-3Hc§(§_-5G5§.§_-17Q§);
         }
      }
      
      private function §_-3Hc§(param1:int, param2:String = null) : void
      {
         §_-5hc§.§_-57w§(new §_-3hc§(param1,param2));
      }
      
      private function §_-9ei§(param1:§_-4Yr§) : void
      {
         var _loc2_:String = param1.moduleId;
         var _loc3_:String = param1.tabId;
         var _loc4_:§_-6G§ = §_-0nG§.instance.getModule(_loc2_);
         if(_loc4_ == null || !_loc4_.isActive())
         {
            return;
         }
         var _loc5_:§_-AWw§ = _loc4_ as §_-AWw§;
         if(_loc5_ == null)
         {
            return;
         }
         var _loc6_:§_-3-X§ = new §_-3-X§(§_-5G5§.§_-AFS§,{});
         _loc6_.moduleId = _loc2_;
         _loc6_.tabId = _loc3_;
         _loc6_.module = _loc5_;
         _loc6_.isNew = param1.isNew;
         _loc6_.showDialog = param1.showDialog;
         var _loc7_:String = _loc2_ + _loc3_;
         this.§_-CLk§[§_-5G5§.§_-AFS§ + "_" + _loc7_] = _loc6_;
         dispatchEvent(new §_-4Yr§(§_-4Yr§.§_-ATn§,this.events));
         if(!Context.cityPlayer.isTutorial && _loc6_.isNew && _loc6_.showDialog)
         {
            this.§_-3Hc§(§_-5G5§.§_-AFS§,_loc7_);
         }
      }
      
      private function §_-3ee§(param1:§_-3Yg§) : void
      {
         var _loc3_:§_-3-X§ = null;
         var _loc2_:§_-7Tj§ = param1.params != null && Boolean(param1.params.hasOwnProperty(§_-3Yg§.§_-38e§)) ? param1.params[§_-3Yg§.§_-38e§] : null;
         if(_loc2_ == null)
         {
            this.§_-CLk§[§_-5G5§.§_-Byo§] = null;
         }
         else
         {
            _loc3_ = new §_-3-X§(§_-5G5§.§_-Byo§,param1.params);
            _loc3_.isNew = param1.params[§_-3Yg§.§_-09C§];
            this.§_-CLk§[§_-5G5§.§_-Byo§] = _loc3_;
         }
         dispatchEvent(new §_-4Yr§(§_-4Yr§.§_-ATn§,this.events));
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         Application.instance.removeEventListener(§_-9Ht§.§_-6Di§,this.§_-A3z§);
         Application.instance.removeEventListener(§_-2p7§.§_-0Wx§,this.§_-9dL§);
         Application.instance.removeEventListener(§_-4Yr§.§_-4B§,this.§_-9ei§);
         Application.instance.removeEventListener(§_-3Yg§.§_-5bp§,this.§_-3ee§);
         super.destroy();
      }
   }
}

