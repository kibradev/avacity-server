package §_-52p§
{
   import §_-63P§.§_-5PR§;
   import §_-6EA§.§_-Cb1§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-25R§ implements §_-0Yu§
   {
      public static const §_-1sg§:String = "gld";
      
      public static const §_-8xg§:String = "slvr";
      
      public static const §_-62U§:String = "enrg";
      
      private var §_-79S§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-aj§:§_-Cb1§ = new §_-Cb1§(0);
      
      private var §_-1Rh§:§_-Cb1§ = new §_-Cb1§(0);
      
      public function §_-25R§(param1:int = 0, param2:int = 0, param3:int = 0)
      {
         super();
         this.gold = param1;
         this.silver = param2;
         this.energy = param3;
      }
      
      public function get gold() : int
      {
         return this.§_-aj§.value;
      }
      
      public function set gold(param1:int) : void
      {
         this.§_-aj§.value = param1;
      }
      
      public function get silver() : int
      {
         return this.§_-79S§.value;
      }
      
      public function set silver(param1:int) : void
      {
         this.§_-79S§.value = param1;
      }
      
      public function get energy() : int
      {
         return this.§_-1Rh§.value;
      }
      
      public function set energy(param1:int) : void
      {
         this.§_-1Rh§.value = param1;
      }
      
      public function isGE(param1:§_-25R§) : Boolean
      {
         if(param1.gold > this.gold)
         {
            return false;
         }
         if(param1.silver > this.silver)
         {
            return false;
         }
         if(param1.energy > this.energy)
         {
            return false;
         }
         return true;
      }
      
      public function isEmpty() : Boolean
      {
         return this.gold <= 0 && this.silver <= 0 && this.energy == 0;
      }
      
      public function substract(param1:§_-25R§) : §_-25R§
      {
         this.silver -= param1.silver;
         this.gold -= param1.gold;
         this.energy -= param1.energy;
         return this;
      }
      
      public function add(param1:§_-25R§) : §_-25R§
      {
         this.gold += param1.gold;
         this.silver += param1.silver;
         this.energy += param1.energy;
         return this;
      }
      
      public function mult(param1:uint) : §_-25R§
      {
         this.gold *= param1;
         this.silver *= param1;
         this.energy *= param1;
         return this;
      }
      
      public function multNumber(param1:Number) : §_-25R§
      {
         this.gold *= param1;
         this.silver *= param1;
         this.energy *= param1;
         return this;
      }
      
      public function §_-3Eh§(param1:String) : void
      {
         var _loc4_:String = null;
         var _loc5_:Array = null;
         var _loc6_:String = null;
         var _loc7_:String = null;
         var _loc8_:int = 0;
         if(param1 == null || param1 == "")
         {
            return;
         }
         var _loc2_:Array = param1.split(",");
         var _loc3_:int = 0;
         for(; _loc3_ < _loc2_.length; _loc3_++)
         {
            _loc4_ = _loc2_[_loc3_];
            _loc5_ = _loc4_.split(":");
            if(_loc5_.length != 2)
            {
               continue;
            }
            _loc6_ = §_-5PR§.§_-eu§((_loc5_[0] as String).toLowerCase());
            _loc7_ = §_-5PR§.§_-eu§(_loc5_[1]);
            _loc8_ = parseInt(_loc7_);
            if(isNaN(_loc8_))
            {
               continue;
            }
            switch(_loc6_)
            {
               case "gold":
                  this.gold = _loc8_;
                  break;
               case "silver":
                  this.silver = _loc8_;
                  break;
               case "energy":
                  this.energy = _loc8_;
                  break;
            }
         }
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.gold = param1.getInt(§_-1sg§);
         this.silver = param1.getInt(§_-8xg§);
         this.energy = param1.getInt(§_-62U§);
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-1sg§,this.gold);
         param1.put(§_-8xg§,this.silver);
         param1.put(§_-62U§,this.energy);
      }
      
      public function fromXML(param1:XML) : void
      {
         this.gold = !!param1.hasOwnProperty("@gold") ? int(param1["@gold"]) : 0;
         this.silver = !!param1.hasOwnProperty("@silver") ? int(param1["@silver"]) : 0;
         this.energy = !!param1.hasOwnProperty("@energy") ? int(param1["@energy"]) : 0;
      }
   }
}

