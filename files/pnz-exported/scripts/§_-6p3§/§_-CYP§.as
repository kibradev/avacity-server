package §_-6p3§
{
   import §_-18o§.§_-ABX§;
   import §_-2U3§.ResourceManager;
   import §_-99s§.§_-7Tj§;
   import §_-BeZ§.§_-4Ww§;
   import adept.config.Configuration;
   import flash.display.MovieClip;
   
   public class §_-CYP§ extends §_-7Tj§
   {
      public static const §_-9Y0§:String = "canUse";
      
      public static const §_-9XR§:String = "relatedTypes";
      
      public static const §_-5y-§:String = "cursor";
      
      public static const §_-CWN§:String = "useDescription";
      
      public static const §_-AJ-§:String = "location";
      
      public static const §_-665§:String = "useLocation";
      
      private static const §_-4pG§:String = "mdf";
      
      private static const §_-5eU§:String = "ml";
      
      private static const §_-3nF§:String = "rt";
      
      private static const §_-ls§:String = "d";
      
      private var §_-VE§:int = 0;
      
      private var §_-AEe§:Object = {};
      
      protected var §_-24q§:String = "";
      
      private var §_-2Ir§:int = 0;
      
      public function §_-CYP§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         var _loc2_:XML = null;
         super.loadXML(param1);
         this.§_-2Ir§ = !!param1.hasOwnProperty("@minLevel") ? int(param1["@minLevel"]) : 0;
         this.§_-VE§ = !!param1.hasOwnProperty("@cooldown") ? int(param1["@cooldown"]) : 0;
         if(param1.hasOwnProperty("modifyers"))
         {
            for each(_loc2_ in (param1.elements("modifyers")[0] as XML).elements("modifyer"))
            {
               this.§_-AEe§[_loc2_["@name"]] = parseFloat(_loc2_["@effect"]);
            }
         }
         this.§_-24q§ = !!param1.hasOwnProperty("@description") ? String(param1["@description"]) : "";
      }
      
      override public function loadConfig(param1:Configuration) : void
      {
         var _loc3_:Array = null;
         var _loc4_:Configuration = null;
         super.loadConfig(param1);
         this.§_-2Ir§ = param1.getInt("minLevel");
         this.§_-VE§ = param1.getInt("cooldown");
         this.§_-24q§ = param1.getString("description");
         var _loc2_:Configuration = param1.getConfiguration("modifyers");
         if(_loc2_ != null)
         {
            _loc3_ = _loc2_.getList("modifyer");
            for each(_loc4_ in _loc3_)
            {
               if(_loc4_ != null)
               {
                  this.§_-AEe§[_loc4_.getString("name")] = _loc4_.getNumber("effect");
               }
            }
         }
      }
      
      public function get minLevel() : int
      {
         return this.§_-2Ir§;
      }
      
      public function getEffect(param1:String) : *
      {
         return !!this.§_-AEe§.hasOwnProperty(param1) ? this.§_-AEe§[param1] : null;
      }
      
      public function get cooldown() : int
      {
         return this.§_-VE§;
      }
      
      public function get description() : String
      {
         return this.§_-24q§;
      }
      
      public function get localizedDescription() : String
      {
         return §_-ABX§.§_-631§(this.§_-24q§);
      }
      
      override public function createIcon() : MovieClip
      {
         return ResourceManager.hasDefinition(iconClass) ? ResourceManager.createMovieClip(iconClass) : new MovieClip();
      }
      
      public function get relatedTypes() : Array
      {
         var _loc1_:String = String(getParam(§_-9XR§));
         return _loc1_.split(",");
      }
      
      override public function fromAGSObject(param1:§_-4Ww§) : void
      {
         super.fromAGSObject(param1);
         this.§_-AEe§ = param1.getMap(§_-4pG§,Number);
         this.§_-2Ir§ = param1.getInt(§_-5eU§);
         this.§_-2Ir§ = param1.getInt(§_-3nF§);
         this.§_-24q§ = param1.getString(§_-ls§);
      }
   }
}

