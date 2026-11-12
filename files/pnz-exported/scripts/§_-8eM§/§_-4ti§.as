package §_-8eM§
{
   import §_-0Uz§.§_-3mj§;
   import §_-0Uz§.§_-6v4§;
   import §_-18o§.§_-5LJ§;
   import §_-1Bd§.§_-11A§;
   import §_-2qd§.§_-9ai§;
   import §_-3Mv§.§_-4T5§;
   import §_-3VF§.§_-0nG§;
   import §_-5El§.§_-6nW§;
   import §_-5eM§.§_-5d-§;
   import §_-6Pj§.§_-02c§;
   import §_-7kf§.§_-9S8§;
   import §_-8LM§.PhotoSalonDecorItem;
   import §_-8LM§.§_-2AY§;
   import §_-8LM§.§_-TM§;
   import §_-8LM§.§_-ve§;
   import §_-99s§.§_-7Tj§;
   import §_-AKx§.§_-0jI§;
   import §_-AKx§.§_-2-c§;
   import §_-AKx§.§_-4OH§;
   import §_-BLg§.§_-89q§;
   import §_-BXK§.§_-6en§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Bwh§.§_-BYa§;
   import §_-C-a§.§_-3uA§;
   import §_-Cc8§.§_-Az0§;
   import §_-GM§.Context;
   
   public class §_-4ti§ extends §_-6v4§
   {
      public static const §_-CY0§:String = "phsl.bph";
      
      public static const §_-5-8§:String = "phsl.shph";
      
      public static const §_-CJV§:String = "snsh";
      
      private static const §_-1id§:String = "sit";
      
      public static const §_-3TF§:int = 1;
      
      private var §_-5iM§:Object = {};
      
      private var §_-7er§:Object = {};
      
      private var §_-6V§:Array = [];
      
      private var §_-pw§:Object = {};
      
      public function §_-4ti§()
      {
         super();
         §_-1-t§(§_-CY0§,this.§_-ANG§);
         §_-1-t§(§_-5-8§,this.§_-5be§);
      }
      
      public function configure(param1:XML) : void
      {
         var _loc3_:XML = null;
         var _loc4_:XML = null;
         var _loc5_:XML = null;
         this.§_-5iM§ = {};
         this.§_-7er§ = {};
         var _loc2_:§_-TM§ = null;
         for each(_loc3_ in (param1.elements("poses")[0] as XML).elements("pose"))
         {
            _loc2_ = new §_-TM§();
            _loc2_.configure(_loc3_);
            if(_loc2_.gender == §_-3uA§.§_-BO7§)
            {
               this.§_-7er§[_loc2_.id] = _loc2_;
            }
            else
            {
               this.§_-5iM§[_loc2_.id] = _loc2_;
            }
         }
         this.§_-6V§ = [];
         for each(_loc4_ in (param1.elements("compositions")[0] as XML).elements("composition"))
         {
            this.§_-2mK§(_loc4_);
         }
         this.§_-pw§ = {};
         for each(_loc5_ in (param1.elements("themes")[0] as XML).elements("theme"))
         {
            this.§_-5oF§(_loc5_);
         }
      }
      
      private function §_-5oF§(param1:XML) : void
      {
         var _loc2_:§_-2AY§ = new §_-2AY§();
         _loc2_.configure(param1);
         this.§_-pw§[_loc2_.id] = _loc2_;
      }
      
      private function §_-2mK§(param1:XML) : void
      {
         var _loc2_:§_-ve§ = new §_-ve§();
         _loc2_.configure(param1);
         this.§_-6V§.push(_loc2_);
      }
      
      public function get themes() : Object
      {
         return this.§_-pw§;
      }
      
      public function getTheme(param1:String) : §_-2AY§
      {
         return !!this.§_-pw§.hasOwnProperty(param1) ? this.§_-pw§[param1] : null;
      }
      
      public function getRandomComposition(param1:String) : §_-ve§
      {
         var _loc3_:§_-ve§ = null;
         var _loc2_:Array = [];
         for each(_loc3_ in this.§_-6V§)
         {
            if(_loc3_.§_-8fX§ == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         if(_loc2_.length == 0)
         {
            return null;
         }
         return _loc2_[Math.floor(Math.random() * _loc2_.length)];
      }
      
      public function §_-65T§(param1:int, param2:Boolean = true) : §_-TM§
      {
         var _loc5_:§_-TM§ = null;
         var _loc3_:Array = [];
         var _loc4_:Object = param1 == §_-3uA§.§_-908§ ? this.§_-5iM§ : this.§_-7er§;
         for each(_loc5_ in _loc4_)
         {
            if(!(!param2 && _loc5_.§_-8-Q§.indexOf(§_-1id§) >= 0))
            {
               _loc3_.push(_loc5_);
            }
         }
         return §_-5LJ§.§_-9-U§(_loc3_) as §_-TM§;
      }
      
      public function §_-48X§(param1:String) : §_-TM§
      {
         if(this.§_-5iM§.hasOwnProperty(param1))
         {
            return this.§_-5iM§[param1];
         }
         if(this.§_-7er§.hasOwnProperty(param1))
         {
            return this.§_-7er§[param1];
         }
         return null;
      }
      
      public function §_-9mk§(param1:String) : PhotoSalonDecorItem
      {
         var _loc2_:§_-2AY§ = null;
         var _loc3_:Array = null;
         var _loc4_:§_-2AY§ = null;
         for each(_loc2_ in this.themes)
         {
            if(_loc2_.getItem(param1) != null)
            {
               return _loc2_.getItem(param1);
            }
         }
         _loc3_ = §_-0nG§.instance.gameHelper.§_-45b§();
         for each(_loc4_ in _loc3_)
         {
            if(_loc4_.getItem(param1) != null)
            {
               return _loc4_.getItem(param1);
            }
         }
         return null;
      }
      
      public function get §_-0QG§() : Object
      {
         return this.§_-5iM§;
      }
      
      public function get §_-0OP§() : Object
      {
         return this.§_-7er§;
      }
      
      public function §_-1am§(param1:String, param2:String, param3:Function, param4:Function) : void
      {
         §_-02c§.instance.confirm(param1,param2,§_-9S8§.§_-2e2§,param3,param4);
      }
      
      private function §_-ANG§(param1:§_-9ai§) : void
      {
         var snapshot:§_-89q§ = null;
         var event:§_-9ai§ = param1;
         if(!event.data.getBoolean(§_-3mj§.§_-2yH§,false))
         {
            return;
         }
         snapshot = event.data.§_-2jV§(§_-CJV§,§_-89q§);
         this.§_-5rs§(snapshot);
         if(snapshot != null && snapshot.poses.length > 1)
         {
            §_-4OH§.confirm(Context.§_-5o8§.message("shareDialogPhotoConfirmTitle"),Context.§_-5o8§.message("shareDialogPhotoConfirmMessage"),function(param1:§_-2-c§):void
            {
               if(param1.§_-B66§.modalResult == §_-0jI§.§_-9qy§)
               {
                  sharePhoto(snapshot);
               }
            });
         }
         dispatchEvent(new §_-11A§(§_-11A§.BUY_PHOTO_COMPLETED));
      }
      
      private function §_-5rs§(param1:§_-89q§) : void
      {
         new §_-6nW§(param1).showModal();
      }
      
      public function §_-2s3§(param1:§_-89q§) : void
      {
         var _loc4_:§_-4Ww§ = null;
         var _loc2_:§_-2AY§ = this.getTheme(param1.§_-8fX§);
         if(_loc2_ == null)
         {
            return;
         }
         if(_loc2_.isVip && !Context.cityPlayer.§_-3k5§)
         {
            §_-4OH§.§_-B5P§(Context.§_-5o8§.message("warning"),Context.§_-5o8§.message("mustBeVipUserMessage"));
            return;
         }
         var _loc3_:int = §_-4T5§.getItemCount(Context.cityPlayer.inventory.gameCollection,§_-Az0§.§_-AZ-§) - _loc2_.price;
         if(_loc3_ < 0)
         {
            this.§_-B4§(Math.abs(_loc3_));
         }
         else
         {
            _loc4_ = new §_-4Ww§();
            _loc4_.§_-6JD§(§_-CJV§,param1);
            §_-6gl§.sendExtMessage(§_-CY0§,_loc4_);
         }
      }
      
      public function §_-B4§(param1:int = 0) : void
      {
         var _loc2_:§_-5d-§ = Context.§_-70S§.§_-0ZU§().findTypeById(§_-Az0§.§_-AZ-§);
         var _loc3_:Object = §_-BYa§.§_-9tU§("tricksShopDialog");
         new §_-6en§(_loc2_ as §_-7Tj§,_loc3_,param1).showModal();
      }
      
      private function sharePhoto(param1:§_-89q§) : void
      {
         var _loc2_:§_-4Ww§ = new §_-4Ww§();
         _loc2_.§_-6JD§(§_-CJV§,param1);
         §_-6gl§.sendExtMessage(§_-5-8§,_loc2_);
      }
      
      private function §_-5be§(param1:§_-9ai§) : void
      {
         var _loc2_:§_-89q§ = param1.data.§_-2jV§(§_-CJV§,§_-89q§);
         this.§_-5rs§(_loc2_);
      }
   }
}

