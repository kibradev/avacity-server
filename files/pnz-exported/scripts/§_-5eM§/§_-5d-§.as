package §_-5eM§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import adept.config.Configuration;
   
   public class §_-5d-§ implements §_-0Yu§
   {
      private static const §_-qS§:String = "tpid";
      
      private static const §_-lS§:String = "lb";
      
      private var _typeId:String;
      
      private var §_-5xz§:§_-5jU§ = null;
      
      private var _label:String;
      
      public var §_-BlF§:§_-4Z7§ = null;
      
      public function §_-5d-§()
      {
         super();
      }
      
      public function loadXML(param1:XML) : void
      {
         this._typeId = param1["@id"];
         this._label = !!param1.hasOwnProperty("@label") ? param1["@label"] : null;
      }
      
      public function loadConfig(param1:Configuration) : void
      {
         this._typeId = param1.getString("id");
         this._label = param1.getString("label");
      }
      
      public function get typeId() : String
      {
         return this._typeId;
      }
      
      public function set typeId(param1:String) : void
      {
         this._typeId = param1;
      }
      
      public function get label() : String
      {
         return this._label;
      }
      
      public function findParentCategory(param1:String) : §_-5jU§
      {
         return this.category.findParentById(param1);
      }
      
      public function get category() : §_-5jU§
      {
         return this.§_-5xz§;
      }
      
      public function set category(param1:§_-5jU§) : void
      {
         this.§_-5xz§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-qS§,this.typeId);
         param1.put(§_-lS§,this.label);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this._typeId = param1.getString(§_-qS§);
         this._label = param1.getString(§_-lS§,null);
      }
   }
}

