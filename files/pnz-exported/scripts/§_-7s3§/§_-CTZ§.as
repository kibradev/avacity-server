package §_-7s3§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-CTZ§ implements §_-0Yu§
   {
      public static const §_-zf§:String = "tp";
      
      public static const §_-7gX§:String = "_";
      
      private static const §_-Af0§:String = "sid";
      
      private static const §_-5Cl§:String = "cid";
      
      private var _type:String;
      
      private var §_-0Vt§:String;
      
      private var §_-4mA§:String;
      
      private var §_-9Fz§:String = null;
      
      private var §_-BzH§:String;
      
      public function §_-CTZ§(param1:String = null)
      {
         super();
         this._type = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get broadcast() : Boolean
      {
         return this.§_-BzH§ == null || this.§_-BzH§.length == 0;
      }
      
      public function get senderId() : String
      {
         return this.§_-0Vt§;
      }
      
      public function set senderId(param1:String) : void
      {
         this.§_-0Vt§ = param1;
      }
      
      public function get senderName() : String
      {
         return this.§_-4mA§;
      }
      
      public function set senderName(param1:String) : void
      {
         this.§_-4mA§ = param1;
      }
      
      public function get §_-iV§() : String
      {
         return this.§_-9Fz§ != null ? this.§_-9Fz§ : this.§_-4mA§;
      }
      
      public function set §_-iV§(param1:String) : void
      {
         this.§_-9Fz§ = param1;
      }
      
      public function get channelId() : String
      {
         return this.§_-BzH§;
      }
      
      public function set channelId(param1:String) : void
      {
         this.§_-BzH§ = param1;
      }
      
      public function §_-1Ud§(param1:String, param2:String) : void
      {
         if(int(param1) < int(param2))
         {
            this.§_-BzH§ = param1 + §_-7gX§ + param2;
         }
         else
         {
            this.§_-BzH§ = param2 + §_-7gX§ + param1;
         }
      }
      
      public function §_-6JW§(param1:String) : Boolean
      {
         return this.§_-BzH§ != null && this.§_-BzH§.indexOf(param1) >= 0;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-zf§,this._type);
         param1.put(§_-Af0§,this.§_-0Vt§);
         param1.put(§_-5Cl§,this.§_-BzH§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this._type = param1.getString(§_-zf§,null);
         this.§_-0Vt§ = param1.getString(§_-Af0§,null);
         this.§_-BzH§ = param1.getString(§_-5Cl§,null);
      }
   }
}

