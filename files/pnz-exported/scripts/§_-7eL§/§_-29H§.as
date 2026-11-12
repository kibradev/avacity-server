package §_-7eL§
{
   import §_-6-L§.§_-49j§;
   import §_-BeZ§.§_-4Ww§;
   import §_-BeZ§.§_-8d2§;
   
   public class §_-29H§ implements §_-8d2§
   {
      public static const §_-0Rw§:String = "pt";
      
      private var §_-6Ny§:Array = [];
      
      public function §_-29H§()
      {
         super();
      }
      
      public function §_-CY8§(param1:String) : Boolean
      {
         var _loc2_:§_-xE§ = null;
         for each(_loc2_ in this.§_-6Ny§)
         {
            if(_loc2_.typeId == param1)
            {
               return true;
            }
         }
         return false;
      }
      
      public function get §_-BG0§() : Array
      {
         return this.§_-6Ny§;
      }
      
      public function set §_-BG0§(param1:Array) : void
      {
         this.§_-6Ny§ = param1;
      }
      
      public function getPetModel(param1:String) : §_-xE§
      {
         var _loc2_:§_-xE§ = null;
         for each(_loc2_ in this.§_-6Ny§)
         {
            if(_loc2_.id == parseInt(param1))
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      public function clone() : §_-29H§
      {
         var _loc1_:§_-29H§ = new §_-29H§();
         _loc1_.§_-BG0§ = §_-49j§.clone(this.§_-BG0§);
         return _loc1_;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.§_-3f6§(§_-0Rw§,this.§_-6Ny§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.§_-6Ny§ = param1.§_-Bc6§(§_-0Rw§,§_-xE§);
      }
   }
}

