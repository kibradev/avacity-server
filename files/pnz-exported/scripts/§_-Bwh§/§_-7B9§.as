package §_-Bwh§
{
   import §_-0yZ§.§_-3B0§;
   import §_-18o§.§_-4gN§;
   import §_-9Bv§.§_-8fL§;
   import §_-B6f§.§_-6-l§;
   import §_-B6f§.§_-7wF§;
   import §_-C2V§.§_-9Ht§;
   import §_-GM§.Context;
   import penzville.Application;
   
   public class §_-7B9§
   {
      private static const §_-36T§:int = 1;
      
      private var §_-73A§:String = null;
      
      private var §_-2Yo§:int = 0;
      
      private var §_-8cD§:int = 0;
      
      private var §_-6q§:Array = [];
      
      private var §_-9UR§:Array = [];
      
      private var §_-7K6§:§_-3B0§ = null;
      
      private var _offers:Array = [];
      
      public function §_-7B9§()
      {
         super();
      }
      
      public function configure(param1:§_-8fL§) : void
      {
         var _loc3_:§_-8fL§ = null;
         var _loc4_:§_-7wF§ = null;
         var _loc5_:§_-8fL§ = null;
         var _loc6_:§_-6-l§ = null;
         if(param1.§_-3vm§("currency"))
         {
            this.§_-73A§ = param1.getString("currency.label");
            this.§_-2Yo§ = param1.getInt("currency.pointsRate");
            this.§_-8cD§ = param1.getInt("currency.goldRate");
         }
         var _loc2_:Array = param1.getList("products.product",[]);
         if(_loc2_.length > 0)
         {
            for each(_loc3_ in _loc2_)
            {
               _loc4_ = new §_-7wF§();
               _loc4_.configure(_loc3_.§_-8QD§());
               this.§_-6q§.push(_loc4_);
            }
         }
         _loc2_ = param1.getList("silverPacks.product",[]);
         if(_loc2_.length > 0)
         {
            for each(_loc5_ in _loc2_)
            {
               _loc6_ = new §_-6-l§();
               _loc6_.configure(_loc5_.§_-8QD§());
               this.§_-9UR§.push(_loc6_);
            }
         }
      }
      
      public function §_-8ip§() : void
      {
         this.§_-6EH§();
      }
      
      public function §_-AIb§(param1:String) : void
      {
         var _loc3_:§_-3B0§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this._offers)
         {
            if(_loc3_.productId != param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         this._offers = _loc2_;
         this.§_-6EH§();
      }
      
      public function §_-244§(param1:Array) : void
      {
         var _loc2_:§_-3B0§ = null;
         var _loc3_:Boolean = false;
         var _loc4_:int = 0;
         if(param1 == null || param1.length == 0)
         {
            return;
         }
         for each(_loc2_ in param1)
         {
            if(_loc2_ != null)
            {
               _loc3_ = false;
               _loc4_ = 0;
               while(_loc4_ < this._offers.length)
               {
                  if((this._offers[_loc4_] as §_-3B0§).productId == _loc2_.productId)
                  {
                     this._offers[_loc4_] = _loc2_;
                     _loc3_ = true;
                     break;
                  }
                  _loc4_++;
               }
               if(!_loc3_)
               {
                  this._offers.push(_loc2_);
               }
            }
         }
         this.§_-6EH§();
      }
      
      public function §_-BCe§(param1:String) : void
      {
         Context.§_-3gu§.§_-3Oq§(param1);
      }
      
      public function get §_-1Jf§() : String
      {
         return this.§_-73A§;
      }
      
      public function get pointsRate() : int
      {
         return this.§_-2Yo§;
      }
      
      public function get goldRate() : int
      {
         return this.§_-8cD§;
      }
      
      public function get products() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(!_loc2_.§_-3IF§ && !_loc2_.§_-4e5§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-7oM§() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(_loc2_.§_-AGq§ && !_loc2_.§_-4e5§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-B1m§() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(_loc2_.§_-8B6§ && !_loc2_.§_-4e5§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-8HW§() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(this.§_-1EG§(_loc2_.id))
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-56P§() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(_loc2_.§_-4e5§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-0cE§() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(_loc2_.§_-AGq§ && _loc2_.§_-4e5§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get §_-B61§() : Array
      {
         var _loc2_:§_-7wF§ = null;
         var _loc1_:Array = [];
         for each(_loc2_ in this.§_-6q§)
         {
            if(_loc2_.§_-8B6§ && _loc2_.§_-4e5§)
            {
               _loc1_.push(_loc2_);
            }
         }
         return _loc1_;
      }
      
      public function get silverPacks() : Array
      {
         return this.§_-9UR§;
      }
      
      public function §_-5Yn§(param1:String) : §_-7wF§
      {
         var _loc3_:§_-7wF§ = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.§_-6q§.length)
         {
            _loc3_ = this.§_-6q§[_loc2_];
            if(_loc3_.id == param1)
            {
               return _loc3_;
            }
            _loc2_++;
         }
         return null;
      }
      
      public function §_-63c§(param1:String) : Array
      {
         var _loc4_:§_-7wF§ = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-6q§.length)
         {
            _loc4_ = this.§_-6q§[_loc3_];
            if(_loc4_.tags.indexOf(param1) >= 0)
            {
               _loc2_.push(_loc4_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function §_-08d§(param1:Array) : Array
      {
         var _loc4_:§_-7wF§ = null;
         var _loc2_:Array = [];
         var _loc3_:int = 0;
         while(_loc3_ < this.§_-6q§.length)
         {
            _loc4_ = this.§_-6q§[_loc3_];
            if(§_-4gN§.§_-3fM§(_loc4_.tags,param1))
            {
               _loc2_.push(_loc4_);
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      public function §_-8VN§(param1:Array) : void
      {
         var _loc2_:int = 0;
         while(_loc2_ < param1.length)
         {
            this.§_-6q§.push(param1[_loc2_]);
            _loc2_++;
         }
      }
      
      public function get §_-099§() : §_-3B0§
      {
         return this.§_-7K6§;
      }
      
      public function get offers() : Array
      {
         return this._offers;
      }
      
      public function set offers(param1:Array) : void
      {
         this._offers = param1;
      }
      
      private function §_-6EH§() : void
      {
         var _loc3_:§_-3B0§ = null;
         var _loc1_:Object = {};
         _loc1_[§_-9Ht§.§_-BFC§] = this._offers;
         var _loc2_:Boolean = false;
         if(this._offers.length >= 0)
         {
            for each(_loc3_ in this._offers)
            {
               if(Context.§_-3gu§.§_-AE3§(_loc3_.productId,§_-36T§))
               {
                  _loc2_ = true;
                  break;
               }
            }
         }
         _loc1_[§_-9Ht§.§_-4JG§] = _loc2_;
         Application.instance.dispatchEvent(new §_-9Ht§(§_-9Ht§.§_-6Di§,_loc1_));
      }
      
      private function §_-1EG§(param1:String) : Boolean
      {
         var _loc2_:§_-3B0§ = null;
         for each(_loc2_ in this._offers)
         {
            if(_loc2_.productId == param1 && _loc2_.§_-72i§)
            {
               return true;
            }
         }
         return false;
      }
   }
}

