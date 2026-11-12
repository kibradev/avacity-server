package §_-0sG§
{
   import §_-5MD§.§_-RT§;
   import §_-5g6§.§_-1ib§;
   import §_-5g6§.§_-8Vp§;
   
   public class §_-2fL§ extends §_-A5E§
   {
      protected var §_-8Fk§:String = null;
      
      public function §_-2fL§()
      {
         super();
      }
      
      override public function apply(param1:§_-1ib§, param2:Object) : void
      {
         var _loc3_:§_-RT§ = null;
         if(param1.worldMode == §_-8Vp§.§_-2BY§)
         {
            _loc3_ = new §_-RT§();
            _loc3_.§_-49T§ = this;
            _loc3_.objectId = itemId;
            _loc3_.tag = this.tag;
            _loc3_.moveTo(wx,wy,wz);
            param1.addObject(_loc3_);
         }
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
      
      public function get tag() : String
      {
         return this.§_-8Fk§;
      }
      
      public function set tag(param1:String) : void
      {
         this.§_-8Fk§ = param1;
      }
   }
}

