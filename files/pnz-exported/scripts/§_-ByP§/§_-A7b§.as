package §_-ByP§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-A7b§ implements §_-8d2§
   {
      private var §_-AcP§:int = 0;
      
      private var §_-9Hm§:int = 0;
      
      private var _typeId:String = null;
      
      private var §_-61x§:int = 0;
      
      private var §_-79S§:int = 0;
      
      private var §_-aj§:int = 0;
      
      public function §_-A7b§()
      {
         super();
      }
      
      public function get id() : int
      {
         return this.§_-AcP§;
      }
      
      public function set id(param1:int) : void
      {
         this.§_-AcP§ = param1;
      }
      
      public function get campaignId() : int
      {
         return this.§_-9Hm§;
      }
      
      public function set campaignId(param1:int) : void
      {
         this.§_-9Hm§ = param1;
      }
      
      public function get typeId() : String
      {
         return this._typeId;
      }
      
      public function set typeId(param1:String) : void
      {
         this._typeId = param1;
      }
      
      public function get section() : int
      {
         return this.§_-61x§;
      }
      
      public function set section(param1:int) : void
      {
         this.§_-61x§ = param1;
      }
      
      public function get silver() : int
      {
         return this.§_-79S§;
      }
      
      public function set silver(param1:int) : void
      {
         this.§_-79S§ = param1;
      }
      
      public function get gold() : int
      {
         return this.§_-aj§;
      }
      
      public function set gold(param1:int) : void
      {
         this.§_-aj§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-CZf§("id",this.§_-AcP§);
         param1.§_-CZf§("cid",this.§_-9Hm§);
         param1.putString("tid",this._typeId);
         param1.§_-CZf§("sc",this.§_-61x§);
         param1.§_-CZf§("si",this.§_-79S§);
         param1.§_-CZf§("gl",this.§_-aj§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-AcP§ = param1.getInt("id");
         this.§_-9Hm§ = param1.getInt("cid");
         this._typeId = param1.getString("tid");
         this.§_-61x§ = param1.getInt("sc");
         this.§_-79S§ = param1.getInt("si");
         this.§_-aj§ = param1.getInt("gl");
      }
   }
}

