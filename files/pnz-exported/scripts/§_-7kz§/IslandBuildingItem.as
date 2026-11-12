package §_-7kz§
{
   import §_-0sG§.§_-A5E§;
   import §_-53e§.§_-q1§;
   import §_-5g6§.§_-1ib§;
   import §_-5g6§.§_-8Vp§;
   
   public class IslandBuildingItem extends §_-A5E§
   {
      protected var _typeId:String = null;
      
      public function IslandBuildingItem()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-q1§ = null;
         if(param1.worldMode == §_-8Vp§.§_-2BY§)
         {
            _loc3_ = new §_-q1§();
            _loc3_.§_-49T§ = this;
            _loc3_.objectId = itemId;
            _loc3_.moveTo(wx,wy,wz);
            _loc3_.typeId = this._typeId;
            param1.addObject(_loc3_);
         }
      }
      
      public function get typeId() : String
      {
         return this._typeId;
      }
      
      public function set typeId(param1:String) : void
      {
         this._typeId = param1;
      }
      
      override public function serializeToXML(param1:XML) : void
      {
         §_-3nN§(param1);
         param1.@typeId = this._typeId;
      }
      
      override public function unserializeFromXML(param1:XML) : void
      {
         §_-CdM§(param1);
         if(param1.hasOwnProperty("@typeId"))
         {
            this._typeId = param1["@typeId"];
         }
      }
   }
}

