package §_-0TK§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-B6z§ implements §_-0Yu§
   {
      public static const MODULE_ID:String = "mi";
      
      private var §_-5X0§:String;
      
      public function §_-B6z§()
      {
         super();
      }
      
      public function get moduleId() : String
      {
         return this.§_-5X0§;
      }
      
      public function set moduleId(param1:String) : void
      {
         this.§_-5X0§ = param1;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(MODULE_ID,this.§_-5X0§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-5X0§ = param1.getString(MODULE_ID,null);
      }
   }
}

