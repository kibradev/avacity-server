package §_-7s3§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-2X1§ implements §_-0Yu§
   {
      public static const §_-2IK§:String = "bdc";
      
      public static const §_-4Me§:String = "bt";
      
      public static const §_-8dr§:String = "tcl";
      
      public static const §_-CQb§:String = "spks";
      
      private var §_-A3u§:String = null;
      
      private var §_-X5§:String = null;
      
      private var §_-2g0§:String = null;
      
      private var §_-2cH§:Array = [];
      
      public function §_-2X1§()
      {
         super();
      }
      
      public function get §_-9mO§() : String
      {
         return this.§_-A3u§;
      }
      
      public function set §_-9mO§(param1:String) : void
      {
         this.§_-A3u§ = param1;
      }
      
      public function get textColor() : String
      {
         return this.§_-2g0§;
      }
      
      public function get §_-6Bm§() : String
      {
         return this.§_-X5§;
      }
      
      public function set §_-6Bm§(param1:String) : void
      {
         this.§_-X5§ = param1;
      }
      
      public function set textColor(param1:String) : void
      {
         this.§_-2g0§ = param1;
      }
      
      public function get §_-6Jm§() : Array
      {
         return this.§_-2cH§;
      }
      
      public function set §_-6Jm§(param1:Array) : void
      {
         this.§_-2cH§ = param1 == null ? [] : param1;
      }
      
      public function clone() : §_-2X1§
      {
         var _loc1_:§_-2X1§ = new §_-2X1§();
         _loc1_.§_-9mO§ = this.§_-9mO§;
         _loc1_.textColor = this.textColor;
         _loc1_.§_-6Jm§ = this.§_-6Jm§;
         _loc1_.§_-6Bm§ = this.§_-6Bm§;
         return _loc1_;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-2IK§,this.§_-A3u§);
         param1.put(§_-8dr§,this.§_-2g0§);
         param1.§_-3f6§(§_-CQb§,this.§_-2cH§);
         param1.put(§_-4Me§,this.§_-X5§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-9mO§ = param1.getString(§_-2IK§,null);
         this.textColor = param1.getString(§_-8dr§,null);
         this.§_-6Jm§ = param1.§_-Bc6§(§_-CQb§,Array);
         this.§_-6Bm§ = param1.getString(§_-4Me§,null);
      }
   }
}

