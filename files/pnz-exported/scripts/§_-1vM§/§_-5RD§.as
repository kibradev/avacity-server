package §_-1vM§
{
   import §_-BeZ§.§_-4Ww§;
   import §_-GM§.Context;
   
   public class §_-5RD§ extends §_-0AJ§
   {
      private static const §_-4QX§:String = "st";
      
      private static const §_-6wF§:String = "ptt";
      
      private static const §_-9Ao§:String = "l";
      
      private var §_-AHo§:String = null;
      
      private var §_-AAk§:String = null;
      
      private var §_-XT§:String = null;
      
      public function §_-5RD§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-AHo§ = !!param1.hasOwnProperty("@subType") ? String(param1["@subType"]) : null;
         this.§_-AAk§ = !!param1.hasOwnProperty("@petType") ? String(param1["@petType"]) : null;
         this.§_-XT§ = !!param1.hasOwnProperty("@library") ? param1["@library"] : null;
      }
      
      public function get subType() : String
      {
         return this.§_-AHo§;
      }
      
      public function get petType() : String
      {
         return this.§_-AAk§;
      }
      
      public function get library() : String
      {
         return this.§_-XT§;
      }
      
      public function intersect(param1:§_-5RD§) : Boolean
      {
         if(param1.petType != this.petType)
         {
            return false;
         }
         if(param1.category.categoryId == category.categoryId && param1.subType == this.subType)
         {
            return true;
         }
         return Context.§_-C8W§.§_-8NI§(this,param1);
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-AHo§ = param1.getString(§_-4QX§);
         this.§_-AAk§ = param1.getString(§_-6wF§);
         this.§_-XT§ = param1.getString(§_-9Ao§);
      }
   }
}

