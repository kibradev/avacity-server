package §_-5wm§
{
   import §_-18o§.§_-A8q§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import flash.errors.IllegalOperationError;
   
   public class §_-BOZ§ implements §_-0Yu§
   {
      public static const §_-4Fb§:String = "c";
      
      public static const §_-91R§:String = "updi";
      
      protected var §_-3LT§:Object = {};
      
      public function §_-BOZ§()
      {
         super();
      }
      
      public function §_-42§(param1:§_-5YM§) : void
      {
         this.§_-3LT§[param1.collectionId] = param1;
      }
      
      public function §_-Bc6§(param1:String) : §_-5YM§
      {
         if(!this.§_-3LT§.hasOwnProperty(param1))
         {
            this.§_-42§(new §_-5YM§(param1));
         }
         return this.§_-3LT§[param1];
      }
      
      public function getCollectionForItem(param1:InventoryItem) : §_-5YM§
      {
         throw new IllegalOperationError("Must override");
      }
      
      public function getItemCollectionId(param1:String) : String
      {
         throw new IllegalOperationError("Must override");
      }
      
      public function putItem(param1:InventoryItem) : void
      {
         var _loc2_:§_-5YM§ = this.getCollectionForItem(param1);
         if(_loc2_ != null)
         {
            _loc2_.putItem(param1);
            return;
         }
         throw new Error("Collection for item with type: " + param1.typeId + " not found");
      }
      
      public function get §_-AKy§() : Object
      {
         return this.§_-3LT§;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-5CI§(§_-4Fb§,this.§_-3LT§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-3LT§ = param1.getMap(§_-4Fb§,§_-5YM§);
      }
      
      public function clone() : §_-BOZ§
      {
         return §_-A8q§.§_-7t§(this);
      }
   }
}

