package §_-52p§
{
   import §_-6EA§.§_-Cb1§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-8jF§ extends §_-25R§
   {
      public static const §_-6DE§:String = "rb";
      
      public static const §_-2hX§:String = "vtlt";
      
      public static const §_-8yX§:String = "bns";
      
      private var §_-BYK§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-BJY§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-0AE§:§_-Cb1§ = new §_-Cb1§(0);
      
      public function §_-8jF§(param1:int = 0, param2:int = 0, param3:int = 0, param4:int = 0, param5:int = 0)
      {
         this.ruby = param4;
         this.bones = param5;
         super(param1,param2,param3);
      }
      
      override public function isGE(param1:§_-25R§) : Boolean
      {
         if(param1 is §_-8jF§ && ((param1 as §_-8jF§).ruby > this.ruby || (param1 as §_-8jF§).bones > this.bones))
         {
            return false;
         }
         return super.isGE(param1);
      }
      
      override public function isEmpty() : Boolean
      {
         return this.ruby <= 0 && this.bones <= 0 && super.isEmpty();
      }
      
      override public function substract(param1:§_-25R§) : §_-25R§
      {
         if(param1 is §_-8jF§)
         {
            this.ruby -= (param1 as §_-8jF§).ruby;
            this.bones -= (param1 as §_-8jF§).bones;
         }
         return super.substract(param1);
      }
      
      override public function add(param1:§_-25R§) : §_-25R§
      {
         if(param1 is §_-8jF§)
         {
            this.ruby += (param1 as §_-8jF§).ruby;
         }
         return super.add(param1);
      }
      
      override public function mult(param1:uint) : §_-25R§
      {
         this.ruby *= param1;
         this.bones *= param1;
         return super.mult(param1);
      }
      
      override public function multNumber(param1:Number) : §_-25R§
      {
         this.ruby *= param1;
         this.bones *= param1;
         return super.multNumber(param1);
      }
      
      public function get ruby() : int
      {
         return this.§_-BYK§.value;
      }
      
      public function set ruby(param1:int) : void
      {
         this.§_-BYK§.value = param1;
      }
      
      public function get vitality() : int
      {
         return this.§_-BJY§.value;
      }
      
      public function set vitality(param1:int) : void
      {
         this.§_-BJY§.value = param1;
      }
      
      public function get bones() : int
      {
         return this.§_-0AE§.value;
      }
      
      public function set bones(param1:int) : void
      {
         this.§_-0AE§.value = param1;
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.ruby = param1.getInt(§_-6DE§);
         this.vitality = param1.getInt(§_-2hX§);
         this.bones = param1.getInt(§_-8yX§);
      }
      
      override public function toAGSObject(param1:§_-4Ww§) : void
      {
         super.toAGSObject(param1);
         param1.§_-CZf§(§_-6DE§,this.ruby);
         param1.§_-CZf§(§_-2hX§,this.vitality);
         param1.§_-CZf§(§_-8yX§,this.bones);
      }
      
      override public function fromXML(param1:XML) : void
      {
         super.fromXML(param1);
         this.ruby = !!param1.hasOwnProperty("@ruby") ? int(param1["@ruby"]) : 0;
         this.vitality = !!param1.hasOwnProperty("@vitality") ? int(param1["@vitality"]) : 0;
         this.bones = !!param1.hasOwnProperty("@bones") ? int(param1["@bones"]) : 0;
      }
   }
}

