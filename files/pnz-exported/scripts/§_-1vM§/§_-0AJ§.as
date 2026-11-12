package §_-1vM§
{
   import §_-18o§.§_-ABX§;
   import §_-2U3§.ResourceManager;
   import §_-3AW§.§_-7k§;
   import §_-52p§.§_-9d9§;
   import §_-8Hp§.§_-5KD§;
   import §_-99s§.§_-7Tj§;
   import §_-BeZ§.§_-4Ww§;
   import §_-Bwh§.§_-AMW§;
   import §_-ByP§.§_-A7b§;
   import §_-GM§.Context;
   import §_-kr§.§_-2NT§;
   import flash.display.MovieClip;
   
   public class §_-0AJ§ extends §_-7Tj§
   {
      private static const §_-9Fm§:String = "bns";
      
      private static const §_-6BQ§:String = "mpl";
      
      private var §_-0AE§:int = 0;
      
      private var §_-9hj§:int = 0;
      
      private var §_-24q§:String = "";
      
      public function §_-0AJ§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-0AE§ = !!param1.hasOwnProperty("@bones") ? int(param1["@bones"]) : 0;
         this.§_-9hj§ = !!param1.hasOwnProperty("@minPetLevel") ? int(param1["@minPetLevel"]) : 0;
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? String(param1["@description"]) : "";
      }
      
      public function get bones() : int
      {
         var _loc2_:§_-A7b§ = null;
         if(isSaleItem)
         {
            _loc2_ = §_-5KD§.instance.getSaleItem(typeId);
            if(_loc2_ != null)
            {
               return _loc2_.gold;
            }
         }
         var _loc1_:int = Context.§_-C8W§.§_-7i6§();
         if(_loc1_ > 0)
         {
            return Math.ceil(this.§_-0AE§ - this.§_-0AE§ / 100 * _loc1_);
         }
         return this.§_-0AE§;
      }
      
      public function get oldBones() : int
      {
         if(isSaleItem || Context.§_-C8W§.§_-7i6§() > 0)
         {
            return this.§_-0AE§;
         }
         return 0;
      }
      
      public function get minPetLevel() : int
      {
         return this.§_-9hj§;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get localizedDescription() : String
      {
         return §_-ABX§.§_-631§(this.description);
      }
      
      override public function getPrice(param1:int) : §_-9d9§
      {
         var _loc2_:§_-9d9§ = super.getPrice(param1);
         if(param1 == §_-AMW§.§_-85a§ || param1 == §_-AMW§.§_-6Xv§)
         {
            _loc2_.bones = this.bones;
         }
         return _loc2_;
      }
      
      override public function createIcon() : MovieClip
      {
         var iconLibrary:String;
         var icon:§_-7k§ = null;
         if(§_-8W7§ == null || §_-8W7§.indexOf("@") < 0)
         {
            return new MovieClip();
         }
         iconLibrary = §_-8W7§.split("@")[1];
         if(!ResourceManager.§_-7Bo§(iconLibrary))
         {
            icon = new §_-7k§();
            §_-2NT§.§_-5vY§(iconLibrary).then(function():void
            {
               if(ResourceManager.hasDefinition(iconClass))
               {
                  icon.addChild(ResourceManager.createMovieClip(iconClass));
               }
            });
            return icon;
         }
         return ResourceManager.hasDefinition(iconClass) ? ResourceManager.createMovieClip(iconClass) : new MovieClip();
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-0AE§ = param1.getInt(§_-9Fm§,0);
         this.§_-9hj§ = param1.getInt(§_-6BQ§,0);
      }
   }
}

