package §_-AdD§
{
   import §_-22f§.§_-5LH§;
   import §_-22f§.§_-77s§;
   import §_-23V§.§_-2KC§;
   import §_-23V§.§_-qo§;
   import §_-38A§.§_-9TB§;
   import §_-4Sa§.§_-0dQ§;
   import §_-70D§.§_-k-§;
   import §_-7xl§.§_-7VJ§;
   import §_-9VF§.§_-5ab§;
   import flash.events.Event;
   
   public class §_-3rH§ extends Avatar
   {
      protected var §_-As8§:§_-0O3§ = null;
      
      protected var §_-6tr§:§_-4pS§;
      
      public function §_-3rH§(param1:§_-7VJ§ = null, param2:String = "0", param3:String = "")
      {
         super(param1,param2,param3);
         this.§_-6tr§ = new §_-4pS§(this);
         this.§_-4nW§();
         this.§_-AY4§();
      }
      
      protected function §_-4nW§() : void
      {
         this.§_-As8§ = new §_-0O3§(avatarName,userId);
      }
      
      protected function §_-AY4§() : void
      {
         this.§_-6tr§.setShadow(new §_-9t4§());
      }
      
      public function §_-Bq6§() : void
      {
         this.§_-6ec§();
         this.§_-4nW§();
         if(this.§_-As8§ != null)
         {
            world.addObject(this.§_-As8§);
         }
         this.invalidatePosition();
      }
      
      private function §_-6ec§() : void
      {
         if(this.§_-As8§ != null)
         {
            if(this.§_-As8§.world != null)
            {
               this.§_-As8§.world.removeObject(this.§_-As8§);
            }
            this.§_-As8§ = null;
         }
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         this.§_-6ec§();
         if(this.§_-6tr§ != null)
         {
            this.§_-6tr§.destroy();
            this.§_-6tr§ = null;
         }
         super.destroy();
      }
      
      override public function initObject() : void
      {
         super.initObject();
         if(this.§_-As8§ != null)
         {
            world.addObject(this.§_-As8§);
         }
         if(this.§_-6tr§ != null)
         {
            this.§_-6tr§.setWorld(world);
         }
      }
      
      public function get bubble() : §_-0O3§
      {
         return this.§_-As8§;
      }
      
      override public function fromModel(param1:§_-5ab§) : void
      {
         super.fromModel(param1);
         if(this.§_-As8§ != null)
         {
            this.§_-As8§.§_-BYi§(avatarName);
         }
      }
      
      override public function setAnimation(param1:String, param2:Object = null) : void
      {
         super.setAnimation(param1,param2);
         this.invalidatePosition();
      }
      
      override protected function invalidatePosition() : void
      {
         var _loc1_:§_-9TB§ = null;
         super.invalidatePosition();
         if(this.§_-As8§ != null)
         {
            _loc1_ = this.headOffset;
            this.§_-As8§.wx = wx + cellOffset.x + _loc1_.x;
            this.§_-As8§.wy = wy + cellOffset.y + _loc1_.y;
            this.§_-As8§.wz = wz + 4.5 + _loc1_.z;
         }
         if(this.§_-6tr§ != null)
         {
            this.§_-6tr§.updatePosition();
         }
      }
      
      protected function get headOffset() : §_-9TB§
      {
         return new §_-9TB§();
      }
      
      override public function set visible(param1:Boolean) : void
      {
         super.visible = param1;
         this.§_-As8§.visible = param1;
         this.§_-6tr§.updateVisible(param1);
      }
      
      override public function addAction(param1:§_-qo§, param2:int = -1, param3:int = 0) : void
      {
         this.§_-6cz§(param1);
         dispatchEvent(new §_-0dQ§(§_-0dQ§.§_-851§,param1,param2));
         super.addAction(param1,param2,param3);
      }
      
      protected function §_-2v5§(param1:§_-77s§) : void
      {
         dispatchEvent(new §_-0dQ§(§_-0dQ§.§_-851§,param1.§_-9oy§,param1.tick));
      }
      
      protected function §_-638§(param1:Event) : void
      {
         var _loc2_:§_-qo§ = param1 is §_-77s§ ? (param1 as §_-77s§).§_-9oy§ : param1.currentTarget as §_-qo§;
         this.§_-C-1§(_loc2_);
         dispatchEvent(new §_-0dQ§(§_-0dQ§.§_-5vT§,_loc2_));
      }
      
      protected function onActionStart(param1:Event) : void
      {
         var _loc2_:§_-qo§ = param1 is §_-77s§ ? (param1 as §_-77s§).§_-9oy§ : param1.currentTarget as §_-qo§;
         dispatchEvent(new §_-0dQ§(§_-0dQ§.§_-82q§,_loc2_));
      }
      
      protected function §_-6cz§(param1:§_-qo§) : void
      {
         if(param1 is §_-2KC§)
         {
            param1.addEventListener(§_-77s§.§_-Bty§,this.onActionStart);
            param1.addEventListener(§_-77s§.§_-4z1§,this.§_-638§);
            param1.addEventListener(§_-77s§.§_-1x8§,this.§_-638§);
            param1.addEventListener(§_-77s§.§_-2Ug§,this.§_-638§);
         }
         param1.addEventListener(§_-5LH§.§_-9yD§,this.onActionStart);
         param1.addEventListener(§_-5LH§.§_-2yH§,this.§_-638§);
         param1.addEventListener(§_-5LH§.§_-0RV§,this.§_-638§);
         param1.addEventListener(§_-5LH§.§_-CJt§,this.§_-638§);
         if(param1 is §_-k-§)
         {
            param1.addEventListener(§_-77s§.§_-212§,this.§_-2v5§);
            param1.addEventListener(§_-77s§.§_-Bty§,this.onActionStart);
            param1.addEventListener(§_-77s§.§_-4z1§,this.§_-638§);
            param1.addEventListener(§_-77s§.§_-1x8§,this.§_-638§);
            param1.addEventListener(§_-77s§.§_-2Ug§,this.§_-638§);
         }
      }
      
      protected function §_-C-1§(param1:§_-qo§) : void
      {
         if(param1.destroyed)
         {
            return;
         }
         if(param1 is §_-2KC§)
         {
            param1.removeEventListener(§_-77s§.§_-Bty§,this.onActionStart);
            param1.removeEventListener(§_-77s§.§_-4z1§,this.§_-638§);
            param1.removeEventListener(§_-77s§.§_-1x8§,this.§_-638§);
            param1.removeEventListener(§_-77s§.§_-2Ug§,this.§_-638§);
         }
         param1.removeEventListener(§_-5LH§.§_-9yD§,this.onActionStart);
         param1.removeEventListener(§_-5LH§.§_-2yH§,this.§_-638§);
         param1.removeEventListener(§_-5LH§.§_-0RV§,this.§_-638§);
         param1.removeEventListener(§_-5LH§.§_-CJt§,this.§_-638§);
         if(param1 is §_-k-§)
         {
            param1.removeEventListener(§_-77s§.§_-212§,this.§_-2v5§);
            param1.removeEventListener(§_-77s§.§_-Bty§,this.onActionStart);
            param1.removeEventListener(§_-77s§.§_-4z1§,this.§_-638§);
            param1.removeEventListener(§_-77s§.§_-1x8§,this.§_-638§);
            param1.removeEventListener(§_-77s§.§_-2Ug§,this.§_-638§);
         }
      }
   }
}

