package §_-6Km§
{
   import §_-0TK§.§_-CdV§;
   import §_-0rs§.§_-6mU§;
   import §_-18o§.§_-A8q§;
   import §_-3VF§.§_-0nG§;
   import §_-3VF§.§_-6G§;
   import §_-4eY§.§_-4aG§;
   import §_-4eY§.§_-8pe§;
   import §_-AFi§.§_-4jt§;
   import §_-BVP§.§_-5Qa§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C6z§.§_-5qw§;
   
   public class §_-6-3§ implements §_-0Yu§
   {
      public static const §_-AMR§:String = "q";
      
      public static const §_-1ms§:String = "cmplt";
      
      private var §_-2Fu§:Array = [];
      
      public function §_-6-3§()
      {
         super();
      }
      
      public function get currentQuests() : Array
      {
         return this.§_-78Q§(this.§_-2Fu§);
      }
      
      public function getCurrentQuestsByType(param1:int) : Array
      {
         var _loc3_:§_-00§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.currentQuests)
         {
            if(_loc3_.descriptor.type == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-1Nd§(param1:String = null) : int
      {
         var _loc3_:§_-00§ = null;
         var _loc4_:Array = null;
         var _loc5_:§_-6G§ = null;
         var _loc6_:§_-4aG§ = null;
         var _loc7_:§_-6mU§ = null;
         var _loc8_:§_-5qw§ = null;
         var _loc2_:int = 0;
         for each(_loc3_ in this.currentQuests)
         {
            _loc6_ = _loc3_.descriptor;
            if(_loc6_ != null)
            {
               if(!_loc6_.§_-9b8§)
               {
                  if(!§_-0nG§.instance.§_-2AP§.isModuleQuest(_loc3_.questId))
                  {
                     _loc2_ += _loc6_.locationId == param1 ? 1 : 0;
                  }
               }
            }
         }
         _loc4_ = §_-0nG§.instance.§_-2bV§();
         for each(_loc5_ in _loc4_)
         {
            if(_loc5_.isActive())
            {
               if(_loc5_ is §_-6mU§)
               {
                  _loc7_ = _loc5_ as §_-6mU§;
                  _loc8_ = _loc7_.getComponent(§_-5qw§) as §_-5qw§;
                  if(_loc8_ != null)
                  {
                     _loc2_ += _loc8_.getCurrentQuestsByType().length;
                  }
               }
               else if(_loc5_ is §_-4jt§ && (_loc5_ as §_-4jt§).getCurrentQuestsByType() != null)
               {
                  _loc2_ += 1;
               }
            }
         }
         return _loc2_ + (§_-5Qa§.§_-C-C§() ? 1 : 0);
      }
      
      private function §_-78Q§(param1:Array) : Array
      {
         var _loc3_:§_-00§ = null;
         var _loc4_:§_-4aG§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in param1)
         {
            _loc4_ = _loc3_.descriptor;
            if(!(_loc4_ == null || !_loc4_.isHoliday))
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function §_-4k9§(param1:§_-00§) : void
      {
         var _loc3_:§_-00§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-2Fu§)
         {
            if(_loc3_.questId == param1.questId)
            {
               _loc2_.push(param1);
            }
            else
            {
               _loc2_.push(_loc3_);
            }
         }
         this.§_-2Fu§ = _loc2_;
      }
      
      public function §_-3M-§(param1:int) : Array
      {
         var _loc3_:§_-00§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-2Fu§)
         {
            if(!(_loc3_.descriptor == null || !_loc3_.descriptor.isHoliday || _loc3_.descriptor.type != param1))
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
      
      public function getQuest(param1:String) : §_-00§
      {
         var _loc2_:§_-00§ = null;
         for each(_loc2_ in this.currentQuests)
         {
            if(_loc2_.questId == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function §_-kM§() : Boolean
      {
         var _loc1_:§_-00§ = null;
         for each(_loc1_ in this.currentQuests)
         {
            if(_loc1_.descriptor.type == §_-8pe§.§_-50a§ && (_loc1_.descriptor is §_-CdV§ && (_loc1_.descriptor as §_-CdV§).showInMain))
            {
               return true;
            }
         }
         return false;
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-2Fu§ = param1.§_-Bc6§("q",§_-00§);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-3f6§("q",this.§_-2Fu§);
      }
      
      public function clone() : §_-6-3§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

