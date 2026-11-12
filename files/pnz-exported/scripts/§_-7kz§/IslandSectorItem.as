package §_-7kz§
{
   import §_-0sG§.§_-A5E§;
   import §_-1Rj§.§_-AfC§;
   import §_-2Hz§.§_-1KZ§;
   import §_-2Hz§.§_-7Ao§;
   import §_-3BS§.§_-Ge§;
   import §_-5eM§.§_-5jU§;
   import §_-5g6§.§_-1ib§;
   import §_-5g6§.§_-8Vp§;
   import §_-8nG§.§_-8Fp§;
   import §_-GM§.Context;
   
   public class IslandSectorItem extends §_-A5E§
   {
      protected var _level:int = 0;
      
      protected var §_-8St§:Number = 0;
      
      protected var §_-3E5§:Number = 0;
      
      public function IslandSectorItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc4_:§_-1KZ§ = null;
         var _loc5_:§_-7Ao§ = null;
         if(param1 is §_-Ge§ && (param1 as §_-Ge§).§_-BVz§ == null)
         {
            return;
         }
         var _loc3_:int = param1.worldMode == §_-8Vp§.§_-2BY§ ? 0 : (param1 as §_-Ge§).§_-BVz§.level;
         if(_loc3_ >= this._level && param1.worldMode != §_-8Vp§.§_-2BY§)
         {
            return;
         }
         if(param2 == null || param2 != null && !param2.hasOwnProperty("onlyLock"))
         {
            _loc4_ = new §_-1KZ§(this._level);
            _loc4_.§_-49T§ = this;
            _loc4_.width = width;
            _loc4_.length = length;
            _loc4_.objectId = itemId;
            _loc4_.moveTo(wx,wy,wz);
            param1.addObject(_loc4_);
         }
         if(param1.worldMode == §_-8Vp§.§_-2BY§ || _loc3_ == this._level - 1 && (param1 as §_-Ge§).ownerId == Context.player.id)
         {
            _loc5_ = new §_-7Ao§(this._level);
            _loc5_.§_-49T§ = this;
            _loc5_.width = 1;
            _loc5_.length = 1;
            _loc5_.objectId = itemId;
            _loc5_.moveTo(wx + (this.pointerX == 0 ? width / 2 : this.pointerX),wy + (this.pointerY == 0 ? length / 2 : this.pointerY),wz + 2);
            param1.addObject(_loc5_);
         }
      }
      
      override public function serializeToXML(param1:XML) : void
      {
         §_-3nN§(param1);
         param1.@id = itemId;
         param1.@length = length;
         param1.@width = width;
         param1.@level = this.level;
         param1.@pointerX = this.pointerX;
         param1.@pointerY = this.pointerY;
      }
      
      override public function unserializeFromXML(param1:XML) : void
      {
         §_-CdM§(param1);
         if(param1.hasOwnProperty("@id"))
         {
            itemId = param1["@id"];
            length = param1["@length"];
            width = param1["@width"];
            this.level = param1["@level"];
            this.pointerX = param1["@pointerX"];
            this.pointerY = param1["@pointerY"];
         }
      }
      
      public function get shopItem() : §_-AfC§
      {
         var _loc1_:§_-5jU§ = Context.§_-70S§.§_-0ZU§().findCategoryById(§_-8Fp§.§_-CEG§);
         if(_loc1_ == null)
         {
            return null;
         }
         return _loc1_.findTypeById(§_-8Fp§.§_-ld§ + this._level) as §_-AfC§;
      }
      
      public function get level() : int
      {
         return this._level;
      }
      
      public function set level(param1:int) : void
      {
         this._level = param1;
      }
      
      public function get pointerX() : Number
      {
         return this.§_-8St§;
      }
      
      public function set pointerX(param1:Number) : void
      {
         this.§_-8St§ = param1;
      }
      
      public function get pointerY() : Number
      {
         return this.§_-3E5§;
      }
      
      public function set pointerY(param1:Number) : void
      {
         this.§_-3E5§ = param1;
      }
   }
}

