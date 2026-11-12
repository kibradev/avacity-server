package §_-1l5§
{
   import §_-18o§.§_-ABX§;
   import §_-54O§.§_-9i9§;
   import §_-54O§.§_-CM6§;
   import §_-5PB§.§_-C3t§;
   import §_-6-L§.§_-6aF§;
   import §_-7Gj§.§_-24r§;
   import §_-7Gj§.§_-3Gm§;
   import §_-7Gj§.§_-3gi§;
   
   public class §_-9Yj§
   {
      private var §_-AcP§:String = null;
      
      private var §_-BPa§:Boolean = false;
      
      private var §_-8W3§:String = null;
      
      private var §_-5V7§:String = null;
      
      private var §_-uX§:§_-9i9§ = null;
      
      private var §_-C6t§:Object = {};
      
      private var _target:§_-7Zo§ = null;
      
      private var §_-9Wb§:§_-C3t§ = null;
      
      public function §_-9Yj§()
      {
         super();
      }
      
      public function configure(param1:XML) : void
      {
         var _loc2_:XML = null;
         var _loc3_:§_-24r§ = null;
         this.§_-AcP§ = param1["@id"];
         this.§_-BPa§ = Boolean(param1.hasOwnProperty("button")) && param1["button"][0]["@active"] == "1";
         this.§_-8W3§ = Boolean(param1.hasOwnProperty("button")) && Boolean(param1["button"][0].hasOwnProperty("@title")) ? param1["button"][0]["@title"] : null;
         this.§_-5V7§ = Boolean(param1.hasOwnProperty("button")) && Boolean(param1["button"][0].hasOwnProperty("@skin")) ? param1["button"][0]["@skin"] : null;
         if(param1.hasOwnProperty("scenario"))
         {
            this.§_-uX§ = §_-CM6§.§_-CdL§(param1["scenario"][0]["@type"]);
            this.§_-uX§.configure(param1["scenario"][0]);
         }
         if(this.§_-uX§ == null)
         {
            this.§_-uX§ = new §_-9i9§();
         }
         if(param1.hasOwnProperty("target"))
         {
            this._target = new §_-7Zo§();
            this._target.configure(param1["target"][0]);
         }
         if(param1.hasOwnProperty("steps"))
         {
            for each(_loc2_ in (param1.elements("steps")[0] as XML).elements("step"))
            {
               _loc3_ = §_-3Gm§.§_-9Em§(_loc2_["@type"]);
               if(_loc3_ != null)
               {
                  _loc3_.configure(_loc2_);
                  _loc3_.offerDescriptor = this;
                  this.§_-C6t§[_loc3_.order] = _loc3_;
               }
            }
         }
         if(param1.hasOwnProperty("stats"))
         {
            this.§_-9Wb§ = new §_-C3t§();
            this.§_-9Wb§.offerDescriptor = this;
            this.§_-9Wb§.configure(param1["stats"][0]);
         }
      }
      
      public function get id() : String
      {
         return this.§_-AcP§;
      }
      
      public function get §_-AII§() : Boolean
      {
         return this.§_-BPa§;
      }
      
      public function get buttonTitle() : String
      {
         return §_-ABX§.§_-631§(this.§_-8W3§);
      }
      
      public function get §_-9KQ§() : String
      {
         return this.§_-5V7§;
      }
      
      public function get scenario() : §_-9i9§
      {
         return this.§_-uX§;
      }
      
      public function get target() : §_-7Zo§
      {
         return this._target;
      }
      
      public function get steps() : Object
      {
         return this.§_-C6t§;
      }
      
      public function getStep(param1:int) : §_-24r§
      {
         return !!this.§_-C6t§.hasOwnProperty(String(param1)) ? this.§_-C6t§[param1] : null;
      }
      
      public function get §_-5w9§() : §_-3gi§
      {
         var _loc1_:§_-24r§ = null;
         for each(_loc1_ in this.§_-C6t§)
         {
            if(_loc1_ is §_-3gi§)
            {
               return _loc1_ as §_-3gi§;
            }
         }
         return null;
      }
      
      public function get §_-4Rh§() : int
      {
         return §_-6aF§.toArray(this.§_-C6t§).length;
      }
      
      public function get statDescriptor() : §_-C3t§
      {
         return this.§_-9Wb§;
      }
   }
}

