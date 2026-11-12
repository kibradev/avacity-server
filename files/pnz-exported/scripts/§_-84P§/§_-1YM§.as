package §_-84P§
{
   import §_-041§.§_-6NF§;
   import §_-0Uz§.§_-m3§;
   import §_-7xl§.§_-5m-§;
   import §_-8Nj§.§_-07f§;
   import §_-8Nj§.§_-a4§;
   import §_-hW§.§_-B6y§;
   import §_-hW§.§_-zd§;
   import ags.§_-5x-§;
   
   public class §_-1YM§ extends §_-5m-§ implements §_-m3§
   {
      private var §_-9Dg§:Vector.<§_-07f§> = new Vector.<§_-07f§>();
      
      private var §_-BSU§:Vector.<§_-a4§> = new Vector.<§_-a4§>();
      
      private var §_-9Jt§:Vector.<§_-zd§> = new Vector.<§_-zd§>();
      
      private var §_-yY§:Vector.<§_-B6y§> = new Vector.<§_-B6y§>();
      
      private var _netManager:§_-6NF§ = null;
      
      public function §_-1YM§()
      {
         super();
         this._netManager = new §_-6NF§();
      }
      
      public function §_-2bH§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-07f§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("achievement"))
         {
            _loc3_ = new §_-07f§();
            _loc3_.configure(_loc2_);
            this.§_-9Dg§.push(_loc3_);
         }
      }
      
      public function §_-8Xx§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-a4§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in param1.elements("trophy"))
         {
            _loc3_ = new §_-a4§();
            _loc3_.configure(_loc2_);
            this.§_-BSU§.push(_loc3_);
         }
      }
      
      public function §_-4ME§(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:XML = null;
         var _loc4_:§_-zd§ = null;
         var _loc5_:§_-B6y§ = null;
         if(param1 == null)
         {
            return;
         }
         for each(_loc2_ in (param1.elements("avapacas")[0] as XML).elements("avapac"))
         {
            _loc4_ = new §_-zd§();
            _loc4_.configure(_loc2_);
            this.§_-9Jt§.push(_loc4_);
         }
         for each(_loc3_ in (param1.elements("awards")[0] as XML).elements("award"))
         {
            _loc5_ = new §_-B6y§();
            _loc5_.configure(_loc3_);
            this.§_-yY§.push(_loc5_);
         }
      }
      
      public function get §_-d1§() : Vector.<§_-07f§>
      {
         return this.§_-9Dg§;
      }
      
      public function get §_-2us§() : Vector.<§_-a4§>
      {
         return this.§_-BSU§;
      }
      
      public function get §_-4qw§() : Vector.<§_-zd§>
      {
         return this.§_-9Jt§;
      }
      
      public function get §_-3Tq§() : Vector.<§_-B6y§>
      {
         return this.§_-yY§;
      }
      
      public function §_-3tL§(param1:String) : §_-07f§
      {
         var _loc2_:§_-07f§ = null;
         for each(_loc2_ in this.§_-9Dg§)
         {
            if(_loc2_.§_-2X5§ == param1)
            {
               return _loc2_;
            }
         }
         throw new Error("invalid achievement descriptor id= " + param1);
      }
      
      public function §_-4a2§(param1:String) : §_-a4§
      {
         var _loc2_:§_-a4§ = null;
         for each(_loc2_ in this.§_-BSU§)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         throw new Error("invalid trophy descriptor id= " + param1);
      }
      
      public function set netClient(param1:§_-5x-§) : void
      {
         this._netManager.netClient = param1;
      }
      
      public function resetAchievements() : void
      {
         this._netManager.resetAchievements();
      }
      
      public function §_-2GP§(param1:String) : void
      {
         this._netManager.§_-2GP§(param1);
      }
      
      public function §_-0uR§(param1:String) : void
      {
         this._netManager.§_-0uR§(param1);
      }
      
      override public function destroy() : void
      {
         if(destroyed)
         {
            return;
         }
         if(this._netManager != null)
         {
            this._netManager.destroy();
            this._netManager = null;
         }
         super.destroy();
      }
   }
}

