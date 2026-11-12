package §_-MZ§
{
   import §_-0sG§.§_-BW1§;
   import §_-5MD§.§_-6vA§;
   import §_-6-L§.§_-3hw§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-12j§ implements §_-0Yu§
   {
      public static const §_-6Ud§:String = "id";
      
      public static const §_-e1§:String = "pr_";
      
      private static const §_-BxX§:String = "uc";
      
      private static const §_-8Iz§:String = "bgs";
      
      private static const §_-592§:String = "ml";
      
      private static const §_-1eF§:String = "vip";
      
      private static const §_-CVt§:String = "dc";
      
      private static const §_-0hX§:String = "ip";
      
      private var §_-4OB§:§_-7zb§ = null;
      
      private var §_-66m§:String = "";
      
      private var §_-0Ln§:String = null;
      
      private var _map:§_-6vA§ = null;
      
      private var §_-C2L§:Array = [];
      
      private var §_-2Ir§:int = 0;
      
      private var §_-57i§:Boolean = false;
      
      private var §_-9Op§:String = null;
      
      private var §_-6EU§:Boolean = false;
      
      public function §_-12j§()
      {
         super();
      }
      
      public function fromXML(param1:XML) : void
      {
         this.§_-66m§ = §_-3hw§.getString(param1,"@id","");
         this.§_-0Ln§ = §_-3hw§.getString(param1,"@map");
         this.§_-C2L§ = §_-3hw§.getList(param1,"@backgroundSound",[]);
         this.§_-2Ir§ = §_-3hw§.getInt(param1,"@minLevel");
         this.§_-57i§ = §_-3hw§.getBoolean(param1,"@vip");
         this.§_-9Op§ = §_-3hw§.getString(param1,"@dresscode");
         this.§_-6EU§ = §_-3hw§.getBoolean(param1,"@isPersonal");
      }
      
      public function get §_-jY§() : §_-7zb§
      {
         return this.§_-4OB§;
      }
      
      public function set §_-jY§(param1:§_-7zb§) : void
      {
         this.§_-4OB§ = param1;
      }
      
      public function get roomId() : String
      {
         return this.§_-66m§;
      }
      
      public function get minLevel() : int
      {
         return this.§_-2Ir§;
      }
      
      public function get isVip() : Boolean
      {
         return this.§_-57i§;
      }
      
      public function get §_-6bS§() : String
      {
         return this.§_-9Op§;
      }
      
      public function get mapName() : String
      {
         return this.§_-0Ln§;
      }
      
      public function set mapName(param1:String) : void
      {
         if(this.§_-0Ln§ != param1)
         {
            this.§_-0Ln§ = param1;
            this._map = §_-BW1§.instance.getMap(this.§_-0Ln§);
         }
      }
      
      public function get map() : §_-6vA§
      {
         if(this._map == null)
         {
            this._map = §_-BW1§.instance.getMap(this.§_-0Ln§);
         }
         return this._map;
      }
      
      public function get backgroundSound() : Array
      {
         return this.§_-C2L§;
      }
      
      public function get §_-22F§() : Boolean
      {
         return this.§_-6EU§;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-66m§ = param1.getString(§_-6Ud§);
         this.§_-0Ln§ = param1.getString(§_-BxX§);
         this.§_-C2L§ = param1.getString(§_-8Iz§,"").split(",");
         this.§_-2Ir§ = param1.getInt(§_-592§);
         this.§_-57i§ = param1.getBoolean(§_-1eF§);
         this.§_-6EU§ = param1.getBoolean(§_-0hX§);
         this.§_-9Op§ = param1.getString(§_-CVt§);
      }
   }
}

