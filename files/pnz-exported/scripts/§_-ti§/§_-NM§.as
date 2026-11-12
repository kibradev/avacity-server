package §_-ti§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-NM§ implements §_-0Yu§
   {
      private var §_-eU§:Boolean;
      
      private var _message:String;
      
      private var _data:§_-4Ww§;
      
      public function §_-NM§(param1:Boolean = false, param2:String = null, param3:§_-4Ww§ = null)
      {
         super();
         this.§_-eU§ = param1;
         this._message = param2;
         this._data = param3;
      }
      
      public function get success() : Boolean
      {
         return this.§_-eU§;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function get data() : §_-4Ww§
      {
         return this._data;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put("success",this.success);
         param1.put("message",this.message);
         param1.put("data",this.data);
         param1.§_-CDr§("data",this._data);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-eU§ = param1.getBoolean("success");
         this._message = param1.getString("message");
         this._data = null;
         if(param1.has("data"))
         {
            this._data = param1.§_-ANw§("data");
         }
      }
   }
}

