package §_-1vM§
{
   import §_-0ZX§.§_-1Sh§;
   import §_-6p3§.§_-CYP§;
   import §_-7eL§.§_-xE§;
   
   public class §_-6He§ extends §_-0AJ§
   {
      private static const §_-8yk§:int = 0;
      
      private var §_-6LX§:Object = {};
      
      protected var §_-2ZP§:int = 9999;
      
      protected var §_-6IY§:Boolean = true;
      
      private var §_-8Vk§:String = null;
      
      private var §_-38T§:String = null;
      
      private var §_-4pH§:Boolean = false;
      
      public function §_-6He§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         super.loadXML(param1);
         if(param1.hasOwnProperty("modifiers"))
         {
            for each(_loc2_ in (param1.elements("modifiers")[0] as XML).elements("modifier"))
            {
               this.§_-6LX§[_loc2_["@name"]] = parseFloat(_loc2_["@effect"]);
            }
         }
         this.§_-2ZP§ = !!param1.hasOwnProperty("@buyCount") ? int(param1["@buyCount"]) : 9999;
         this.§_-6IY§ = !param1.hasOwnProperty("@showButton") || int(param1["@showButton"]) == 1;
         this.§_-8Vk§ = !!param1.hasOwnProperty("@assetName") ? String(param1["@assetName"]) : "";
         this.§_-38T§ = !!param1.hasOwnProperty("@buttonAssetName") ? String(param1["@buttonAssetName"]) : "";
         this.§_-4pH§ = !!param1.hasOwnProperty("@animated") ? Boolean(param1["@animated"]) : false;
      }
      
      public function get showButton() : Boolean
      {
         return this.§_-6IY§;
      }
      
      public function get buyCount() : int
      {
         return this.§_-2ZP§;
      }
      
      public function getEffect(param1:String) : *
      {
         return !!this.§_-6LX§.hasOwnProperty(param1) ? this.§_-6LX§[param1] : null;
      }
      
      public function §_-1NO§(param1:§_-xE§) : Boolean
      {
         param1.calculateParameters();
         if(this.getEffect(§_-1Sh§.§_-6yT§) != null && §_-xE§.§_-AEM§ - param1.energy.value > §_-8yk§)
         {
            return true;
         }
         if(this.getEffect(§_-1Sh§.§_-0R5§) != null && §_-xE§.§_-1E7§ - param1.happiness.value > §_-8yk§)
         {
            return true;
         }
         if(this.getEffect(§_-1Sh§.§_-28k§) != null && §_-xE§.§_-3U4§ - param1.satiety.value > §_-8yk§)
         {
            return true;
         }
         return false;
      }
      
      public function get relatedTypes() : Array
      {
         var _loc1_:String = String(getParam(§_-CYP§.§_-9XR§));
         return _loc1_.split(",");
      }
      
      public function get assetName() : String
      {
         return this.§_-8Vk§;
      }
      
      public function get §_-0fJ§() : String
      {
         return this.§_-38T§;
      }
      
      public function get §_-9Vl§() : Boolean
      {
         return this.§_-4pH§;
      }
   }
}

