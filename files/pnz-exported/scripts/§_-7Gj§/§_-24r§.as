package §_-7Gj§
{
   import §_-18o§.§_-ABX§;
   import §_-1l5§.§_-9Yj§;
   
   public class §_-24r§
   {
      private var §_-5MF§:int = 0;
      
      private var _type:String = null;
      
      private var §_-Avc§:String = null;
      
      private var §_-4o2§:§_-9Yj§ = null;
      
      public function §_-24r§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         this.§_-5MF§ = !!param1.hasOwnProperty("@order") ? int(param1["@order"]) : 0;
         this._type = !!param1.hasOwnProperty("@type") ? param1["@type"] : null;
         this.§_-Avc§ = !!param1.hasOwnProperty("@title") ? param1["@title"] : null;
      }
      
      public function get order() : int
      {
         return this.§_-5MF§;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get title() : String
      {
         return this.§_-Avc§;
      }
      
      public function get localizedTitle() : String
      {
         return §_-ABX§.§_-631§(this.§_-Avc§);
      }
      
      public function get offerDescriptor() : §_-9Yj§
      {
         return this.§_-4o2§;
      }
      
      public function set offerDescriptor(param1:§_-9Yj§) : void
      {
         this.§_-4o2§ = param1;
      }
      
      public function execute() : void
      {
      }
      
      public function validate(param1:Function) : void
      {
         param1(this.order,false);
      }
   }
}

