package §_-0yq§
{
   import flash.geom.Point;
   
   public class §_-tF§
   {
      public static const §_-5On§:int = 1;
      
      public static const EUCLIDIAN:int = 2;
      
      public static const §_-CDe§:int = 3;
      
      protected var _map:§_-1Lh§;
      
      protected var §_-5kr§:Array = [];
      
      protected var §_-7ny§:Array = [];
      
      protected var _source:Point;
      
      protected var §_-4za§:Point;
      
      protected var §_-BEO§:Number = 1;
      
      protected var §_-9Kh§:Number = 1.4142135623730951;
      
      protected var §_-Bq1§:Function;
      
      protected var §_-7Hx§:Array = null;
      
      public function §_-tF§(param1:int = 3, param2:Array = null)
      {
         super();
         this.§_-7Hx§ = param2;
         switch(param1)
         {
            case §_-5On§:
               this.§_-Bq1§ = this.§_-9Sp§;
               break;
            case EUCLIDIAN:
               this.§_-Bq1§ = this.§_-BfA§;
               break;
            case §_-CDe§:
               this.§_-Bq1§ = this.§_-41N§;
               break;
            default:
               throw new Error("Invalid heuristic type: " + param1);
         }
      }
      
      public function §_-92N§(param1:Number, param2:Number) : void
      {
         this.§_-BEO§ = param1;
         this.§_-9Kh§ = param2;
      }
      
      public function §_-6G4§(param1:§_-1Lh§, param2:Point, param3:Point) : Array
      {
         this._map = param1;
         this.§_-5kr§ = [];
         this.§_-7ny§ = [];
         this._source = param2.clone();
         this.§_-4za§ = param3.clone();
         this.§_-4za§.x = Math.min(param1.cols - 1,Math.max(0,this.§_-4za§.x));
         this.§_-4za§.y = Math.min(param1.rows - 1,Math.max(0,this.§_-4za§.y));
         if(this.§_-2hL§ == null)
         {
            trace("sourceNode is null","source:",param2,"dest:",param3);
            return null;
         }
         this.§_-2hL§.g = 0;
         this.§_-2hL§.h = this.§_-Bq1§(this.§_-2hL§);
         this.§_-2hL§.f = this.§_-2hL§.g + this.§_-2hL§.h;
         return this.search(this.§_-2ei§,this.§_-Bq1§) ? this.§_-ByU§() : null;
      }
      
      public function §_-8sM§(param1:§_-1Lh§, param2:Point) : void
      {
         this._map = param1;
         this.§_-5kr§ = [];
         this.§_-7ny§ = [];
         this._source = param2.clone();
         this.§_-4za§ = null;
         this.§_-2hL§.g = 0;
         this.§_-2hL§.h = 0;
         this.§_-2hL§.f = 0;
         this.search(null,null);
      }
      
      protected function get §_-2hL§() : §_-0eB§
      {
         return this._map.getNode(this._source.x,this._source.y);
      }
      
      protected function get §_-2ei§() : §_-0eB§
      {
         return this._map.getNode(this.§_-4za§.x,this.§_-4za§.y);
      }
      
      protected function checkPassability(param1:§_-0eB§, param2:§_-0eB§) : Boolean
      {
         return param2.walkable && !param1.§_-B2L§(§_-7-M§.§_-WQ§(param2.x - param1.x,param2.y - param1.y));
      }
      
      protected function search(param1:§_-0eB§, param2:Function) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         var _loc8_:int = 0;
         var _loc9_:int = 0;
         var _loc10_:§_-0eB§ = null;
         var _loc11_:Number = NaN;
         var _loc12_:Number = NaN;
         var _loc13_:Number = NaN;
         var _loc14_:Number = NaN;
         var _loc15_:int = 0;
         var _loc3_:§_-0eB§ = this.§_-2hL§;
         while(param1 != null ? _loc3_ != param1 : true)
         {
            _loc4_ = Math.max(0,_loc3_.x - 1);
            _loc5_ = Math.min(this._map.cols - 1,_loc3_.x + 1);
            _loc6_ = Math.max(0,_loc3_.y - 1);
            _loc7_ = Math.min(this._map.rows - 1,_loc3_.y + 1);
            _loc8_ = _loc4_;
            while(_loc8_ <= _loc5_)
            {
               _loc9_ = _loc6_;
               for(; _loc9_ <= _loc7_; _loc9_++)
               {
                  _loc10_ = this._map.getNode(_loc8_,_loc9_);
                  if(_loc10_ != _loc3_)
                  {
                     if(this.§_-7Hx§ != null)
                     {
                        _loc15_ = §_-7-M§.§_-WQ§(_loc8_ - _loc3_.x,_loc9_ - _loc3_.y);
                        if(_loc15_ == -1 || this.§_-7Hx§.indexOf(_loc15_) == -1)
                        {
                           continue;
                        }
                     }
                     if(this.checkPassability(_loc3_,_loc10_))
                     {
                        _loc11_ = this.§_-9gc§(_loc3_,_loc10_);
                        _loc12_ = _loc3_.g + _loc11_ * _loc10_.§_-9RF§;
                        _loc13_ = param2 != null ? param2(_loc10_) : 0;
                        _loc14_ = _loc12_ + _loc13_;
                        if(this.isOpen(_loc10_) || this.§_-6l3§(_loc10_))
                        {
                           if(_loc10_.f > _loc14_)
                           {
                              _loc10_.f = _loc14_;
                              _loc10_.g = _loc12_;
                              _loc10_.h = _loc13_;
                              _loc10_.parent = _loc3_;
                           }
                        }
                        else
                        {
                           _loc10_.f = _loc14_;
                           _loc10_.g = _loc12_;
                           _loc10_.h = _loc13_;
                           _loc10_.parent = _loc3_;
                           this.§_-5kr§.push(_loc10_);
                        }
                     }
                  }
               }
               _loc8_++;
            }
            this.§_-7ny§.push(_loc3_);
            if(this.§_-5kr§.length == 0)
            {
               return false;
            }
            this.§_-5kr§.sortOn("f",Array.NUMERIC);
            _loc3_ = this.§_-5kr§.shift() as §_-0eB§;
         }
         return true;
      }
      
      protected function §_-9gc§(param1:§_-0eB§, param2:§_-0eB§) : Number
      {
         return param1.x == param2.x || param1.y == param2.y ? this.§_-BEO§ : this.§_-9Kh§;
      }
      
      private function §_-ByU§() : Array
      {
         var _loc1_:Array = [];
         var _loc2_:§_-0eB§ = this.§_-2ei§;
         var _loc3_:§_-1xL§ = new §_-1xL§(_loc2_.x,_loc2_.y);
         _loc1_.push(_loc3_);
         while(_loc2_ != this.§_-2hL§)
         {
            _loc3_.cost = this.§_-9gc§(_loc2_,_loc2_.parent);
            _loc2_ = _loc2_.parent;
            _loc3_ = new §_-1xL§(_loc2_.x,_loc2_.y,_loc2_.getOption("cost"));
            _loc1_.unshift(_loc3_);
         }
         return _loc1_;
      }
      
      private function isOpen(param1:§_-0eB§) : Boolean
      {
         return this.§_-5kr§.indexOf(param1) != -1;
      }
      
      private function §_-6l3§(param1:§_-0eB§) : Boolean
      {
         return this.§_-7ny§.indexOf(param1) != -1;
      }
      
      private function §_-9Sp§(param1:§_-0eB§) : Number
      {
         return Math.abs(param1.x - this.§_-2ei§.x) * this.§_-BEO§ + Math.abs(param1.y + this.§_-2ei§.y) * this.§_-BEO§;
      }
      
      private function §_-BfA§(param1:§_-0eB§) : Number
      {
         var _loc2_:Number = param1.x - this.§_-2ei§.x;
         var _loc3_:Number = param1.y - this.§_-2ei§.y;
         return Math.sqrt(_loc2_ * _loc2_ + _loc3_ * _loc3_) * this.§_-BEO§;
      }
      
      private function §_-41N§(param1:§_-0eB§) : Number
      {
         var _loc2_:Number = Math.abs(param1.x - this.§_-2ei§.x);
         var _loc3_:Number = Math.abs(param1.y - this.§_-2ei§.y);
         var _loc4_:Number = Math.min(_loc2_,_loc3_);
         var _loc5_:Number = _loc2_ + _loc3_;
         return this.§_-9Kh§ * _loc4_ + this.§_-BEO§ * (_loc5_ - 2 * _loc4_);
      }
   }
}

