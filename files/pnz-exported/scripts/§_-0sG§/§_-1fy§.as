package §_-0sG§
{
   import §_-5MD§.§_-C9k§;
   import §_-5g6§.§_-1ib§;
   
   public class §_-1fy§ extends §_-A5E§
   {
      protected var _kind:String;
      
      protected var _skin:String;
      
      protected var §_-AKu§:String = null;
      
      public function §_-1fy§()
      {
         super();
      }
      
      protected function createObject() : §_-C9k§
      {
         return new §_-C9k§();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-C9k§ = this.createObject();
         _loc3_.§_-6S6§ = this._kind;
         if(this._skin != null)
         {
            _loc3_.skinName = this._skin;
         }
         _loc3_.§_-49T§ = this;
         _loc3_.objectId = itemId;
         _loc3_.moveTo(wx,wy,wz);
         param1.addObject(_loc3_);
      }
      
      override public function serializeToXML(param1:XML) : void
      {
         §_-3nN§(param1);
         param1.@id = itemId;
      }
      
      override public function unserializeFromXML(param1:XML) : void
      {
         §_-CdM§(param1);
         if(param1.hasOwnProperty("@id"))
         {
            itemId = param1["@id"];
         }
      }
      
      public function get kind() : String
      {
         return this._kind;
      }
      
      public function set kind(param1:String) : void
      {
         this._kind = param1;
      }
      
      public function get skin() : String
      {
         return this._skin;
      }
      
      public function set skin(param1:String) : void
      {
         this._skin = param1;
      }
      
      public function get layer() : String
      {
         return this.§_-AKu§;
      }
      
      public function set layer(param1:String) : void
      {
         this.§_-AKu§ = param1;
      }
   }
}

