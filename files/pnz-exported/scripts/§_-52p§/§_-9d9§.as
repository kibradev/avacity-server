package §_-52p§
{
   import §_-18o§.§_-A8q§;
   import §_-6EA§.§_-Cb1§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-9d9§ extends §_-8jF§
   {
      public static const §_-616§:String = "emd";
      
      public static const §_-CKI§:String = "vmd";
      
      private var §_-A3m§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-8vu§:§_-Cb1§ = new §_-Cb1§(0);
      
      public function §_-9d9§()
      {
         super();
      }
      
      public function get energyModifiedDate() : int
      {
         return this.§_-A3m§.value;
      }
      
      public function set energyModifiedDate(param1:int) : void
      {
         this.§_-A3m§.value = param1;
      }
      
      public function get §_-3dC§() : int
      {
         return this.§_-8vu§.value;
      }
      
      public function set §_-3dC§(param1:int) : void
      {
         this.§_-8vu§.value = param1;
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.energyModifiedDate = param1.getInt(§_-616§);
         this.§_-3dC§ = param1.getInt(§_-CKI§);
      }
      
      override public function toAGSObject(param1:§_-4Ww§) : void
      {
         super.toAGSObject(param1);
         param1.put(§_-616§,this.energyModifiedDate);
         param1.put(§_-CKI§,this.§_-3dC§);
      }
      
      public function clone() : §_-9d9§
      {
         return §_-A8q§.§_-7t§(this);
      }
      
      public function toString() : String
      {
         return "gold: " + gold + "; silver: " + silver + "; energy: " + energy + "; energyModifiedDate: " + this.energyModifiedDate + "vitalityModifiedDate: " + this.§_-3dC§ + "; ruby: " + ruby;
      }
   }
}

