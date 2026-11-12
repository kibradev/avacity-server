package §_-1Vu§
{
   import §_-2U3§.ResourceManager;
   import §_-3AW§.§_-7k§;
   import §_-5eM§.§_-5jU§;
   import §_-8Hp§.§_-5KD§;
   import §_-99s§.§_-7Tj§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   import §_-kr§.§_-2NT§;
   import flash.display.MovieClip;
   import penzville.Config;
   
   public class §_-Awf§ extends §_-7Tj§
   {
      private static const §_-4QX§:String = "st";
      
      private static const §_-3nF§:String = "rt";
      
      private static const §_-ADQ§:String = "c";
      
      private static const §_-15L§:String = "co";
      
      private static const §_-9Ao§:String = "l";
      
      private static const §_-4OF§:String = "tg";
      
      public static const §_-0F-§:String = "gender";
      
      public static const §_-3UH§:String = "boy";
      
      public static const §_-AzH§:String = "girl";
      
      public static const §_-Bc2§:String = "beardless";
      
      public static const §_-IZ§:String = "hairless";
      
      public static const §_-Zz§:String = "wide";
      
      protected var §_-AHo§:String = null;
      
      protected var §_-35X§:int = 0;
      
      protected var §_-XT§:String = null;
      
      protected var §_-13F§:Array = [];
      
      private var _isColored:Boolean = true;
      
      private var §_-5Nr§:Boolean = false;
      
      public function §_-Awf§()
      {
         super();
      }
      
      override public function loadXML(param1:XML) : void
      {
         super.loadXML(param1);
         this.§_-AHo§ = !!param1.hasOwnProperty("@subType") ? String(param1["@subType"]) : null;
         this.§_-35X§ = !!param1.hasOwnProperty("@rating") ? int(param1["@rating"]) : 0;
         this.§_-XT§ = !!param1.hasOwnProperty("@library") ? param1["@library"] : null;
         this.§_-13F§ = !!param1.hasOwnProperty("@tags") ? String(param1["@tags"]).split(",") : [];
         this._isColored = Boolean(param1.hasOwnProperty("@isColored")) && int(param1["@isColored"]) == 1;
         this.§_-5Nr§ = !!param1.hasOwnProperty("@clanOnly") ? int(param1["@clanOnly"]) == 1 : false;
      }
      
      public function get subType() : String
      {
         return this.§_-AHo§;
      }
      
      public function get rating() : int
      {
         return this.§_-35X§ > 0 ? this.§_-35X§ : int(Math.ceil(this.silver / 100) + Math.floor(this.gold * 1.7));
      }
      
      public function get isColored() : Boolean
      {
         return this._isColored;
      }
      
      public function get gender() : int
      {
         var _loc1_:String = category.getAttribute(§_-0F-§);
         if(_loc1_ == §_-3UH§)
         {
            return §_-3uA§.§_-908§;
         }
         if(_loc1_ == §_-AzH§)
         {
            return §_-3uA§.§_-BO7§;
         }
         throw new Error("Cannot get gender category attribute");
      }
      
      public function intersect(param1:§_-Awf§) : Boolean
      {
         if(param1.gender != this.gender)
         {
            return false;
         }
         if(param1.category.categoryId == category.categoryId && param1.subType == this.subType)
         {
            return true;
         }
         if(Context.§_-Amy§.§_-6WF§(this,param1))
         {
            return true;
         }
         return false;
      }
      
      public function get §_-C4x§() : Boolean
      {
         return this.hasTag(§_-Bc2§);
      }
      
      public function get §_-1yY§() : Boolean
      {
         return this.hasTag(§_-IZ§);
      }
      
      public function get §_-5ly§() : Boolean
      {
         return this.hasTag(§_-Zz§);
      }
      
      public function hasTag(param1:String) : Boolean
      {
         return this.§_-13F§ != null && this.§_-13F§.length > 0 && this.§_-13F§.indexOf(param1) >= 0;
      }
      
      public function get library() : String
      {
         return this.§_-XT§;
      }
      
      public function get §_-wn§() : Boolean
      {
         return this.§_-5Nr§;
      }
      
      override public function get oldSilverPrice() : int
      {
         if(isSaleItem || (this.isColored ? Context.§_-0Vr§.§_-8aq§(true) : Context.§_-0Vr§.§_-94p§(true) && !this.§_-wn§))
         {
            return §_-79S§.value;
         }
         return 0;
      }
      
      override public function get oldGoldPrice() : int
      {
         if(isSaleItem || (this.isColored ? Context.§_-0Vr§.§_-8aq§(true) : Context.§_-0Vr§.§_-94p§(true) && !this.§_-wn§))
         {
            return §_-aj§.value;
         }
         return 0;
      }
      
      override public function get silver() : int
      {
         if(this.§_-5Nr§)
         {
            return §_-79S§.value;
         }
         if(!isSaleItem && Context.§_-0Vr§.§_-9-K§(false))
         {
            Context.§_-0Vr§.§_-0iP§();
            if(this.isColored)
            {
               return Math.round(§_-79S§.value - §_-79S§.value * Context.§_-0Vr§.§_-4aq§(false));
            }
            return Math.round(§_-79S§.value - §_-79S§.value * Context.§_-0Vr§.§_-9n2§());
         }
         return super.silver;
      }
      
      override public function get gold() : int
      {
         if(this.§_-5Nr§)
         {
            return §_-aj§.value;
         }
         if(!isSaleItem && Context.§_-0Vr§.§_-9-K§(false))
         {
            Context.§_-0Vr§.§_-0iP§();
            if(this.isColored)
            {
               return Math.round(§_-aj§.value - §_-aj§.value * Context.§_-0Vr§.§_-4aq§(false));
            }
            return Math.round(§_-aj§.value - §_-aj§.value * Context.§_-0Vr§.§_-9n2§());
         }
         return super.gold;
      }
      
      override public function get canBuy() : Boolean
      {
         return super.canBuy;
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
         this.§_-AHo§ = param1.getString(§_-4QX§);
         this.§_-35X§ = param1.getInt(§_-3nF§);
         this.§_-XT§ = param1.getString(§_-9Ao§);
         this.§_-13F§ = param1.getString(§_-4OF§,"").split(",");
         this.§_-5Nr§ = param1.getBoolean(§_-15L§);
         this._isColored = param1.getBoolean(§_-ADQ§);
      }
      
      override public function get isActiveX2SaleItem() : Boolean
      {
         var _loc1_:String = null;
         if(!§_-5KD§.instance.isActiveX2SaleItem(typeId))
         {
            _loc1_ = Context.§_-Amy§.§_-8tJ§(typeId);
            if(_loc1_ != null)
            {
               return §_-5KD§.instance.isActiveX2SaleItem(_loc1_);
            }
            return false;
         }
         return true;
      }
      
      override public function set category(param1:§_-5jU§) : void
      {
         super.category = param1;
         this.§_-A7J§();
      }
      
      private function §_-A7J§() : void
      {
         if(this.§_-XT§ == null)
         {
            this.§_-XT§ = this.gender == §_-3uA§.§_-908§ ? Config.§_-2X2§ : Config.§_-4Hw§;
         }
      }
   }
}

