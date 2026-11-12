package §_-62k§
{
   import §_-18o§.§_-A8q§;
   import §_-5Us§.§_-0d-§;
   import §_-5Us§.§_-2o6§;
   import §_-5Us§.§_-AyA§;
   import §_-AUc§.§_-3L0§;
   import §_-BeZ§.§_-0Yu§;
   import §_-BeZ§.§_-4Ww§;
   import §_-C-a§.§_-3uA§;
   import §_-GM§.Context;
   
   public class §_-7Mj§ implements §_-0Yu§
   {
      public static const §_-2K5§:String = "g";
      
      public static const §_-8Aa§:String = "n";
      
      public static const §_-92A§:String = "nct";
      
      public static const §_-5dt§:int = 12;
      
      public static const §_-3rF§:int = 3;
      
      private static const §_-Abc§:String = "sc";
      
      private static const §_-AsA§:String = "hc";
      
      private static const §_-BO4§:String = "ec";
      
      private static const §_-8s4§:String = "brc";
      
      private static const §_-6e§:String = "mc";
      
      private static const §_-AWe§:String = "bc";
      
      private static const §_-0DH§:String = "rc";
      
      private static const §_-4a§:String = "shc";
      
      private static const §_-55C§:String = "ssc";
      
      private static const §_-2Rg§:String = "pc";
      
      private static const §_-0JM§:String = "fac";
      
      private static const §_-C1t§:String = "ht";
      
      private static const §_-3qs§:String = "et";
      
      private static const §_-n9§:String = "brt";
      
      private static const §_-529§:String = "mt";
      
      private static const §_-2Db§:String = "bt";
      
      private static const §_-0zM§:String = "sh";
      
      private static const §_-1d3§:String = "rg";
      
      private static const §_-35F§:String = "ss";
      
      private static const §_-4r5§:String = "pt";
      
      private static const §_-6dQ§:String = "fat";
      
      private static const §_-4G3§:String = "fft";
      
      private var §_-BSf§:int = 1;
      
      private var _name:String = "";
      
      private var §_-60§:int = 0;
      
      private var §_-4hM§:int = 1;
      
      private var §_-Bep§:int = 1;
      
      private var §_-6Hd§:int = 1;
      
      private var §_-9VN§:int = 1;
      
      private var §_-AoR§:int = 1;
      
      private var §_-8Og§:int = 1;
      
      private var §_-8n1§:int = 1;
      
      private var §_-9Vi§:int = 1;
      
      private var §_-6vz§:int = 1;
      
      private var §_-6jG§:int = 1;
      
      private var §_-1K9§:int = 1;
      
      private var §_-bY§:int = 1;
      
      private var §_-39X§:int = 1;
      
      private var §_-7ZN§:int = 1;
      
      private var §_-6Cc§:int = 1;
      
      private var §_-687§:int = 0;
      
      private var §_-3Iv§:int = 0;
      
      private var §_-ALE§:int = 0;
      
      private var §_-8vg§:int = 0;
      
      private var §_-4Yh§:int = 0;
      
      private var §_-22U§:int = 0;
      
      private var §_-2KZ§:int = 0;
      
      public function §_-7Mj§()
      {
         super();
      }
      
      public function reset() : void
      {
         this.§_-Bep§ = 1;
         this.§_-6Hd§ = 1;
         this.§_-9VN§ = 1;
         this.§_-AoR§ = 1;
         this.§_-8Og§ = 1;
         this.§_-9Vi§ = 1;
         this.§_-8n1§ = 1;
         this.§_-6jG§ = 1;
         this.§_-1K9§ = 1;
         this.§_-6vz§ = 1;
         this.§_-bY§ = Context.§_-6vd§.§_-4-O§(§_-2o6§.HAIR,this.gender);
         this.§_-39X§ = Context.§_-6vd§.§_-4-O§(§_-2o6§.EYES,this.gender);
         this.§_-7ZN§ = Context.§_-6vd§.§_-4-O§(§_-2o6§.BROWS,this.gender);
         this.§_-6Cc§ = Context.§_-6vd§.§_-4-O§(§_-2o6§.MOUTH,this.gender);
         this.§_-687§ = 0;
         this.§_-3Iv§ = 0;
         this.§_-ALE§ = 0;
         this.§_-8vg§ = 0;
         this.§_-4Yh§ = 0;
         this.§_-22U§ = 0;
         this.§_-2KZ§ = 0;
      }
      
      public function getColorIndexByCategory(param1:int) : int
      {
         switch(param1)
         {
            case §_-2o6§.BEARD:
               return this.§_-8Yf§;
            case §_-2o6§.BROWS:
               return this.§_-4-Q§;
            case §_-2o6§.EYES:
               return this.§_-0Iz§;
            case §_-2o6§.HAIR:
               return this.§_-2yT§;
            case §_-2o6§.MOUTH:
               return this.§_-6WK§;
            case §_-2o6§.§_-1r5§:
               return this.skinColorIndex;
            case §_-2o6§.ROUGE:
               return this.§_-8Q4§;
            case §_-2o6§.§_-9ka§:
               return this.§_-1c0§;
            case §_-2o6§.§_-8jW§:
               return this.§_-8C§;
            case §_-2o6§.§_-5lw§:
               return this.§_-9Ch§;
            default:
               return 0;
         }
      }
      
      public function setColorIndexByCategory(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case §_-2o6§.BEARD:
               this.§_-8Yf§ = param2;
               break;
            case §_-2o6§.BROWS:
               this.§_-4-Q§ = param2;
               break;
            case §_-2o6§.EYES:
               this.§_-0Iz§ = param2;
               break;
            case §_-2o6§.HAIR:
               this.§_-2yT§ = param2;
               break;
            case §_-2o6§.MOUTH:
               this.§_-6WK§ = param2;
               break;
            case §_-2o6§.§_-1r5§:
               this.skinColorIndex = param2;
               break;
            case §_-2o6§.ROUGE:
               this.§_-8Q4§ = param2;
               break;
            case §_-2o6§.§_-9ka§:
               this.§_-1c0§ = param2;
               break;
            case §_-2o6§.§_-8jW§:
               this.§_-8C§ = param2;
               break;
            case §_-2o6§.§_-5lw§:
               this.§_-9Ch§ = param2;
         }
      }
      
      public function getColorItemByCategory(param1:int) : §_-0d-§
      {
         switch(param1)
         {
            case §_-2o6§.BEARD:
               return this.beardColorItem;
            case §_-2o6§.BROWS:
               return this.browsColorItem;
            case §_-2o6§.EYES:
               return this.eyesColorItem;
            case §_-2o6§.HAIR:
               return this.hairsColorItem;
            case §_-2o6§.MOUTH:
               return this.mouthColorItem;
            case §_-2o6§.§_-1r5§:
               return this.skinColorItem;
            case §_-2o6§.ROUGE:
               return this.rougeColorItem;
            case §_-2o6§.§_-9ka§:
               return this.shadowColorItem;
            case §_-2o6§.§_-8jW§:
               return this.strassColorItem;
            case §_-2o6§.§_-5lw§:
               return this.faceArtColorItem;
            default:
               return null;
         }
      }
      
      public function getPartTypeByCategory(param1:int) : int
      {
         switch(param1)
         {
            case §_-2o6§.BEARD:
               return this.§_-2Q2§;
            case §_-2o6§.BROWS:
               return this.§_-5u7§;
            case §_-2o6§.EYES:
               return this.eyesType;
            case §_-2o6§.HAIR:
               return this.§_-5ES§;
            case §_-2o6§.MOUTH:
               return this.§_-5sB§;
            case §_-2o6§.§_-9ka§:
               return this.§_-85g§;
            case §_-2o6§.ROUGE:
               return this.§_-Caf§;
            case §_-2o6§.§_-8jW§:
               return this.§_-7Aw§;
            case §_-2o6§.§_-ATO§:
               return this.§_-1Nn§;
            case §_-2o6§.§_-5lw§:
               return this.§_-rG§;
            case §_-2o6§.FACE_FEATURE:
               return this.§_-BfL§;
            default:
               return 0;
         }
      }
      
      public function setPartTypeByCategory(param1:int, param2:int) : void
      {
         switch(param1)
         {
            case §_-2o6§.BEARD:
               this.§_-2Q2§ = param2;
               break;
            case §_-2o6§.BROWS:
               this.§_-5u7§ = param2;
               break;
            case §_-2o6§.EYES:
               this.eyesType = param2;
               break;
            case §_-2o6§.HAIR:
               this.§_-5ES§ = param2;
               break;
            case §_-2o6§.MOUTH:
               this.§_-5sB§ = param2;
               break;
            case §_-2o6§.§_-9ka§:
               this.§_-85g§ = param2;
               break;
            case §_-2o6§.ROUGE:
               this.§_-Caf§ = param2;
               break;
            case §_-2o6§.§_-8jW§:
               this.§_-7Aw§ = param2;
               break;
            case §_-2o6§.§_-ATO§:
               this.§_-1Nn§ = param2;
               break;
            case §_-2o6§.§_-5lw§:
               this.§_-rG§ = param2;
               break;
            case §_-2o6§.FACE_FEATURE:
               this.§_-BfL§ = param2;
         }
      }
      
      public function getPartItemByCategory(param1:int) : §_-AyA§
      {
         switch(param1)
         {
            case §_-2o6§.§_-1r5§:
               return this.skinItem;
            case §_-2o6§.BEARD:
               return this.beardItem;
            case §_-2o6§.BROWS:
               return this.browsItem;
            case §_-2o6§.EYES:
               return this.eyesItem;
            case §_-2o6§.HAIR:
               return this.hairsItem;
            case §_-2o6§.MOUTH:
               return this.mouthItem;
            case §_-2o6§.§_-9ka§:
               return this.shadowItem;
            case §_-2o6§.ROUGE:
               return this.rougeItem;
            case §_-2o6§.§_-8jW§:
               return this.strassItem;
            case §_-2o6§.§_-ATO§:
               return this.pirsingItem;
            case §_-2o6§.§_-5lw§:
               return this.faceArtItem;
            case §_-2o6§.FACE_FEATURE:
               return this.faceFeatureItem;
            default:
               return null;
         }
      }
      
      public function §_-6wk§(param1:String) : §_-AyA§
      {
         switch(param1)
         {
            case §_-3L0§.BEARD:
               return this.beardItem;
            case §_-3L0§.BROWS:
               return this.browsItem;
            case §_-3L0§.EYES:
               return this.eyesItem;
            case §_-3L0§.MOUTH:
               return this.mouthItem;
            case §_-3L0§.§_-9ka§:
               return this.shadowItem;
            case §_-3L0§.ROUGE:
               return this.rougeItem;
            case §_-3L0§.§_-8jW§:
               return this.strassItem;
            case §_-3L0§.§_-ATO§:
               return this.pirsingItem;
            case §_-3L0§.§_-5lw§:
               return this.faceArtItem;
            case §_-3L0§.FACE_FEATURE:
               return this.faceFeatureItem;
            default:
               return null;
         }
      }
      
      public function get colorSet() : §_-0d-§
      {
         var _loc2_:int = 0;
         var _loc3_:§_-0d-§ = null;
         var _loc1_:§_-0d-§ = new §_-0d-§();
         for each(_loc2_ in §_-2o6§.values())
         {
            _loc3_ = Context.§_-6vd§.getColors(_loc2_,this.gender,this.getColorIndexByCategory(_loc2_));
            if(_loc3_ != null)
            {
               _loc1_.merge(_loc3_);
            }
         }
         return _loc1_;
      }
      
      public function get gender() : int
      {
         return this.§_-BSf§;
      }
      
      public function set gender(param1:int) : void
      {
         this.§_-BSf§ = param1;
      }
      
      public function get htmlName() : String
      {
         var _loc1_:String = String(this.name);
         _loc1_ = _loc1_.replace(/</g,"&lt;");
         return _loc1_.replace(/>/g,"&gt;");
      }
      
      public function get name() : String
      {
         return this._name.replace(/\r/g,"");
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get §_-3LV§() : int
      {
         return this.§_-60§;
      }
      
      public function set §_-3LV§(param1:int) : void
      {
         this.§_-60§ = param1;
      }
      
      public function get skinColorIndex() : int
      {
         return this.§_-4hM§;
      }
      
      public function set skinColorIndex(param1:int) : void
      {
         this.§_-4hM§ = param1;
      }
      
      public function get skinColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.§_-1r5§,this.§_-BSf§,this.§_-4hM§);
      }
      
      public function get §_-2yT§() : int
      {
         return this.§_-Bep§;
      }
      
      public function set §_-2yT§(param1:int) : void
      {
         this.§_-Bep§ = param1;
      }
      
      public function get hairsColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.HAIR,this.§_-BSf§,this.§_-Bep§);
      }
      
      public function get §_-0Iz§() : int
      {
         return this.§_-6Hd§;
      }
      
      public function set §_-0Iz§(param1:int) : void
      {
         this.§_-6Hd§ = param1;
      }
      
      public function get eyesColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.EYES,this.§_-BSf§,this.§_-6Hd§);
      }
      
      public function get §_-4-Q§() : int
      {
         return this.§_-9VN§;
      }
      
      public function set §_-4-Q§(param1:int) : void
      {
         this.§_-9VN§ = param1;
      }
      
      public function get browsColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.BROWS,this.§_-BSf§,this.§_-9VN§);
      }
      
      public function get §_-6WK§() : int
      {
         return this.§_-AoR§;
      }
      
      public function set §_-6WK§(param1:int) : void
      {
         this.§_-AoR§ = param1;
      }
      
      public function get mouthColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.MOUTH,this.§_-BSf§,this.§_-AoR§);
      }
      
      public function get §_-8Yf§() : int
      {
         return this.§_-8Og§;
      }
      
      public function set §_-8Yf§(param1:int) : void
      {
         this.§_-8Og§ = param1;
      }
      
      public function get beardColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.BEARD,this.§_-BSf§,this.§_-8Og§);
      }
      
      public function get §_-5ES§() : int
      {
         return this.§_-bY§;
      }
      
      public function set §_-5ES§(param1:int) : void
      {
         this.§_-bY§ = param1;
      }
      
      public function get hairsItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.HAIR,this.§_-bY§);
      }
      
      public function get eyesType() : int
      {
         return this.§_-39X§;
      }
      
      public function set eyesType(param1:int) : void
      {
         this.§_-39X§ = param1;
      }
      
      public function get eyesItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.EYES,this.§_-39X§);
      }
      
      public function get §_-5u7§() : int
      {
         return this.§_-7ZN§;
      }
      
      public function set §_-5u7§(param1:int) : void
      {
         this.§_-7ZN§ = param1;
      }
      
      public function get browsItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.BROWS,this.§_-7ZN§);
      }
      
      public function get §_-5sB§() : int
      {
         return this.§_-6Cc§;
      }
      
      public function set §_-5sB§(param1:int) : void
      {
         this.§_-6Cc§ = param1;
      }
      
      public function get mouthItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.MOUTH,this.§_-6Cc§);
      }
      
      public function get §_-2Q2§() : int
      {
         return this.§_-687§;
      }
      
      public function set §_-2Q2§(param1:int) : void
      {
         this.§_-687§ = param1;
      }
      
      public function get skinItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.§_-1r5§,this.skinColorIndex);
      }
      
      public function get beardItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.BEARD,this.§_-687§);
      }
      
      public function get §_-85g§() : int
      {
         return this.§_-3Iv§;
      }
      
      public function set §_-85g§(param1:int) : void
      {
         this.§_-3Iv§ = param1;
      }
      
      public function get shadowItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.§_-9ka§,this.§_-3Iv§);
      }
      
      public function get §_-1c0§() : int
      {
         return this.§_-8n1§;
      }
      
      public function set §_-1c0§(param1:int) : void
      {
         this.§_-8n1§ = param1;
      }
      
      public function get shadowColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.§_-9ka§,this.§_-BSf§,this.§_-8n1§);
      }
      
      public function get §_-7Aw§() : int
      {
         return this.§_-8vg§;
      }
      
      public function set §_-7Aw§(param1:int) : void
      {
         this.§_-8vg§ = param1;
      }
      
      public function get strassItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.§_-8jW§,this.§_-8vg§);
      }
      
      public function get §_-8C§() : int
      {
         return this.§_-6vz§;
      }
      
      public function set §_-8C§(param1:int) : void
      {
         this.§_-6vz§ = param1;
      }
      
      public function get strassColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.§_-8jW§,this.§_-BSf§,this.§_-6vz§);
      }
      
      public function get §_-Caf§() : int
      {
         return this.§_-ALE§;
      }
      
      public function set §_-Caf§(param1:int) : void
      {
         this.§_-ALE§ = param1;
      }
      
      public function get rougeItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.ROUGE,this.§_-ALE§);
      }
      
      public function get §_-8Q4§() : int
      {
         return this.§_-9Vi§;
      }
      
      public function set §_-8Q4§(param1:int) : void
      {
         this.§_-9Vi§ = param1;
      }
      
      public function get rougeColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.ROUGE,this.§_-BSf§,this.§_-9Vi§);
      }
      
      public function get §_-1Nn§() : int
      {
         return this.§_-4Yh§;
      }
      
      public function set §_-1Nn§(param1:int) : void
      {
         this.§_-4Yh§ = param1;
      }
      
      public function get pirsingItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.§_-ATO§,this.§_-4Yh§);
      }
      
      public function get §_-5nD§() : int
      {
         return this.§_-6jG§;
      }
      
      public function set §_-5nD§(param1:int) : void
      {
         this.§_-6jG§ = param1;
      }
      
      public function get pirsingColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.§_-ATO§,this.§_-BSf§,this.§_-6jG§);
      }
      
      public function get §_-rG§() : int
      {
         return this.§_-22U§;
      }
      
      public function set §_-rG§(param1:int) : void
      {
         this.§_-22U§ = param1;
      }
      
      public function get faceArtItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.§_-5lw§,this.§_-22U§);
      }
      
      public function get §_-9Ch§() : int
      {
         return this.§_-1K9§;
      }
      
      public function set §_-9Ch§(param1:int) : void
      {
         this.§_-1K9§ = param1;
      }
      
      public function get faceArtColorItem() : §_-0d-§
      {
         return Context.§_-6vd§.getColors(§_-2o6§.§_-5lw§,this.§_-BSf§,this.§_-1K9§);
      }
      
      public function get §_-BfL§() : int
      {
         return this.§_-2KZ§;
      }
      
      public function set §_-BfL§(param1:int) : void
      {
         this.§_-2KZ§ = param1;
      }
      
      public function get faceFeatureItem() : §_-AyA§
      {
         return this.§_-CVc§(§_-2o6§.FACE_FEATURE,this.§_-2KZ§);
      }
      
      private function §_-CVc§(param1:uint, param2:int) : §_-AyA§
      {
         var _loc3_:§_-2oh§ = Context.§_-6vd§.getCategory(param1,this.§_-BSf§);
         if(_loc3_ == null)
         {
            return null;
         }
         return _loc3_.getItem(param2);
      }
      
      public function fromAGSObject(param1:§_-4Ww§) : void
      {
         this.gender = param1.getInt(§_-2K5§);
         this.name = param1.getString(§_-8Aa§);
         this.skinColorIndex = param1.getInt(§_-Abc§);
         this.§_-2yT§ = param1.getInt(§_-AsA§);
         this.§_-0Iz§ = param1.getInt(§_-BO4§);
         this.§_-4-Q§ = param1.getInt(§_-8s4§);
         this.§_-6WK§ = param1.getInt(§_-6e§);
         this.§_-8Yf§ = param1.getInt(§_-AWe§);
         this.§_-8Q4§ = param1.getInt(§_-0DH§);
         this.§_-1c0§ = param1.getInt(§_-4a§);
         this.§_-8C§ = param1.getInt(§_-55C§);
         this.§_-5nD§ = param1.getInt(§_-2Rg§);
         this.§_-9Ch§ = param1.getInt(§_-0JM§);
         this.§_-5ES§ = param1.getInt(§_-C1t§);
         this.eyesType = param1.getInt(§_-3qs§);
         this.§_-5u7§ = param1.getInt(§_-n9§);
         this.§_-5sB§ = param1.getInt(§_-529§);
         this.§_-2Q2§ = param1.getInt(§_-2Db§);
         this.§_-85g§ = param1.getInt(§_-0zM§);
         this.§_-Caf§ = param1.getInt(§_-1d3§);
         this.§_-7Aw§ = param1.getInt(§_-35F§);
         this.§_-1Nn§ = param1.getInt(§_-4r5§);
         this.§_-rG§ = param1.getInt(§_-6dQ§);
         this.§_-BfL§ = param1.getInt(§_-4G3§);
         this.§_-3LV§ = param1.getInt(§_-92A§);
         this.§_-4Tm§();
         this.§_-9jw§();
      }
      
      private function §_-4Tm§() : void
      {
         var _loc3_:String = null;
         var _loc4_:§_-2oh§ = null;
         var _loc5_:int = 0;
         var _loc6_:§_-AyA§ = null;
         var _loc1_:Object = Context.§_-6vd§.getCategories(this.gender);
         var _loc2_:int = 0;
         for(_loc3_ in _loc1_)
         {
            if(int(_loc3_) == §_-2o6§.§_-1r5§)
            {
               _loc2_ = this.getColorIndexByCategory(int(_loc3_));
               if(Context.§_-6vd§.getColors(int(_loc3_),this.gender,_loc2_) == null)
               {
                  this.setColorIndexByCategory(int(_loc3_),1);
               }
            }
            else
            {
               _loc4_ = Context.§_-6vd§.getCategory(int(_loc3_),this.gender);
               _loc5_ = this.getPartTypeByCategory(int(_loc3_));
               _loc6_ = _loc4_ != null ? _loc4_.getItem(_loc5_) : null;
               if(_loc6_ == null)
               {
                  this.setPartTypeByCategory(int(_loc3_),(_loc4_.items[0] as §_-AyA§).id);
               }
            }
         }
      }
      
      private function §_-9jw§() : void
      {
         var _loc2_:String = null;
         var _loc3_:int = 0;
         var _loc1_:Object = Context.§_-6vd§.§_-4ya§(this.gender);
         for(_loc2_ in _loc1_)
         {
            if(!(this.gender == §_-3uA§.§_-908§ && §_-2o6§.§_-3Hb§.indexOf(int(_loc2_)) == -1 || this.gender == §_-3uA§.§_-BO7§ && §_-2o6§.§_-ss§.indexOf(int(_loc2_)) == -1))
            {
               _loc3_ = this.getColorIndexByCategory(int(_loc2_));
               if(!(_loc3_ == 0 && (this.gender == §_-3uA§.§_-908§ && §_-2o6§.§_-CJS§.indexOf(int(_loc2_)) >= 0 || this.gender == §_-3uA§.§_-BO7§ && §_-2o6§.§_-wd§.indexOf(int(_loc2_)) >= 0)))
               {
                  if(Context.§_-6vd§.getColors(int(_loc2_),this.gender,_loc3_) == null)
                  {
                     this.setColorIndexByCategory(int(_loc2_),1);
                  }
               }
            }
         }
      }
      
      public function toAGSObject(param1:§_-4Ww§) : void
      {
         param1.put(§_-2K5§,this.gender);
         param1.put(§_-8Aa§,this.name);
         param1.put(§_-Abc§,this.skinColorIndex);
         param1.put(§_-AsA§,this.§_-2yT§);
         param1.put(§_-BO4§,this.§_-0Iz§);
         param1.put(§_-8s4§,this.§_-4-Q§);
         param1.put(§_-6e§,this.§_-6WK§);
         param1.put(§_-AWe§,this.§_-8Yf§);
         param1.put(§_-0DH§,this.§_-8Q4§);
         param1.put(§_-4a§,this.§_-1c0§);
         param1.put(§_-55C§,this.§_-8C§);
         param1.put(§_-2Rg§,this.§_-5nD§);
         param1.put(§_-0JM§,this.§_-9Ch§);
         param1.put(§_-C1t§,this.§_-5ES§);
         param1.put(§_-3qs§,this.eyesType);
         param1.put(§_-n9§,this.§_-5u7§);
         param1.put(§_-529§,this.§_-5sB§);
         param1.put(§_-2Db§,this.§_-2Q2§);
         param1.put(§_-0zM§,this.§_-85g§);
         param1.put(§_-1d3§,this.§_-Caf§);
         param1.put(§_-35F§,this.§_-7Aw§);
         param1.put(§_-4r5§,this.§_-1Nn§);
         param1.put(§_-6dQ§,this.§_-rG§);
         param1.put(§_-4G3§,this.§_-BfL§);
         param1.put(§_-92A§,this.§_-3LV§);
      }
      
      public function clone() : §_-7Mj§
      {
         return §_-A8q§.§_-7t§(this);
      }
      
      public function isAppearancesEquals(param1:§_-7Mj§) : Boolean
      {
         var _loc2_:int = 0;
         for each(_loc2_ in §_-2o6§.values())
         {
            if(this.getPartTypeByCategory(_loc2_) != param1.getPartTypeByCategory(_loc2_))
            {
               return false;
            }
            if(this.getColorIndexByCategory(_loc2_) != param1.getColorIndexByCategory(_loc2_))
            {
               return false;
            }
         }
         return true;
      }
   }
}

