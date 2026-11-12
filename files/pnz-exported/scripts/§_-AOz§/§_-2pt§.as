package §_-AOz§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-1e5§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-2pt§ implements §_-0Yu§
   {
      public static const §_-BPy§:String = "cn";
      
      public static const §_-3Fp§:String = "ctp";
      
      public static const §_-B7d§:String = "cct";
      
      private var _name:String = "";
      
      private var _type:String = "";
      
      private var §_-2SF§:Array = [];
      
      public function §_-2pt§()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function get collection() : Array
      {
         return this.§_-2SF§;
      }
      
      public function set collection(param1:Array) : void
      {
         this.§_-2SF§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-BPy§,this.name);
         param1.put(§_-3Fp§,this.type);
         param1.put(§_-B7d§,new §_-1e5§(this.collection));
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.name = param1.getString(§_-BPy§);
         this.type = param1.getString(§_-3Fp§);
         this.collection = param1.§_-CUA§(§_-B7d§).toArray();
      }
   }
}

