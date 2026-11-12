package §_-2UV§
{
   import §_-18o§.§_-A8q§;
   import §_-5OE§.§_-1v2§;
   import §_-5OE§.§_-680§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-8Vi§ implements §_-0Yu§
   {
      private static const §_-O2§:String = "wss";
      
      private static const §_-0vl§:String = "cktutorcmpl";
      
      private var §_-3Iu§:Boolean;
      
      private var §_-3QC§:Array = [];
      
      public function §_-8Vi§()
      {
         super();
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-6YJ§(§_-0vl§,this.§_-3Iu§);
         param1.§_-3f6§(§_-O2§,this.§_-3QC§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         var _loc4_:§_-4Ww§ = null;
         var _loc5_:§_-0jk§ = null;
         if(param1 == null)
         {
            return;
         }
         this.§_-3Iu§ = param1.getBoolean(§_-0vl§);
         this.§_-3QC§ = [];
         var _loc2_:§_-1e5§ = param1.§_-CUA§(§_-O2§);
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            _loc4_ = _loc2_.§_-ANw§(_loc3_);
            _loc5_ = §_-680§.§_-2qF§(_loc4_.getString(§_-1v2§.§_-3su§));
            if(_loc5_ != null)
            {
               _loc5_.fromAGSObject(_loc4_);
               this.§_-3QC§.push(_loc5_);
            }
            _loc3_++;
         }
      }
      
      public function §_-4ZJ§(param1:String) : §_-0jk§
      {
         var _loc3_:§_-0jk§ = null;
         var _loc2_:§_-0jk§ = null;
         for each(_loc3_ in this.§_-3QC§)
         {
            if(_loc3_.work.id == param1)
            {
               if(_loc2_ == null || _loc2_.§_-1zF§ < _loc3_.§_-1zF§)
               {
                  _loc2_ = _loc3_;
               }
            }
         }
         return _loc2_;
      }
      
      public function §_-4-n§(param1:String) : Boolean
      {
         var _loc5_:§_-0jk§ = null;
         var _loc2_:Array = [];
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         while(_loc4_ < this.§_-3QC§.length)
         {
            _loc5_ = this.§_-3QC§[_loc4_] as §_-0jk§;
            if(_loc5_.work.id == param1)
            {
               _loc3_ = true;
            }
            else
            {
               _loc2_.push(_loc5_);
            }
            _loc4_++;
         }
         this.§_-3QC§ = _loc2_;
         return _loc3_;
      }
      
      public function §_-5sb§(param1:§_-0jk§) : void
      {
         this.§_-3QC§.push(param1);
      }
      
      public function get §_-1aj§() : Array
      {
         return this.§_-3QC§;
      }
      
      public function get §_-86Q§() : Boolean
      {
         return this.§_-3Iu§;
      }
      
      public function clone() : §_-8Vi§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

