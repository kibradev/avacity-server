package §_-3EY§
{
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   
   public class §_-17b§ implements §_-0Yu§
   {
      public static const §_-BJ3§:String = "sk";
      
      public static const §_-2Lu§:String = "ac";
      
      public static const §_-9b7§:String = "rt";
      
      public static const §_-2cZ§:String = "nmc";
      
      private var _skin:String = null;
      
      private var §_-445§:String = null;
      
      private var §_-5Zx§:String = null;
      
      private var §_-78Z§:int = 0;
      
      public function §_-17b§()
      {
         super();
      }
      
      public function get §_-3gS§() : String
      {
         return this.§_-445§;
      }
      
      public function set §_-3gS§(param1:String) : void
      {
         this.§_-445§ = param1;
      }
      
      public function get §_-0m0§() : String
      {
         return this.§_-5Zx§;
      }
      
      public function set §_-0m0§(param1:String) : void
      {
         this.§_-5Zx§ = param1;
      }
      
      public function get skin() : String
      {
         return this._skin;
      }
      
      public function set skin(param1:String) : void
      {
         this._skin = param1;
      }
      
      public function get §_-8MJ§() : int
      {
         return this.§_-78Z§;
      }
      
      public function set §_-8MJ§(param1:int) : void
      {
         this.§_-78Z§ = param1;
      }
      
      public function §_-9XK§() : void
      {
         ++this.§_-78Z§;
      }
      
      public function §_-1A3§(param1:int) : void
      {
         if(this.§_-78Z§ < param1)
         {
            this.§_-78Z§ = 0;
         }
         this.§_-78Z§ -= param1;
      }
      
      public function clone() : §_-17b§
      {
         var _loc1_:§_-17b§ = new §_-17b§();
         _loc1_.§_-3gS§ = this.§_-3gS§;
         _loc1_.skin = this.skin;
         _loc1_.§_-0m0§ = this.§_-0m0§;
         _loc1_.§_-8MJ§ = this.§_-8MJ§;
         return _loc1_;
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-BJ3§,this._skin);
         param1.put(§_-2Lu§,this.§_-445§);
         param1.put(§_-9b7§,this.§_-5Zx§);
         param1.put(§_-2cZ§,this.§_-78Z§);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this._skin = param1.getString(§_-BJ3§,null);
         this.§_-445§ = param1.getString(§_-2Lu§,null);
         this.§_-5Zx§ = param1.getString(§_-9b7§,null);
         this.§_-78Z§ = param1.getInt(§_-2cZ§,0);
      }
   }
}

